
-----------------------------------------
-- ⚡ SMART AUTO SHOUT + AUTO INVITE (Event Driven)
-- Inspired by Kate-DefenseDown structure
-- Author: Aragan System Enhanced
-----------------------------------------

--========================================================
-- ⚙️ STATES
--========================================================
state.SmartAutoShoutMode = M(false, "SmartAutoShoutMode")
state.AutoInviteMode     = M(false, "AutoInviteMode")

--========================================================
-- 🧾 CONFIGURATION
--========================================================
local active_mode = nil
local repeater_turned_off = false
local last_invite_time = {}
local invite_cooldown = 30 -- seconds before reinvite same player
local blacklist = { ["botname"]=true, ["trollguy"]=true }

-- Modes setup
local mode_configs = {
    seg = {
        title = "Odyssey SEG C farm",
        roles = {DD=2, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },
    temenos = {
        title = "Temenos Super Climb",
        roles = {DD=1, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },
    apollyon = {
        title = "Apollyon Super Climb ",
        roles = {DD=1, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },
    dynamis = {
        title = "Dynamis Wave 3 Clear Run",
        roles = {DD=3, BRD=1, COR=1, HEALER=1},
        yell = true, -- /yell
    },

    ambuscade = {
        title = "Ambuscade VD Run (Monthly)",
        roles = {DD=2, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },

    omen = {
        title = "Omen Cards Farm",
        roles = {DD=2, BRD=1, COR=1, HEALER=1},
        yell = true,
    },

    aeonic = {
        title = "Aeonic clear savage blade method",
        roles = {DD=3, BRD=1, COR=1, GEO=1, HEALER=1},
        yell = true,
    },

    reisen = {
        title = "Reisenjima NM Farm savage blade method",
        roles = {DD=2, BRD=1, COR=1, GEO=1, HEALER=1},
        yell = true,
    },

    odysseyboss = {
        title = "Odyssey Boss ",
        roles = {DD=2, BRD=1, COR=1, GEO=1, HEALER=1, TANK=1},
        yell = true,
    },

    sortiep = {
        title = "Sortie Physical Method",
        roles = {DD=2, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },

    sortiem = {
        title = "Sortie Magical Method",
        roles = {BLM=1, GEO=1, SCH=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },
    sortie = {
        title = "Sortie ABCECG",
        roles = {DD=1, BRD=1, COR=1, RDM=1, HEALER=1},
        yell = true,
    },
}

--========================================================
-- 🧩 JOB CLASSIFICATION
--========================================================
local job_roles = {
    WAR="DD", MNK="DD", THF="DD", DRK="DD", SAM="DD", DRG="DD", NIN="DD", DNC="DD",
    BRD="BRD", COR="COR",
    WHM="HEALER", RDM="HEALER", SCH="HEALER",
    PLD="TANK", RUN="TANK"
}
local function get_role(job) return job_roles[job] or "OTHER" end

--========================================================
-- 🧠 PARTY INFO HELPERS
--========================================================
local function get_party_roles()
    local p = windower.ffxi.get_party()
    local roles = {}
    if not p then return roles end
    for i = 0, 5 do
        local m = p["p"..i]
        if m and m.mob and m.mob.main_job then
            local r = get_role(m.mob.main_job)
            if r then roles[r] = (roles[r] or 0) + 1 end
        end
    end
    return roles
end
local function get_party_size()
    local p = windower.ffxi.get_party()
    return (p and p.party1_count) or 0
end

--========================================================
-- 🔍 MISSING ROLE DETECTOR
--========================================================
local function get_missing_roles(mode)
    local config = mode_configs[mode]
    if not config then return {} end
    local current = get_party_roles()
    local missing = {}
    for role, req in pairs(config.roles) do
        local have = current[role] or 0
        if have < req then
            for i = 1, (req - have) do table.insert(missing, role) end
        end
    end
    return missing
end

--========================================================
-- 📢 SMART AUTO SHOUT
--========================================================
local function do_shout(mode)
    if not (state.SmartAutoShoutMode.value and active_mode) then return end
    local config = mode_configs[mode]
    if not config then return end

    local size = get_party_size()
    local missing = get_missing_roles(mode)
    local missing_text = #missing > 0 and table.concat(missing, " ") or "any"
    local msg = string.format('%s LFM %s %d/6', config.title, missing_text, size)

    if size >= 6 then
        if not repeater_turned_off then
            windower.send_command('repeater off')
            windower.send_command('gs c set AutoInviteMode off')
            windower.send_command('AutoInvite freeinv off')
            windower.send_command('AutoInvite tellback on')
            windower.add_to_chat(207, '[SEG] Party full (6/6) → Repeater OFF.')
            repeater_turned_off = true
        end
        return
    end

    if repeater_turned_off and size < 6 then
        windower.send_command('repeater on')
        windower.send_command('gs c set AutoInviteMode on')
        windower.send_command('AutoInvite freeinv on')
        windower.send_command('AutoInvite tellback off')
        windower.add_to_chat(207, '[SEG] Party reduced → Repeater ON.')
        repeater_turned_off = false
    end

    if config.yell then
        windower.send_command('input /yell "'..msg..'"')
    else
        windower.send_command('input /sh "'..msg..'"')
    end
    windower.add_to_chat(207, '[AutoShout] '..msg)
end

--========================================================
-- 🎯 EVENT-BASED WATCHERS
--========================================================
-- عندما يتغير وضع SmartAutoShoutMode
windower.register_event('status change', function()
    if state.SmartAutoShoutMode.value then
        windower.add_to_chat(207, "[SmartAutoShoutMode] → ON")
    else
        windower.add_to_chat(167, "[SmartAutoShoutMode] → OFF")
    end
end)

-- عند تغير عدد أعضاء الفريق (انضمام / مغادرة)
windower.register_event('party invite', function()
    if state.SmartAutoShoutMode.value and active_mode then do_shout(active_mode) end
end)
windower.register_event('party member add', function()
    if state.SmartAutoShoutMode.value and active_mode then do_shout(active_mode) end
end)
windower.register_event('party member remove', function()
    if state.SmartAutoShoutMode.value and active_mode then do_shout(active_mode) end
end)

-- عند تغيير المنطقة
windower.register_event('zone change', function()
    repeater_turned_off = true
    windower.send_command('repeater off')
    windower.send_command('gs c set AutoShoutMode off')
    windower.add_to_chat(167, '[AutoShout] Zone changed → Repeater OFF.')
end)

--========================================================
-- 💬 SMART AUTO INVITE (CHAT MESSAGE)
--========================================================
local function is_in_party(name)
    local p = windower.ffxi.get_party()
    for i = 0, 5 do
        local m = p["p"..i]
        if m and m.name and m.name:lower() == name:lower() then return true end
    end
    return false
end

local function parse_player_job_from_message(sender, text)
    local lower = text:lower()
    local job_keywords = {
        { "cor", "corsair" },
        { "brd", "bard" },
        { "whm", "white mage", "rdm", "red mage", "sch", "scholar", "healer" },
        { "pld", "paladin", "run", "rune fencer", "tank" },
        { "war", "warrior", "drk", "dark knight", "sam", "samurai",
          "mnk", "monk", "drg", "dragoon", "thf", "thief",
          "nin", "ninja", "dnc", "dancer", "dd", "damage dealer" },
    }

    local job_map = {
        cor="COR", corsair="COR",
        brd="BRD", bard="BRD",
        whm="WHM", ["white mage"]="WHM",
        rdm="RDM", ["red mage"]="RDM",
        sch="SCH", scholar="SCH", healer="HEALER",
        pld="PLD", paladin="PLD",
        run="RUN", ["rune fencer"]="RUN", tank="TANK",
        war="DD", warrior="DD", drk="DD", ["dark knight"]="DD",
        sam="DD", samurai="DD", mnk="DD", monk="DD",
        drg="DD", dragoon="DD", thf="DD", thief="DD",
        nin="DD", ninja="DD", dnc="DD", dancer="DD",
        dd="DD", ["damage dealer"]="DD",
    }

    for _, group in ipairs(job_keywords) do
        for _, word in ipairs(group) do
            if lower:find(word) then
                return job_map[word] or "UNKNOWN"
            end
        end
    end
    return nil
end

windower.register_event('chat message', function(message, player, mode, is_gm)
    if not state.AutoInviteMode.value then return end
    if not state.SmartAutoShoutMode.value then return end
    if not active_mode then return end
    if not message or not player then return end
    if mode ~= 3 then return end

    local sender = player
    local lname = sender:lower()
    local lower = message:lower()

    if blacklist[lname] then
        windower.add_to_chat(167, string.format("[Blacklist] Ignored %s", sender))
        return
    end

    if is_in_party(sender) then return end
    if last_invite_time[lname] and os.clock() - last_invite_time[lname] < invite_cooldown then return end

    local job = parse_player_job_from_message(sender, lower)
    if job then
        windower.send_command('wait 1; input /pcmd add '..sender)
        windower.add_to_chat(207, string.format("[AutoInvite] Added %s as %s", sender, job))
        last_invite_time[lname] = os.clock()
    else
        local mob = windower.ffxi.get_mob_by_name(sender)
        if mob and mob.main_job then
            windower.send_command('wait 1; input /pcmd add '..sender)
            windower.add_to_chat(207, string.format("[AutoInvite] Added %s using current job (%s)", sender, mob.main_job))
            last_invite_time[lname] = os.clock()
        end
    end
end)

--========================================================
-- 🧭 MODE COMMANDS
--========================================================
windower.register_event('addon command', function(cmd, arg)
    if not cmd then return end
    cmd = cmd:lower()

    if mode_configs[cmd] then
        if arg == 'on' then
            active_mode = cmd
            windower.add_to_chat(207, string.format("[SmartAutoShout] %s mode ON", cmd:upper()))
            do_shout(cmd)
        elseif arg == 'off' then
            active_mode = nil
            windower.add_to_chat(167, string.format("[SmartAutoShout] %s mode OFF", cmd:upper()))
        else
            windower.add_to_chat(207, string.format("Usage: //%s on|off", cmd))
        end
        return
    end

    if cmd == 'smart' then
        state.SmartAutoShoutMode:toggle()
        local val = state.SmartAutoShoutMode.value and "ON" or "OFF"
        windower.add_to_chat(207, "[SmartAutoShoutMode] "..val)
    end

    if cmd == 'autoinv' then
        state.AutoInviteMode:toggle()
        local val = state.AutoInviteMode.value and "ON" or "OFF"
        windower.add_to_chat(207, "[AutoInviteMode] "..val)
    end
end)


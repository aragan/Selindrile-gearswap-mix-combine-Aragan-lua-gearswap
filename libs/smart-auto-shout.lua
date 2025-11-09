------------------------------------------------------------
-- SMART AUTO SHOUT + AUTO INVITE (Hardened Version)
-- يعمل حتى لو M/state غير مهيّأة وقت التحميل
-- يستخدم chat message + مُجدول خفيف كل 2 ثانية
------------------------------------------------------------

-- حماية: state & M قد لا تكون جاهزة عند التحميل
state = state or {}

-- دالة صانع وضع (Mode) بديلة لو M غير متاحة بعد
local function make_mode_bool(default, name)
    if type(M) == 'function' then
        return M(default, name)
    end
    -- بديل بسيط متوافق
    return setmetatable({value = default, description = name},{
        __index = {
            toggle = function(self) self.value = not self.value end,
            set = function(self, v) self.value = v and true or false end,
        }
    })
end

-- تأكد من وجود الأوضاع مرة واحدة فقط
if not state.SmartAutoShoutMode then state.SmartAutoShoutMode = make_mode_bool(false, "SmartAutoShoutMode") end
if not state.AutoInviteMode     then state.AutoInviteMode     = make_mode_bool(false, "AutoInviteMode")     end

-- متغيرات عامة
local active_mode = nil
local repeater_turned_off = false
local last_party_count = -1
local scheduler_running = false
local blacklist = { ["botname"]=true, ["trollguy"]=true }
local last_invite_time = {}
local INVITE_COOLDOWN = 30 -- ثواني

-- إعدادات المودات (يمكنك إضافة مودات جديدة هنا بحرية)
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
        title = "Apollyon Climb Run",
        roles = {DD=1, BRD=1, COR=1, HEALER=1, TANK=1},
        yell = true,
    },
    sortie = {
        title = "Sortie ABCECG",
        roles = {DD=1, BRD=1, COR=1, RDM=1, HEALER=1},
        yell = true,
    },

    -- أمثلة جاهزة لإضافاتك:
    odin = { title = "Odin HTBF Run", roles = {DD=3, COR=1, HEALER=1, TANK=1}, yell = false },
    dynamis = { title = "Dynamis Wave 3 Clear Run", roles = {DD=3, BRD=1, COR=1, HEALER=1}, yell = true },
    ambuscade = { title = "Ambuscade VD Run (Monthly)", roles = {DD=2, BRD=1, COR=1, HEALER=1, TANK=1}, yell = true },
}

-- تصنيف الجوبات
local job_roles = {
    WAR="DD", MNK="DD", THF="DD", DRK="DD", SAM="DD", DRG="DD", NIN="DD", DNC="DD",
    BRD="BRD", COR="COR",
    WHM="HEALER", RDM="HEALER", SCH="HEALER",
    PLD="TANK", RUN="TANK",
    GEO="GEO", BLM="BLM", SCH="SCH" -- دعم إضافي لوضع sortiem مثلًا
}
local function get_role(job) return job_roles[job] or "OTHER" end

-- مساعدات البارتي
local function get_party()
    local ok, p = pcall(windower.ffxi.get_party)
    return ok and p or nil
end

local function get_party_size()
    local p = get_party()
    return (p and p.party1_count) or 0
end

local function get_party_roles()
    local p = get_party()
    local roles = {}
    if not p then return roles end
    for i = 0, 5 do
        local m = p["p"..i]
        if m and m.mob and m.mob.main_job then
            local r = get_role(m.mob.main_job)
            roles[r] = (roles[r] or 0) + 1
        end
    end
    return roles
end

local function get_missing_roles(mode)
    local config = mode_configs[mode]; if not config then return {} end
    local cur = get_party_roles()
    local missing = {}
    for role, req in pairs(config.roles) do
        local have = cur[role] or 0
        if have < req then
            for _=1,(req-have) do table.insert(missing, role) end
        end
    end
    return missing
end

local function show_party_info(mode)
    local cfg = mode_configs[mode]; if not cfg then return end
    local cur = get_party_roles()
    local size = get_party_size()
    local order = {"DD","BRD","COR","RDM","HEALER","TANK","GEO","BLM","SCH"}
    local parts = {}
    for _,r in ipairs(order) do
        if cfg.roles[r] then
            table.insert(parts, ("%s:%d/%d"):format(r, cur[r] or 0, cfg.roles[r]))
        end
    end
    windower.add_to_chat(207, ("[Party Info] %s (%d/6)"):format(table.concat(parts, " "), size))
end

-- الشوت الذكي
local function do_shout(mode)
    if not (state.SmartAutoShoutMode and state.SmartAutoShoutMode.value) then return end
    if not active_mode then return end
    local cfg = mode_configs[mode]; if not cfg then return end

    local size = get_party_size()

    if size >= 6 then
        if not repeater_turned_off then
            windower.send_command('repeater off')
            windower.send_command('gs c set AutoInviteMode off')
            windower.send_command('AutoInvite freeinv off')
            windower.send_command('AutoInvite tellback on')
            windower.add_to_chat(207, '[SEG] Party is full (6/6). Repeater turned OFF.')
            repeater_turned_off = true
        end
        return
    end

    if repeater_turned_off then
        windower.send_command('repeater on')
        windower.send_command('gs c set AutoInviteMode on')
        windower.send_command('AutoInvite freeinv on')
        windower.send_command('AutoInvite tellback off')
        windower.add_to_chat(207, '[SEG] Party size reduced. Repeater can now be turned ON.')
        repeater_turned_off = false
    end

    local missing = get_missing_roles(mode)
    local missing_text = #missing > 0 and table.concat(missing, " ") or "any"
    local msg = ("%s LFM %s %d/6"):format(cfg.title, missing_text, size)

    if cfg.yell then
        windower.send_command('input /yell "'..msg..'"')
    else
        windower.send_command('input /sh "'..msg..'"')
    end

    show_party_info(mode)
    windower.add_to_chat(207, '[AutoShout] '..msg)
end

-- جدولة خفيفة بدل prerender (كل ~2s)
local function schedule_tick()
    if scheduler_running then return end
    scheduler_running = true
    local function tick()
        if state.SmartAutoShoutMode and state.SmartAutoShoutMode.value and active_mode then
            local size = get_party_size()
            if size ~= last_party_count then
                last_party_count = size
                do_shout(active_mode)
            end
        end
        coroutine.schedule(tick, 2)
    end
    coroutine.schedule(tick, 2)
end
schedule_tick()

-- إشعار تغيير حالة المود
local function echo_mode()
    if not state or not state.SmartAutoShoutMode then return end
    local val = state.SmartAutoShoutMode.value
    windower.add_to_chat(val and 207 or 167, val and "[SmartAutoShoutMode] → ON" or "[SmartAutoShoutMode] → OFF")
end

-- عند تغيير المنطقة: أوقف التكرار مؤقتًا
windower.register_event('zone change', function()
    repeater_turned_off = true
    windower.send_command('repeater off')
    windower.send_command('gs c set AutoShoutMode off')
    windower.add_to_chat(207, '[AutoShout] Zone changed → Repeater OFF.')
    -- إعادة السماح بعد 5 ثواني (اختياري)
    coroutine.schedule(function() repeater_turned_off = true end, 5)
end)

-- إشعار عند تغيّر حالة SmartAutoShoutMode (إن توفّر الحدث)
windower.register_event('status change', function() echo_mode() end)

-- أدوات دعوة
local function is_in_party(name)
    local p = get_party()
    for i = 0, 5 do
        local m = p and p["p"..i]
        if m and m.name and m.name:lower() == name:lower() then return true end
    end
    return false
end

-- استخراج أول جوب مذكور أو fallback للجوب الحالي
local function parse_player_job_from_message(sender, text)
    if not text then return nil end
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
        cor="COR", corsair="COR", brd="BRD", bard="BRD",
        whm="WHM", ["white mage"]="WHM", rdm="RDM", ["red mage"]="RDM",
        sch="SCH", scholar="SCH", healer="HEALER",
        pld="PLD", paladin="PLD", run="RUN", ["rune fencer"]="RUN", tank="TANK",
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

    -- لا يوجد ذكر جوب → سنحاول نقرأ جوبه الحالي
    local mob = windower.ffxi.get_mob_by_name(sender)
    if mob and mob.main_job then
        return mob.main_job -- نعيد الكود نفسه مثل "SAM"
    end
    return nil
end

-- استقبال تيلز عبر chat message
windower.register_event('chat message', function(message, player, mode, is_gm)
    if not (state.SmartAutoShoutMode and state.SmartAutoShoutMode.value) then return end
    if not (state.AutoInviteMode and state.AutoInviteMode.value) then return end
    if not active_mode then return end
    if not message or not player then return end
    if mode ~= 3 then return end -- فقط تيلز

    local sender = player
    local lname = sender:lower()
    if blacklist[lname] then
        windower.add_to_chat(167, ("[Blacklist] Ignored %s (blocked)"):format(sender))
        return
    end
    if is_in_party(sender) then return end
    if last_invite_time[lname] and os.clock() - last_invite_time[lname] < INVITE_COOLDOWN then return end

    local job = parse_player_job_from_message(sender, message)
    if job then
        windower.send_command('wait 1; input /pcmd add '..sender)
        windower.add_to_chat(207, ("[AutoInvite] Added %s as %s"):format(sender, job))
        last_invite_time[lname] = os.clock()
    else
        windower.add_to_chat(167, ("[AutoInvite] Could not determine job for %s — no invite sent."):format(sender))
    end
end)

-- أوامر التحكم
windower.register_event('addon command', function(cmd, arg)
    if not cmd then return end
    cmd = cmd:lower()

    -- تشغيل/إيقاف المودات
    if mode_configs[cmd] then
        if arg == 'on' then
            active_mode = cmd
            repeater_turned_off = false
            last_party_count = -1
            windower.add_to_chat(207, ("[SmartAutoShout] %s Mode ON"):format(cmd:upper()))
            do_shout(cmd)
        elseif arg == 'off' then
            active_mode = nil
            windower.add_to_chat(167, ("[SmartAutoShout] %s Mode OFF"):format(cmd:upper()))
        else
            windower.add_to_chat(207, ("[SmartAutoShout] Usage: //%s on | off"):format(cmd))
        end
        return
    end

    -- اختصارات لتبديل الحالات
    if cmd == 'smart' then
        state.SmartAutoShoutMode:toggle()
        echo_mode()
        return
    end
    if cmd == 'autoinv' then
        state.AutoInviteMode:toggle()
        windower.add_to_chat(207, "[AutoInviteMode] → "..(state.AutoInviteMode.value and "ON" or "OFF"))
        return
    end

    -- إدارة البلاك ليست
    if cmd == 'black' then
        local sub = (arg or ""):lower()
        local name = tostring(({...})[2] or "") -- لا تعتمد على {...} هنا داخل GearSwap؛ نخليها بسيطة:
        -- بديل بسيط: استخدم //black add NAME في الشات عبر bind مخصص إذا لزم
        windower.add_to_chat(207, "[Blacklist] Use via code or customize parser if needed.")
        return
    end
end)

-- تحية عند التحميل (آمنة)
coroutine.schedule(function()
    windower.add_to_chat(207, "[SmartAutoShout] Loaded. Use: //smart, //autoinv, //seg on")
end, 0.5)

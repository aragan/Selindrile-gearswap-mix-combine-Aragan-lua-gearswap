--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--
--	Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
--
--	Editing this file will cause you to be unable to use Github Desktop to update!
--
--	Any changes you wish to make in this file you should be able to make by overloading. That is Re-Defining the same variables or functions in another file, by copying and
--	pasting them to a file that is loaded after the original file, all of my library files, and then job files are loaded first.
--	The last files to load are the ones unique to you. User-Globals, Charactername-Globals, Charactername_Job_Gear, in that order, so these changes will take precedence.
--
--	You may wish to "hook" into existing functions, to add functionality without losing access to updates or fixes I make, for example, instead of copying and editing
--	status_change(), you can instead use the function user_status_change() in the same manner, which is called by status_change() if it exists, most of the important 
--  gearswap functions work like this in my files, and if it's unique to a specific job, user_job_status_change() would be appropriate instead.
--
--  Variables and tables can be easily redefined just by defining them in one of the later loaded files: autofood = 'Miso Ramen' for example.
--  States can be redefined as well: state.HybridMode:options('Normal','PDT') though most of these are already redefined in the gear files for editing there.
--	Commands can be added easily with: user_self_command(commandArgs, eventArgs) or user_job_self_command(commandArgs, eventArgs)
--
--	If you're not sure where is appropriate to copy and paste variables, tables and functions to make changes or add them:
--		User-Globals.lua - 			This file loads with all characters, all jobs, so it's ideal for settings and rules you want to be the same no matter what.
--		Charactername-Globals.lua -	This file loads with one character, all jobs, so it's ideal for gear settings that are usable on all jobs, but unique to this character.
--		Charactername_Job_Gear.lua-	This file loads only on one character, one job, so it's ideal for things that are specific only to that job and character.
--
--
--	If you still need help, feel free to contact me on discord or ask in my chat for help: https://discord.gg/ug6xtvQ
--  !Please do NOT message me in game about anything third party related, though you're welcome to message me there and ask me to talk on another medium.
--
--  Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
	organizer_items = {
		"Airmid's Gorget",
		"Gyudon",
		"Reraiser",
		"Hi-Reraiser",
		"Vile Elixir",
		"Vile Elixir +1",
		"Miso Ramen",
		"Carbonara",
		"Silent Oil",
		"Salt Ramen",
		"Panacea",
		"Sublime Sushi",
		"Sublime Sushi 1+",
		"Prism Powder",
		"Antacid",
		"Icarus Wing",
		"Warp Cudgel",
		"Holy Water",
		"Sanjaku-Tenugui",
		"Shinobi-Tabi",
		"Shihei",
		"Remedy",
		"Emporox's Ring",
		"Red Curry Bun",
		"Instant Reraise",
		"Black Curry Bun",
		"Rolan. Daifuku",
		"Reraise Earring",}

		--attack2 = 4500 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this val

end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Hundred Fists'] = buffactive['Hundred Fists'] or false
	state.Buff['Impetus'] = buffactive['Impetus'] or false
	state.Buff['Footwork'] = buffactive['Footwork'] or false
	state.Buff['Boost'] = buffactive['Boost'] or false
	state.HippoMode = M(false, "hippoMode")
	--state.AutoMedicineMode = M(false, 'Auto Medicine Mode')

	state.AutoBoost = M(false, 'Auto Boost Mode')
	
	autows = 'Victory Smite'
	autofood = 'Soy Ramen'
	
    info.impetus_hit_count = 0
    --windower.raw_register_event('action', on_action_for_impetus)
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","HippoMode","AutoMedicineMode"},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)

end

function job_pretarget(spell, spellMap, eventArgs)

end

function job_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and (state.AutoBoost.value or state.AutoBuffMode.value ~= 'Off') then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.AutoBoost.value and player.sub_job == 'WAR' and abil_recasts[2] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Warcry" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		elseif state.AutoBoost.value and abil_recasts[16] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Boost" <me>')
			windower.chat.input:schedule(2.5,'/ws "'..spell.english..'" '..spell.target.raw..'')
			tickdelay = os.clock() + 1.25
			return
		end
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
					equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
				elseif sets.MaxTP then
					equip(sets.MaxTP[spell.english] or sets.MaxTP)
				else
				end
			end
		end
		
        if state.Buff['Impetus'] and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite" or spell.english == "Shijin Spiral" or spell.english == "Asuran Fists" or spell.english == "Raging Fists") then
			if sets.buff.ImpetusWS then
				equip(sets.buff.ImpetusWS)
			else
				equip(sets.buff.Impetus)
			end
		elseif buffactive.Footwork and (spell.english == "Dragon Kick" or spell.english	 == "Tornado Kick") then
			equip(sets.FootworkWS)
		end
	elseif spell.english == 'Boost' and not (player.in_combat or being_attacked or player.status == 'Engaged') and sets.precast.JA['Boost'].OutOfCombat then
		equip(sets.precast.JA['Boost'].OutOfCombat)
	end
end

function job_aftercast(spell, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	update_melee_groups()
	if buff == "Sleep" then
        if gain then    
            send_command('input /p ZZZzzz, please cure.')		
        else
            send_command('input /p '..player.name..' is no longer Sleep!')
        end
    end
	if buff == "petrification" then
        if gain then    
            equip(sets.defense.DT)
            send_command('input /p Petrification, please Stona.')		
        else
        send_command('input /p '..player.name..' is no longer Petrify!')
        handle_equipping_gear(player.status)
        end
    end
    if buff == "Charm" then
        if gain then  			
           send_command('input /p Charmd, please Sleep me.')		
        else	
           send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
           handle_equipping_gear(player.status)
        end
    end

	if state.NeverDieMode.value or state.AutoCureMode.value then 

		if buffactive['poison'] and world.area:contains('Sortie') and (player.sub_job == 'SCH' or player.sub_job == 'WHM') and spell_recasts[14] < spell_latency then 
			windower.chat.input('/ma "Poisona" <me>')
			tickdelay = os.clock() + 1.1
			
		end
	end
	if state.AutoMedicineMode.value == true then
		if buff == "Defense Down" then
			if gain then  			
				send_command('input /item "Panacea" <me>')
			end
		elseif buff == "Magic Def. Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Max HP Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Evasion Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Magic Evasion Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Dia" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end  
		elseif buff == "Bio" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Bind" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "slow" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "weight" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Attack Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "Accuracy Down" then
			if gain then  			
				send_command('@input /item "panacea" <me>')
			end
		end
	
		if buff == "VIT Down" then
			if gain then
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "INT Down" then
			if gain then
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "MND Down" then
			if gain then
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "STR Down" then
			if gain then
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "AGI Down" then
			if gain then
				send_command('@input /item "panacea" <me>')
			end
		elseif buff == "poison" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		end
		if not midaction() then
			job_update()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)
	
	if state.OffenseMode.value ~= 'FullAcc' then
		if state.Buff['Impetus'] then
			meleeSet = set_combine(meleeSet, sets.buff.Impetus)
		end
		if buffactive.Footwork then
			meleeSet = set_combine(meleeSet, sets.buff.Footwork)
		end
	end
	
	if state.Buff['Boost'] then
		meleeSet = set_combine(meleeSet, sets.buff.Boost)
	end
	
    return meleeSet
end

function job_customize_defense_set(defenseSet)
    return defenseSet
end

function job_customize_idle_set(idleSet)
    if state.Buff['Boost'] and sets.buff.Boost then
        idleSet = set_combine(idleSet, sets.buff.Boost)
    end
	if state.HippoMode.value == true then 
        idleSet = set_combine(idleSet, {feet="Hippo. Socks +1"})
    end
	if buffactive['Tactician\'s Roll'] then 
		idleSet = set_combine(idleSet, sets.rollerRing)
	end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if state.HippoMode.value == true then 
        moving = false
	end
end)
-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------

--[[ Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
    if state.Buff.Impetus then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                info.impetus_hit_count = 0
                            elseif action.spike_effect_animation == 63 then
                                info.impetus_hit_count = info.impetus_hit_count + 1
                            end
                        end
                    end
                end
            end
        end
        
        --add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
    else
        info.impetus_hit_count = 0
    end
    
end
]]

function job_self_command(commandArgs, eventArgs)

end

function job_tick()
	if user_status_change() then return true end
	if check_buff() then return true end
	return false
end
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end

end

function user_status_change(newStatus, oldStatus, eventArgs)

	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	--local player = windower.ffxi.get_player()
	
	if state.NeverDieMode.value or state.AutoCureMode.value then 
		if (buffactive['poison'] or buffactive['Taint'] or buffactive['Blind'] 
			or buffactive['paralysis'] or buffactive['disease'] or buffactive['plague']) and abil_recasts[15] < latency then		
			windower.send_command('input /ja "Chakra" <me>')
			tickdelay = os.clock() + 1.1
			return
		end
	end
	
	if state.NeverDieMode.value or state.AutoCureMode.value then 
		if player.hpp < 50 and being_attacked and abil_recasts[19] < latency then 
			windower.chat.input('/ja "Mantra" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif (player.in_combat or being_attacked) and player.hpp < 40 and abil_recasts[15] < latency then
			windower.chat.input('/ja "Chakra" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif (player.in_combat or being_attacked) and player.hpp < 41 and abil_recasts[254] < latency then
			windower.chat.input('/ja "Inner Strength" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
end

function check_buff()
	if state.AutoBuffMode.value == 'Auto' and player.in_combat then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.hpp < 51 and abil_recasts[15] < latency then
			windower.chat.input('/ja "Chakra" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Impetus and abil_recasts[31] < latency then
			windower.chat.input('/ja "Impetus" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[13] < latency then
			windower.chat.input('/ja "Focus" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Footwork and abil_recasts[21] < latency then
			windower.chat.input('/ja "Footwork" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Dodge and abil_recasts[14] < latency then
			windower.chat.input('/ja "Dodge" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] then
			if not buffactive.Berserk and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = os.clock() + 1.1
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Warcry and abil_recasts[2] < latency then
				windower.chat.input('/ja "Warcry" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end
	end

	if state.AutoBuffMode.value == 'Full' and player.in_combat then

		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.hpp < 51 and abil_recasts[15] < latency then
			windower.chat.input('/ja "Chakra" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.hpp < 52 and abil_recasts[19] < latency then
			windower.chat.input('/ja "Mantra" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Impetus and abil_recasts[31] < latency then
			windower.chat.input('/ja "Impetus" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[13] < latency then
			windower.chat.input('/ja "Focus" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Footwork and abil_recasts[21] < latency then
			windower.chat.input('/ja "Footwork" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Dodge and abil_recasts[14] < latency then
			windower.chat.input('/ja "Dodge" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and buffactive.Defender then
			send_command('@wait .5;cancel Defender')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] < latency then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Warcry and abil_recasts[2] < latency then
			windower.chat.input('/ja "Warcry" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive['Hundred Fists'] and abil_recasts[254] < latency then
			windower.chat.input('/ja "Hundred Fists" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
	if state.AutoBuffMode.value == 'Defend' and player.in_combat then

		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'WAR' and buffactive.Berserk then
			send_command('@wait .5;cancel Berserk')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Defender and abil_recasts[3] < latency then
			windower.chat.input('/ja "Defender" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Dodge and abil_recasts[14] < latency then
			windower.chat.input('/ja "Dodge" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif not buffactive.Warcry and abil_recasts[2] < latency then
			windower.chat.input('/ja "Warcry" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end
	return false
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()

	if buffactive.footwork and not buffactive['hundred fists'] then
        classes.CustomMeleeGroups:append('Footwork')
    end
	
	if player.equipment.main and player.equipment.main == "Glanzfaust" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end
	
    if state.Buff['Hundred Fists'] then
        classes.CustomMeleeGroups:append('HF')
    end
end

buff_spell_lists = {
	Defend = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	When='Always'},
	},
	
	Defend = {
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
	},}
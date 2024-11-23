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
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Sentinel = buffactive.Sentinel or false
    state.Buff.Cover = buffactive.Cover or false
	state.WeaponLock = M(false, 'Weapon Lock')
    state.HippoMode = M(false, "hippoMode")
    state.RP = M(false, "Reinforcement Points Mode")  
    state.SrodaBelt = M(false, 'SrodaBelt')
    state.MagicBurst = M(false, 'Magic Burst')

	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}

	state.CurrentStep = M{['description']='Current Step', 'Box Step', 'Quickstep'}
	
	state.AutoEmblem = M(true, 'Auto Emblem')
	state.AutoCover = M(false, 'Auto Cover')
	state.AutoMajesty = M(true, 'Auto Majesty')

	
    elemental_ws = S{"Flash Nova", "Sanguine Blade","Seraph Blade","Burning Blade","Red Lotus Blade"
    , "Shining Strike", "Aeolian Edge", "Gust Slash", "Cyclone","Energy Steal","Energy Drain"
    , "Leaden Salute", "Wildfire", "Hot Shot", "Flaming Arrow", "Trueflight", "Blade: Teki", "Blade: To"
    , "Blade: Chi", "Blade: Ei", "Blade: Yu", "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter"
    , "Primal Rend", "Dark Harvest", "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust"
    , "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki", "Rock Crusher", "Earth Crusher", "Starburst"
    , "Sunburst", "Omniscience", "Garland of Bliss"}

	autows = 'Savage Blade'
	autofood = 'Miso Ramen'
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","CastingMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode","MagicalDefenseMode","ResistDefenseMode","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 172 is Flash Nova, meaning a Spear is equipped.
		if available_ws:contains(172) then
            if spell.english == "Chant du Cygne" then
				send_command('@input /ws "True Strike" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Savage Blade" then
                send_command('@input /ws "Realmrazer" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Sanguine Blade" then
                send_command('@input /ws "Flash Nova" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            end
        end
    end
end

function job_pretarget(spell, spellMap, eventArgs)

end

function job_precast(spell, spellMap, eventArgs)

	if spell.english == 'Flash' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if abil_recasts[80] < latency and not silent_check_amnesia() and spell_recasts[112] < spell_latency and state.AutoEmblem.value then
			eventArgs.cancel = true
			windower.chat.input('/ja "Divine Emblem" <me>')
			windower.chat.input:schedule(1,'/ma "Flash" '..spell.target.raw..'')
		end
	end

end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
					local AccMaxTPset = standardize_set(sets.AccMaxTP)

					if (AccMaxTPset.ear1:startswith("Lugra Earring") or AccMaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayMaxTPWSEars then
						equip(sets.AccDayMaxTPWSEars[spell.english] or sets.AccDayMaxTPWSEars)
					else
						equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
					end
				elseif sets.MaxTP then
					local MaxTPset = standardize_set(sets.MaxTP)
					if (MaxTPset.ear1:startswith("Lugra Earring") or MaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayMaxTPWSEars then
						equip(sets.DayMaxTPWSEars[spell.english] or sets.DayMaxTPWSEars)
					else
						equip(sets.MaxTP[spell.english] or sets.MaxTP)
					end
				else
				end
			else
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayWSEars then
					equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
				elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayWSEars then
					equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
				end
			end
		elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn then
			if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccDayWSEars then
				equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
			elseif sets.DayWSEars then
				equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
			end
		end
	end
	if spell.type == 'WeaponSkill' then
        if elemental_ws:contains(spell.name) then
            -- Matching double weather (w/o day conflict).
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 1.7 yalms.
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Matching day and weather.
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 8 yalms.
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Match day or weather.
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        end
    end
end

function job_post_midcast(spell, spellMap, eventArgs)
    if (spellMap == 'Cure' or spellMap == 'Regen') then
        if state.SrodaBelt.value then
            equip({waist="Sroda Belt"})
        end
    end
	if (spell.skill == 'Elemental Magic' or spell.skill == 'Divine Magic') and (state.MagicBurst.value or AEBurst) then
        equip(sets.magicburst)
    end

end

function job_aftercast(spell, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
		if spell.english:lower():contains('step') then
			state.CurrentStep:cycle()
		end
	end
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end    
end
function job_handle_equipping_gear(playerStatus, eventArgs)   
    if state.ShieldMode.value == "Duban" then
		equip({sub="Duban"})
	elseif state.ShieldMode.value == "Ochain" then
		equip({sub="Ochain"})
	elseif state.ShieldMode.value == "Aegis" then
		equip({sub="Aegis"})
	elseif state.ShieldMode.value == "Priwen" then
		 equip({sub="Priwen"})
	elseif state.ShieldMode.value == "Srivatsa" then
		 equip({sub="Srivatsa"})
	elseif state.ShieldMode.value == "Normal" then
	   equip({})
	end
	if state.HippoMode.value == true then 
        equip({feet="Hippo. Socks +1"})
    end
    check_weaponset()
end
function job_buff_change(buff, gain)
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
	
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
    check_weaponset()

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

    -- Allow jobs to override this code
function job_self_command(commandArgs, eventArgs)

	if commandArgs[1] == 'RuneElement' then
		send_command('input /ja "'..state.RuneElement.value..'" <me>')

	elseif commandArgs[1] == 'SubJobEnmity' then

		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
			return

		elseif player.sub_job == 'RUN' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if abil_recasts[24] < latency then
				send_command('input /ja "Swordplay" <me>')
			end
			
		elseif player.sub_job == 'BLU' and not moving then
			local spell_recasts = windower.ffxi.get_spell_recasts()
					
			if spell_recasts[584] < spell_latency then
				windower.chat.input('/ma "Sheep Song" <t>')
			elseif spell_recasts[598] < spell_latency then
				windower.chat.input('/ma "Soporific" <t>')
			elseif spell_recasts[605] < spell_latency then
				windower.chat.input('/ma "Geist Wall" <t>')
			elseif spell_recasts[537] < spell_latency then
				windower.chat.input('/ma "Stinking Gas" <t>')
			elseif spell_recasts[575] < spell_latency then
				windower.chat.input('/ma "Jettatura" <t>')
			elseif spell_recasts[592] < spell_latency then
				windower.chat.input('/ma "Blank Gaze" <t>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Blue Magic on cooldown.') end
			end

		elseif player.sub_job == 'DRK' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Souleater'] then
				send_command('cancel souleater')
			end
			
			if (state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None')  and buffactive['Last Resort'] then
				send_command('cancel last resort')
			end
			
			if spell_recasts[252] < spell_latency and not silent_check_silence() then
				windower.chat.input('/ma "Stun" <t>')
			elseif abil_recasts[85] < latency then
				windower.chat.input('/ja "Souleater" <me>')
			elseif abil_recasts[87] < latency then
				windower.chat.input('/ja "Last Resort" <me>')
			elseif abil_recasts[86] < latency then
				windower.chat.input('/ja "Arcane Circle" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Dark Knight abillities on cooldown.') end
			end

		elseif player.sub_job == 'WAR' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if state.HybridMode.value:contains('DD') then
				if buffactive['Defender'] then send_command('cancel defender') end
			elseif state.HybridMode.value ~= 'Normal' and not state.HybridMode.value:contains('DD') then
				if buffactive['Berserk'] then send_command('cancel berserk') end
			end
			
			if abil_recasts[5] < latency then
				send_command('input /ja "Provoke" <t>')
			elseif abil_recasts[2] < latency then
				send_command('input /ja "Warcry" <me>')
			elseif abil_recasts[3] < latency then
				send_command('input /ja "Defender" <me>')
			elseif abil_recasts[4] < latency then
				send_command('input /ja "Aggressor" <me>')
			elseif abil_recasts[1] < latency then
				send_command('input /ja "Berserk" <me>')
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'All Enmity Warrior Job Abilities on cooldown.') end
			end
			
		elseif player.sub_job == 'DNC' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
			if under3FMs then
				if abil_recasts[220] < latency then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
				end
			elseif abil_recasts[221] < latency then
				send_command('input /ja "Animated Flourish" <t>')
				return
			elseif abil_recasts[220] < latency and not buffactive['Finishing Move 5'] then
				send_command('@input /ja "'..state.CurrentStep.value..'" <t>')
				return
			elseif not check_auto_tank_ws() then
				if not state.AutoTankMode.value then add_to_chat(123,'Dancer job abilities not needed.') end
			end
		else
			check_auto_tank_ws()
		end

	end

end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
	update_melee_groups()
	check_weaponset()

    if state.RuneElement.value == 'Ignis' then
		RuneResist = "Ice"
		RuneDamage = 'Fire'
	elseif state.RuneElement.value == 'Gelus' then
		RuneResist = "Wind"
        RuneDamage = 'Ice'
	elseif state.RuneElement.value == 'Flabra' then
		RuneResist = "Earth"
        RuneDamage = 'Wind'
	elseif state.RuneElement.value == 'Tellus' then
		RuneResist = "Lightning"
		RuneDamage = 'Earth'
	elseif state.RuneElement.value == 'Sulpor' then
		RuneResist = "Water"
        RuneDamage = 'Lightning'
	elseif state.RuneElement.value == 'Unda' then
		RuneResist = "Fire"
		RuneDamage = 'Water'
	elseif state.RuneElement.value == 'Lux' then
		RuneResist = "Darkness"
		RuneDamage = 'Light'
	elseif state.RuneElement.value == 'Tenebrae' then
		RuneResist = "Light"
		RuneDamage = 'Darkness'
	end
	
	if player.sub_job ~= 'SAM' and state.Stance.value ~= "None" then
		state.Stance:set("None")
	end	
end

-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if state.HippoMode.value == true then 
        idleSet = set_combine(idleSet, {feet="Hippo. Socks +1"})
    end
    if state.IdleMode.value == 'Normal' or state.IdleMode.value:contains('Sphere') then
		if player.mpp < 51 and sets.latent_refresh then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end

		if player.hpp < 71 then
			idleSet = set_combine(idleSet, sets.latent_regen)
		end
    end
	if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    check_weaponset()

    return idleSet
end

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)

    if state.ExtraDefenseMode.value ~= 'None' then
        meleeSet = set_combine(meleeSet, sets[state.ExtraDefenseMode.value])
    end
	check_weaponset()

    return meleeSet

end

function job_customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
	check_weaponset()

    return defenseSet
end

function check_weaponset()
    equip(sets[state.ShieldMode.current])
end

function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra: ' .. state.ExtraDefenseMode.value
    end
   
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
	
    if state.AutoDefenseMode.value == true then
        msg = msg .. ', Auto Defense: On'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.sub and not player.equipment.sub:endswith('Shield') and not player.equipment.sub:endswith('Strap') and
		player.equipment.sub ~= 'empty' and player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' and player.equipment.sub ~= 'Duban' and player.equipment.sub ~= 'Priwen' and 
		player.equipment.sub ~= 'Blurred Shield +1' and player.equipment.sub ~= 'Beatific Shield +1' and player.equipment.sub ~= 'Srivatsa' and player.equipment.sub ~= 'Svalinn' and 
		player.equipment.sub ~= 'Adamas' and player.equipment.sub ~= 'Chanter\'s Shield' and player.equipment.sub ~= 'Sacro Bulwark' then
		state.CombatForm:set('DW')
		else
		state.CombatForm:reset()
		end
    end
end

function job_tick()
	if check_majesty() then return true end
	if check_hasso() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if state.AutoTankMode.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_flash() then return true
		else 
			windower.send_command('gs c SubJobEnmity')
			tickdelay = os.clock() + 1
			return true
		end
	end
	return false
end

function check_flash()
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if spell_recasts[112] < spell_latency then
		send_command('input /ma "Flash" <t>')
		tickdelay = os.clock() + 2
		return true
	else
		return false
	end
end

function update_melee_groups()
	if player.equipment.main then
		classes.CustomMeleeGroups:clear()
		
		if player.equipment.main == "Burtgang" and state.Buff['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM')
		end
	end	
end

function check_majesty()
	if state.AutoMajesty.value and player.in_combat and not buffactive.Majesty and not silent_check_amnesia() then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if abil_recasts[150] < latency then
			windower.chat.input('/ja "Majesty" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end
	return false
end

function check_cover(Protectee)
    if state.AutoCover.value and not midaction() and Protectee.hpp < 85 and math.sqrt(Protectee.distance) < 10 and windower.ffxi.get_ability_recasts()[76] < latency then
		windower.chat.input('/ja Cover '..Protectee.name..'')
    end
end 

function check_hasso()
if player.sub_job == 'SAM' and player.status == 'Engaged' and not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan or state.Buff['SJ Restriction'] or main_weapon_is_one_handed() or silent_check_amnesia()) then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] < latency then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] < latency then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end
	end

	return false
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		if player.in_combat then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive['Majesty'] and abil_recasts[150] < latency then
				windower.chat.input('/ja "Majesty" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end
		
	else
		return false
	end
end

function check_buffup()
	if buffup ~= '' then
		local needsbuff = false
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) then
				needsbuff = true
				break
			end
		end
	
		if not needsbuff then
			add_to_chat(217, 'All '..buffup..' buffs are up!')
			buffup = ''
			return false
		end
		
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) and spell_recasts[buff_spell_lists[buffup][i].SpellID] < spell_latency then
				windower.chat.input('/ma "'..buff_spell_lists[buffup][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		
		return false
	else
		return false
	end
end

windower.register_event('hpp change', -- code add from Aragan Asura
function(new_hpp,old_hpp)
    if new_hpp < 5 then
        equip(sets.Reraise)
    end
end
)

buff_spell_lists = {
	Auto = {	
		{Name='Crusade',Buff='Enmity Boost',SpellID=476,When='Always'},
		{Name='Reprisal',Buff='Reprisal',SpellID=97,When='Always'},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,When='Always'},
	},
	
	Default = {
		{Name='Crusade',Buff='Enmity Boost',SpellID=476,Reapply=false},
		{Name='Reprisal',Buff='Reprisal',SpellID=97,Reapply=false},
		{Name='Haste',Buff='Haste',SpellID=57,Reapply=false},
		{Name='Refresh',Buff='Refresh',SpellID=109,Reapply=false},
		{Name='Aquaveil',Buff='Aquaveil',SpellID=55,Reapply=false},
		{Name='Stoneskin',Buff='Stoneskin',SpellID=54,Reapply=false},
		{Name='Blink',Buff='Blink',SpellID=53,Reapply=false},
		{Name='Regen',Buff='Regen',SpellID=108,Reapply=false},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,Reapply=false},
	},
}
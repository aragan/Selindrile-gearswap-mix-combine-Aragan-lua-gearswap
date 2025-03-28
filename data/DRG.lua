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
    
end


-- Setup vars that are user-independent.
function job_setup()

    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Spirit Surge'] = buffactive['Spirit Surge'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	state.AutoJumpMode = M(false, 'Auto Jump Mode')
	state.AutoBondMode = M(true, 'Auto Bond Mode')

	absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-MaxAcc', 'Absorb-TP'}

	autows = 'Savage Blade'
	autofood = 'Soy Ramen'

	Breath_HPP = 60
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoJumpMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoMedicineMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","TreasureMode",})
end

function job_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.sub_job == 'SAM' and not state.Buff['SJ Restriction'] then
			if player.tp > 1850 and abil_recasts[140] < latency then
				eventArgs.cancel = true
				windower.chat.input('/ja "Sekkanoki" <me>')
				windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
				tickdelay = os.clock() + 1.25
				return
			elseif abil_recasts[134] < latency then
				eventArgs.cancel = true
				windower.chat.input('/ja "Meditate" <me>')
				windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
				tickdelay = os.clock() + 1.25
				return
			end
		end
	elseif spell.action_type == 'Ability' then
		if spell.english == 'Restoring Breath' and state.AutoBondMode.value then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if pet.isvalid and pet.hpp < 75 and abil_recasts[239] < latency and abil_recasts[149] < latency and spell.target.hpp > 44 then
				eventArgs.cancel = true
				windower.chat.input('/ja "Spirit Bond" <me>')
				windower.chat.input:schedule(1,'/ja "Restoring Breath" '..spell.target.raw..'')
			end
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
					equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
				elseif sets.MaxTP then
					equip(sets.MaxTP[spell.english] or sets.MaxTP)
				else
				end
			end
		end
	elseif spell.type == 'JobAbility' then
		if spell.english:endswith('Jump') then
			if sets.precast.JA[spell.english] then
				if sets.precast.JA[spell.english][state.OffenseMode.value] then
					equip(sets.precast.JA[spell.english][state.OffenseMode.value])
				end
			end
		end
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' and player.hpp > 25 and player.hpp < Breath_HPP and pet.isvalid then
		equip(sets.midcast.HB_Trigger)
	end

end

-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, spellMap, eventArgs)

end

function job_pet_aftercast(spell, spellMap, eventArgs)
	if spell.english == 'Restoring Breath' and state.AutoBondMode.value then
		windower.send_command('cancel spirit bond')
	end
end
function job_filter_aftercast(spell, spellMap, eventArgs)
	if not spell.interrupted then
		if spell.english == "Angon" then
			send_command('timers create "Angon Defense Down" 90 down')
		end
	end
end
function job_aftercast(spell, spellMap, eventArgs)
	if pet.isvalid then
		if (spell.action_type == 'Magic' and player.hpp < Breath_HPP) or spell.english == 'Steady Wing' or spell.english == 'Restoring Breath' then
			petWillAct = os.clock()
			equip(sets.HealingBreath)
			eventArgs.handled = true
		elseif spell.english == 'Smiting Breath' and sets.SmitingBreath then
			petWillAct = os.clock()
			equip(sets.SmitingBreath)
			eventArgs.handled = true
		end
	end
	--Countdowns--
	if not spell.interrupted then
		if spell.english == "Angon" then
			send_command('timers create "Angon Defense Down" 90 down')
		end
	end
			--[[if spell.english == "Meditate" then
				send_command('wait 169;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
			elseif spell.english == "Sekkanoki" then
				send_command('wait 289;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
			elseif spell.english == "Jump" then
				send_command('wait 49;gs c -cd '..spell.name..': [Ready!]')
			elseif spell.english == "High Jump" then
				send_command('wait 100;gs c -cd '..spell.name..': [Ready!!]')
			elseif spell.english == "Spirit Jump" then
				send_command('wait 49;gs c -cd '..spell.name..': [Ready!]')
			elseif spell.english == "Soul Jump" then
				send_command('wait 100;gs c -cd '..spell.name..': [Ready!!]')
			elseif spell.english == "Angon" then
				send_command('timers create "Angon Defense Down" 90 down')
			elseif spell.type == "WeaponSkill" then
				SkillchainPending = true
				SkillchainTimer = os.time()    -- sets SkillchainTimer variable to the current time of the operating system (in seconds)
			end ]]
		
end

function job_buff_change(buff, gain)
	update_melee_groups()
	if buff == "Dragon Breaker" then
        if gain then  			
            send_command('input /p "Dragon Breaker" [ON]')		
        else	
            send_command('input /p "Dragon Breaker" [OFF]')
        end
    end
    if buff == "Ancient Circle" then
        if gain then  			
            send_command('input /p "Ancient Circle" [ON]')		
        else	
            send_command('input /p "Ancient Circle" [OFF]')
        end
    end
	if buff == "petrification" then
        if gain then    
            equip(sets.defense.PDT)
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
        end
    end
end

function job_update(cmdParams, eventArgs)
    update_melee_groups()
	find_breath_hpp()

	if player.sub_job ~= 'SAM' and state.Stance.value ~= "None" then
		state.Stance:set("None")
	end
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    
    if data.areas.adoulin:contains(world.area) and buffactive.Ionis then
		classes.CustomMeleeGroups:append('Adoulin')
    end
	
	if player.equipment.main and player.equipment.main == "Ryunohige" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end
    
  -- Spirit Surge modifies the custom melee groups
    if state.Buff['Spirit Surge'] then
        classes.CustomMeleeGroups:append('SpiritSurge')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(commandArgs, eventArgs)

end

function job_tick()
	if check_hasso() then return true end
	if check_jump() then return true end
	if check_buff() then return true end
	return false
end

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)
    return meleeSet
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
		end
	
	end
		
	return false
end

function check_jump()
    if state.AutoJumpMode.value and player.status == 'Engaged' and player.tp < 501 then

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if abil_recasts[166] < latency then
            windower.chat.input('/ja "Spirit Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[167] < latency then
            windower.chat.input('/ja "Soul Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[158] < latency then
            windower.chat.input('/ja "Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif abil_recasts[159] < latency then
            windower.chat.input('/ja "High Jump" <t>')
            tickdelay = os.clock() + 1.1
            return true
        elseif pet.isvalid and abil_recasts[162] < latency and pet.tp > 350 then
            windower.chat.input('/ja "Spirit Link" <me>')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not pet.isvalid and abil_recasts[163] < latency then
			windower.chat.input('/ja "Call Wyvern" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Buff['SJ Restriction'] then
			return false
		elseif player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency then
			windower.chat.input('/ja "Last Resort" <me>')
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
		else
			return false
		end
	end
		
	return false
end

function find_breath_hpp()
	if S{'WHM','BLM','RDM','SMN','BLU','SCH','GEO'}:contains() then
		if sets.midcast.HB_Trigger and (sets.midcast.HB_Trigger.head:contains('Vishap') or sets.midcast.HB_Trigger.head:contains('Drachen')) then
			Breath_HPP = 65
		else
			Breath_HPP = 45
		end
	elseif S{'PLD','DRK','BRD','NIN','RUN'}:contains() then
		if sets.midcast.HB_Trigger and (sets.midcast.HB_Trigger.head:contains('Vishap') or sets.midcast.HB_Trigger.head:contains('Drachen')) then
			Breath_HPP = 45
		else
			Breath_HPP = 35
		end
	end
end

windower.register_event('hpp change', -- code add from Aragan Asura
function(new_hpp,old_hpp)
    if new_hpp < 5 then
        equip(sets.Reraise)
    end
end
)

Breath_HPP = 35
end
end
end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	When='Always'},
	},
	Self = {
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}
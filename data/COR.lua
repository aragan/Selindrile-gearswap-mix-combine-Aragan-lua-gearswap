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
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off
    
    Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
    for ranged weaponskills, but not actually meleeing.
    
    Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
--]]


-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
	organizer_items  = {
        "Airmid's Gorget",
        "Tumult's Blood",
        "Sarama's Hide",
        "Hidhaegg's Scale",
        "Sovereign's Hide",
        "Grape Daifuku",
        "Soy Ramen",
        "G. Curry Bun +1",
        "Pukatrice Egg",
        "Moogle Amp.",
        "Pear Crepe",
        "Crab Sushi",
        "Om. Sandwich",
        "Red Curry Bun",
        "Living Bullet",
        "Chrono Bullet",
        "Trump Card Case",
        "Trump Card",
        --"Chr. Bul. Pouch", 
        "Liv. Bul. Pouch", 
        "Dec. Bul. Pouch",
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
        "Reraise Earring",
    }
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	-- Whether to use Compensator under a certain threshhold even when weapons are locked.
	state.CompensatorMode = M{'Never','300','1000','Always'}
	-- Whether to automatically generate bullets.
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false
	state.RP = M(false, "Reinforcement Points Mode")  
	state.WeaponLock = M(false, 'Weapon Lock')
    state.QDMode = M{['description']='Quick Mode','Enhance', 'STP',  'TH'}
    state.ElementalMode = M{['description'] = 'Elemental Mode','Light', 'Fire','Ice','Wind','Earth','Lightning','Water','Dark'}
	state.RuneElement = M{['description'] = 'Rune Element','Lux','Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Tenebrae'}

    state.phalanxset = M(false,true)

    state.Roller1 = M{['description']='Roller', 'Chaos Roll', 'Samurai Roll','Fighter\'s Roll',
    'Wizard\'s Roll', 'Warlock\'s Roll','Miser\'s Roll',
      'Companion\'s Roll','Puppet Roll', 'Beast Roll', 'Drachen Roll',
      'Blitzer\'s Roll', 'Courser\'s Roll', 'Allies\' Roll',
     'Avenger\'s Roll', 'Magus\'s Roll', 'Runeist\'s Roll', 'Gallant\'s Roll',
    'Monk\'s Roll', 'Healer\'s Roll', 'Rogue\'s Roll',
    'Choral Roll', 'Hunter\'s Roll', 'Ninja Roll', 'Evoker\'s Roll',
    'Dancer\'s Roll', 'Scholar\'s Roll', 'Bolter\'s Roll', 'Caster\'s Roll','Naturalist\'s Roll',
    }
    state.Roller2 = M{['description']='Roller', 'Samurai Roll', 'Chaos Roll', 'Fighter\'s Roll',
    'Wizard\'s Roll', 'Warlock\'s Roll','Miser\'s Roll',
      'Companion\'s Roll','Puppet Roll', 'Beast Roll', 'Drachen Roll',
      'Blitzer\'s Roll', 'Courser\'s Roll', 'Allies\' Roll',
     'Avenger\'s Roll', 'Magus\'s Roll', 'Runeist\'s Roll', 'Gallant\'s Roll',
    'Monk\'s Roll', 'Healer\'s Roll', 'Rogue\'s Roll',
    'Choral Roll', 'Hunter\'s Roll', 'Ninja Roll', 'Evoker\'s Roll',
    'Dancer\'s Roll', 'Scholar\'s Roll', 'Bolter\'s Roll', 'Caster\'s Roll','Naturalist\'s Roll',
    }
    state.Rollset = M{['description']='Rollset','None', 'melee', 'magic','dynamis','aminon','exp','tp','speed','acc','ws',
    'pet','petnuke',
    }
	-- Whether to use Luzaf's Ring
	state.LuzafRing = M(true, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo

	autows = 'Leaden Salute'
    autonuke = 'Absorb-TP'
	rangedautows = 'Last Stand'
	autofood = 'Sublime Sushi'
	ammostock = 98

    Haste = 0
    DW_needed = 0
    DW = false
    determine_haste_group()
    update_combat_form()  

    define_roll_values()
	init_job_states({"Capacity","AutoNukeMode","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","RngHelper","AutoStunMode","AutoDefenseMode","LuzafRing","AutoMedicineMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","Rollset","ElementalMode","IdleMode","Passive","RuneElement","CompensatorMode","TreasureMode","QDMode"})
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)
	if spell.type == 'WeaponSkill' then
		local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
		-- WS 112 is Double Thrust, meaning a Spear is equipped.
		if available_ws:contains(16) then
            if spell.english == "Savage Blade" then
				windower.chat.input('/ws "Evisceration" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
            elseif spell.english == "Circle Blade" then
                windower.chat.input('/ws "Aeolian Edge" '..spell.target.raw)
                cancel_spell()
				eventArgs.cancel = true
			end
        end
	end


end

function job_pretarget(spell, spellMap, eventArgs)

end

function job_precast(spell, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
    -- Check that proper ammo is available if we're using ranged attacks or similar.
    elseif spell.type == 'CorsairShot' then
		if not player.inventory['Trump Card'] and player.satchel['Trump Card'] then
			send_command('get "Trump Card" satchel')
			eventArgs.cancel = true
			windower.chat.input:schedule(1,'/ja "'..spell.english..'" '..spell.target.raw..'')
			return
		end
    end
	if spell.type == 'CorsairRoll' and not spell.interrupted then
		enable('range')
	end
    if spell.action_type == 'Ranged Attack' or spell.name == 'Shadowbind' or (spell.type == 'WeaponSkill' and spell.skill == 'Marksmanship') then
        do_bullet_checks(spell, spellMap, eventArgs)
    end
end

function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		if state.Buff['Triple Shot'] and sets.buff['Triple Shot'] then
			if sets.buff['Triple Shot'][state.RangedMode.value] then
				equip(sets.buff['Triple Shot'][state.RangedMode.value])
			else
				equip(sets.buff['Triple Shot'])
			end
		end

		if state.Buff.Barrage and sets.buff.Barrage then
			equip(sets.buff.Barrage)
		end
	end
	if spell.type == 'CorsairShot' then
        if (spell.english ~= 'Light Shot' and spell.english ~= 'Dark Shot') then
            if state.QDMode.value == 'Enhance' then
                equip(sets.midcast.CorsairShot.Enhance)
            elseif state.QDMode.value == 'TH' then
                equip(sets.midcast.CorsairShot)
                equip(sets.TreasureHunter)
            elseif state.QDMode.value == 'STP' then
                equip(sets.midcast.CorsairShot.STP)
            end
        end
	end

end



function job_midcast(spell, action, spellMap, eventArgs)
	--Probably overkill but better safe than sorry.
	if spell.action_type == 'Ranged Attack' then
		if player.equipment.ammo:startswith('Hauksbok') or player.equipment.ammo == "Animikii Bullet" then
			enable('ammo')
			equip({ammo=empty})
			add_to_chat(123,"Abort Ranged Attack: Don't shoot your good ammo!")
			return
		end
	end

end
function job_filter_aftercast(spell, spellMap, eventArgs)
	if spell.english == "Light Shot" then
        send_command('@timers c "Light Shot ['..spell.target.name..']" 120 down abilities/00195.png')
    end


end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, spellMap, eventArgs)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
		if state.CompensatorMode.value ~= 'Never' then
			if (player.equipment.range and player.equipment.range == 'Compensator') and sets.weapons[state.Weapons.value] and sets.weapons[state.Weapons.value].range then
				equip({range=sets.weapons[state.Weapons.value].range})
				disable('range')
			end
			if sets.precast.CorsairRoll.main and sets.weapons[state.Weapons.value] and sets.weapons[state.Weapons.value].main then
				equip({main=sets.weapons[state.Weapons.value].main})
				disable('main')
			end
		end

        display_roll_info(spell)
	end
    if spell.english == 'Bolter\'s Roll' then
        send_command('@input //roller off')
    end
	if state.UseDefaultAmmo.value then
		equip({ammo=gear.RAbullet})
	end
	if spell.english == "Light Shot" then
        send_command('@timers c "Light Shot ['..spell.target.name..']" 120 down abilities/00195.png')
    end
	if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
	check_weaponset()

end

local command_count = 0
local rate_limit = 5 -- commands per 10 seconds

function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end
function job_self_command(commandArgs, eventArgs)
    gearinfo(commandArgs, eventArgs)

	if commandArgs[1]:lower() == 'elemental' and commandArgs[2]:lower() == 'quickdraw' then
		windower.chat.input('/ja "'..data.elements.quickdraw_of[state.ElementalMode.Value]..' Shot" <t>')
		eventArgs.handled = true			
	end
    if commandArgs[1]:lower() == 'roller1' then
       send_command('@input //roller roll1 "'..state.Roller1.value..'"')
    elseif commandArgs[1]:lower() == 'roller2' then
        send_command('@input //roller roll2 "'..state.Roller2.value..'"')
    elseif commandArgs[1]:lower() == 'rollset' then
        send_command('@input //roller "'..state.Rollset.value..'"')
    end
   --[[ if commandArgs[1]:lower() == 'roller1' then
        send_command('@input //cor roll 1 "'..state.Roller1.value..'"')
     elseif commandArgs[1]:lower() == 'roller2' then
         send_command('@input //cor roll 2 "'..state.Roller2.value..'"')
     end]]

end

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 11 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 11 and DW_needed <= 27 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 27 and DW_needed <= 38 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 38 and DW_needed <= 40 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 40 and DW_needed <= 42 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 42 then
            classes.CustomMeleeGroups:append('LowHaste')
        end
    end
end

function gearinfo(commandArgs, eventArgs)
    if commandArgs[1] == 'gearinfo' then
        if type(tonumber(commandArgs[2])) == 'number' then
            if tonumber(commandArgs[2]) ~= DW_needed then
            DW_needed = tonumber(commandArgs[2])
            DW = true
            end
        elseif type(commandArgs[2]) == 'string' then
            if commandArgs[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(commandArgs[3])) == 'number' then
            if tonumber(commandArgs[3]) ~= Haste then
                Haste = tonumber(commandArgs[3])
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

function job_buff_change(buff, gain)
	if player.equipment.Ranged and buff:contains('Aftermath') then
		classes.CustomRangedGroups:clear()
		if (player.equipment.Ranged == 'Death Penalty' and buffactive['Aftermath: Lv.3']) then
			classes.CustomRangedGroups:append('AM')
		end
	end
    if buff == "Crooked Cards" then
        if gain then  			
           send_command('input /p Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Ready')		
        end
    end
	if buff == "phalanx" or "Phalanx II" then
        if gain then
            state.phalanxset:set(false)
        end
    end
    if buff == "Charm" then
        if gain then  			
           send_command('input /p Charmd, please Sleep me.')		
        else	
           send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
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
	if buff == "sleep" then
        if gain then    
            send_command('input /p ZZZzzz, please cure.')		
        else
            send_command('input /p '..player.name..' is no longer Sleep!')
        end
    end

end
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
    if state.phalanxset .value == true then
        equip(sets.Phalanx_Received)
        send_command('gs equip sets.midcast.Phalanx')
        send_command('input /p Phalanx set equiped [ON] PLZ GIVE ME PHALANX')	
    else 
        state.phalanxset:reset()
    end

    check_weaponset()
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    return idleSet
end
-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.Weapon.value then
        meleeSet = set_combine(meleeSet, check_weaponset())
    end
	check_weaponset()

    return meleeSet
end
function job_handle_equipping_gear(playerStatus, eventArgs)
	check_weaponset()
    determine_haste_group()
	update_combat_form()
end
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	check_weaponset()
    handle_equipping_gear(player.status)

end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if data.weaponskills.elemental:contains(spell.english) then
					if wsacc:contains('Acc') and sets.MagicalAccMaxTP then
						equip(sets.MagicalAccMaxTP[spell.english] or sets.MagicalAccMaxTP)
					elseif sets.MagicalMaxTP then
						equip(sets.MagicalMaxTP[spell.english] or sets.MagicalMaxTP)
					else
					end
				elseif spell.skill == 26 then
					if wsacc:contains('Acc') and sets.RangedAccMaxTP then
						equip(sets.RangedAccMaxTP[spell.english] or sets.RangedAccMaxTP)
					elseif sets.RangedMaxTP then
						equip(sets.RangedMaxTP[spell.english] or sets.RangedMaxTP)
					else
					end
				else
					if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
						equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
					elseif sets.MaxTP then
						equip(sets.MaxTP[spell.english] or sets.MaxTP)
					else
					end
				end
			end
		end
	elseif spell.type == 'CorsairShot' and not (spell.english == 'Light Shot' or spell.english == 'Dark Shot') then
		if (state.WeaponskillMode.value == "Proc" or state.CastingMode.value == "Proc") and sets.precast.CorsairShot.Proc then
			equip(sets.precast.CorsairShot.Proc)
		elseif state.CastingMode.value == 'Fodder' and sets.precast.CorsairShot.Damage then
			equip(sets.precast.CorsairShot.Damage)
			
			local distance = spell.target.distance - spell.target.model_size
			local single_obi_intensity = 0
			local orpheus_intensity = 0
			local hachirin_intensity = 0

			if item_available("Orpheus's Sash") then
				orpheus_intensity = (16 - (distance <= 1 and 1 or distance >= 15 and 15 or distance))
			end
			
			if item_available(data.elements.obi_of[spell.element]) then
				if spell.element == world.weather_element then
					single_obi_intensity = single_obi_intensity + data.weather_bonus_potency[world.weather_intensity]
				end
				if spell.element == world.day_element then
					single_obi_intensity = single_obi_intensity + 10
				end
			end
			
			if item_available('Hachirin-no-Obi') then
				if spell.element == world.weather_element then
					hachirin_intensity = hachirin_intensity + data.weather_bonus_potency[world.weather_intensity]
				elseif spell.element == data.elements.weak_to[world.weather_element] then
					hachirin_intensity = hachirin_intensity - data.weather_bonus_potency[world.weather_intensity]
				end
				if spell.element == world.day_element then
					hachirin_intensity = hachirin_intensity + 10
				elseif spell.element == data.elements.weak_to[world.day_element] then
					hachirin_intensity = hachirin_intensity - 10
				end
			end
			
			if single_obi_intensity >= hachirin_intensity and single_obi_intensity >= orpheus_intensity and single_obi_intensity >= 5 then
				equip({waist=data.elements.obi_of[spell.element]})
			elseif hachirin_intensity >= orpheus_intensity and hachirin_intensity >= 5 then
				equip({waist="Hachirin-no-Obi"})
			elseif orpheus_intensity >= 5 then
				equip({waist="Orpheus's Sash"})
			end
			
		end
		
	elseif spell.action_type == 'Ranged Attack' then
		if buffactive.Flurry then
			if sets.precast.RA.Flurry and lastflurry == 1 then
				equip(sets.precast.RA.Flurry)
			elseif sets.precast.RA.Flurry2 and lastflurry == 2 then
				equip(sets.precast.RA.Flurry2)
			end
		end
	elseif spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
		if state.LuzafRing.value and item_available("Luzaf's Ring") then
			equip(sets.precast.LuzafRing)
		end
		if spell.type == 'CorsairRoll' and state.CompensatorMode.value ~= 'Never' and (state.CompensatorMode.value == 'Always' or tonumber(state.CompensatorMode.value) > player.tp) then
			if item_available("Compensator") then
				enable('range')
				equip({range="Compensator"})
			end
			if sets.precast.CorsairRoll.main and sets.precast.CorsairRoll.main ~= player.equipment.main then
				enable('main')
				equip({main=sets.precast.CorsairRoll.main})
			end
		end
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 and sets.precast.FoldDoubleBust then
		equip(sets.precast.FoldDoubleBust)
	end

end
function check_weaponset()
    equip(sets[state.Weapongun.current])
    if (player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC') then
        equip(sets.DefaultShield)
    elseif player.sub_job == 'NIN' and player.sub_job_level < 10 or player.sub_job == 'DNC' and player.sub_job_level < 20 then
        equip(sets.DefaultShield)
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------




function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=3, unlucky=7, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=4, unlucky=8, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies' Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		["Naturalist's Roll"]   = {lucky=3, unlucky=7, bonus="Enhancing Duration"},
		["Runeist's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Evasion"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(217, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(217, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
        windower.chat.input('/p "Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'."')

    
    end
end


-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)

    if (player.equipment.ammo == 'Animikii Bullet' or player.equipment.ammo == 'Hauksbok Bullet') then
		cancel_spell()
		eventArgs.cancel = true
		enable('ammo')

		if sets.weapons[state.Weapons.value].ammo and item_available(sets.weapons[state.Weapons.value].ammo) then
			equip({ammo=sets.weapons[state.Weapons.value].ammo})
			disable('ammo')
		elseif item_available(gear.RAbullet) then
			equip({ammo=gear.RAbullet})
		else
			equip({ammo=empty})
		end

		add_to_chat(123,"Abort: Don't shoot your good ammo!")
		return
    end

    local bullet_name
    local bullet_min_count = 1
    
    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if data.weaponskills.elemental:contains(spell.english) then
                -- magical weaponskills
                bullet_name = gear.MAbullet
            else
				-- physical weaponskills
				bullet_name = gear.WSbullet
            end
        else
            -- Ignore non-ranged weaponskills
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.RAbullet
        if state.Buff['Triple Shot'] then
            bullet_min_count = 3
        end
    end
  
	local available_bullets = count_available_ammo(bullet_name)
	
  -- If no ammo is available, give appropriate warning and cancel.
    if not (available_bullets > 0) then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(217, 'No Quick Draw ammo available, using equipped ammo: ('..player.equipment.ammo..')')
            return
        elseif spell.type == 'WeaponSkill' and (player.equipment.ammo == gear.RAbullet or player.equipment.ammo == gear.WSbullet or player.equipment.ammo == gear.MAbullet) then
            add_to_chat(217, 'No weaponskill ammo available, using equipped ammo: ('..player.equipment.ammo..')')
            return
        else
            add_to_chat(217, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end
    
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and (available_bullets <= bullet_min_count) then
        add_to_chat(217, 'No ammo will be left for Quick Draw.  Cancelling.')
        eventArgs.cancel = true
        return
    end
    
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and (available_bullets > 0) and (available_bullets <= options.ammo_warning_limit) then
        local msg = '****  LOW AMMO WARNING: '..bullet_name..' ****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end
        
        add_to_chat(217, border)
        add_to_chat(217, msg)
        add_to_chat(217, border)
    end
end

function job_tick()
	if check_ammo() then return true end
	return false
end
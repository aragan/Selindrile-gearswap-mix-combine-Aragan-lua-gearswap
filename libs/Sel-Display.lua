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
----------------------------------------------------------------------------------------------------
-- Job State Display -- Originally written by Talym, modified by Selindrile.
----------------------------------------------------------------------------------------------------
-- Creates a customizable visual job state display for states managed by Modes.lua
--
-- Include in get_sets(), user_setup(), etc, or custom include file
--
-- By default, supports the following modal states:
-- OffenseMode, DefenseMode, HybridMode, IdleMode, WeaponskillMode, CastingMode,
-- MainStep, AltStep, TreasureMode, TotalHaste, DelayReduction
--
-- Additional modal states can be supported by defining a label mapping in update_job_states()
-- Boolean states require no modifications
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Initialize display
-- Call after defining job states in get_sets(), user_setup(), etc.
--
-- required     job_bools   List of boolean-type states to manage
-- required     job_modes   List of modal-type states to manage
--
-- EXAMPLE
-- function user_setup()
--      state.MagicBurst = M(false, 'Magic Burst')
--      state.CastingMode:options('Normal', 'Death')
--      state.IdleMode:options('Normal', 'Death')
--      init_job_states({"MagicBurst"},{"CastingMode","IdleMode"})
-- end
----------------------------------------------------------------------------------------------------
function init_job_states(job_bools,job_modes)

    stateList = job_modes
    stateBool = job_bools

    if stateBox then stateBox:destroy() end

    local settings = windower.get_windower_settings()
	local x,y
	
	if settings["ui_x_res"] == 1920 and settings["ui_y_res"] == 1080 then
		x,y = settings["ui_x_res"]-1917, settings["ui_y_res"]-18 -- -285, -18
	else
		x,y = 0, settings["ui_y_res"]-17 -- -285, -18
	end
	
	if displayx then x = displayx end
	if displayy then y = displayy end

	local font = displayfont or 'Arial'
	local size = displaysize or 12
	local bold = displaybold or true
	local bg = displaybg or 0
	local strokewidth = displaystroke or 2
	local stroketransparancy = displaytransparancy or 192
	
    stateBox = texts.new()
    stateBox:pos(x,y)
    stateBox:font(font)--Arial
    stateBox:size(size)
    stateBox:bold(bold)
    stateBox:bg_alpha(bg)--128
    stateBox:right_justified(false)
    stateBox:stroke_width(strokewidth)
    stateBox:stroke_transparency(stroketransparancy)

    update_job_states(stateBox)

end

----------------------------------------------------------------------------------------------------
-- Update display
-- Call from state_change(), job_state_change(), etc.
----------------------------------------------------------------------------------------------------
function update_job_states()

	if not state.DisplayMode.value then
		if stateBox then stateBox:hide() end
		return		
	end

    -- Define colors for text in the display
    local clr = {
        h='\\cs(255,192,0)', -- Yellow for active booleans and non-default modals
		w='\\cs(255,255,255)', -- White for labels and default modals
        n='\\cs(192,192,192)', -- White for labels and default modals
        s='\\cs(96,96,96)', -- Gray for inactive booleans
		Fire='\\cs(255,80,80)', -- Red For Fire Element
		Ice='\\cs(140,160,255)', -- Light Blue For Ice Element
		Wind='\\cs(110,255,110)', -- Light Green For Wind Element
		Earth='\\cs(220,214,110)', -- Brown/Yellow For Earth Element
		Lightning='\\cs(190,90,190)', -- Purple For Lightning Element
		Water='\\cs(110,110,255)', -- Blue For Water Element
		Light='\\cs(255,255,155)', -- Light Yellow For Light Element
		Dark='\\cs(90,90,90)', -- Dark Grey For Dark Element
    }
    if state.DisplayColors then
		clr = state.DisplayColors
	end

    local info = {}
    local orig = {}
    local spc = '    '

    -- Define labels for each state
    local labels = {
		Weapons = "Weapons",
		UnlockWeapons = "Unlock Weapons",
        OffenseMode = "Offense",
		RangedMode = "Ranged",
        DefenseMode = "Defense",
        HybridMode = "Hybrid",
        IdleMode = "Idle",
		Passive = "Passive",
		PetMode = "Pet Mode",
		AutoManawell = "Auto Manawell",
        WeaponskillMode = "Weaponskill",
        CastingMode = "Casting",
        MainStep = "Main Step",
        AltStep = "Alt Step",
        TreasureMode = "Treasure",
		AutoBuffMode = "Auto Buff",
        TotalHaste = "Haste",
        DelayReduction = "Delay",
		LearningMode = "Learning",
		ElementalWheel = "Elemental Wheel",
		MagicBurstMode = "Magic Burst",
		SkillChainMode = "SkillchainMode",
		RecoverMode = "Recover MP",
		ElementalMode = "Element",
		ExtraSongsMode = "Songs",
		AutoStunMode = "Auto Stun",
		LuzafRing = "Luzaf's Ring",
		AutoDefenseMode = "Auto Defense",
		AutoTrustMode = "Auto Trust",
		JugMode = "Pet",
		RewardMode = "Reward",
		AutoNukeMode = "Auto Nuke: "..autonuke.."",
		AutoSongMode = "Auto Song",
		AutoJumpMode = "Auto Jump",
		AutoSuperJumpMode = "Auto SuperJump",
		AutoWSMode = "Auto WS: "..autows..": "..autowstp.."",
		AutoShadowMode = "Auto Shadows",
		AutoFoodMode = "Auto Food: "..autofood.."",
		RngHelper = "RngHelper",
		RngHelperQuickDraw = "RngHelperQuickDraw",
		Capacity = "Capacity",
		AutoTankMode = "Auto Tank",
		CompensatorMode = "Compensator",
		CarnMode = "Carn Mode",
		DrainSwapWeaponMode = "Drain Swap",
		AutoRuneMode = "Auto Rune: "..state.RuneElement.value.."",
		AutoSambaMode = "Auto Samba: "..state.AutoSambaMode.value.."",
		PhysicalDefenseMode = "Physical Defense",
		MagicalDefenseMode = "Magical Defense",
		ResistDefenseMode = "Resist Defense",
		RuneElement = "Rune Element",
		AutoReadyMode = "Auto Ready",
		AutoPuppetMode = "Auto Puppet",
		AutoRepairMode = "Auto Repair",
		PactSpamMode = "Pact Spam",
		PetWSGear = "PetWSGear",
		DanceStance = "DanceStance",
		Stance = "Stance",
		PWUnlock = "PWUnlock",

		Crafting = "Crafting",
		HippoMode = "HippoMode",
		SrodaBelt = "SrodaBelt",
		SrodaNecklace = "SrodaNecklace",
		StormSurge = "StormSurge",
		Songset = "Songset: "..state.Songset.value.."",
		Rollset = "Rollset: "..state.Rollset.value.."",
		Avatars = "Avatars: "..state.Avatars.value.."",
		NM = "NM",
		SleepMode = "SleepMode",
		ShieldMode = "ShieldMode",
    }

    stateBox:clear()
	stateBox:append('   ')

    -- Construct and append info for boolean states
    for i,n in pairs(stateBool) do

        -- Define color for modal state
        if state[n].index then
			if n == 'AutoWSMode' and state.AutoWSMode.value then
				if state.RngHelper.value then
					stateBox:append(string.format("%sAuto WS: "..rangedautows..": "..rangedautowstp.."%s", clr.h, clr.n))
				else
					stateBox:append(string.format("%sAuto WS: "..autows..": "..autowstp.."%s", clr.h, clr.n))
				end
				stateBox:append(spc)
			elseif n == 'AutoDefenseMode' then
				if state.AutoDefenseMode.value then
					if state.TankAutoDefense.value then
						stateBox:append(string.format("%sAuto Defense: Tank%s", clr.h, clr.n))
					else
						stateBox:append(string.format("%sAuto Defense%s", clr.h, clr.n))
					end
					stateBox:append(spc)
				end
			else
				stateBox:append(clr.h..labels[n]..clr.n)
				stateBox:append(spc)
			end
		else

		end

        -- Append basic formatted boolean state

    end
		stateBox:append(clr.w)
    -- Construct and append info for modal states
    for i,n in ipairs(stateList) do

        -- Format total haste and delay reduction as percentages
        if n == 'TotalHaste' or n == 'DelayReduction' then
            info[n] = state[n]..'%'
            orig[n] = '0%'
        else
            info[n] = state[n].current
            orig[n] = state[n][1]
        end
        if info[n] ~= orig[n] then
            info[n] = clr.h..info[n]..clr.n
        end

        -- Append basic formatted modal state


        -- Add additional information for active hybrid defense mode
		if n == 'AutoBuffMode' then
			if state.AutoBuffMode.value ~= 'Off' then
				if player.main_job == 'GEO' then
					stateBox:append(string.format("%sAuto Buff: Indi-"..autoindi.." Geo-"..autogeo.."%s  ", clr.h, clr.n))
					if autoentrust ~= 'None' then
						stateBox:append(string.format("%sAuto Entrust: "..autoentrust.."  Entrustee: "..autoentrustee.."%s  ", clr.h, clr.n))
					end
				end
				stateBox:append(string.format("%sAuto Buff: %s%s", clr.w, clr.h, state.AutoBuffMode.value))
				stateBox:append(spc)
			end
		elseif n == 'RangedMode' then
			stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
				if statusammo then
					stateBox:append('Ammo: '..statusammo..'    ')
				end
		elseif n == 'OffenseMode' then
			if state.DefenseMode.value ~= 'None' then
				stateBox:append(string.format("%sDefense Active: ", clr.w))
				if state.DefenseMode.value == 'Physical' then
					stateBox:append(string.format("%s%s: %s%s", clr.h, state.DefenseMode.current, state.PhysicalDefenseMode.current, clr.w))
				elseif state.DefenseMode.value == 'Magical' then
					stateBox:append(string.format("%s%s: %s%s", clr.h, state.DefenseMode.current, state.MagicalDefenseMode.current, clr.w))
				elseif state.DefenseMode.value == 'Resist' then
					stateBox:append(string.format("%s%s: %s%s", clr.h, state.DefenseMode.current, state.ResistDefenseMode.current, clr.w))
				end
				if state.ExtraDefenseMode and state.ExtraDefenseMode.value ~= 'None' then
					stateBox:append(string.format("%s / %s%s%s", clr.n, clr.h, state.ExtraDefenseMode.current, clr.n))
				end
				stateBox:append(spc)
			else
				stateBox:append(string.format("%s%s: ${%s}", clr.w, labels[n], n))
				if state.HybridMode then
					if state.HybridMode.value == 'Normal' then
						stateBox:append(string.format("%s / %s%s%s", clr.n, clr.w, state.HybridMode.current, clr.n))
					else
						stateBox:append(string.format("%s / %s%s%s", clr.n, clr.h, state.HybridMode.current, clr.n))
					end
				end
				if state.ExtraMeleeMode then
					if state.ExtraMeleeMode.value == 'None' then
						stateBox:append(string.format("%s / %s%s%s", clr.n, clr.w, state.ExtraMeleeMode.current, clr.n))
					else
						stateBox:append(string.format("%s / %s%s%s", clr.n, clr.h, state.ExtraMeleeMode.current, clr.n))
					end
				end
				stateBox:append(spc)
			end
		elseif n == 'AutoSambaMode' then
			if state.AutoSambaMode.value ~= 'Off' then
				stateBox:append(string.format("%sAuto Samba: %s%s    ", clr.w, clr.h, state.AutoSambaMode.value))
			end
		elseif n == 'IdleMode' then
			if state.IdleMode.value ~= 'Normal' and state.DefenseMode.value == 'None' then
				stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
			end
			if state.Kiting.value then
				stateBox:append(string.format("%sKiting: %sOn    ", clr.w, clr.h))
			end
		elseif n == 'Passive' then
			if state.Passive.value ~= 'None' and state.DefenseMode.value == 'None' then
				stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
			end
		elseif n == 'TreasureMode' then
			if (state.TreasureMode.value ~= 'None' or player.main_job == 'THF') and state.DefenseMode.value == 'None' then
				stateBox:append(string.format("%sTreasure: %s%s    ", clr.w, clr.h, state.TreasureMode.value))
			end
		elseif n == 'CastingMode' then
			stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
			if state.MagicBurstMode.value ~= 'Off' then
				stateBox:append(string.format("%sMagic Burst: %s%s    ", clr.w, clr.h, state.MagicBurstMode.value))
			end
			if state.DeathMode and state.DeathMode.value ~= 'Off' then
				stateBox:append(string.format("%sDeath Mode: %s%s    ", clr.w, clr.h, state.DeathMode.value))
			end
		elseif n == 'WeaponskillMode' then
			if state.WeaponskillMode.value ~= 'Match' then
				stateBox:append(string.format("%sWeaponskill: %s%s    ", clr.w, clr.h, state.WeaponskillMode.value))
			end
			if state.SkillchainMode.value ~= 'Off' and state.DefenseMode.value == 'None' then
				stateBox:append(string.format("%sSkillchain Mode: %s%s    ", clr.w, clr.h, state.SkillchainMode.value))
			end
		elseif n == 'ElementalMode' then
				stateBox:append(string.format("%sElement: %s%s    ", clr.w, clr[state.ElementalMode.value], state.ElementalMode.value))
		elseif n == 'RuneElement' then
				if not state.AutoRuneMode.value and (player.main_job == 'RUN' or player.sub_job == 'RUN') then
					stateBox:append(string.format("%sRune: %s%s    ", clr.w, clr[data.elements.runes_lookup[state.RuneElement.value]], state.RuneElement.value))
				end
		elseif n == 'LearningMode' then
			if state.LearningMode.value and state.DefenseMode.value == 'None' then
				stateBox:append(string.format("%sLearning Mode: %sOn    ", clr.w, clr.h))
			end
		elseif n == 'CompensatorMode' then
			if state.CompensatorMode.value ~= 'Never' then
				stateBox:append(string.format("%sCompensator: %s%s    ", clr.w, clr.h, state.CompensatorMode.value))
			end
		elseif n == 'CarnMode' then
			if state.CarnMode.value ~= 'Never' then
				stateBox:append(string.format("%sCarn Mode: %s%s    ", clr.w, clr.h, state.CarnMode.value))
			end
		elseif n == 'DrainSwapWeaponMode' then
			if state.DrainSwapWeaponMode.value ~= 'Never' then
				stateBox:append(string.format("%sDrain Swap: %s%s    ", clr.w, clr.h, state.DrainSwapWeaponMode.value))
			end
		elseif n == 'ExtraSongsMode' then
			if state.ExtraSongsMode.value ~= "None" then
				stateBox:append(string.format("%sSongs: %s%s    ", clr.w, clr.h, state.ExtraSongsMode.value))
			end
		elseif n == 'DanceStance' then
			if state.DanceStance.value ~= "None" then
				stateBox:append(string.format("%sDance: %s%s    ", clr.w, clr.h, state.DanceStance.value))
			end
		elseif n == 'Stance' then
			if state.Stance.value ~= "None" then
				stateBox:append(string.format("%sStance: %s%s    ", clr.w, clr.h, state.Stance.value))
			end
		elseif n == 'RecoverMode' then
			if state.RecoverMode.value ~= 'Never' then
				stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
			end
		else
			if labels[n] then
				stateBox:append(string.format("%s%s: ${%s}    ", clr.w, labels[n], n))
			else
				stateBox:append(string.format("%s%s: ${%s}    ", clr.w, n, n))
			end
		end
    end
	
	if state.ExtraDefenseMode and state.ExtraDefenseMode.value ~= 'None' and state.DefenseMode.value == 'None' then
		stateBox:append(string.format("%sExtra Defense: %s%s    ", clr.w, clr.h, state.ExtraDefenseMode.value))
	end
    -- Update and display current info
    stateBox:update(info)
    stateBox:show()

end

----------------------------------------------------------------------------------------------------
-- Clean up display objects
-- Call from file_unload(), user_unload(), etc.
----------------------------------------------------------------------------------------------------
function clear_job_states()
    if stateBox then stateBox:destroy() end
end


windower.raw_register_event('outgoing chunk', function(id, data)
    if id == 0x00D and stateBox then
        stateBox:hide()
    end
end)

windower.raw_register_event('incoming chunk', function(id, data)
    if id == 0x00A and stateBox and state.DisplayMode.value then
        stateBox:show()
    end
end)

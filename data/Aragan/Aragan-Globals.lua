-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
	---------------------------------------                        ---------------------------------------  
	--        A T T E N T I O N          --                        --      P L E A S E     R E A D      --
	---------------------------------------                        ---------------------------------------  

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat .

some jobs work with it some addon.

add code auto equip to PDL ws set if buff high attack.
add code auto equip magic burst set when sc window open.
add bind to work addon autoitem for auto use medicine for Odyssey nms 
and i made mode automedicinemode auto use medicine

made mode autoReraise auto equip zombie gear Reraise
 
add reaction for sortie NM B/D F/H auto switch elemental mode to correct nm weak it if he use spell for job rdm drk blm sch .
add passive set tartarus death if mob touch u for jobs pld war drk drg sam bst. if u have Tartarus Platemail red wings .
add passive enspell for some job.
add code auto swap gearto EnemyCritical idle set if u get hite critcal hit.
add auto use ja Ebullience for blm job if sub /sch and in fight.
add code tell msg if u get proc in abyssea and auto swap gear after msg for job war nin blm
and add in macro special line for proc those job war nin blm. 
add bind for reset addon zonetimer for sortie bosses F/H to calc 3min run away before tpmove or use ja run or bind or kitting

in macro job blm sch rdm nin drk geo whm pld for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C and spam mb on bosses 
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
u can use addon automb 

sch i add macro for fast make skillchain :

command add macro :
SC1
/console gs c elemental skillchain1
SC2
/console gs c elemental skillchain2
SC3
/console gs c elemental skillchain3
-------------
	---------------------------------------                        ---------------------------------------  
	--        A T T E N T I O N          --                        --      P L E A S E     R E A D      --
	---------------------------------------                        ---------------------------------------  

]]

--Place for settings and custom functions to work across one characters, all jobs.
latency = .75

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Display related settings.
state.DisplayMode = M(true, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the values to edit the display's look.
--displayx = 3
--displayy = 1062
--displayfont = 'Arial'
--displaysize = 12
--displaybold = true
--displaybg = 0
--displaystroke = 2
--displaytransparancy = 192
--state.DisplayColors = {
    -- h='\\cs(255, 0, 0)', -- Red for active booleans and non-default modals
    -- w='\\cs(255,255,255)', -- White for labels and default modals
    -- n='\\cs(192,192,192)', -- White for labels and default modals
    -- s='\\cs(96,96,96)' -- Gray for inactive booleans
--}

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(true, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
state.UnlockWeapons		  = M(true, 'Unlock Weapons')
state.CraftingMode		  = M{['description'] = 'Crafting Mode','None','Goldsmithing','Smithing','Cooking','Fishing',}
state.CraftQuality  	  = M{['description'] = 'Crafting Quality','Normal','HQ','NQ'}

state.Songset = M{['description']='Songset','mboze', 'xevioso', 'kalunga', 'ngai','arebati', 'ongo', 'bumba',
'haste', 'magic', 'aria', 'ph','sortie4', 'ody4', 'ody','sortie',}
state.Rollset = M{['description']='Rollset','None', 'melee', 'magic','dynamis','aminon','exp','tp','speed','acc','ws',
'pet','petnuke',}
state.Etude = M{['description']='Etude',  'Herculean Etude', 'Sage Etude', 'Sinewy Etude', 'Learned Etude',
'Quick Etude', 'Swift Etude', 'Vivacious Etude', 'Vital Etude', 'Dextrous Etude', 'Uncanny Etude',
'Spirited Etude', 'Logical Etude', 'Enchanting Etude', 'Bewitching Etude'}

state.Spellset = M{['description']='Spellset','vagary', 'aoe', 'aoe2'}

state.Avatars = M{['description']='Avatars', "Ifrit", "Ramuh", "Titan", "Siren", "Garuda", "Diabolos", "Carbuncle", "Fenrir", "Leviathan", "Shiva", "Odin", "Alexander", "Cait Sith"}

state.WeaponLock = M(false, 'Weapon Lock')
state.RP = M(false, "Reinforcement Points Mode")
state.StormSurge = M(false, 'Stormsurge')
state.SrodaBelt = M(false, 'SrodaBelt')
state.SrodaNecklace = M(false, 'SrodaNecklace')
state.NM = M(false, 'NM')
state.SleepMode = M{['description']='Sleep Mode', 'Normal', 'MaxDuration'}
state.AutoMedicineMode = M(false, 'Auto Medicine Mode')
state.AutoReraiseeMode = M(false, 'Auto Reraise Mode')
--state.ShieldMode:options('Normal','Genmei','Ammurapi')

--auto equip to PDL ws set is higher than this value .. this value for all job and u can add any value in any job lua . (Aragan@Asura)
attack2 = 4500 -- This LUA will equip PDL "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value.

--state.ShieldMode = M{['description']='Shield Mode', 'Normal', 'Srivatsa','Ochain','Duban', 'Aegis', 'Priwen','Genmei','Ammurapi'} -- , 'Priwen' }
state.ShieldMode = M{['description'] = 'Shield Mode', 'Normal','Aegis','Ochain','Duban','Genmei','Ammurapi'}
state.Weapongun = M{['description']='Weapon Set', 'normal', 'DeathPenalty', 'Anarchy', 'Fomalhaut', 'Earp'}

NotifyBuffs = S{'doom','petrification','sleep','slow','paralysis','weakness','elegy','curse recovery','zombie','super curse'}

gear.TVRring = "Cornelia's Ring"

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
--[[
need add 
	send_command('bind !f4 gs c toggle AutoDefenseMode')

	send_command('bind f4 gs c cycle RuneElement')
	send_command('bind f3 gs c RuneElement')
	send_command('bind f2 gs c toggle AutoRuneMode')
	send_command('bind @f2 gs c toggle AutoBuffMode')
	send_command('bind @f3 gs c toggle AutoTrustMode')

	send_command('bind ^f1 gs c toggle AutoStunMode')
	send_command('bind ^f2 gs c toggle SubJobEnmity')
	send_command('bind ^f1 gs c toggle AutoStunMode')
	send_command('bind ^f2 gs c toggle SubJobEnmity')
	send_command('bind @5 gs c toggle  AutoFoodMode')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
	send_command('bind @2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.

AutoShadowMode
AutoSambaMode
AutoRuneMode

AutoAcceptRaiseMode

gs c set AutoWSRestore true
gs c set SkipProcWeapons false

//gs c useitem head Reraise Hairpin +1
//gs c useitem ring2 warp ring

(Aragan) HPboost set gear Equiped ready 
send_command('input /p Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Ready')		


]]

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle HybridMode')
	send_command('bind !f9 gs c cycle RangedMode')
	send_command('bind f4 gs c cycle ElementalMode')
	send_command('bind f5 gs c cycle WeaponskillMode')
	--send_command('bind f10 gs c set DefenseMode Physical')
	--send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
	send_command('bind !f10 gs c toggle Kiting')
	send_command('bind !f11 gs c cycle MagicalDefenseMode;gs c set DefenseMode Magical') --Changes your magical defense set.
	send_command('bind f11 gs c cycle CastingMode')
	send_command('bind ^f12 gs c update user')
	send_command('bind f12 gs c cycle IdleMode;gs c reset DefenseMode')
	send_command('bind !f12 gs c reset DefenseMode;gs c reset IdleMode')
	send_command('bind ^f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.

	send_command('bind delete input //zonetimer reset') --Turns addon reset time.
	send_command('bind !0 input //zonetimer reset') --Turns addon reset time.
	send_command('bind ^pagedown input //autoitem off') --Turns addon off.
	send_command('bind ^pageup input //autoitem on') --Turns addon on.
	send_command('bind ^delete input //aws toggle') --Turns addon autows on odd. to add ws //aws set "Evisceration" 
	send_command('bind ^insert input //aws reload') --reload addon autows on odd. --//aws set Evisceration

	
	send_command('bind !delete input //smrt on;input //smrt') --Turns addon smarttarget on odd.
	send_command('bind !insert input //smrt off') --Turns addon smarttarget off odd.
	send_command('bind !pagedown input //autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	send_command('bind !pageup input //autoNukes on') --Turns addon on. addon use for spamm aspir on sortie aminon
	send_command('bind ^4 input //autoNukes on') --Turns addon on.addon use for spamm aspir on sortie aminon
	send_command('bind ^5 input //autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	
	send_command('bind ^backspace input //automb on') --Turns addon on.addon automb
	send_command('bind !backspace input //automb off') --Turns addon off.addon automb
	
	--input //lua r AutoWS;input //aws on;
	send_command('bind !o input //gs org') 
	send_command('bind ^w input /wave')

	
	send_command('bind !f2 gs c toggle TankAutoDefense')
	send_command('bind !f3 gs c toggle AutoTankMode')
	send_command('bind !f4 gs c toggle AutoDefenseMode')
	send_command('bind !f5 gs c toggle AutoWSMode')
	send_command('bind @f1 gs c toggle AutoEngageMode')
	send_command('bind @f2 gs c toggle AutoBuffMode')
	send_command('bind @f3 gs c toggle AutoTrustMode')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('bind @x gs c toggle RP')  
	send_command('bind @z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
	send_command('bind !c gs c cycle CraftingMode')
	send_command('bind ^c gs c cycle CraftQuality')

	send_command('bind !1 gs c toggle AutoSambaMode')
	send_command('bind !2 gs c toggle AutoShadowMode')
	send_command('bind !3 gs c toggle AutoRuneMode')
	send_command('bind !4 gs c cycle passive')
	send_command('bind !5 gs c toggle stance')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
	send_command('bind ^2 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^3 gs c cycle RuneElement') -- cycle RuneElement

	send_command('bind ^f1 gs c toggle AutoStunMode')
	send_command('bind ^f2 gs c toggle SubJobEnmity')
	send_command('bind ^f3 gs c cycle SkillchainMode')
	send_command('bind @1 gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
	send_command('bind @2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.
	send_command('bind @3 gs c cycle RecoverMode')
	send_command('bind @5 gs c toggle AutoFoodMode')
	send_command('bind !w gs c toggle WeaponLock')
	send_command('bind !f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind !7 gs c toggle AutoAcceptRaiseMode')

	send_command('bind ^- gs c toggle selectnpctargets')
	send_command('bind !- gs c cycle pctargetmode')
    send_command('lua r runewidget;rw show')--Turns addon off if job non /run.

	send_command('bind ^] input //put storage slip* case all')
	send_command('bind ^[ input //get storage slip* all') --PorterPacker Porter find
	send_command('bind !, input //put * sack all;input //put * Satchel all') -- gs validate  --to check 	lua r gearswap
	send_command('bind !. input //put * Wardrobe4 all') -- gs validate  --to check  --lua r gearswap --;input //put * Wardrobe4 all;input //put * Wardrobe5 all;input //put * Wardrobe6 all;input //put * Wardrobe7 all;input //put * Wardrobe8 all

	send_command('bind ^. input //get storage slip* all;wait 1;input //po r') -- PorterPacker addon
	send_command('bind ^, input //get storage slip* all;wait 1;input //po r a') -- PorterPacker addon

	send_command('bind !m gs c toggle AutoMedicineMode')
	send_command('bind !n gs c toggle AutoReraiseeMode')

	--send_command('bind @m gs c mount Raptor')

	--send_command('input //gs org')-- org addon every change job
	send_command('wait 1;input //gs c naked;gs disable all;wait .5;put * wardrobe4 all;wait .3;put storage slip* case all;wait .5;input //gs org')-- org addon every change job

end
-- Function to revert binds when unloading.
function global_unload()
	send_command('unbind f1')
	send_command('unbind f2')
	send_command('unbind f3')
	send_command('unbind !s')
	send_command('unbind !r')
	send_command('unbind !5')

	send_command('unbind tab')
	send_command('unbind `')


	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind f11')
	send_command('unbind !f11')
	send_command('unbind ^-')
	send_command('unbind ^=')
	send_command('unbind -')
	send_command('unbind =')
	send_command('unbind !P')
	send_command('unbind ^P')
	send_command('unbind ^m')

	send_command('lua u Singer')--Turns addon off if job non brd.
	send_command('lua u PLD-HUD')--Turns addon off if job non pld.
	send_command('lua u DNC-hud')--Turns addon off if job non dnc.
	send_command('lua u sch-hud')--Turns addon off if job non sch.
	send_command('input //parse reset')-- reset parse addon every change job

end

send_command('bind !home lua l trust') --Turns addon trust  on.
send_command('bind !end lua u trust') --Turns addon trust off.

send_command('bind ^home input //trust start') --Turns addon trust start.
send_command('bind ^end input //trust stop') --Turns addon trust stop.

send_command('bind home lua l autobuff') --Turns addon  on.
send_command('bind end lua u autobuff') --Turns addon off.

send_command('bind pageup input //ata on;input //lua load Gaze_check;input /p ((Attack is ON.)) >> killer machine ready <<')--Turns addon  auto attack target on. to be killer machine in Odyssey or Dynamis.
send_command('bind pagedown input //ata off;input //lua unload Gaze_check')--Turns addon  auto attack target off.

send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f6 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind !f6 gs c cycleback Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
send_command('bind f10 gs c cycle PhysicalDefenseMode;gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
--send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
--send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
send_command('bind @r gs c weapons Default') --Requips weapons and gear.
send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
send_command('bind !t input /target <bt>') --Targets the battle target.
send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind @m gs c mount Omega')

send_command('alias ambuseal input /item "Abdhaljs Seal" <me>')
send_command('alias rads temps buy Radialens')
send_command('alias molli temps buy Mollifier')
send_command('alias temps temps buy')

bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

--[[ List of all Bayld Items.
bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu','Zoquittihuitz',
'Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers','Chocaliztli Boots','Maochinoli',
'Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg','Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Otomi Helm',
'Otomi Gloves','Kaabnax Hat','Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers',
'Uk\'uxkaj Cap'}
]]


-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------
function job_pretarget(spell, action, spellMap, eventArgs)
	if spell.type == 'step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']

        --local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
        if not midaction() then
            job_update()
        end
    end
	    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']

        --local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
        if not midaction() then
            job_update()
        end
    end
end

function user_job_state_change(field, newVal, oldVal)
	if field == 'ShieldMode' then
		if newVal == 'Normal' then
			internal_enable_set("Shield")
		else
			internal_disable_set(sets.shield[newVal], "Shield")
		end
	end
end

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    refine_waltz(spell, action, spellMap, eventArgs)
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
	--[[ 
	attack = player.attack
	if attack > attack2 then
		windower.send_command('gs c set WeaponskillMode PDL')

		--WeaponskillMode:set('PDL') 
    else
		windower.send_command('gs c set WeaponskillMode Match')
    end
]]
end
function job_post_precast(spell)
	if spell.name == "Holy Water" then
		 equip(sets.precast.Item['Holy Water'])
    end
	attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)
	if spell.type == 'WeaponSkill' then
		if attack > attack2 then
			equip(sets.precast.WS[spell.name].PDL)
		elseif state.WeaponskillMode.value == 'Proc' then
			equip(sets.precast.WS.Proc)
		else
			equip(sets.precast.WS[spell.name])
		end
	end
	if spell.type == 'WeaponSkill' and player.main_job == 'WAR' then
		if buffactive['Mighty Strikes'] then
			equip(sets.WSMighty)
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
	-- < this mean low  
	if spell.type == 'WeaponSkill' and not spell.interrupted then
		if (spell.english == "Shell Crusher" or spell.english == "Armor Break") then
			if player.tp == 3000 then  
				send_command('timers c "Defense Down '..spell.name..' ['..spell.target.name..'] " 540 down')
				send_command('@input /p  >>> "Defense Down on '..spell.name..' ['..spell.target.name..']. 9 min. ')
			elseif player.tp < 2001 then  
				send_command('timers c "Defense Down '..spell.name..' ['..spell.target.name..']" 360 down')
				send_command('@input /p  >>> "'..spell.name..' Defense Down on  ' ..tostring(spell.target.name).. '. 6 min. ')
			elseif player.tp < 1001 then  
				send_command('timers c "Defense Down '..spell.name..' ['..spell.target.name..']" 180 down')
				send_command('@input /p  >>> "Defense Down on '..spell.name..' ['..spell.target.name..']. 3 min. ')
			end
		end
	end
	--[[
	send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
	send_command('wait '..gambit_duration..';input /p <t> [Gambit just wore off!];')
	send_command('@input /p  >>> Gambit on ['..spell.target.name..']. Second left: '..gambit_duration..'')
	]]
	--[[if spell.english == "Meditate" then
				send_command('wait 169;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
	 ]]

end
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
	if player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
	   or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR' then
       if player.hpp < 5 then
	    equip(sets.Reraise)
		--send_command('gs c update')
		disable('head','body')
	    end
    else
        enable('head','body')
    end
	if state.CraftingMode.value ~= 'None' then
		equip(sets.crafting[state.CraftingMode.value])
	
    elseif state.CraftQuality.value ~= 'Normal' then
		equip(sets.crafting[state.CraftQuality.value])
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



-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
	
	if state.CraftingMode.value ~= 'None' then
		idleSet = set_combine(idleSet,sets.crafting[state.CraftingMode.value])
	
    elseif state.CraftQuality.value ~= 'Normal' then
		idleSet = set_combine(idleSet,sets.crafting[state.CraftQuality.value])
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
	-- If HP drops under 45% then equip Re-raise head/body
	if (player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
		or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR') then
        if player.hpp < 5 then --code add from Aragan Asura
        meleeSet = set_combine(meleeSet, sets.Reraise)
	    end
	end
    return meleeSet
end

-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)
	if state.AutoReraiseeMode.value == true then
		if buff == "weakness" then
			if gain then
				equip(sets.Reraise)
				 disable('body','head')
				else
				 enable('body','head')
			end
		end
	end

	-- Create a timer when we gain weakness.  Remove it when weakness is gone.
	if buff:lower() == 'weakness' then
		if gain then
			send_command('timers create "Weakness" 300 up abilities/00255.png')
		else
			send_command('timers delete "Weakness"')
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
    if buff == "Sleep" then
        if gain then    
            send_command('input /p ZZZzzz, please cure.')		
        else
            send_command('input /p '..player.name..' is no longer Sleep!')
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
		elseif buff == "Magic Evasion Downn" then
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
			status_change(player.status)
		end
	end
end

--[[		elseif buff == "Warcry" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		elseif buff == "Berserk" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		elseif buff == "Defender" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		elseif buff == "Aggressor" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		end]]


	--[[if buff == "Defense Down" then
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
    elseif buff == "Magic Evasion Downn" then
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
    end
    if buff == "curse" then
        if gain then  
            send_command('input /item "Holy Water" <me>')
			equip(sets.precast.Item['Holy Water'])
        end
    end
	if buff == "poison" then
        if gain then  
        send_command('input /item "remedy" <me>')
        end
    end]]

function default_zone_change(new_id,old_id)
	--tickdelay = os.clock() + 10	
	if data.areas.cities:contains(world.area)  then
		send_command('input //lua l invspace;input //lua l invtracker;input //lua l Clock;input //tr autodrop off') --Turns addon on.
	else
		send_command('input //lua u invspace;input //lua u invtracker;input //stats hide;input //lua U Clock;input //tr autodrop on;wait 5;put storage slip* case all') --Turns addon off. stats=craftstats addon
	end
	
	if data.areas.laggy:contains(world.area)  then
		send_command('input //gs c set AutoDefenseMode true;input //gs c set AutoWSRestore true') --Turns mode on.
	else
		send_command('input //gs c set AutoWSRestore false;') --Turns  off. -- 
	end

	if world.area:contains('Nyzul Isle') then
		send_command('input //NyzulHelper show;input //NyzulBuddy start;input //iSpy') --Turns addon on.
	else
		send_command('input //NyzulHelper hide;input //NyzulBuddy stop;') --Turns addon off. -- input //iSpy
	end
	if world.area:contains('Abyssea') then
		send_command('input //ept show;') --Turns addon on.
	else
		send_command('input //ept hide;') --Turns addon off.
	end
end

-- If HP drops under 45% then equip Re-raise head/body
windower.register_event('hpp change', -- code add from Aragan Asura
function(new_hpp,old_hpp)
    if player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
            or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR' then
        if new_hpp < 5 then
			equip(sets.Reraise)
        end
    end
end)

function is_sc_element_today(spell)
    if spell.type ~= 'WeaponSkill' then
        return
    end

   local weaponskill_elements = S{}:
    union(skillchain_elements[spell.skillchain_a]):
    union(skillchain_elements[spell.skillchain_b]):
    union(skillchain_elements[spell.skillchain_c])

    if weaponskill_elements:contains(world.day_element) then
        return true
    else
        return false
    end

end


--[[ 
disable_priority = T{
    "User",
    "Showset",
    "Crafting",
    "Doom",
    "Sleep",
    "UseItem",
    "OneHour",
    "Shield",
    "Weapons",
    "ShowTP",
    "Ability",
    "TreasureHunter",
}:reverse()
]]

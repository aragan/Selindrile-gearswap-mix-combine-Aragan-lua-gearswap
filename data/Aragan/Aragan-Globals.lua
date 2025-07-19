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
add cor auto fold when buffactive bust
in macro job blm sch rdm nin drk geo whm pld for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C and spam mb on bosses 
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
u can use addon automb 

sch job i add macro for fast make skillchain :

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
nexttime = os.clock()
delay = 0
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
state.ReEquip 		  	  = M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  	  = M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	  = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 	  = M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 	  = M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  	  = M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
state.UnlockWeapons		  = M(true, 'Unlock Weapons')
state.CraftingMode		  = M{['description'] = 'Crafting Mode','None','Goldsmithing','Smithing','Cooking','Fishing',}
state.CraftQuality  	  = M{['description'] = 'Crafting Quality','Normal','HQ','NQ'}
state.AutoDefenseMode 	  = M(true, 'Auto Defense') 
state.AutoStunMode 	      = M(true, 'Auto Stun') 
state.AutoCleanupMode  	  = M(true, 'Auto Cleanup Mode')
state.AutoWSRestore		  = M(true, 'Auto Weaponskill Restore Mode')
state.SelectNPCTargets    = M(false, 'Select NPC Targets')
state.PCTargetMode        = M{['description'] = 'PC Target Mode', 'default', 'stpt', 'stal', 'stpc'}
state.SubtleBlowMode      = M(true, 'SubtleBlow Mode') 
state.AutoOtherTargetWS = M(false, 'AutoOtherTargetWS')

-- state.Abyssea = M{['description']='Abyssea','Ulhuadshi','Chloris','Dragua','Bukhis'} 
state.AutoLoggerMode = M(false, 'AutoLoggerMode')
state.Songset = M{['description']='Songset','mboze', 'xevioso', 'kalunga', 'ngai','arebati', 'ongo', 'bumba',
'haste', 'magic', 'aria', 'ph','sortie4', 'ody4', 'ody','sortie',}
state.Rollset = M{['description']='Rollset','None', 'melee', 'magic','dynamis','aminon','exp','tp','speed','acc','ws',
'pet','petnuke',}
state.Etude = M{['description']='Etude',  'Herculean Etude', 'Sage Etude', 'Sinewy Etude', 'Learned Etude',
'Quick Etude', 'Swift Etude', 'Vivacious Etude', 'Vital Etude', 'Dextrous Etude', 'Uncanny Etude',
'Spirited Etude', 'Logical Etude', 'Enchanting Etude', 'Bewitching Etude'}

state.Spellset = M{['description']='Spellset','vagary', 'aoe', 'aoe2'}

state.Avatars = M{['description']='Avatars', "Ifrit", "Ramuh", "Titan", "Siren", "Garuda", "Diabolos", "Carbuncle", "Fenrir", "Leviathan", "Shiva", "Odin", "Alexander", "Cait Sith"}
state.Passive = M{['description'] = 'Passive Mode','None'}
state.ReEquip 			  = M(true, 'ReEquip Mode')

--state.Passive:options('None','EnemyCritRate','Regen','Resist','Refresh','Empy', 'SubtleBlow', 'SubtleBlow40', 'SubtleBlow50')

state.WeaponLock = M(false, 'Weapon Lock')
state.RP = M(false, "Reinforcement Points Mode")
state.StormSurge = M(false, 'Stormsurge')
state.SrodaBelt = M(false, 'SrodaBelt')
state.SrodaNecklace = M(false, 'SrodaNecklace')
state.NM = M(true, 'NM')
state.SleepMode = M{['description']='Sleep Mode', 'Normal', 'MaxDuration'}
state.AutoMedicineMode = M(false, 'Auto Medicine Mode')
state.AutoReraiseeMode = M(true, 'Auto Reraise Mode')
state.AutoCureMode = M(true, 'Auto Cure Mode')
state.NeverDieMode = M(true, 'Never Die Mode')
state.AutoTomahawkMode = M(false, 'AutoTomahawkMode')
state.AutoJumpMode 		  = M(false, 'Auto Jump Mode')
state.AutoAPMode = M(true, 'AutoAPMode')
state.AutoinfoNMMode = M(true, 'Auto info NM Mode')
state.AutoShadowMode 	  = M(false, 'Auto Shadow Mode')
state.RefineWaltz		  = M(true, 'RefineWaltz')
state.Stance = M{['description']='Stance','None'}

state.DefenseDownMode = M{['description']='Defense Down Mode'}
state.DefenseDownMode:options('None','Tag')
already_announced_by_name = already_announced_by_name or {}
--state.RuneElement = M{['description']='Rune Element','Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Lux','Tenebrae'}
--state.ShieldMode:options('Normal','Genmei','Ammurapi')
--auto equip to PDL ws set is higher than this value .. this value for all job and u can add any value in any job lua . (Aragan@Asura)
attack2 = 4000 -- This LUA will equip PDL "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value.

--state.ShieldMode = M{['description']='Shield Mode', 'Normal', 'Srivatsa','Ochain','Duban', 'Aegis', 'Priwen','Genmei','Ammurapi'} -- , 'Priwen' }
state.ShieldMode = M{['description'] = 'Shield Mode', 'Normal','Aegis','Ochain','Duban','Genmei','Ammurapi'}
state.Weapongun = M{['description']='Weapon Set', 'normal', 'DeathPenalty', 'Anarchy', 'Fomalhaut', 'Earp'}
-- TOOGLE WS OPEN ON AUTOSC ADDON --auto set ws
state.Ascws = M{['description']='Ascws','Exudation','Realmrazer','Black Halo','Blade: Teki','Blade: Chi','Blade: To','Blade: Shun','Tachi: Kagero','Tachi: Goten','Tachi: Koki','Tachi: Fudo','Torcleaver','Savage Blade','Requiescat','Victory Smite','Shijin Spiral','Evisceration','Rudra\'s Storm','Cross Reaper','Spiral Hell','Insurgency','Vorpal Scythe',}
-- TOOGLE WS ON Skillchainer ADDON --auto set ws
state.Skillchainerws = M{['description']='Skillchainerws','Fell Cleave','Exudation','Realmrazer','Black Halo','Blade: Teki','Blade: Chi','Blade: To','Blade: Shun','Tachi: Kagero','Tachi: Goten','Tachi: Koki','Tachi: Fudo','Torcleaver','Savage Blade','Requiescat','Victory Smite','Shijin Spiral','Evisceration','Rudra\'s Storm','Cross Reaper','Spiral Hell','Insurgency','Vorpal Scythe',}

NotifyBuffs = S{'doom','petrification','sleep','slow','paralysis','weakness','elegy','curse recovery','zombie','super curse'}

gear.TVRring = "Cornelia's Ring"

state.AutoBarStatus = M{['description'] = 'Auto BarStatus','Off','Barparalyze','Barsilence','Barpoison','Barvirus','Barpetrify','Barblind','Baramnesia','Barsleep'}
state.AutoBoostStat = M{['description'] = 'Auto BoostStat','Off', 'Boost-INT', 'Boost-AGI', 'Boost-VIT', 'Boost-DEX', 'Boost-MND', 'Boost-CHR'}
-- state.AutoTrustMode = M{['description'] = 'Auto Trust Mode', 'Off','Auto', 'Cleave', 'Defend', 'Buff'}
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
	send_command('bind @5 gs c toggle  AutoFoodMode')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
	send_command('bind @2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.

AutoShadowMode
AutoSambaMode
AutoRuneMode

state.AutoTomahawkMode = M(false, 'AutoTomahawkMode')
state.AutoTPReductionMode = M(false, 'Auto TP Reduction Mode')
state.AutoBLUSpam = M(false, 'AutoBLUSpam')
state.CastingMode:set('SIRD')

Autodef.downMode
AutozergMode

AutoAcceptRaiseMode
use <call21>
gs c set AutoWSRestore true
gs c set SkipProcWeapons false
gs showswaps
lua r gearswap
AutoCleanupMode add more items
handle_killstatue
//get *crystal all
//put *crystal satchel all
//tradenpc 80 "earth crystal"
//tradenpc 80 "Wind crystal"
//tradenpc 80 "Fire Crystal"
//tradenpc 96 "Lightning Crystal"
//gs c useitem head Reraise Hairpin +1
//gs c useitem ring2 warp ring
(Aragan) Treasure Hunter set Equip
(Aragan) HPboost set gear Equiped ready 
send_command('input /p Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Ready')		
--for non change warp ring if equip 
 using any item, //gs c useitem slot Item Name
So, for example //gs c useitem head Reraise Hairpin +1
//gs c useitem ring2 warp ring
]]

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle HybridMode')
	send_command('bind !f9 gs c cycle RangedMode')
	send_command('bind f4 gs c cycle ElementalMode')
	send_command('bind !f5 gs c cycle WeaponskillMode')
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
	send_command('bind ^pagedown input //autoitem toggle') --Turns addon off.
	-- send_command('bind ^pageup input //autoitem on') --Turns addon on.
	send_command('bind ^delete input //aws toggle;gs c set AutoWSMode false') --Turns addon autows on odd. to add ws //aws set "Evisceration" 
	send_command('bind ^insert input //aws reload') --reload addon autows on odd. --//aws set Evisceration
	send_command('bind ~d gs c cycle DefenseDownMode') --Turns addon smarttarget on odd.

	send_command('bind !insert input //smrt on;input //smrt') --Turns addon smarttarget on odd.
	send_command('bind !delete input //smrt off') --Turns addon smarttarget off odd.
	-- send_command('bind !pagedown input //autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	--send_command('bind !pageup input //autoNukes on') --Turns addon on. addon use for spamm aspir on sortie aminon
	--send_command('bind ^4 input //autoNukes on') --Turns addon on.addon use for spamm aspir on sortie aminon
	-- send_command('bind ^5 input //autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  --use for spam absort tp and aspir on sortie aminon
	send_command('bind ^7 gs c toggle AutoWSRestore ')  -- USE WS HP STEAL IF HP LOW

	-- send_command('bind ^backspace input //automb toggle') --Turns addon on.addon automb
	send_command('bind !backspace input //automb toggle') --Turns addon toggle on off.addon automb
	
	--input //lua r AutoWS;input //aws on;
	send_command('bind !o put storage slip* case all;wait .3;input //gs org;wait 3;input //gs validate') 
	send_command('bind ^w input /wave')

	
	send_command('bind !f2 gs c toggle TankAutoDefense')
	send_command('bind !f3 gs c toggle AutoTankMode')
	send_command('bind !f4 gs c toggle AutoDefenseMode')
	send_command('bind f5 gs c toggle AutoWSMode;input //aws off')
	send_command('bind @f1 gs c toggle AutoEngageMode;gzc auto_point;')
	send_command('bind @f2 gs c toggle AutoBuffMode')
	send_command('bind @f3 gs c toggle AutoTrustMode')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('bind @x gs c toggle RP')  
	send_command('bind @z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
	send_command('bind !c gs c weapons None;gs c cycle CraftingMode;')
	send_command('bind ^c gs c cycle CraftQuality')

	send_command('bind !1 gs c toggle AutoSambaMode')
	send_command('bind !2 gs c toggle AutoShadowMode')
	send_command('bind !3 gs c toggle AutoRuneMode')
	send_command('bind !4 gs c cycle passive')
	--send_command('bind ~2 gs c cycle passive')

	send_command('bind !5 gs c toggle stance')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
	send_command('bind ^f2 gs c set AutoBuffMode off ') --

	send_command('bind ^2 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^3 gs c cycle RuneElement') -- cycle RuneElement

	send_command('bind ^f1 gs c toggle AutoStunMode')
	--send_command('bind !6 gs c toggle SubJobEnmity')
	send_command('bind ^f3 gs c cycle SkillchainMode')
	send_command('bind @1 gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
	send_command('bind @2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.
	send_command('bind @3 gs c cycle RecoverMode')
	send_command('bind @5 gs c toggle AutoFoodMode')
	send_command('bind !w gs c toggle WeaponLock')
	send_command('bind !f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind !7 gs c toggle AutoAcceptRaiseMode')
	send_command('bind !8 gs c toggle SkipProcWeapons')
	
	send_command('bind ^- gs c toggle selectnpctargets') 
	send_command('bind !- gs c cycle pctargetmode')
    send_command('lua r runewidget;rw show')--Turns addon off if job non /run. just used on screen left side to check elemtels cycle for used anythung like ws spell sc mb  and other idea
	send_command('lua u invspace;lua u invtracker')--Turns load addon invspace and invtracker 

	--send_command('bind ^] input //put storage slip* case all')
	--send_command('bind ^[ input //get storage slip* all') --PorterPacker Porter find
	send_command('bind ~p input //put storage slip* case all') --shift+p put all storage slip* all to case  -- all command put or get from itemizer addon 

	send_command('bind !, input //put * sack all;input //put * Satchel all') -- put everything to Satchel sack used if inventory full / --gs validate  --to check 	lua r gearswap
	send_command('bind !. input //put * Wardrobe4 all') -- put all equip to wardobe 4 / -- gs validate  --to check  -- lua r gearswap --;input //put * Wardrobe4 all;input //put * Wardrobe5 all;input //put * Wardrobe6 all;input //put * Wardrobe7 all;input //put * Wardrobe8 all

	send_command('bind ^. input //get storage slip* all;wait 1;input //po r') -- old version PorterPacker Porter used get storage slip* all equips from porter -- lua r PorterPacker addon
	send_command('bind ^, lua r PorterPacker;wait 1;input //get storage slip* all;wait 1;input //po r a') -- new version PorterPacker Porter used get storage slip* all equips from porter
	send_command('bind ^] input //get storage slip* all;wait 1;input //po pack')--  old version PorterPacker trade storage slip* all to porter
	send_command('bind ^[ input //get storage slip* all;wait 1;input //lua r PorterPacker;wait 1;input //po p a ') -- new version PorterPacker Porter used trade storage slip* all to porter

	send_command('bind !m gs c toggle AutoMedicineMode') --use medicine if i have debuff
	send_command('bind !n gs c toggle AutoReraiseeMode') -- equip zombie set autoreraise if u in jobs sam pld war bst drk drg

	--send_command('bind @m gs c mount Raptor')

	--send_command('input //gs org')-- org addon every change job
	send_command('wait 1;input //put * wardrobe4 all;wait .3;put storage slip* case all;wait .5;input //gs org')-- org addon every change job

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
	send_command('lua u BST-HUD')--Turns addon off if job non bst.

	send_command('input //parse reset')-- reset parse addon every change job

end
send_command('bind ~s gs c toggle AutoLoggerMode;gs c toggle NotifyBuffs') --AutoLoggerMode and NotifyBuffs mode text in chat all u doing ja ws spell debuff buff in on 

--addon ascs autosc
send_command('bind ~f1 asc') --Turns addon on off.
send_command('bind ~f2 asc toggle') --Turns addon show/hide.
send_command('bind ~f3 asc open') --Turns addon open ws no/off.
send_command('bind ~f4 gs c cycle ascws;gs c ascws') --wait 1;
send_command('bind ~f5 gs c cycleback ascws;gs c ascws') --wait 1;

send_command('bind ~1 asc c 1') --Turns addon clos sc 1 .
send_command('bind ~2 asc c 2') --Turns addon clos sc 2.
send_command('bind ~3 asc c 3') --
send_command('bind ~4 asc c 4') --
--send_command('bind ~z input //gs c ascws') --wait 1;

send_command('bind ~q !') --Turns addon clos sc 1 .
send_command('bind ~w @') --Turns addon clos sc 2.
send_command('bind ~e #') --
send_command('bind ~r $') --
----

--addon Skillchainer
send_command('bind ~insert lua l Skillchainer;Skillchainer pause') --;Skillchainer on --Turns addon on off.
send_command('bind ~delete lua u Skillchainer') --Turns addon on off.
send_command('bind ~home Skillchainer pause;') --;Skillchainer on --Turns addon on off.
send_command('bind ~pageup gs c cycle Skillchainerws;gs c Skillchainerws') --wait 1;
send_command('bind ~pagedown gs c cycleback Skillchainerws;gs c Skillchainerws') --wait 1;




send_command('bind !home lua l trust') --Turns addon trust  on.
send_command('bind !end lua u trust') --Turns addon trust off.

send_command('bind ^home input //trust toggle') --Turns addon trust start.
-- send_command('bind ^end input //trust stop') --Turns addon trust stop.

send_command('bind home lua l autobuff') --Turns addon  on.
send_command('bind end lua u autobuff') --Turns addon off.

send_command('bind ^@!f12 gs reload;lua r Gaze_check') --Reloads gearswap.and addon Gaze_check

-- send_command('bind pageup input //ata on;input //lua load Gaze_check;input /p ((Attack is ON.)) >> killer machine ready <<')--Turns addon  auto attack target on. to be killer machine in Odyssey or Dynamis.
-- send_command('bind pagedown input //ata off;input //lua unload Gaze_check')--Turns addon  auto attack target off.

send_command('bind pageup ata toggle;gzc auto_point;gs c toggle AutoEngageMode')--Turns addon  auto attack target on. to be killer machine in Odyssey or Dynamis.
-- send_command('bind pagedown input //ata off;input //lua unload Gaze_check')--Turns addon  auto attack target off.

windower.raw_register_event('incoming text',function(org)
	if string.find(org, "AutoTargetAssist targeting: on")  then
		windower.send_command('input /echo ((Attack is ON.)) >> killer machine ready <<')  -- code add by (Aragan@Asura)
        -- windower.send_command('input /t '..player.name..' '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14> ' )
	end
end)

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
-- send_command('bind ^@!f12 gs reload') --Reloads gearswap.
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
send_command('alias tonic tonic buffup')


local last_check = 0
local was_chat_open = false
windower.register_event('prerender', function()
	local curtime = os.clock()
	if nexttime + delay <= curtime then
		nexttime = curtime
		delay = 0.2
	    -- if os.clock() - last_check < 0.5 then return end
        -- last_check = os.clock()	
        local chat_open = windower.ffxi.get_info().chat_open
		if chat_open and not was_chat_open then
			send_command('unbind ~1')
			send_command('unbind ~2')
			send_command('unbind ~3')
			send_command('unbind ~4')
			-- send_command('unbind `')
			-- send_command('unbind tab')
	
			was_chat_open = true
	
		elseif not chat_open and was_chat_open then
			send_command('bind ~1 asc c 1')
			send_command('bind ~2 asc c 2')
			send_command('bind ~3 asc c 3')
			send_command('bind ~4 asc c 4')
			was_chat_open = false
		end
	
		if os.clock() - last_check < 8 then return end
		last_check = os.clock()	
		if player.equipment.ring2 == "Warp Ring" or player.equipment.feet == "Hippo. Socks +1" then
			Warping()
			tickdelay = os.clock() + 1
		end
		if state.AutoBuffMode.Value == 'Shinryu' then
			if target and target.is_npc and target.hpp <= 1 and not low_hp_nm_triggered then
				low_hp_nm_triggered = true
				state.TreasureMode:set('Fulltime')
				add_to_chat(123, 'NM HP ≤ 1% - Equipped low HP set.')
			end
		end
    end
end)

notified_hippo = false  

function Warping()
	local party = windower.ffxi.get_party()
	local current_zone = windower.ffxi.get_info().zone

	if being_attacked and player.equipment.ring2 == "Warp Ring" then
	    windower.send_command('input /p Never Die Again >> Warping Hollaaaa ;')
	-- tickdelay = os.clock() + 1
    end   

	if party.count ~= 0 and player.equipment.feet == "Hippo. Socks +1" and not data.areas.cities:contains(world.area) and not notified_hippo then
        windower.send_command('input /p >> Hippo feet equiped for pull mobs << ;')
        notified_hippo = true
    -- elseif player.equipment.feet ~= "Hippo. Socks +1" then
    --     notified_hippo = false  -- يعيد السماح إذا قمت بنزعها، يمكن إزالة هذا السطر إذا تريدها مرة فقط حتى تغيير الزون
    end
end

-- local last_check = 0

-- windower.register_event('prerender', function()
--     if os.clock() - last_check < 8 then return end
--     last_check = os.clock()	
-- 	if player.equipment.ring2 == "Warp Ring" then
-- 		Warping()
-- 		tickdelay = os.clock() + 1
-- 	end
-- end)

-- function user_tick()
--     if player.equipment.ring2 == "Warp Ring" then
-- 	if Warping() then return true end
-- 			tickdelay = os.clock() + 1.5
-- 		return true
-- 	end

-- 	return false
-- end

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

--[[ 
function user_job_state_change(field, newVal, oldVal)
	if field == 'ShieldMode' then
		if newVal == 'Normal' then
			internal_enable_set("Shield")
		else
			internal_disable_set(sets.shield[newVal], "Shield")
		end
	end
end
]]


step_timer = 0

function check_steps_subjob()
	local abil_recasts = windower.ffxi.get_ability_recasts()
    
    if state.AutoBuffMode.value ~= 'Off' and not buffactive['SJ Restriction'] then
        if player.sub_job == 'DNC' and player.tp > 140 and not silent_check_amnesia() and os.clock() > step_timer and abil_recasts[220] < latency and player.status == 'Engaged' then
            windower.add_to_chat('[AutoStep] Using Box Step')
            windower.chat.input('/ja "Box Step" <t>')
            tickdelay = os.clock() + 3.5
            step_timer = os.clock() + 35
            return true
        else
            return false
        end
    else
        return false
    end
end


function getAngle(index)
    local P = windower.ffxi.get_mob_by_target('me') --get player
    local M = index and windower.ffxi.get_mob_by_id(index) or windower.ffxi.get_mob_by_target('t') --get target
    local delta = {Y = (P.y - M.y),X = (P.x - M.x)} --subtracts target pos from player pos
    local angleInDegrees = (math.atan2( delta.Y, delta.X) * 180 / math.pi)*-1 
    local mult = 10^0
    return math.floor(angleInDegrees * mult + 0.5) / mult
end


-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
	-- default_pretarget(spell, spellMap)

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
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    refine_waltz(spell, action, spellMap, eventArgs)
end

waltz_tp_cost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}

-- Utility function for automatically adjusting the waltz spell being used to match HP needs and TP limits.
-- Handle spell changes before attempting any precast stuff.
function refine_waltz(spell, spellMap, eventArgs)
	if not state.RefineWaltz.value or spell.type ~= 'Waltz' then return false end

	local effective_tp = player.tp
	if state.DefenseMode.value == 'None' and uses_waltz_legs then
		effective_tp = player.tp + 50
	end

	if effective_tp < 200 then
		add_to_chat(123, 'Abort: Insufficient TP ['..tostring(player.tp)..'] to waltz.')
		eventArgs.cancel = true
		return true
	end

	-- Don't modify anything for Healing Waltz or Divine Waltzes
	if spell.english == "Healing Waltz" or spell.english == "Divine Waltz" or spell.english == "Divine Waltz II" then
		return false
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	-- If curing ourself, get our exact missing HP
	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	-- If curing someone in our alliance, we can estimate their missing HP
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)

		if player.main_job == 'DNC' and state.Buff['Contradance'] then
			missingHP = missingHP / 2
		end
	end

	-- If we have an estimated missing HP value, we can adjust the preferred tier used.
	if missingHP == nil then return end

	local abil_recasts = windower.ffxi.get_ability_recasts()
	if player.main_job == 'DNC' then
		if missingHP < 40 and spell.target.name == player.name then
			-- Not worth curing yourself for so little.
			-- Don't block when curing others to allow for waking them up.
			add_to_chat(123,'Abort: You have full HP!')
			eventArgs.cancel = true
			return true
		elseif missingHP < 200 then
			if abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			end
		elseif missingHP < 600 then
			if abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			elseif abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			end
		elseif missingHP < 1100 then
			if abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif abil_recasts[188] < latency then
				newWaltz = 'Curing Waltz IV'
				waltzID = 193
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			end
		elseif state.AutoContradanceMode.value and abil_recasts[229] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Contradance" <me>')
			windower.chat.input:schedule(.5,'/ja "Curing Waltz III" '..spell.target.raw..'')
			return true
		elseif missingHP < 1500 then
			if abil_recasts[188] < latency then
				newWaltz = 'Curing Waltz IV'
				waltzID = 193
			elseif abil_recasts[189] < latency then
				newWaltz = 'Curing Waltz V'
				waltzID = 311
			elseif abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			if abil_recasts[189] < latency then
				newWaltz = 'Curing Waltz V'
				waltzID = 311
			elseif abil_recasts[188] < latency then
				newWaltz = 'Curing Waltz IV'
				waltzID = 193
			elseif abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		end
	elseif player.sub_job == 'DNC' then
		if missingHP < 40 and spell.target.name == player.name then
			-- Not worth curing yourself for so little.
			-- Don't block when curing others to allow for waking them up.
			add_to_chat(123,'Abort: You have full HP!')
			eventArgs.cancel = true
			return true
		elseif missingHP < 150 then
			if abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			end
		elseif missingHP < 300 then
			if abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			elseif abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			if abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			end
		end
	else
		-- Not dnc main or sub; bail out
		return false
	end

	local tpCost = waltz_tp_cost[newWaltz]
	local downgrade

	-- Downgrade the spell to what we can afford
	if effective_tp < tpCost and not buffactive.trance then
		--[[ Costs:
			Curing Waltz:     200 TP
			Curing Waltz II:  350 TP
			Curing Waltz III: 500 TP
			Curing Waltz IV:  650 TP
			Curing Waltz V:   800 TP
			Divine Waltz:     400 TP
			Divine Waltz II:  800 TP
		--]]
		if effective_tp < 350 and abil_recasts[217] < latency then
			newWaltz = 'Curing Waltz'
		elseif effective_tp < 500 then
			if abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
			elseif abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
			end
		elseif effective_tp < 650 then
			if abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
			elseif abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
			end
		elseif effective_tp < 800 then
			if abil_recasts[188] < latency then
				newWaltz = 'Curing Waltz IV'
			elseif abil_recasts[187] < latency then
				newWaltz = 'Curing Waltz III'
			elseif abil_recasts[186] < latency then
				newWaltz = 'Curing Waltz II'
			elseif abil_recasts[217] < latency then
				newWaltz = 'Curing Waltz'
			end
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end


	if newWaltz ~= spell.english then
		windower.chat.input('/ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(122, downgrade)
		end
		eventArgs.cancel = true
		add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
		return true
	end
end



function user_post_precast(spell)
	if spell.name == "Holy Water" then
		equip(sets.precast.Item['Holy Water'])
		if buffactive['doom'] then
			equip(sets.precast.Item['Holy Water'],sets.Reraise)
		end
    end
    --[[if spell.type == 'WeaponSkill' and state.WeaponskillMode.value == 'SubtleBlow' then
	equip(sets.precast.WS.SubtleBlow)
    end
    ]]

    if spell.type == 'WeaponSkill' and state.WeaponskillMode.value == 'SubtleBlow' then
	    equip(sets.precast.WS.SubtleBlow)
    end
	attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)

    if spell.type == 'WeaponSkill' then

        if state.WeaponskillMode.value == 'SubtleBlow' then --and (attack > attack2 or attack < attack2)
            equip(sets.precast.WS.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
		elseif player.main_job == 'DNC' and buffactive["Climactic Flourish"] and not data.weaponskills.elemental:contains(spell.name) and attack > attack2 then
			equip(sets.precast.WS[spell.name].PDL.Clim)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
			 --windower.add_to_chat(123, 'Auto WS Mode: PDL')

        --[[else
            equip(sets.precast.WS[spell.name])
			]]
        end

    end
end

function user_aftercast(spell, spellMap, eventArgs)
	-- if pet.isvalid then
	-- 	if (spell.action_type == 'Magic' and player.hpp < Breath_HPP) or spell.english == 'Steady Wing' or spell.english == 'Restoring Breath' then
	-- 		petWillAct = os.clock()
	-- 		equip(sets.HealingBreath)
	-- 		eventArgs.handled = true
	-- 	elseif spell.english == 'Smiting Breath' and sets.SmitingBreath then
	-- 		petWillAct = os.clock()
	-- 		equip(sets.SmitingBreath)
	-- 		eventArgs.handled = true
	-- 	end
	-- end
	-- < this mean low  
	if spell.type == 'WeaponSkill' then
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

-- windower.register_event('incoming text',function(org)     

-- end)
	-- if spell.skill == 'Elemental Magic' then
	-- 	windower.send_command('input /p  ')
	-- 	-- windower.chat.input('/p  ')

	-- end
	if state.AutoLoggerMode.value and not spell.interrupted then
		if spell.action_type == 'Magic' or spell.type == 'WeaponSkill' or spell.type == 'JobAbility' then
			windower.chat.input('/p used: '..spell.name..' on -> '..(spell.target.name or '<t>'))

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
function user_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
	-- if (player.main_job == 'BST' or player.main_job == 'DRK'
	--    or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR') then
    --    if player.hpp < 5 then
	--     equip(sets.Reraise)
	-- 	--send_command('gs c update')
	-- 	disable('head','body')
	--     end
    -- else
    --     enable('head','body')
    -- end
	if state.CraftingMode.value ~= 'None' then
		equip(sets.crafting[state.CraftingMode.value])
	
    elseif state.CraftQuality.value ~= 'Normal' then
		equip(sets.crafting[state.CraftQuality.value])
	end

	if state.NeverDieMode.value or state.AutoCureMode.value then 

		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()
		-- local spellCost = actual_cost(spell)

		--[[if player.tp > 350 and player.max_hp - player.hp > 600 and abil_recasts[186] < latency then
			windower.send_command('input /ja Curing Waltz II <me>')
			]]
	    if player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and player.tp > 500 and player.max_hp - player.hp > 1000 and abil_recasts[187] < latency then			
			windower.chat.input('/ja Curing Waltz II <me>')
			tickdelay = os.clock() + 1.1
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Defender and abil_recasts[3] < latency and (player.in_combat or being_attacked) and player.hpp < 25 then
			windower.chat.input('/ja "Defender" <me>')
			tickdelay = os.clock() + 1.1
		elseif (player.sub_job == 'SCH' or player.sub_job == 'RDM' or player.sub_job == 'pld' or player.sub_job == 'WHM')
		    and not state.Buff['SJ Restriction'] and player.hpp < 25 and being_attacked and spell_recasts[4] < spell_latency then 
				windower.send_command('gs c smartcure')
			-- windower.chat.input('/ma "Cure IV" <me>')
			tickdelay = os.clock() + 1.1
		elseif player.sub_job == 'NIN' and not state.Buff['SJ Restriction'] and (player.in_combat or being_attacked) and player.hpp < 10 then
			state.AutoShadowMode:set('true')
			tickdelay = os.clock() + 1.1
		elseif player.inventory['Vile Elixir +1'] and (player.in_combat or being_attacked) and player.hpp < 10 then
            send_command('input /item "Vile Elixir +1" <me>')
            tickdelay = os.clock() + 1.1
            return true
        elseif player.inventory['Vile Elixir'] and (player.in_combat or being_attacked) and player.hpp > 10 then
            send_command('input /item "Vile Elixir" <me>')
            tickdelay = os.clock() + 1.1
            return true
		end
	end

end

function user_tick()
	--if check_arts() then return true end
	if user_state_change() then return true end
	if user_buff_change() then return end
	if check_steps_subjob() then return true end
	-- if refine_waltz(spell, action, spellMap, eventArgs) then return true end
	-- if state.AutoAbsorttpaspirSpam.value and player.in_combat and player.target.type == "MONSTER" and not moving then
	-- 	if check_tp_mp_lower() then return true end
	-- 		tickdelay = os.clock() + 1.5
	-- 	return true
	-- end
	return false
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


-- Allow jobs to override this code
function user_self_command(commandArgs, eventArgs)


	if commandArgs[1]:lower() == 'abyssea' then
		send_command('@input //ept track "'..state.Abyssea.value..'"')
	end
	if commandArgs[1]:lower() == 'ascws' then
		send_command('@asc ws "'..state.Ascws.value..'"') --asc ws Decimation
	elseif commandArgs[1]:lower() == 'skillchainerws' then --Skillchainer mainws Decimation
		send_command('@Skillchainer mainws "'..state.Skillchainerws.value..'"')
	end
end
	

-- Modify the default idle set after it was constructed.
function user_customize_idle_set(idleSet)
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
function user_customize_melee_set(meleeSet)
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
	-- if (player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
	-- 	or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR') then
    --     if player.hpp < 5 then --code add from Aragan Asura
    --     meleeSet = set_combine(meleeSet, sets.Reraise)
	-- 	disable('head','body')
    --     else
    --     enable('head','body')
	--     end
	-- end

    return meleeSet
end

-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)

	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if state.NeverDieMode.value or state.AutoCureMode.value then 
		if player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and player.tp > 200 and abil_recasts[215] < latency and (buffactive['poison'] or buffactive['slow'] or buffactive['Rasp'] 
	    or buffactive['Dia'] or buffactive['Defense Down'] or buffactive['Magic Def. Down'] or buffactive['Max HP Down']
	    or buffactive['Evasion Down'] or buffactive['Magic Evasion Down'] or buffactive['Bio'] or buffactive['Bind']
	    or buffactive['weight'] or buffactive['Attack Down'] or buffactive['Accuracy Down'] or buffactive['VIT Down']
	    or buffactive['INT Down'] or buffactive['MND Down'] or buffactive['STR Down'] or buffactive['AGI Down']) then		
	        windower.chat.input('/ja Healing Waltz <me>')
	        tickdelay = os.clock() + 1.1
			return
		end
	end


	-- -- Create a timer when we gain weakness.  Remove it when weakness is gone.
	-- if buff:lower() == 'weakness' then
	-- 		send_command('timers create "Weakness" 300 up abilities/00255.png')
	-- else
	-- 		send_command('timers delete "Weakness"')
		
	-- end
	if state.NeverDieMode.value or state.AutoCureMode.value then 
		if buffactive['poison'] and world.area:contains('Sortie') and (player.sub_job == 'SCH' or player.sub_job == 'WHM') and spell_recasts[14] < spell_latency then 
			windower.chat.input('/ma "Poisona" <me>')
			tickdelay = os.clock() + 1.1
		end
	end

	if state.AutoMedicineMode.value == true then
		if buff == "Defense Down" then
			if gain then  			
				send_command('input /item "panacea" <me>')
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
		elseif buff == "paralysis" then
			if gain then  
				send_command('input /item "remedy" <me>')
			end
		end
		if buff == "curse" then
			if gain then  
				send_command('input /item "Holy Water" <me>')
				equip(sets.precast.Item['Holy Water'])
			end
		end
		if not midaction() then
			job_update()
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

function user_zone_change(new_id,old_id)
	--tickdelay = os.clock() + 10	
	current_zone = windower.ffxi.get_info().zone
	notified_hippo = false
	if data.areas.cities:contains(world.area)  then
		send_command('input //lua l invspace;input //lua l invtracker;input //lua l Clock;input //tr autodrop off;input //gs c set AutoCleanupMode false;lua u Skillchainer;asc hide;sing active') --Turns addon on hide show off some no need in city on screen.
	else
		send_command('input //lua u invspace;input //lua u invtracker;input //stats hide;input //lua U Clock;input //tr autodrop on;input //gs c set AutoCleanupMode true') --Turns addon off on show hide. stats=craftstats addon
	end
	
	if data.areas.laggy:contains(world.area)  then
		send_command('input //gs c set AutoDefenseMode true;input //gs c set AutoWSRestore true') --Turns mode on.
	else
		--send_command('input //gs c set AutoWSRestore false;') --Turns  off. -- 
	end

	if world.area:contains('Nyzul Isle') then
		send_command('input //NyzulHelper show;input //NyzulBuddy start;input //iSpy') --Turns addon on.
	else
		send_command('input //NyzulHelper hide;input //NyzulBuddy stop;') --Turns addon off. -- input //iSpy
	end
	if not world.area:contains('Abyssea - Empyreal Paradox') and world.area:contains('Abyssea') then
		send_command('input //ept show;gs c set SkipProcWeapons false;input /lockstyleset 1') --Turns addon on.

	else
		send_command('input //ept hide;') --Turns addon off.
	end

	if world.area:contains('Sortie') or world.area:contains('Odyssey') then
		send_command('AutoItem on') --Turns addon on.
	else
		--send_command('input //ept hide;') --Turns addon off.
	end
end


function user_sub_job_change(newSubjob, oldSubjob)	-- sub_job_change(new,old) -- style on auto with change sub job
	-- user_job_lockstyle()
	-- tickdelay = os.clock() + 6.5

	user_job_lockstyle:schedule(7)

end
-- If HP drops under 45% then equip Re-raise head/body
-- windower.register_event('hpp change', -- code add from Aragan Asura
-- function(new_hpp,old_hpp)
--     if player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
--             or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR' then
--         if new_hpp < 5 then
-- 			equip(sets.Reraise)
--         end
--     end
-- end)


function user_target_change(target)  
	local already_announced_by_name = already_announced_by_name or {}
	local target = windower.ffxi.get_mob_by_target('t')
	local sub = windower.ffxi.get_mob_by_target('st')

    if state.AutoinfoNMMode.value and target ~= nil and sub == nil then

        if target.name == "Ironshell" and not already_announced_by_name[target.name] then
			already_announced_by_name[target.name] = true

			-- windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
			windower.send_command('input /echo ['..target.name..'] HP ~1,620,000 MP:have EVA 1,581 M.DEF 100 INT: 363 MND: 338 /posion dangeros remove it fast /move nm from pos if black cloud up .')
		end
        -- if (target.name == "Ironshell" or target.name == "Ghast") and not already_announced_by_name[target.name] then
		-- 	already_announced_by_name[target.name] = true

		-- 	windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
		-- 	windower.send_command('input /echo ['..target.name..'] RUN Thunder hand USE Tellus / Wind hand USE Gelus .. Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
		-- end
	end
end

windower.raw_register_event('incoming text',function(org)
	if state.DefenseDownMode.Value ~= 'None' then
		--abyssea stagger --red pros
		if string.find(org, "Armor Break") then
			-- windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
			send_command('gs c Weapons Normal;gs c cycle DefenseDownMode;')
		end
	end
	if string.find(org, "You find a Volte Tights") or string.find(org, "You find a Volte Tiara") 
	or string.find(org, "You find a Volte Boots") or string.find(org, "You find a Volte Hose") 
	or string.find(org, "You find a Volte Bracers") or string.find(org, "You find a Crepuscular Cloak") 
	or string.find(org, "You find a Volte Moufles") or string.find(org, "You find a Volte Brayettes")
	or string.find(org, "You find a Fu's scale") or string.find(org, "You find a Kin's scale")
	or string.find(org, "You find a Kyou's Scale") or string.find(org, "You find a Kei's Scale")
	or string.find(org, "You find a Gin's Scale") then
		local item_name = org:match("You find a (.+)")

		windower.send_command('input /echo '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14>!')  -- code add by (Aragan@Asura)
        windower.send_command('input /t '..player.name..' '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14> ' )
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
function get_attack_increase(target)
    local buffs = {'Dia', 'Shell Crusher'}
    local attack_increase = 0
    for _, buff in ipairs(buffs) do
        if target and target.buffs[buff] then
            attack_increase = attack_increase + 1000
        end
    end
    return attack_increase
end

function get_attack_power()
    local base_attack = 3500
    local target = windower.ffxi.get_mob_by_target('t')
    local attack_increase = get_attack_increase(target)
    return base_attack + attack_increase
end
function display_attack_power(attack_power)
    add_to_chat(123, '"Attack Power: " '.. tostring(attack_power)'')
end

function get_attack_power()
    local base_attack = 3500
    local target = windower.ffxi.get_mob_by_target('t')
    local attack_increase = get_attack_increase(target)
    local attack_power = base_attack + attack_increase
    
    display_attack_power(attack_power)
	add_to_chat(123, '"Attack Power: " '.. tostring(attack_power)'')

    return attack_power
end
]]


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



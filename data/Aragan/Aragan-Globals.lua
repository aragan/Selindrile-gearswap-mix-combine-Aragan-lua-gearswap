-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	         Aragan  --------------- [Author Primary]                          -- 
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
add code auto swap gear to EnemyCritical idle set if u get hite critcal hit.
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
-- include(player.name..'-items.lua')

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
state.ReEquip 		  	  = M(false, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
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
state.AutoWSRestore		  = M(false, 'Auto Weaponskill Restore Mode')
state.SelectNPCTargets    = M(false, 'Select NPC Targets')
state.PCTargetMode        = M{['description'] = 'PC Target Mode', 'default', 'stpt', 'stal', 'stpc'}
state.SubtleBlowMode      = M(false, 'SubtleBlow Mode') 
state.AutoOtherTargetWS   = M(false, 'AutoOtherTargetWS')
state.TargetMode        = M(false, 'TargetMode')
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

--state.Passive:options('None','EnemyCritRate','Regen','Resist','Refresh','Empy', 'SubtleBlow', 'SubtleBlow40', 'SubtleBlow50')
-- state.Buff['SJ Restriction'] = buffactive['SJ Restriction'] or false

state.WeaponLock = M(false, 'Weapon Lock')
state.RP = M(false, "Reinforcement Points Mode")
state.StormSurge = M(false, 'Stormsurge')
state.SrodaBelt = M(false, 'SrodaBelt')
state.SrodaNecklace = M(false, 'SrodaNecklace')
state.NM = M(true, 'NM')
state.SleepMode = M{['description']='Sleep Mode', 'Normal', 'MaxDuration'}
state.AutoMedicineMode = M(false, 'Auto Medicine Mode')
state.AutoReraiseMode = M(true, 'Auto Reraise Mode')
state.AutoCureMode = M(true, 'Auto Cure Mode')
state.NeverDieMode = M(true, 'Never Die Mode')
state.AutoTomahawkMode = M(false, 'AutoTomahawkMode')
state.AutoJumpMode 		  = M(false, 'Auto Jump Mode')
state.AutoAPMode = M(true, 'AutoAPMode')
state.AutoinfoNMMode = M(true, 'Auto info NM Mode')
state.AutoShadowMode 	  = M(false, 'Auto Shadow Mode')
state.RefineWaltz		  = M(true, 'RefineWaltz')
state.Stance = M{['description']='Stance','None'}
state.AutoReraiseMode = M(true, 'Auto Reraise Mode')
state.AutogearbuffMode = M(true, 'AutogearbuffMode')
state.Autojoinptmode = M(true, 'Autojoinptmode')
state.AutoDropItemsMode = M(true, 'AutoDropItemsMode')


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
state.Skillchainerws = M{['description']='Skillchainerws','Fell Cleave','Exudation','Realmrazer','Last Stand','Black Halo','Blade: Yu','Blade: Teki','Blade: Chi','Blade: To','Blade: Shun','Tachi: Kagero','Tachi: Goten','Tachi: Koki','Tachi: Fudo','Torcleaver','Savage Blade','Requiescat','Victory Smite','Shijin Spiral','Evisceration','Rudra\'s Storm','Aeolian Edge','Cross Reaper','Spiral Hell','Insurgency','Vorpal Scythe',}

NotifyBuffs = S{'doom','petrification','sleep','slow','paralysis','weakness','elegy','curse recovery','zombie','super curse'}

gear.TVRring = "Cornelia's Ring"

-- --if get debuff slow equip set
-- sets.buff.Slow = {hands={ name="Gazu Bracelets +1", augments={'Path: A',}}, --10% haste
-- waist="Tempus Fugit +1",}  --15% haste
-- global.lua
-- if not sets then sets = {} end
-- sets.buff = sets.buff or {}

-- sets.buff.Slow = set_combine(sets.buff.Slow, {hands={ name="Gazu Bracelets +1", augments={'Path: A',}}, --10% haste
-- waist="Tempus Fugit +1",})

state.Absorbs = M{['description']='Absorbs', 'Absorb-TP', 'Absorb-VIT','Absorb-Attri', 'Absorb-MaxAcc','Absorb-STR', 'Absorb-DEX', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR',}

state.AutoBarStatus = M{['description'] = 'Auto BarStatus','Off','Barparalyze','Barsilence','Barpoison','Barvirus','Barpetrify','Barblind','Baramnesia','Barsleep'}
state.AutoBoostStat = M{['description'] = 'Auto BoostStat','Off', 'Boost-INT', 'Boost-AGI', 'Boost-VIT', 'Boost-DEX', 'Boost-MND', 'Boost-CHR'}

state.AutoTrustMode = M{['description'] = 'Auto Trust Mode', 'Off','Auto','MLfarm','corfarm', 'Defend', 'DI'}

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
((Attack is ON.)) >> killer machine ready <<
(Aragan) i do first ws Armor Break def down
send_command('input /p Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Ready')		
--for non change warp ring if equip 
 using any item, //gs c useitem slot Item Name
So, for example //gs c useitem head Reraise Hairpin +1
//gs c useitem ring2 warp ring
]]

-- if (player.main_job == 'BLM' or player.main_job == 'RDM' or player.main_job == 'SCH' or player.main_job == 'PLD' or player.main_job == 'WHM' or player.main_job == 'NIN') then
    --  if player.sub_job == 'DRK' or player.sub_job == 'RDM' then

-- 	       send_command('amb t 2')--;automb addon set tier spell 
--      end
-- end

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
	send_command('bind !f12 gs c reset DefenseMode;gs c reset IdleMode;gs c reset passive')
	send_command('bind ^f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.

	send_command('bind delete zonetimer reset') --Turns addon reset time.
	send_command('bind !0 zonetimer reset') --Turns addon reset time.
	send_command('bind ^pagedown autoitem toggle') --Turns addon off.
	-- send_command('bind ^pageup autoitem on') --Turns addon on.
	send_command('bind ^delete aws toggle;gs c set AutoWSMode false') --Turns addon autows on odd. to add ws //aws set "Evisceration" 
	send_command('bind ^insert aws reload') --reload addon autows on odd. --//aws set Evisceration
	send_command('bind ~d gs c cycle DefenseDownMode') --Turns addon smarttarget on odd.

	send_command('bind !insert smrt on;smrt') --Turns addon smarttarget on odd.
	send_command('bind !delete smrt off') --Turns addon smarttarget off odd.
	-- send_command('bind !pagedown autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	--send_command('bind !pageup autoNukes on') --Turns addon on. addon use for spamm aspir on sortie aminon
	--send_command('bind ^4 autoNukes on') --Turns addon on.addon use for spamm aspir on sortie aminon
	-- send_command('bind ^5 autoNukes off') --Turns addon off.addon use for spamm aspir on sortie aminon
	send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  --use for spam absort tp and aspir on sortie aminon
	send_command('bind ^7 gs c toggle AutoWSRestore ')  -- USE WS HP STEAL IF HP LOW

	-- send_command('bind ^backspace automb toggle') --Turns addon on.addon automb
	send_command('bind !backspace automb toggle') --Turns addon toggle on off.addon automb
	
	--lua r AutoWS;aws on;
	send_command('bind !o put storage slip* case all;wait .3;gs org;wait 3;gs validate') 
	send_command('bind ^w input /wave')

	
	send_command('bind !f2 gs c toggle TankAutoDefense')
	send_command('bind !f3 gs c toggle AutoTankMode')
	send_command('bind !f4 gs c toggle AutoDefenseMode')
	send_command('bind f5 gs c toggle AutoWSMode;aws off')
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
	send_command('bind @4 gs c cycleback passive')

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
	send_command('bind @7 gs c toggle TargetMode')

	
	send_command('bind !w gs c toggle WeaponLock')
	send_command('bind !f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind !7 gs c toggle AutoAcceptRaiseMode')
	send_command('bind !8 gs c toggle SkipProcWeapons')
	send_command('bind !9 gs c toggle AutogearbuffMode')
	send_command('bind !0 gs c toggle Autojoinptmode')
	send_command('bind ^0 gs c toggle AutoDropItemsMode')

	send_command('bind ^- gs c toggle selectnpctargets') 
	send_command('bind !- gs c cycle pctargetmode')
    send_command('lua r runewidget;rw show')--Turns addon off if job non /run. just used on screen left side to check elemtels cycle for used anythung like ws spell sc mb  and other idea
	send_command('lua u invspace;lua u invtracker')--Turns load addon invspace and invtracker 

	--send_command('bind ^] put storage slip* case all')
	--send_command('bind ^[ get storage slip* all') --PorterPacker Porter find
	send_command('bind ~p put storage slip* case all') --shift+p put all storage slip* all to case  -- all command put or get from itemizer addon 

	send_command('bind !, put * sack all;put * Satchel all') -- put everything to Satchel sack used if inventory full / --gs validate  --to check 	lua r gearswap
	send_command('bind !. put * Wardrobe4 all') -- put all equip to wardobe 4 / -- gs validate  --to check  -- lua r gearswap --;put * Wardrobe4 all;put * Wardrobe5 all;put * Wardrobe6 all;put * Wardrobe7 all;put * Wardrobe8 all

	send_command('bind ^. get storage slip* all;wait 1;po r') -- old version PorterPacker Porter used get storage slip* all equips from porter -- lua r PorterPacker addon
	send_command('bind ^, lua r PorterPacker;wait 1;get storage slip* all;wait 1;po r a') -- new version PorterPacker Porter used get storage slip* all equips from porter
	send_command('bind ^] get storage slip* all;wait 1;po pack')--  old version PorterPacker trade storage slip* all to porter
	send_command('bind ^[ get storage slip* all;wait 1;lua r PorterPacker;wait 1;po p a ') -- new version PorterPacker Porter used trade storage slip* all to porter

	send_command('bind !m gs c toggle AutoMedicineMode') --use medicine if i have debuff
	-- send_command('bind !n gs c toggle AutoReraiseMode') -- equip zombie set autoreraise if u in jobs sam pld war bst drk drg

	--send_command('bind @m gs c mount Raptor')

	--send_command('gs org')-- org addon every change job
	send_command('wait 1;put * wardrobe4 all;wait .3;put storage slip* case all;wait .5;gs org')-- org addon every change job

end
send_command('bind ~s gs c toggle AutoLoggerMode;gs c toggle NotifyBuffs') --AutoLoggerMode and NotifyBuffs mode text in chat all u doing ja ws spell debuff buff in on 

--addon ascs autosc
send_command('bind ~f1 asc') --Turns addon on off.
send_command('bind ~f2 asc toggle') --Turns addon show/hide.
send_command('bind ~f3 asc open') --Turns addon open ws no/off.
send_command('bind ~f4 gs c cycle ascws;gs c ascws') --wait 1;
send_command('bind ~f5 gs c cycleback ascws;gs c ascws') --wait 1;
send_command('bind ~f6 asc r') --wait 1;
send_command('bind ~f7 asc pr') --wait 1;

send_command('bind ~1 asc c 1') --Turns addon clos sc 1 .
send_command('bind ~2 asc c 2') --Turns addon clos sc 2.
send_command('bind ~3 asc c 3') --
send_command('bind ~4 asc c 4') --
--send_command('bind ~z gs c ascws') --wait 1;

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

send_command('bind ^home trust toggle') --Turns addon trust start.
-- send_command('bind ^end trust stop') --Turns addon trust stop.

send_command('bind home lua l autobuff') --Turns addon  on.
send_command('bind end lua u autobuff') --Turns addon off.

send_command('bind ^@!f12 gs reload;gzc auto_point') -- lua r Gaze_check /--Reloads gearswap.and addon Gaze_check

-- send_command('bind pageup ata on;lua load Gaze_check;input /p ((Attack is ON.)) >> killer machine ready <<')--Turns addon  auto attack target on. to be killer machine in Odyssey or Dynamis.
-- send_command('bind pagedown ata off;lua unload Gaze_check')--Turns addon  auto attack target off.

send_command('bind pageup ata toggle;gs c toggle AutoEngageMode;gzc auto_point;')--Turns addon  auto attack target on. to be killer machine in Odyssey or Dynamis.
-- send_command('bind pagedown ata off;lua unload Gaze_check')--Turns addon  auto attack target off.

-- windower.register_event('action', function(act)
-- 	local actor = (act.actor_id and windower.ffxi.get_mob_by_id(act.actor_id)) or 'unknown'
-- 	if type(actor) == "table" then
-- 		actor = actor.name
-- 	end

-- 	local monster_ability = res.monster_abilities[act.targets[1].actions[1].param]
-- 	local spell_start = res.spells[act.targets[1].actions[1].param]

-- 	if actor == 'Abyssdiver' then
-- 		local monster_ability = res.monster_abilities[act.param]
-- 		if monster_ability == nil then
-- 			return
-- 		elseif monster_ability.en == 'Helldive' then
-- 			windower.add_to_chat(207, 'Helldive')
-- 		elseif monster_ability.en == 'Wing Cutter' then
-- 			windower.add_to_chat(207, 'Wing Cutter')
-- 			-- coroutine.schedule(function()
-- 			-- 	windower.add_to_chat(207, 'Wing Cutter  is off!')
-- 			-- end, 30)
-- 		end
-- 	end
-- 	if actor == 'Minaruja' then
-- 		local monster_ability = res.monster_abilities[act.param]
-- 		if monster_ability == nil then
-- 			return
-- 		elseif monster_ability.en == 'Hurricane Breath' then
-- 			windower.add_to_chat(207, 'Hurricane Breath')
-- 			send_command('gs c update') 
-- 			style_lock = true
-- 		end
-- 	end
-- end)
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


-- local next_check = 0
-- local check_delay = 1.0   -- ثانية بين كل فحص (تقدر تخليها 2.0 لو تبي أخف)
-- local was_chat_open = false

-- windower.register_event('prerender', function()
--     local now = os.clock()
--     if now < next_check then return end
--     next_check = now + check_delay
-- 	    -- if os.clock() - last_check < 0.5 then return end
--         -- last_check = os.clock()	
--         local chat_open = windower.ffxi.get_info().chat_open
-- 		if chat_open and not was_chat_open then
-- 			send_command('unbind ~1')
-- 			send_command('unbind ~2')
-- 			send_command('unbind ~3')
-- 			send_command('unbind ~4')
-- 			-- send_command('unbind `')
-- 			-- send_command('unbind tab')
	
-- 			was_chat_open = true
	
-- 		elseif not chat_open and was_chat_open then
-- 			send_command('bind ~1 asc c 1')
-- 			send_command('bind ~2 asc c 2')
-- 			send_command('bind ~3 asc c 3')
-- 			send_command('bind ~4 asc c 4')
-- 			was_chat_open = false
-- 		end
	


-- 		-- if state.AutoBuffMode.Value == 'Shinryu' then
-- 		-- 	if target and target.is_npc and target.hpp <= 1 and not low_hp_nm_triggered then
-- 		-- 		low_hp_nm_triggered = true
-- 		-- 		state.TreasureMode:set('Fulltime')
-- 		-- 		add_to_chat(123, 'NM HP ≤ 1% - Equipped low HP set.')
-- 		-- 	end
-- 		-- end
    
-- end)


-- Function to revert binds when unloading.
function global_unload()
	send_command('clear_binds') 
	send_command('unbind f1')
	send_command('unbind f2')
	send_command('unbind f3')
	send_command('unbind !s')
	send_command('unbind !r')
	send_command('unbind !5')
	send_command('unbind tab')
	send_command('unbind `')
    send_command('unbind ^numpad0')
    send_command('unbind ^a')
    send_command('unbind !a')
	send_command('unbind !e')
    send_command('unbind !;')
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
	send_command('unbind ^backspace')
	send_command('unbind !n')
	send_command('unbind !;')
	send_command('unbind ^;')
	send_command('unbind !`')
	send_command('unbind @`')
	send_command('unbind !q')
	send_command('unbind @^`')
	send_command('unbind !pause')
	send_command('unbind @^`')
	send_command('unbind ^\\\\')
	send_command('unbind @\\\\')
	send_command('unbind !\\\\')
	send_command('unbind ')
	send_command('unbind ')

	

	send_command('lua u Singer')--Turns addon off if job non brd.
	send_command('lua u PLD-HUD')--Turns addon off if job non pld.
	send_command('lua u DNC-hud')--Turns addon off if job non dnc.
	send_command('lua u sch-hud')--Turns addon off if job non sch.
	send_command('lua u BST-HUD')--Turns addon off if job non bst.

	send_command('parse reset')-- reset parse addon every change job

end

notified_hippo = false  

function Warping()
	local party = windower.ffxi.get_party()
	local current_zone = windower.ffxi.get_info().zone

	if player.status ~= 'Dead' and not buff == "weakness" and not buffactive.doom and being_attacked and player.equipment.ring2 == "Warp Ring" then
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

function user_status_change(new_status, old_status)
	if player.equipment.ring2 == "Warp Ring" then
		Warping()
		tickdelay = os.clock() + 1
	end
end

-- Delay for user_tick
local next_user_tick = 0
local user_tick_delay = 0.5 -- نصف ثانية

function user_tick()
    local now = os.clock()
    if now < next_user_tick then return false end
    next_user_tick = now + user_tick_delay
    -- if player.equipment.ring2 == "Warp Ring" then
	-- if Warping() then return true end
	-- 		tickdelay = os.clock() + 1.5
	-- 	return true
	-- end

	return false
end

-- bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
-- 'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
-- 'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
-- 'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
-- 'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

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

function user_pretarget(spell, spellMap, eventArgs)
    if state.TargetMode.value and spell.type == "WeaponSkill" and spell.targets.Enemy then
		if spell.target.raw == '<t>' and spell.target.type == 'MONSTER' then
			change_target('<stnpc>')
			eventArgs.cancel = true

			windower.chat.input('/ma "'..spell.name..'" <stnpc>')
            tickdelay = os.clock() + 1.1

			return
		end
    end
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
-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
	-- Default base equipment layer of fast recast.
	if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
		equip(sets.midcast.FastRecast)
	end
end

-- waltz_tp_cost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}

-- -- Utility function for automatically adjusting the waltz spell being used to match HP needs and TP limits.
-- -- Handle spell changes before attempting any precast stuff.
-- function refine_waltz(spell, spellMap, eventArgs)
-- 	if not state.RefineWaltz.value or spell.type ~= 'Waltz' then return false end

-- 	local effective_tp = player.tp
-- 	if state.DefenseMode.value == 'None' and uses_waltz_legs then
-- 		effective_tp = player.tp + 50
-- 	end

-- 	if effective_tp < 200 then
-- 		add_to_chat(123, 'Abort: Insufficient TP ['..tostring(player.tp)..'] to waltz.')
-- 		eventArgs.cancel = true
-- 		return true
-- 	end

-- 	-- Don't modify anything for Healing Waltz or Divine Waltzes
-- 	if spell.english == "Healing Waltz" or spell.english == "Divine Waltz" or spell.english == "Divine Waltz II" then
-- 		return false
-- 	end

-- 	local newWaltz = spell.english
-- 	local waltzID

-- 	local missingHP

-- 	-- If curing ourself, get our exact missing HP
-- 	if spell.target.type == "SELF" then
-- 		missingHP = player.max_hp - player.hp
-- 	-- If curing someone in our alliance, we can estimate their missing HP
-- 	elseif spell.target.isallymember then
-- 		local target = find_player_in_alliance(spell.target.name)
-- 		local est_max_hp = target.hp / (target.hpp/100)
-- 		missingHP = math.floor(est_max_hp - target.hp)

-- 		if player.main_job == 'DNC' and state.Buff['Contradance'] then
-- 			missingHP = missingHP / 2
-- 		end
-- 	end

-- 	-- If we have an estimated missing HP value, we can adjust the preferred tier used.
-- 	if missingHP == nil then return end

-- 	local abil_recasts = windower.ffxi.get_ability_recasts()
-- 	if player.main_job == 'DNC' then
-- 		if missingHP < 40 and spell.target.name == player.name then
-- 			-- Not worth curing yourself for so little.
-- 			-- Don't block when curing others to allow for waking them up.
-- 			add_to_chat(123,'Abort: You have full HP!')
-- 			eventArgs.cancel = true
-- 			return true
-- 		elseif missingHP < 200 then
-- 			if abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 				waltzID = 190
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			end
-- 		elseif missingHP < 600 then
-- 			if abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			elseif abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			elseif abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 				waltzID = 190
-- 			end
-- 		elseif missingHP < 1100 then
-- 			if abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			elseif abil_recasts[188] < latency then
-- 				newWaltz = 'Curing Waltz IV'
-- 				waltzID = 193
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			end
-- 		elseif state.AutoContradanceMode.value and abil_recasts[229] < latency then
-- 			eventArgs.cancel = true
-- 			windower.chat.input('/ja "Contradance" <me>')
-- 			windower.chat.input:schedule(.5,'/ja "Curing Waltz III" '..spell.target.raw..'')
-- 			return true
-- 		elseif missingHP < 1500 then
-- 			if abil_recasts[188] < latency then
-- 				newWaltz = 'Curing Waltz IV'
-- 				waltzID = 193
-- 			elseif abil_recasts[189] < latency then
-- 				newWaltz = 'Curing Waltz V'
-- 				waltzID = 311
-- 			elseif abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			end
-- 		else
-- 			if abil_recasts[189] < latency then
-- 				newWaltz = 'Curing Waltz V'
-- 				waltzID = 311
-- 			elseif abil_recasts[188] < latency then
-- 				newWaltz = 'Curing Waltz IV'
-- 				waltzID = 193
-- 			elseif abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			end
-- 		end
-- 	elseif player.sub_job == 'DNC' then
-- 		if missingHP < 40 and spell.target.name == player.name then
-- 			-- Not worth curing yourself for so little.
-- 			-- Don't block when curing others to allow for waking them up.
-- 			add_to_chat(123,'Abort: You have full HP!')
-- 			eventArgs.cancel = true
-- 			return true
-- 		elseif missingHP < 150 then
-- 			if abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 				waltzID = 190
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			end
-- 		elseif missingHP < 300 then
-- 			if abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			elseif abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			end
-- 		else
-- 			if abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 				waltzID = 192
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 				waltzID = 191
-- 			end
-- 		end
-- 	else
-- 		-- Not dnc main or sub; bail out
-- 		return false
-- 	end

-- 	local tpCost = waltz_tp_cost[newWaltz]
-- 	local downgrade

-- 	-- Downgrade the spell to what we can afford
-- 	if effective_tp < tpCost and not buffactive.trance then
-- 		--[[ Costs:
-- 			Curing Waltz:     200 TP
-- 			Curing Waltz II:  350 TP
-- 			Curing Waltz III: 500 TP
-- 			Curing Waltz IV:  650 TP
-- 			Curing Waltz V:   800 TP
-- 			Divine Waltz:     400 TP
-- 			Divine Waltz II:  800 TP
-- 		--]]
-- 		if effective_tp < 350 and abil_recasts[217] < latency then
-- 			newWaltz = 'Curing Waltz'
-- 		elseif effective_tp < 500 then
-- 			if abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 			elseif abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 			end
-- 		elseif effective_tp < 650 then
-- 			if abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 			elseif abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 			end
-- 		elseif effective_tp < 800 then
-- 			if abil_recasts[188] < latency then
-- 				newWaltz = 'Curing Waltz IV'
-- 			elseif abil_recasts[187] < latency then
-- 				newWaltz = 'Curing Waltz III'
-- 			elseif abil_recasts[186] < latency then
-- 				newWaltz = 'Curing Waltz II'
-- 			elseif abil_recasts[217] < latency then
-- 				newWaltz = 'Curing Waltz'
-- 			end
-- 		end

-- 		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
-- 	end


-- 	if newWaltz ~= spell.english then
-- 		windower.chat.input('/ja "'..newWaltz..'" '..tostring(spell.target.raw))
-- 		if downgrade then
-- 			add_to_chat(122, downgrade)
-- 		end
-- 		eventArgs.cancel = true
-- 		add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
-- 		return true
-- 	end
-- end



function user_post_precast(spell)
	-- if spell.name == "Holy Water" then
	-- 	equip(sets.precast.Item['Holy Water'])
	-- 	if buffactive['doom'] then
	-- 		equip(sets.precast.Item['Holy Water'],sets.Reraise)
	-- 	end
    -- end
    --[[if spell.type == 'WeaponSkill' and state.WeaponskillMode.value == 'SubtleBlow' then
	equip(sets.precast.WS.SubtleBlow)
    end
    ]]

    -- if state.WeaponskillMode.value == 'SubtleBlow' and spell.type == 'WeaponSkill' then
	--     equip(sets.precast.WS.SubtleBlow)
    -- end
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
	-- if state.AutogearbuffMode.value then
	-- 	if buffactive['Endark'] then
	-- 		state.HybridMode:set('DreadSP') 	
	-- 	elseif buff == "Endark" and not gain then
	-- 			add_to_chat(123, " off Amnesia")
	-- 		state.HybridMode:set('Normal') 
	-- 	end
	-- 	-- send_command('@wait 0.5;gs c update')
	-- end	
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
	    -- if not state.Buff['SJ Restriction'] and player.sub_job == 'DNC' and  player.tp > 500 and player.max_hp - player.hp > 1000 and abil_recasts[187] < latency then			
		-- 	windower.chat.input('/ja Curing Waltz II <me>')
		-- 	tickdelay = os.clock() + 1.1
		if not state.Buff['SJ Restriction'] and player.sub_job == 'WAR' and  not buffactive.Defender and abil_recasts[3] < latency and (player.in_combat or being_attacked) and player.hpp < 25 then
			windower.chat.input('/ja "Defender" <me>')
			tickdelay = os.clock() + 1.1
		elseif not state.Buff['SJ Restriction'] and (player.sub_job == 'SCH' or player.sub_job == 'RDM' or player.sub_job == 'pld' or player.sub_job == 'WHM')
		    and player.hpp < 25 and being_attacked and spell_recasts[4] < spell_latency then 
				windower.send_command('gs c smartcure')
			-- windower.chat.input('/ma "Cure IV" <me>')
			tickdelay = os.clock() + 1.1
		elseif not state.Buff['SJ Restriction'] and player.sub_job == 'NIN' and (player.in_combat or being_attacked) and player.hpp < 10 then
			state.AutoShadowMode:set('true')
			tickdelay = os.clock() + 1.1
		elseif player.inventory['Vile Elixir +1'] and being_attacked and player.hpp < 5 then
            send_command('input /item "Vile Elixir +1" <me>')
            tickdelay = os.clock() + 1.1
            return true
        elseif player.inventory['Vile Elixir'] and being_attacked and player.hpp < 6 then
            send_command('input /item "Vile Elixir" <me>')
            tickdelay = os.clock() + 1.1
            return true
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


-- Allow jobs to override this code
function user_self_command(commandArgs, eventArgs)


	if commandArgs[1]:lower() == 'abyssea' then
		send_command('@ept track "'..state.Abyssea.value..'"')
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
	-- if buffactive["Slow"] then
	-- 	meleeSet = set_combine(meleeSet,sets.buff.Slow)
	-- end
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



local debuff_items = {
    ['Paralysis'] = "Remedy",
    ['Blindness'] = "Remedy",
    ['Silence'] = "Echo Drops",
    ['Petrification'] = "Remedy",
    ['Poison'] = "Antidote",
    ['Doom'] = "Holy Water",
    ['Curse'] = "Holy Water",
    ['Plague'] = "Remedy",
    ['Disease'] = "Remedy",
    ['Amnesia'] = "Remedy",
    ['Sleep'] = "Remedy",
    ['Slow'] = "Remedy",
    ['Bind'] = "Remedy",
    ['Weight'] = "Remedy",
    ['Bio'] = "Remedy",
    ['Dia'] = "Remedy",
    ['STR Down'] = "Panacea",
    ['DEX Down'] = "Panacea",
    ['VIT Down'] = "Panacea",
    ['AGI Down'] = "Panacea",
    ['INT Down'] = "Panacea",
    ['MND Down'] = "Panacea",
    ['CHR Down'] = "Panacea",
    ['Max HP Down'] = "Panacea",
    ['Max MP Down'] = "Panacea",
    ['Max TP Down'] = "Panacea",
    ['Accuracy Down'] = "Panacea",
    ['Attack Down'] = "Panacea",
    ['Evasion Down'] = "Panacea",
    ['Defense Down'] = "Panacea",
    ['Magic Atk. Down'] = "Panacea",
    ['Magic Def. Down'] = "Panacea",
    ['Magic Acc. Down'] = "Panacea",
    ['Magic Evasion Down'] = "Panacea",
}


-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)
    -- add_to_chat(123, 'job_buff_change: '..buff..'  Gain: '..tostring(gain))

	-- local abil_recasts = windower.ffxi.get_ability_recasts()
	-- local spell_recasts = windower.ffxi.get_spell_recasts()

	-- if state.AutogearbuffMode.value then
	-- 	-- if buffactive['Endark'] then
	-- 	if buff == "Endark" then
	-- 		state.HybridMode:set('DreadSP') 	
	-- 	else
	-- 		state.HybridMode:set('Normal') 
	-- 	end
	-- 	-- send_command('@wait 0.5;gs c update')
	-- end

	-- if state.NeverDieMode.value or state.AutoCureMode.value then 
	-- 	if player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and player.tp > 200 and abil_recasts[215] < latency and (buffactive['poison'] or buffactive['slow'] or buffactive['Rasp'] 
	--     or buffactive['Dia'] or buffactive['Defense Down'] or buffactive['Magic Def. Down'] or buffactive['Max HP Down']
	--     or buffactive['Evasion Down'] or buffactive['Magic Evasion Down'] or buffactive['Bio'] or buffactive['Bind']
	--     or buffactive['weight'] or buffactive['Attack Down'] or buffactive['Accuracy Down'] or buffactive['VIT Down']
	--     or buffactive['INT Down'] or buffactive['MND Down'] or buffactive['STR Down'] or buffactive['AGI Down']) then		
	--         windower.chat.input('/ja Healing Waltz <me>')
	--         tickdelay = os.clock() + 1.1
	-- 		return
	-- 	end
	-- end

	-- -- Create a timer when we gain weakness.  Remove it when weakness is gone.
	-- if buff:lower() == 'weakness' then
	-- 		send_command('timers create "Weakness" 300 up abilities/00255.png')
	-- else
	-- 		send_command('timers delete "Weakness"')
		
	-- end

	-- if state.AutogearbuffMode.value then
	-- 	if buffactive['Sentinel\'s Scherzo'] then
	-- 		state.HybridMode:set('Normal') 
	-- 		send_command('@wait 0.5;gs c update')

	-- 	else
	-- 		state.HybridMode:set('DT') 
	-- 		send_command('@wait 0.5;gs c update')

	-- 	end
	-- end
	
	-- if state.AutogearbuffMode.value then
	-- 	if buffactive['amnesia'] then
	-- 		state.OffenseMode:set('CRIT') 
	-- 		send_command('@wait 0.5;gs c update')

	-- 	else
	-- 		state.OffenseMode:reset()  
	-- 		send_command('@wait 0.5;gs c update')

	-- 	end
	-- end
	
	-- if buff == "Endark" and not gain then
	-- 	add_to_chat(123, " off Amnesia")
	--     state.HybridMode:set('Normal') 
	-- end

	if state.NeverDieMode.value or state.AutoCureMode.value then 
		if buffactive['poison'] and world.area:contains('Sortie') and (player.sub_job == 'SCH' or player.sub_job == 'WHM') and spell_recasts[14] < spell_latency then 
			windower.chat.input('/ma "Poisona" <me>')
			tickdelay = os.clock() + 1.1
		end
	end


	-- if state.AutogearbuffMode.value and buff == "Slow" then
	-- 	if gain then
	-- 		-- إذا أخذت Slow، نغير القطع لتعويض السرعة
	-- 		equip(sets.buff.Slow)
	-- 		add_to_chat(123, "[GearSwap] Slow detected: Equipping haste gear!")
	-- 	end
	-- end

-- update code version 2.1.1 by Author:Aragan
--------------- for Amnesia debuff
	previous_hybrid_mode = previous_hybrid_mode or nil

    if state.AutogearbuffMode.value and buff == "Amnesia" then
		if gain then
            if not previous_hybrid_mode then
				previous_hybrid_mode = state.OffenseMode.value
			    -- add_to_chat(123, '[GS] Scherzo ON →  '..previous_hybrid_mode..'  Normal')
		    end
			state.OffenseMode:set('CRIT')-- SWITCH TO CRITICAL SET
			-- add_to_chat(123, '[GS] Scherzo ON → Normal')
		else
			if previous_hybrid_mode then
                state.OffenseMode:set(previous_hybrid_mode) -- back to previous mode value
                -- add_to_chat(122, "OffenseMode restored → "..previous_hybrid_mode)
                previous_hybrid_mode = nil -- نفرغ التخزين
            else
				state.OffenseMode:reset() -- if all previous of this buff false , then reset
                -- add_to_chat(122, "OffenseMode reset (no saved value)")
            end
        end
	end

-- update code version 2.1.1 by Author:Aragan
------------ for scherszo buff
	previous_hybrid_mode = previous_hybrid_mode or nil


	if state.AutogearbuffMode.value and buff == "Sentinel's Scherzo" then
		if gain then
			if not previous_hybrid_mode then
				previous_hybrid_mode = state.HybridMode.value
				-- add_to_chat(123, '[GS] Scherzo ON → حفظ '..previous_hybrid_mode..' وتغيير لـ Normal')
			end
			state.HybridMode:set('Normal') -- SWITCH TO Normal SET
			-- add_to_chat(123, '[GS] Scherzo ON → Normal')
		else
			if previous_hybrid_mode then
				state.HybridMode:set(previous_hybrid_mode) -- back to previous hybrid mode value
				-- add_to_chat(122, "HybridMode restored → "..previous_hybrid_mode)
				previous_hybrid_mode = nil -- نفرغ التخزين
			else
				state.HybridMode:set('DT') -- if all previous of this buff false , then reset set HybridMode to DT for safety
				-- add_to_chat(122, "HybridMode reset (no saved value)")
			end
		end
	end
	if state.AutoMedicineMode.value then
		if gain and debuff_items[buff] then
			-- استخدام الدواء المناسب
			windower.chat.input('/item "'..debuff_items[buff]..'" <me>')
		end
	
		if not midaction() then
			handle_equipping_gear(player.status)
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


	
-- function user_tick()
	--if check_arts() then return true end
	-- if user_state_change() then return true end
	-- if user_buff_change() then return true end
	-- if check_steps_subjob() then return true end
	-- if refine_waltz(spell, action, spellMap, eventArgs) then return true end
	-- if state.AutoAbsorttpaspirSpam.value and player.in_combat and player.target.type == "MONSTER" and not moving then
	-- 	if check_tp_mp_lower() then return true end
	-- 		tickdelay = os.clock() + 1.5
	-- 	return true
	-- end
	
-- 	return false
-- end
function user_zone_change(new_id,old_id)
	--tickdelay = os.clock() + 10	
	current_zone = windower.ffxi.get_info().zone
	notified_hippo = false
	if player.main_job == 'DRK' and data.areas.cities:contains(world.area)  then
	    send_command('gs c set DefenseMode Physical;gs c set PhysicalDefenseMode SEboost') --Turns addon on hide show off some no need in city on screen.
    end
	if data.areas.cities:contains(world.area)  then
		send_command('lua l invspace;lua l invtracker;lua l Clock;tr autodrop off;gs c set AutoCleanupMode false;lua u Skillchainer;asc hide;gs c set DefenseMode Physical;gs c set PhysicalDefenseMode hp') --Turns addon on hide show off some no need in city on screen.
	elseif player.main_job == 'DRK' and data.areas.cities:contains(world.area)  then
		send_command('wait 5;gs c set DefenseMode Physical;gs c set PhysicalDefenseMode SEboost') --Turns addon on hide show off some no need in city on screen.
	else
		send_command('lua u invspace;lua u invtracker;stats hide;lua U Clock;tr autodrop on;gs c set AutoCleanupMode true;gs c reset DefenseMode;gs c set IdleMode hp') --Turns addon off on show hide. stats=craftstats addon
	end

	if data.areas.laggy:contains(world.area)  then
		send_command('gs c set AutoDefenseMode true;gs c set AutoWSRestore true') --Turns mode on.
	else
		--send_command('gs c set AutoWSRestore false;') --Turns  off. -- 
	end

	if world.area:contains('Nyzul Isle') then
		send_command('NyzulHelper show;NyzulBuddy start;iSpy') --Turns addon on.
	else
		send_command('NyzulHelper hide;NyzulBuddy stop;') --Turns addon off. -- iSpy
	end
	-- if not world.area:contains('Abyssea - Empyreal Paradox') and world.area:contains('Abyssea') then
	-- 	send_command('input /lockstyleset 1;ept show;gs c set SkipProcWeapons false;get *"Forbidden Key" all;') --Turns addon on.

	-- else
	-- 	send_command('ept hide;') --Turns addon off.
	-- end
	
	if (world.area:contains('Sortie') or world.area:contains('Odyssey')) then
		send_command('AutoItem on') --Turns addon on.
	elseif world.area:contains('Sortie') then
		    if player.main_job == 'WHM' then
		        add_to_chat(123,' Melee strat: whm Boost-STR  Auspice  Aurorastorm  Regen IV AOE. A E BOSS DO Barpoison Barwatera C G BOSS DO Baramnesra Barparalyzra F BOSS Wind Hands: Use Asylum it start fight then cor wc and whm repeat')
		    -- elseif
		    end
	end
end


function user_sub_job_change(newSubjob, oldSubjob)	-- sub_job_change(new,old) -- style on auto with change sub job
	-- user_job_lockstyle()
	-- tickdelay = os.clock() + 6.5

	user_job_lockstyle:schedule(7)

end
-- function user_lockstyle()
--     if world.area:contains('Abyssea') then
--         windower.chat.input:schedule(5,'/lockstyleset 1')
--     end
-- end

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

        if target.name == "Dhartok" and not already_announced_by_name[target.name] then
			already_announced_by_name[target.name] = true

			-- windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
			windower.send_command('input /echo ['..target.name..'] HP ~1,620,000 MP:have EVA 1,581 M.DEF 100 INT: 363 MND: 338 /posion dangeros remove it fast /move nm from pos if black cloud up .')
		end
		if target.name == "Dhartok" or target.name == "Triboulex" or target.name == "Gartell" or target.name == "Ghatjot" or target.name == "Leshonn" or target.name == "Skomora" and not already_announced_by_name[target.name] then
			already_announced_by_name[target.name] = true

			-- windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
			-- windower.send_command('input /echo ['..target.name..'] HP ~1,620,000 MP:have EVA 1,581 M.DEF 100 INT: 363 MND: 338 /posion dangeros remove it fast /move nm from pos if black cloud up .')
			if player.main_job == 'WHM' then
				windower.send_command('input /echo Melee strat: WHM: Boost-STR  Auspice  Aurorastorm  Regen IV AOE. A E BOSS DO Barpoison Barwatera C G BOSS DO Baramnesra Barparalyzra')
				windower.send_command('@wait 0.2;input /echo F BOSS Wind Hands: Use Asylum it start fight then cor wc and whm repeat ')
					-- add_to_chat(122,'"Boost-STR  Auspice  Aurorastorm  Regen IV AOE.A E BOSS DO Barpoison Barwatera C G BOSS DO Baramnesra Barparalyzra F BOSS Wind Hands: Use Asylum it start fight then cor wc and whm repeat"')

			end
		end
        -- if (target.name == "Ironshell" or target.name == "Ghast") and not already_announced_by_name[target.name] then
		-- 	already_announced_by_name[target.name] = true

		-- 	windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
		-- 	windower.send_command('input /echo ['..target.name..'] RUN Thunder hand USE Tellus / Wind hand USE Gelus .. Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
		-- end
	end
end
already_announced_timers = false

-- windower.register_event('incoming text',function(org)     
-- 	if string.find(org, "Amun") then
-- 		windower.send_command('timers c "Amun Respawn" 600 down')
-- 		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
-- 		already_announced_timers = true
-- 	end
-- end)




res = require('resources')
packets = require('packets')
packets.raw_fields.incoming[0x009] = L{
    {ctype='unsigned int',      label='ID',},             -- 04
    {ctype='unsigned short',    label='Index',},          -- 08
    {ctype='unsigned short',    label='Message'},         -- 0A
    {ctype='unsigned char',     label='Attr'},            -- 0C
    {ctype='char*',             label='data'},            -- 0D
}

windower.register_event('incoming chunk', function(id, original, modified, injected, blocked)
    if not state.AutoDropItemsMode.value then return end

	if id ~= 0x009 or injected then return end
    local packet = packets.parse('incoming', original)
    if packet.Message ~= 180 then return end -- Item dropped
    local _, item_id_string, _, quantity_string = unpack(packet.data:split(' '))
    local item_data = res.items[tonumber(item_id_string)]
    local quantity = tonumber(quantity_string) or 1
    
    windower.add_to_chat(123, 'Detected that you dropped a "%s" x%d':format(item_data.en, quantity))
    
    windower.send_command('treasury drop add '..item_data.en)
end)






-- local res = require('resources')
-- require('chat')
-- local drop_items = S{
--     "beetle shell","beetle jaw","volte tights","volte tiara","volte boots",
--     "volte hose","volte bracers","volte moufles","volte brayettes",
--     "crepuscular cloak","fu's scale","kin's scale","kyou's scale","kei's scale","gin's scale"
-- }
-- local alerted_items = S{}

windower.raw_register_event('incoming text',function(org, original, modified)
	-- if not original then return end

    -- local text = tostring(original)  -- تأكد أن النص نص
    -- local player_name = windower.ffxi.get_player().name or "Unknown"
	-- item_name = item_name and item_name:strip_format()

    -- for item_name in drop_items:it() do
    --     -- إزالة a/the في النص لتسهيل المطابقة
    --     local pattern = "You find [aA] "..item_name
    --     if text:match(pattern) and not alerted_items:contains(item_name) then
    --         local msg = player_name.." >> "..item.." << ITS DROP LOT IT!"
    --         windower.send_command('input /echo '..msg)
    --         windower.send_command('input /t '..player_name..' '..msg)
            
    --         alerted_items:add(item_name)
    --         break
    --     end
    -- end
	
	-- if not state.AutoDropItemsMode.value then return end

	-- local item_name = original:match('You throw away a (.+)%.') or original:match('You toss (.+)%.')
	-- item_name = item_name and item_name:strip_format()
    -- if item_name then
    --     windower.send_command('treasury drop add '..item_name..'')
    --     windower.add_to_chat(207, '[Treasury] Added dropped item: ' .. item_name)
    -- end


    -- -- الكود الجديد لفحص إذا رميت شيء م
	-- if string.find(org, "AutoTargetAssist targeting: on")  then
	-- 	windower.send_command('input /echo ((Attack is ON.)) >> killer machine ready <<')  -- code add by (Aragan@Asura)
    --     -- windower.send_command('input /t '..player.name..' '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14> ' )
	-- end
	if state.Autojoinptmode.Value then
		if string.find(org, "invites you to her party") or string.find(org, "invites you to his party") then
			-- local sender = org:match("invites you to (.+) party")		
				windower.send_command('wait 1.2;input /join')
			-- add_to_chat(207, 'Auto-joined party from: ' .. sender)
			add_to_chat(207, 'Auto-joined party ')
		end
	end



	if state.DefenseDownMode.Value ~= 'None' then
		--abyssea stagger --red pros
		if string.find(org, "Armor Break") then
			-- windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
			send_command('gs c Weapons Normal;gs c cycle DefenseDownMode;')
		end
	end
	--beetle shell --beetle jaw
	-- if string.find(original, "You find a beetle shell") or string.find(org, "You find a volte tights") or string.find(org, "You find a volte tiara") 
	-- or string.find(org, "You find a volte boots") or string.find(org, "You find a volte hose") 
	-- or string.find(org, "You find a volte bracers") or string.find(org, "You find a crepuscular cloak") 
	-- or string.find(org, "You find a volte moufles") or string.find(org, "You find a volte brayettes")
	-- or string.find(org, "You find a fu's scale") or string.find(org, "You find a kin's scale")
	-- or string.find(org, "You find a kyou's scale") or string.find(org, "You find a kei's scale")
	-- or string.find(org, "You find a gin's scale") then
	-- 	local item_name = org:match("You find a (.+)")

	-- 	windower.send_command('input /echo '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14>!')  -- code add by (Aragan@Asura)
    --     windower.send_command('input /t '..player.name..' '..player.name..' >> '..item_name..' << ITS DROP LOT IT ! <call14> ' )
	-- end
	if string.find(org, "Hazhdiha") then
		windower.send_command('timers c "Hazhdiha Respawn" 900 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end
	if string.find(org, "Sisyphus") then
		windower.send_command('timers c "Sisyphus Respawn" 900 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end
	if string.find(org, "Fistule") then
		windower.send_command('timers c "Fistule Respawn" 1200 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end
	if string.find(org, "Lord Varney") then
		windower.send_command('timers c "Lord Varney Respawn" 900 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end

	if string.find(org, "Gukumatz ") then
		windower.send_command('timers c "Gukumatz  Respawn" 900 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end
	if string.find(org, "Jaculus") then
		windower.send_command('timers c "Jaculus  Respawn" 900 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
	end
	if string.find(org, "La Velue") then
		windower.send_command('timers c "La Velue  Respawn" 3600 down')
		-- windower.send_command('input /echo '..player.name..' >> '..item_name..' << Amun Respawn time start 10 min!')  -- code add by (Aragan@Asura)
		already_announced_timers = true
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

-- windower.register_event('chat message', function(message, sender, mode, gm)
--     -- نتحقق إذا الرسالة تحتوي على موت Amun
--     if message:contains("defeats the Amun") then
--         -- يرسل للـ plugin timers مؤقت 30 دقيقة
--         send_command('timers c "Amun Respawn" 1800 down')
--     end
-- end)

trust_activation_time = nil  -- تعريف المتغير في أعلى ملفك
last_auto_trust_mode = nil   -- لتتبع آخر قيمة

function check_trust()
    local current_time = os.clock()

    -- إذا تغيرت قيمة AutoTrustMode، نعيد ضبط المؤقت
    if last_auto_trust_mode ~= state.AutoTrustMode.value then
        trust_activation_time = current_time
        last_auto_trust_mode = state.AutoTrustMode.value
        return false  -- لا نفعل شيئًا هذه الدورة، ننتظر 10 ثواني
    end

    -- لا نكمل إلا بعد مرور 10 ثواني
    if not trust_activation_time or (current_time - trust_activation_time < 4) then
        return false
    end
		
	if not moving and state.AutoTrustMode.value ~= false and state.AutoTrustMode.value ~= 'Off' and state.AutoTrustMode.value ~= nil and not data.areas.cities:contains(world.area) and (buffactive['Reive Mark'] or buffactive['Elvorseal'] or not player.in_combat) then
		local party = windower.ffxi.get_party()
		local spell_recasts = windower.ffxi.get_spell_recasts()
        -- شرط خاص لـ Temenos: لا تستدعي إلا إذا p3 فاضية
        -- if world.area == 'Temenos' and party.p3 ~= nil then
	    if (world.area == 'Temenos' or world.area == 'Apollyon') and party.p3 == nil then

            return false
        end
		if party.p5 == nil then
		
			if state.AutoTrustMode.value == 'Auto' then

			    if spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
				    windower.chat.input('/ma "Ygnas" <me>')
				    tickdelay = os.clock() + 4.5
				    return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.chat.input('/ma "Joachim" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 4.5
					return true
				else
					return false
				end
			end
			if state.AutoTrustMode.value == 'Cleave' then
			    if spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
				    windower.chat.input('/ma "Ygnas" <me>')
				    tickdelay = os.clock() + 4.5
				    return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.chat.input('/ma "Joachim" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 4.5
					return true
				else
					return false
				end
			end
			
			if state.AutoTrustMode.value == 'DI' then
				if spell_recasts[1013] < spell_latency and not have_trust("Lilisette II") then
					windower.chat.input('/ma "Lilisette II" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
					windower.chat.input('/ma "Ygnas" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh\'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 4.5
					return true
				else
					return false
				end
			end
			if state.AutoTrustMode.value == 'corfarm' then

				if spell_recasts[999] < spell_latency and not have_trust("Monberaux") then
					windower.chat.input('/ma "Monberaux" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[989] < spell_latency and not have_trust("King of Hearts") then
					windower.chat.input('/ma "King of Hearts" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.chat.input('/ma "Joachim" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[935] < spell_latency and not have_trust("Star Sibyl") then
					windower.chat.input('/ma "Star Sibyl" <me>')
					tickdelay = os.clock() + 4.5
					return true
				else
					return false
				end
			end
			if state.AutoTrustMode.value == 'MLfarm' then
				if spell_recasts[999] < spell_latency and not have_trust("Monberaux") then
					windower.chat.input('/ma "Monberaux" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.chat.input('/ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.chat.input('/ma "Joachim" <me>')
					tickdelay = os.clock() + 4.5
					return true
				elseif spell_recasts[935] < spell_latency and not have_trust("Star Sibyl") then
					windower.chat.input('/ma "Star Sibyl" <me>')
					tickdelay = os.clock() + 4.5
					return true
				else
					return false
				end
	
		    end
		end
	end
	return false
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



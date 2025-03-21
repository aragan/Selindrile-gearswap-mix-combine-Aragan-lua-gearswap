-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
-- IMPORTANT: This include requires supporting include files:
-- from my web :
-- Mote-include
-- Mote-Mappings
-- Mote-Globals

-- DW/HASTE  work with addon gearinfo
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    include('Display.lua')
	-- Load and initialize the include file.
	include('Mote-Include.lua')
    include('organizer-lib')
end
organizer_items = {
    "Airmid's Gorget",
    "Tumult's Blood",
    "Sarama's Hide",
    "Hidhaegg's Scale",
    "Sovereign's Hide",
    "Grape Daifuku",
    "G. Curry Bun +1",
    "Pukatrice Egg",
    "Moogle Amp.",
    "Popo. con Queso",
    "Pear Crepe",
    "Crab Sushi",
    "Om. Sandwich",
    "Red Curry Bun",
    "Foreshock Sword",
    "Hepatizon Axe +1",
    "Sword Strap",
    "Mafic Cudgel",
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

-- Setup vars that are user-independent.
function job_setup()
    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')
    state.SrodaBelt = M(false, 'SrodaBelt')
    state.ShelteredRing = M(false,true)
    state.phalanxset = M(false,true)
    state.RP = M(false, "Reinforcement Points Mode")  
    state.CapacityMode = M(false, 'Capacity Point Mantle') 
    
    send_command('lua l PLD-HUD')
    include('Mote-TreasureHunter')
    state.TreasureMode:set('None')
    send_command('wait 2;input /lockstyleset 177')
    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
    "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring", "Cumulus Masque +1", "Nexus Cape", "Airmid's Gorget",}
    
    elemental_ws = S{"Flash Nova", "Sanguine Blade","Seraph Blade","Burning Blade","Red Lotus Blade"
    , "Shining Strike", "Aeolian Edge", "Gust Slash", "Cyclone","Energy Steal","Energy Drain"
    , "Leaden Salute", "Wildfire", "Hot Shot", "Flaming Arrow", "Trueflight", "Blade: Teki", "Blade: To"
    , "Blade: Chi", "Blade: Ei", "Blade: Yu", "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter"
    , "Primal Rend", "Dark Harvest", "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust"
    , "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki", "Rock Crusher", "Earth Crusher", "Starburst"
    , "Sunburst", "Omniscience", "Garland of Bliss"}
    rune_enchantments = S{'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda',
        'Lux','Tenebrae'}

    -- /BLU Spell Maps
    blue_magic_maps = {}

    blue_magic_maps.Enmity = S{'Blank Gaze', 'Geist Wall', 'Jettatura', 'Soporific',
        'Poison Breath', 'Blitzstrahl', 'Sheep Song', 'Chaotic Eye'}
    blue_magic_maps.Cure = S{'Wild Carrot'}
    blue_magic_maps.Buffs = S{'Cocoon', 'Refueling'}
    absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-MaxAcc', 'Absorb-TP'}

    rayke_duration = 35
    gambit_duration = 96
    -- Table of entries
    rune_timers = T{}
    -- entry = rune, index, expires
    
    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.ShieldMode = M{['description']='Shield Mode', 'Normal','Ochain','Duban', 'Srivatsa', 'Aegis', 'Priwen'} -- , 'Priwen' }
    state.HippoMode = M(false, "hippoMode")
    --state.TartarusMode = M{['description']='Tartarus Mode', 'normal', 'Tartarus'}
    --areas.AdoulinCity = S{'Eastern Adoulin','Western Adoulin','Mog Garden','Celennia Memorial Library'}
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Hybrid', 'TP', 'Acc', 'STP', 'CRIT')
	--state.DefenseMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'PDL', 'None')
    state.CastingMode:options( 'MB', 'Normal', 'DT','ConserveMP') 
    state.IdleMode:options('Normal', 'EnemyCritRate', 'PD', 'PDH', 'MEVA','Evasion', 'ReverenceGauntlets', 'Refresh', 'Resist', 'EnemyTPaccumulation')
    --state.RestingModes:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PD', 'PDH', 'Convert', 'Block', 'HPBOOST', 'Enmity' ,'Enmitymax')
    state.MagicalDefenseMode:options('MDT', 'Turtle', 'Evasion', 'ResistCharm', 'Aminion')
    state.HybridMode:options('Normal', 'PDT', 'MDT', 'Turtle', 'ReverenceGauntlets')
    state.WeaponSet = M{['description']='Weapon Set', 'Normal', 'Burtgang', 'MalignanceSword', 'Naegling', 'Reikiko','Malevolence', 'Caladbolg', 'MalignancePole'}
    swordList = S{"Naegling", "Sangarius +1", "Reikiko", "Perun +1", "Tanmogayi", "Loxotic Mace +1", "Ternion Dagger +1", "Zantetsuken"}


        --use //listbinds    .. to show command keys
    -- Additional local binds

    --state.BreathDefenseModes:options('Turtle')
    --state.HybridDefenseMode:options('PDT', 'MDT', 'Reraise')
    --state.HybridDefenseMode=('none')
    --state.BreathDefenseModes:options'Turtle'
    --send_command('bind ^f11 gs c cycle MagicalDefenseModes')
 	--send_command('bind ^= gs c activate MDT')
    send_command('wait 6;input /lockstyleset 177')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind @s gs c toggle SrodaBelt')
    send_command('bind f5 gs c cycle WeaponskillMode')
    send_command('bind !f11 gs c cycle MagicalDefenseMode')
    send_command('bind !w gs c toggle WeaponLock')
    send_command('bind f6 gs c cycle WeaponSet')
    send_command('bind !f6 gs c cycleback WeaponSet')
	send_command('bind f7 gs c cycle ShieldMode')
    send_command('bind !f7 gs c cycleback ShieldMode')
    --send_command('bind !t gs c cycle TartarusMode')
    send_command('bind f4 gs c cycle Runes')
    send_command('bind f3 gs c cycleback Runes')
    send_command('bind f2 input //gs c rune')
    send_command('bind delete gs c toggle ShelteredRing')
    send_command('bind ^p gs c toggle phalanxset')
    send_command('bind @c gs c toggle CapacityMode')
    send_command('bind @x gs c toggle RP')  
     -- ctrl+/ gs disable all
    send_command('bind ^/ gs disable all')
     --Alt+; disable head body hands legs feet rring ammo
    send_command('bind ^; gs disable head body hands legs feet rring ammo')
     --Alt+/ enable all
    send_command('bind !/ gs enable all')

    state.Runes = M{['description']='Runes', 'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda', 'Lux', 'Tenebrae'}
    state.Auto_Kite = M(false, 'Auto_Kite')

    if init_job_states then init_job_states({"WeaponLock","MagicBurst","HippoMode","SrodaBelt"},{"IdleMode","ShieldMode","WeaponSet","OffenseMode","WeaponskillMode","CastingMode","Runes","TreasureMode"}) 
    end
    -- 'Out of Range' distance; WS will auto-cancel
    range_mult = {
        [0] = 0,
        [2] = 1.70,
        [3] = 1.490909,
        [4] = 1.44,
        [5] = 1.377778,
        [6] = 1.30,
        [7] = 1.20,
        [8] = 1.30,
        [9] = 1.377778,
        [10] = 1.45,
        [11] = 1.490909,
        [12] = 1.70,
    }
    state.AutoEquipBurst = M(true)
    state.Moving  = M(false, "moving")

    Haste = 0
    DW_needed = 0
    DW = false
    moving = false

    determine_haste_group()
    select_default_macro_book()
    update_combat_form()
end


function init_gear_sets()

    ---- WeaponSet ----

    sets.Normal = {}
    sets.Burtgang = {main="Burtgang", sub="Zantetsuken"}
    sets.MalignanceSword = {main="Malignance Sword", sub="Zantetsuken"}
    sets.Naegling = {main="Naegling", sub="Zantetsuken"}
    sets.Reikiko = {main="Reikiko", sub="Zantetsuken"}
    sets.Caladbolg = {main="Caladbolg", sub="Utu Grip",}
    sets.MalignancePole = {main="Malignance Pole", sub="Utu Grip",}
    sets.Malevolence = {main="Malevolence", sub="Malevolence",}


     -- neck JSE Necks Reinf
 sets.RP = {}
 -- Capacity Points Mode
 sets.CapacityMantle = {}


  -- Precast sets to enhance JAs
   sets.precast.JA['Invincible'] = set_combine(sets.precast.JA['Provoke'], {legs="Cab. Breeches +3"})
   sets.precast.JA['Holy Circle'] = set_combine(sets.precast.JA['Provoke'], {feet="Rev. Leggings +3"})
   sets.precast.JA['Shield Bash'] = set_combine(sets.precast.JA['Provoke'], {sub="Aegis", hands="Cab. Gauntlets +2", left_ear="Knightly Earring"})
   sets.precast.JA['Intervene'] = sets.precast.JA['Shield Bash']
   sets.precast.JA['Sentinel'] = set_combine(sets.precast.JA['Provoke'], {feet="Cab. Leggings +3"})   
   --The amount of damage absorbed is variable, determined by VIT*2
   sets.precast.JA['Rampart'] = {
   head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},}
   sets.buff['Rampart'] = sets.precast.JA['Rampart']
   sets.precast.JA['Fealty'] = set_combine(sets.precast.JA['Provoke'], {body="Cab. Surcoat +1",})
   sets.precast.JA['Divine Emblem'] = set_combine(sets.precast.JA['Provoke'], {feet="Chev. Sabatons +3"})
   --15 + min(max(floor((user VIT + user MND - target VIT*2)/4),0),15)
   sets.precast.JA['Cover'] = set_combine(sets.precast.JA['Rampart'], {head="Rev. Coronet +2", body="Cab. Surcoat +1"})
   sets.buff['Cover'] = sets.precast.JA['Cover']
   -- add MND for Chivalry
   sets.precast.JA['Chivalry'] = set_combine(sets.defense.HPBOOST, {
       hands={ name="Cab. Gauntlets +1", augments={'Enhances "Chivalry" effect',}},
   })

   --enmity +152 
sets.precast.JA['Provoke'] = {   
   head={ name="Loess Barbuta +1", augments={'Path: A',}},
   body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet="Eschite Greaves",
   neck={ name="Unmoving Collar +1", augments={'Path: A',}},
   waist="Creed Baudrier",
   left_ear="Trux Earring",
   right_ear="Cryptic Earring",
   left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
   right_ring="Apeile Ring",   
   back="Rudianos's Mantle",
}

--enmity +152
sets.Enmity = {
ammo="Iron Gobbet",   
main="Burtgang",
head={ name="Loess Barbuta +1", augments={'Path: A',}},
body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
feet="Eschite Greaves",
neck="Moonlight Necklace",
waist="Creed Baudrier",
left_ear="Trux Earring",
right_ear="Cryptic Earring",
left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
right_ring="Apeile Ring",   
back="Rudianos's Mantle",
}

   sets.precast.JA['Warcry'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Defender'] = sets.precast.JA['Provoke']
   ------------------------ Sub DNC ------------------------ 
   -- Waltz set (chr and vit)
   sets.precast.Waltz = {}
   -- Special gear for Healing Waltz.
   sets.precast.Waltz['Healing Waltz'] = sets.precast.Waltz
   sets.precast.Step = sets.precast.JA['Provoke']
   sets.precast.Flourish1 = sets.precast.Step
   ------------------------ Sub RUN ------------------------ 
   sets.precast.JA['Ignis'] = sets.precast.JA['Provoke']   
   sets.precast.JA['Gelus'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Flabra'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Tellus'] = sets.precast.JA['Provoke']  
   sets.precast.JA['Sulpor'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Unda'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Lux'] = sets.precast.JA['Provoke']     
   sets.precast.JA['Tenebrae'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Vallation'] = sets.precast.JA['Provoke'] 
   sets.precast.JA['Pflug'] = sets.precast.JA['Provoke'] 
   -- Fast cast sets for spells   2844HP FC+80/80
 sets.precast.FC = {   
   ammo="Sapience Orb",
   head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
   body="Rev. Surcoat +3",
   hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
   legs="Enif Cosciales",
   feet="Chev. Sabatons +3",
   neck="Orunmila's Torque",
   waist="Plat. Mog. Belt",
   left_ear="Etiolation Earring",
   right_ear="Loquac. Earring",
   left_ring="Rahab Ring",
   right_ring="Kishar Ring",
   back="Moonlight Cape",
}
 sets.precast.FC.DT = set_combine(sets.precast.FC, {})
 sets.precast.FC.Phalanx = set_combine(sets.precast.FC, {waist="Siegel Sash",})
 sets.precast.FC.Enlight = sets.precast.FC
 sets.precast.FC['Enlight II'] = sets.precast.FC
 sets.precast.FC.Protect = sets.precast.FC
 sets.precast.FC.Shell = sets.precast.FC
 sets.precast.FC.Crusade = sets.precast.FC

 sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    waist="Siegel Sash",
})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
waist="Siegel Sash",
})

 sets.precast.FC.Cure = set_combine(sets.precast.FC,{
   right_ear="Mendi. Earring",
   left_ring="Moonlight Ring",
   waist="Acerbic Sash +1",
})
sets.precast.FC.Cure.DT = set_combine(sets.precast.FC,{
   right_ear="Mendi. Earring",
   left_ring="Moonlight Ring",
   waist="Acerbic Sash +1",
})
sets.precast.FC.Jettatura = set_combine(sets.Enmity,{
})

sets.precast.RA = {ammo=empty,
head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
left_ear="Crep. Earring",
right_ear="Telos Earring",
}

   -- Weaponskill sets
   -- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {   
   ammo="Oshasha's Treatise",
head="Nyame Helm",
body="Nyame Mail",
body="Nyame Mail",
legs="Nyame Flanchard",
feet="Nyame Sollerets",
neck="Rep. Plat. Medal",
waist={ name="Sailfi Belt +1", augments={'Path: A',}},
right_ear="Thrud Earring",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ring="Regal Ring",
right_ring="Cornelia's Ring",
}
sets.precast.WS.PDL = set_combine(sets.precast.WS, {
   ammo="Crepuscular Pebble",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   left_ring="Sroda Ring", 
})
sets.precast.WS.None = {}

   -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

   --Stat Modifier:     73~85% MND  fTP:    1.0
sets.precast.WS['Requiescat'] = {
ammo="Aurgelmir Orb +1",
head="Hjarrandi Helm",
body={ name="Sakpata's Plate", augments={'Path: A',}},
hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
feet={ name="Sakpata's Leggings", augments={'Path: A',}},
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Cessance Earring",
left_ring="Petrov Ring",
right_ring="Regal Ring",
back="Annealed Mantle",
}
sets.precast.WS['Requiescat'].PDL = set_combine(sets.precast.WS['Requiescat'], {
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
})
sets.precast.WS['Requiescat'].None = {}

   --Stat Modifier: 50%MND / 50%STR fTP: 1000:4.0 2000:10.25 3000:13.75
sets.precast.WS['Savage Blade'] = {
   ammo="Oshasha's Treatise",
head="Nyame Helm",
body="Nyame Mail",
hands="Nyame Gauntlets",
legs="Nyame Flanchard",
feet="Nyame Sollerets",
neck="Rep. Plat. Medal",
waist={ name="Sailfi Belt +1", augments={'Path: A',}},
right_ear="Thrud Earring",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ring="Sroda Ring", 
right_ring="Cornelia's Ring",
back="Annealed Mantle",
}
sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
   ammo="Crepuscular Pebble",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   left_ring="Sroda Ring", 
})
sets.precast.WS['Savage Blade'].None = {}

  --Stat Modifier:  80%DEX  fTP:2.25
  sets.precast.WS['Chant du Cygne'] = {	
   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
   head={ name="Blistering Sallet +1", augments={'Path: A',}},
   body="Hjarrandi Breast.",
   hands="Flam. Manopolas +2",
   legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
   feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
   neck="Fotia Gorget",
   waist="Fotia Belt",
   left_ear="Mache Earring +1",
   right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
   left_ring="Regal Ring",
   right_ring="Hetairoi Ring",
   back="Annealed Mantle",
}
sets.precast.WS['Chant du Cygne'].PDL = set_combine(sets.precast.WS['Chant du Cygne'], {
   ammo="Crepuscular Pebble",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
})
sets.precast.WS['Chant du Cygne'].None = {}

   --Stat Modifier: WS damage + 30/31%   2211DMG maxaggro
   sets.precast.WS['Atonement'] = {
   ammo="Paeapua",
   head={ name="Loess Barbuta +1", augments={'Path: A',}},
   body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   neck="Moonlight Necklace",
   waist="Fotia Belt",
   left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
   right_ear="Cryptic Earring",
   left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
   right_ring="Apeile Ring",
   back="Rudianos's Mantle",
}
sets.precast.WS['Atonement'].None = {}

sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {})
sets.precast.WS['Impulse Drive'].PDL = set_combine(sets.precast.WS['Impulse Drive'], {    
   ammo="Crepuscular Pebble",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   left_ring="Sroda Ring", 
})
sets.precast.WS['Impulse Drive'].None = {}

sets.precast.WS["Realmrazer"] = set_combine(sets.precast.WS["Requiescat"], {})
sets.precast.WS["Realmrazer"].PDL = set_combine(sets.precast.WS["Requiescat"].PDL, {})
sets.precast.WS["True Strike"] = set_combine(sets.precast.WS["Chant du Cygne"], {})
sets.precast.WS["True Strike"].PDL = set_combine(sets.precast.WS["Chant du Cygne"], {})
sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS["Requiescat"], {
   ammo="Oshasha's Treatise",
   head="Nyame Helm",
   body="Nyame Mail",
   hands="Nyame Gauntlets",
   legs="Nyame Flanchard",
   feet="Nyame Sollerets",
   neck="Fotia Gorget",
   waist="Fotia Belt",
   left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
   right_ear="Brutal Earring",
   left_ring="Rufescent Ring",
   right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
   back="Annealed Mantle",
})
sets.precast.WS['Shattersoul'].PDL = set_combine(sets.precast.WS["Requiescat"].PDL, {
   ammo="Crepuscular Pebble",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   left_ring="Sroda Ring", 
})
sets.precast.WS['Resolution'] = set_combine(sets.precast.WS['Requiescat'], {})
sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Requiescat'].PDL, {})

-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    legs="Nyame Flanchard",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring="Cornelia's Ring",
    back="Argocham. Mantle",
    })

    sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

    sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back="Argocham. Mantle",
    })
    sets.precast.WS["Red Lotus Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Shining Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Cyclone"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Gust Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Shining Strike"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Seraph Strike"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Flash Nova"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Thunder Thrust"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Raiden Thrust"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Frostbite"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Freezebite"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Earth Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Rock Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Starburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Sunburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Flaming Arrow"] = set_combine(sets.precast.WS["Burning Blade"],{})

   ------------------------------------------------------------------------------------------------
   -----------------------------------------Midcast sets-------------------------------------------
   ------------------------------------------------------------------------------------------------
   sets.midcast.FastRecast = sets.SIRD

   sets.ConserveMP={
    ammo="Pemphredo Tathlum",
    legs={ name="Augury Cuisses +1", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    left_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}
   -- Divine Skill 590/594 142 Acc
   sets.midcast.Divine = {
       head="Jumalik Helm",
       body="Rev. Surcoat +3",
       hands="Eschite Gauntlets",
       neck="Incanter's Torque",
       waist="Asklepian Belt",
       left_ring="Stikini Ring +1",
       right_ring="Stikini Ring +1",
}
   sets.midcast.Divine.DT = set_combine(sets.SIRD, {
       head="Jumalik Helm",
       body="Rev. Surcoat +3",
       hands="Eschite Gauntlets",
       neck="Incanter's Torque",
       waist="Asklepian Belt",
       left_ring="Stikini Ring +1",
       right_ring="Stikini Ring +1",
   })
 --skill 401/402
 sets.midcast['Enhancing Magic'] ={    
   ammo="Staunch Tathlum +1",
   head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
   body="Shab. Cuirass +1",
   hands="Regal Gauntlets",
   legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   neck="Enhancing Torque",
   waist="Olympus Sash",
   left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ear="Andoaa Earring",
   left_ring="Stikini Ring +1",
   right_ring="Stikini Ring +1",
   back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
}
   sets.midcast['Enhancing Magic'].DT = set_combine(sets.SIRD, {    
   right_ear="Andoaa Earring",
   right_ring="Stikini Ring +1",
})
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
	legs="Haven Hose",
	left_ear="Earthcry Earring",
	waist="Siegel Sash",
    neck="Stone Gorget",
})
sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash",})
sets.midcast.Refresh.DT = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash",})
 sets.midcast.MAB = {
    ammo="Pemphredo Tathlum",
    head="Jumalik Helm",
       body="Nyame Mail",
       hands="Nyame Gauntlets",
       legs="Nyame Flanchard",
       feet="Nyame Sollerets",
       neck="Baetyl Pendant",
       waist="Skrymir Cord",
       left_ear="Hecate's Earring",
       right_ear="Friomisi Earring",
       left_ring="Stikini Ring +1",
       right_ring="Stikini Ring +1",
       back="Argocham. Mantle",
   }
   sets.midcast.MAB.MB = {
    ammo="Pemphredo Tathlum",
    head="Jumalik Helm",
       body="Sacro Breastplate",
       hands={ name="Nyame Gauntlets", augments={'Path: B',}},
       legs={ name="Augury Cuisses +1", augments={'Path: A',}},
       feet="Nyame Sollerets",
       neck={ name="Warder's Charm +1", augments={'Path: A',}},
       waist="Skrymir Cord",
       left_ear="Hecate's Earring",
       right_ear="Friomisi Earring",
       left_ring="Locus Ring",
       right_ring="Mujin Band",
       back="Argocham. Mantle",
   }
   sets.magic_burst = {
       ammo="Pemphredo Tathlum",
       head="Jumalik Helm",
       body="Nyame Mail",
       hands="Nyame Gauntlets",
       legs="Nyame Flanchard",
       feet="Nyame Sollerets",
       neck={ name="Warder's Charm +1", augments={'Path: A',}},
       waist="Skrymir Cord",
       left_ear="Hecate's Earring",
       right_ear="Friomisi Earring",
       left_ring="Locus Ring",
       right_ring="Mujin Band",
       back="Argocham. Mantle",
   }

   sets.midcast['Elemental Magic'] = {
       ammo="Pemphredo Tathlum",
       body={ name="Cohort Cloak +1", augments={'Path: A',}},
       hands="Nyame Gauntlets",
       legs="Nyame Flanchard",
       feet="Nyame Sollerets",
       neck="Sibyl Scarf",
       waist="Eschan Stone",
       left_ear="Hecate's Earring",
       right_ear="Friomisi Earring",
       left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
       right_ring="Stikini Ring +1",
       back="Argocham. Mantle",}

       sets.midcast['Elemental Magic'].MB = {
           ammo="Pemphredo Tathlum",
           head="Nyame Helm",
           body="Nyame Mail",
           hands="Nyame Gauntlets",
           legs="Nyame Flanchard",
           feet="Nyame Sollerets",
           neck={ name="Warder's Charm +1", augments={'Path: A',}},
           waist="Eschan Stone",
           left_ear="Hecate's Earring",
           right_ear="Friomisi Earring",
           left_ring="Locus Ring",
           right_ring="Mujin Band",
           back="Argocham. Mantle",
       }
   sets.midcast.Flash = sets.Enmity
   sets.midcast.Flash.DT = sets.Enmity
   sets.midcast.Enlight = sets.midcast.Divine --+95 accu
   sets.midcast['Enlight II'] = sets.midcast.Divine --+142 accu (+2 acc each 20 divine skill)
   --Max HP+ set for reprisal 3951HP / war so 7902+ damage reflect before it off (8k+ with food)
   sets.midcast.Reprisal =	{
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body="Shab. Cuirass +1",
   hands="Regal Gauntlets",
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   neck={ name="Unmoving Collar +1", augments={'Path: A',}},
   waist="Plat. Mog. Belt",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Moonlight Ring",
   back="Moonlight Cape",
}
   --Phalanx skill 386/386 = 31/31  + phalanx + 30/31 total 61/62
   sets.midcast.Phalanx = {
       main="Sakpata's Sword",
       sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
       ammo="Staunch Tathlum +1",
       head={ name="Odyssean Helm", augments={'INT+5','"Cure" potency +8%','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
       body="Odyss. Chestplate",
       hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
       feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       neck="Incanter's Torque",
       waist="Olympus Sash",
       left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
       right_ear="Andoaa Earring",
       left_ring="Stikini Ring +1",
       right_ring="Defending Ring",
       back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
   } 
   sets.midcast.Phalanx.DT = {
       main="Sakpata's Sword",
       ammo="Staunch Tathlum +1",
       head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       body="Chev. Cuirass +3",
       hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
       feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
       neck="Moonlight Necklace",
       waist="Audumbla Sash",
       left_ear="Knightly Earring",
       right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
       left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
       right_ring="Moonlight Ring",
       back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
}
  sets.midcast.Phalanx.MB = set_combine(sets.midcast.Phalanx, {
   main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
   sub={ name="Ajax +1", augments={'Path: A',}},
   body="Shab. Cuirass +1",
   hands="Regal Gauntlets",
 })
 
   sets.midcast.Banish = sets.midcast.MAB
   sets.midcast['Banish II'] = set_combine(sets.midcast.MAB, {})
   sets.midcast.Holy = sets.midcast.MAB
   sets.midcast['Holy II'] = sets.midcast.MAB
   sets.midcast.Crusade = {
       main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
       sub={ name="Ajax +1", augments={'Path: A',}},
       head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
       body="Shab. Cuirass +1",
       hands="Regal Gauntlets",
       legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
       feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       neck="Enhancing Torque",
       waist="Olympus Sash",
       right_ear="Andoaa Earring",
       right_ring="Stikini Ring +1",
       back="Moonlight Cape",
}
sets.midcast.Cocoon = {  
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
sets.midcast.Cocoon.DT = sets.midcast.Cocoon

-- Cure1=120; Cure2=266; Cure3=600; Cure4=1123; cure potency caps at 50/50% received caps at 32/30%. sans signet 
   sets.midcast.Cure = {
       ammo="Staunch Tathlum +1",
       head={ name="Loess Barbuta +1", augments={'Path: A',}},
       body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       hands="Macabre Gaunt. +1",
       legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
       neck="Sacro Gorget",
       waist="Plat. Mog. Belt",
       left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
       right_ear="Chev. Earring +1",
       left_ring="Moonlight Ring",
       right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
       back="Solemnity Cape",
}
   sets.midcast.Cure.DT = set_combine(sets.SIRD, {
       hands="Macabre Gaunt. +1",
       left_ear="Mendi. Earring",
       right_ear="Chev. Earring +1",
   })
   sets.midcast.Cure.MB = set_combine(sets.midcast.Cure, {
       ammo="Pemphredo Tathlum",
       hands="Macabre Gaunt. +1",
       neck="Reti Pendant",
       waist="Austerity Belt +1",
       left_ear="Mendi. Earring",
       right_ear="Chev. Earring +1",
       back="Solemnity Cape",
   })
-- 630 HP (curecheat)
 sets.self_healing = {      
       ammo="Staunch Tathlum +1",
       head={ name="Loess Barbuta +1", augments={'Path: A',}},
       body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       hands="Macabre Gaunt. +1",
       legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
       neck="Sacro Gorget",
       waist="Plat. Mog. Belt",
       left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
       right_ear="Chev. Earring +1",
       left_ring="Moonlight Ring",
       right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
       back="Solemnity Cape",
}
 sets.self_healing.DT = set_combine(sets.SIRD, {
       hands="Macabre Gaunt. +1",
       right_ear="Chev. Earring +1",
   })
   sets.self_healing.MB = set_combine(sets.midcast.Cure, {
       ammo="Pemphredo Tathlum",
       hands="Macabre Gaunt. +1",
       neck="Reti Pendant",
       waist="Austerity Belt +1",
       left_ear="Mendi. Earring",
       right_ear="Chev. Earring +1",
       back="Solemnity Cape",
   })
   sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
 sub="Srivatsa",
 head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
 legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
 neck="Incanter's Torque",
 waist="Olympus Sash",
 ring2="Sheltered Ring",
 right_ear="Andoaa Earring",
})
   sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'] , {
  head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
 legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
 neck="Incanter's Torque",
 waist="Olympus Sash",
 right_ear="Andoaa Earring",
 ring2="Sheltered Ring",

})
 sets.midcast.Raise = {       
ammo="Staunch Tathlum +1",
head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
body={ name="Sakpata's Plate", augments={'Path: A',}},
hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
neck="Moonlight Necklace",
waist="Audumbla Sash",
left_ear="Tuisto Earring",
right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
right_ring="Defending Ring",
back="Rudianos's Mantle",
}	
sets.midcast.Raise.DT = {       
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
   }	
   sets.midcast.Stun = sets.midcast.Flash
   sets.SrodaBelt = {waist="Sroda Belt"}

 --Spell interupt down (pro shell raise)104/102
 sets.SIRD = {   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",}
---------- NIN Spell	--------------
 sets.midcast.Utsusemi = {      
ammo="Staunch Tathlum +1",
head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
body={ name="Sakpata's Plate", augments={'Path: A',}},
hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
neck="Moonlight Necklace",
waist="Audumbla Sash",
left_ear="Tuisto Earring",
right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
right_ring="Defending Ring",
back="Moonlight Cape",
}
sets.midcast.Absorb = {
    ammo="Pemphredo Tathlum",
    neck="Erra Pendant",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Kishar Ring",
}
---------- BLU Spell	--------------
   sets.midcast['Geist Wall'] ={    
       ammo="Iron Gobbet",   
       main="Burtgang",
     head={ name="Loess Barbuta +1", augments={'Path: A',}},
     body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     feet="Eschite Greaves",
     neck="Moonlight Necklace",
     waist="Creed Baudrier",
     left_ear="Trux Earring",
     right_ear="Cryptic Earring",
     left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
     right_ring="Apeile Ring",   
     back="Rudianos's Mantle",}

sets.midcast['Geist Wall'].DT ={    
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",}

   sets.midcast['Jettatura'] ={    
       ammo="Iron Gobbet",   
       main="Burtgang",
     head={ name="Loess Barbuta +1", augments={'Path: A',}},
     body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     feet="Eschite Greaves",
     neck="Moonlight Necklace",
     waist="Creed Baudrier",
     left_ear="Trux Earring",
     right_ear="Cryptic Earring",
     left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
     right_ring="Apeile Ring",   
     back="Rudianos's Mantle",}

sets.midcast['Jettatura'].DT ={    
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",}

   sets.midcast['Sheep Song'] = {   
   ammo="Pemphredo Tathlum",
   head="Chev. Armet +3",
   body="Chev. Cuirass +3",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet="Chev. Sabatons +3",
   neck="Erra Pendant",
   waist="Luminary Sash",
   left_ear="Crep. Earring",
   right_ear="Digni. Earring",
   left_ring="Stikini Ring +1",
   right_ring="Stikini Ring +1",
   back="Rudianos's Mantle",
}

sets.midcast['Sheep Song'].DT = {   
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}
 sets.midcast.Soporific = {   
       ammo="Iron Gobbet",   
       main="Burtgang",
     head={ name="Loess Barbuta +1", augments={'Path: A',}},
     body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     feet="Eschite Greaves",
     neck="Moonlight Necklace",
     waist="Creed Baudrier",
     left_ear="Trux Earring",
     right_ear="Cryptic Earring",
     left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
     right_ring="Apeile Ring",   
     back="Rudianos's Mantle",
}
sets.midcast.Soporific.DT = {   
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}
 sets.midcast['Stinking Gas'] = {   
       ammo="Iron Gobbet",   
       main="Burtgang",
     head={ name="Loess Barbuta +1", augments={'Path: A',}},
     body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     feet="Eschite Greaves",
     neck="Moonlight Necklace",
     waist="Creed Baudrier",
     left_ear="Trux Earring",
     right_ear="Cryptic Earring",
     left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
     right_ring="Apeile Ring",   
     back="Rudianos's Mantle",
}    
sets.midcast['Stinking Gas'].DT = {   
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}    
 sets.midcast['Bomb Toss'] = {   
       ammo="Iron Gobbet",   
       main="Burtgang",
     head={ name="Loess Barbuta +1", augments={'Path: A',}},
     body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
     feet="Eschite Greaves",
     neck="Moonlight Necklace",
     waist="Creed Baudrier",
     left_ear="Trux Earring",
     right_ear="Cryptic Earring",
     left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
     right_ring="Apeile Ring",   
     back="Rudianos's Mantle",
}
sets.midcast['Bomb Toss'].DT = {   
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}

sets.midcast['Frightful Roar'] = {
   ammo="Staunch Tathlum +1",
   head="Chev. Armet +3",
   body="Chev. Cuirass +3",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet="Chev. Sabatons +3",
   neck="Erra Pendant",
   waist="Luminary Sash",
   left_ear="Crep. Earring",
   right_ear="Digni. Earring",
   left_ring="Stikini Ring +1",
   right_ring="Stikini Ring +1",
}
sets.midcast['Frightful Roar'].DT = {  
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}	
sets.TreasureHunter = { 
   ammo="Per. Lucky Egg",
   head="White rarab cap +1", 
   waist="Chaac Belt",
}
   --------------------------------------
   -- Idle/resting/defense/etc sets
   --------------------------------------
 sets.Cover = set_combine(sets.precast.JA['Rampart'], { head="Rev. Coronet +2", body="Cab. Surcoat +1"})
   sets.Doom = {neck="Nicander's Necklace",
   left_ring="Eshmun's Ring",
   right_ring="Blenmot's Ring +1", 
   waist="Gishdubar Sash",
   legs="Shabti Cuisses +1",
} -- +65%
 sets.Reraise = {head="Crepuscular Helm", body="Crepuscular Mail",}
 sets.buff.Sleep = {neck={ name="Vim Torque +1", augments={'Path: A',}},left_ear="Infused Earring",}
 sets.Breath = sets.defense.MDT
  
   sets.resting = {
       ammo="Homiliary",
       head="Jumalik Helm",
       body="Jumalik Mail",
       hands="Regal Gauntlets",
       legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       neck={ name="Bathy Choker +1", augments={'Path: A',}},
       waist="Fucho-no-Obi",
       left_ear="Infused Earring",
       right_ear="Cryptic Earring",
       left_ring="Stikini Ring +1",
       right_ring="Stikini Ring +1",
       back="Moonlight Cape",
   }
    
   -- Idle sets
   sets.idle =  { 
    main="Burtgang",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Chev. Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Chev. Earring +1",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Rudianos's Mantle",
   }
   sets.idle.Field = sets.idle

   sets.idle.EnemyCritRate ={
       ammo="Eluder's Sachet",
       left_ring="Warden's Ring",
       right_ring="Fortified Ring",
       back="Reiki Cloak",
}
   sets.idle.ReverenceGauntlets ={
       hands="Rev. Gauntlets +3",
}
   sets.idle.Refresh ={
       ammo="Homiliary",
       head="Jumalik Helm",
       body="Jumalik Mail",
       hands="Regal Gauntlets",
       left_ring="Stikini Ring +1",
       right_ring="Stikini Ring +1",
}
   sets.idle.Resist ={
    ammo="Staunch Tathlum +1",
    head={ name="Founder's Corona", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Magic dmg. taken -5%',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands="Macabre Gaunt. +1",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
}
   sets.idle.EnemyTPaccumulation ={
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
}
sets.idle.PD = {    
    main="Burtgang",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    right_ring="Defending Ring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Rudianos's Mantle",
}

   sets.idle.PDH ={
    main="Burtgang",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Chev. Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Chev. Earring +1",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring"}

   sets.idle.MEVA ={
    ammo="Staunch Tathlum +1",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Eabani Earring",
    right_ear="Sanare Earring",
    left_ring="Vengeful Ring",
    right_ring="Purity Ring",
    back="Rudianos's Mantle",}

    sets.idle.Evasion={
        ammo="Amar Cluster",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Regal Ring",
        right_ring="Vengeful Ring",
        back="Rudianos's Mantle",}

    sets.idle.Town ={
    legs="Carmine Cuisses +1",
    left_ear="Infused Earring",}
    
   sets.idle.Weak = {head="Crepuscular Helm", body="Crepuscular Mail",}
    
   sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
 
 sets.HQ = {}

   --   Physical
   --     PDT
   --     Aegis
   -- Defense sets
   --   Magical
   --     MDT
   --   Hybrid (on top of either physical or magical)
   --     Repulse  
   --     Reraise
   --     RepulseReraise
   --   Custom
    
   -- sets.Repulse = {back="Repulse Mantle"}
 --3367 HP   
   sets.defense.PDT = {
    main="Burtgang",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Chev. Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Chev. Earring +1",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Rudianos's Mantle",
}
   -- To cap MDT with Shell IV (52/256), need 76/256 in gear. Current gear set is 248/256.
   -- Shellra V can provide 75/256.
   sets.defense.MDT ={
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck="Warder's Charm +1",
   waist="Creed Baudrier",
   left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ear="Sanare Earring",
   left_ring="Shadow Ring",
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}

 sets.defense.Turtle ={   
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck={ name="Warder's Charm +1", augments={'Path: A',}},
   waist="Asklepian Belt",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring="Shadow Ring",
   right_ring="Moonlight Ring",
   back="Rudianos's Mantle",
}
 sets.defense.ResistCharm = {
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head={ name="Founder's Corona", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Magic dmg. taken -5%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands="Chev. Gauntlets +3",
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck={ name="Unmoving Collar +1", augments={'Path: A',}},
   waist="Carrier's Sash",
   left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ear="Volunt. Earring",
   left_ring="Unyielding Ring",
   right_ring="Wuji Ring",
   back="Solemnity Cape",
}	

sets.defense.Aminion = {
    main="Reikiko",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Carrier's Sash",
    ear2="Chev. Earring +1",
    ear1="Sanare Earring",
    ring1="Shadow Ring",
    ring2="Apeile Ring +1",
    back="Rudianos's Mantle",
}

sets.defense.Dagger = {    
   ammo="Eluder's Sachet",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands="Rev. Gauntlets +3",
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck={ name="Loricate Torque +1", augments={'Path: A',}},
   waist="Carrier's Sash",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Fortified Ring",
   back="Rudianos's Mantle",
}
sets.defense.Evasion = {    
   ammo="Amar Cluster",
   head="Nyame Helm",
   body="Nyame Mail",
   hands="Nyame Gauntlets",
   legs="Nyame Flanchard",
   feet="Nyame Sollerets",
   neck={ name="Bathy Choker +1", augments={'Path: A',}},
   waist="Flume Belt +1",
   left_ear="Eabani Earring",
   right_ear="Infused Earring",
   left_ring="Vengeful Ring",
   right_ring="Defending Ring",
   back="Rudianos's Mantle",
}
 
   sets.defense.Enmity = { 
       ammo="Iron Gobbet",
       main="Burtgang",
       head={ name="Loess Barbuta +1", augments={'Path: A',}},
       body="Chev. Cuirass +3",
       hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
       legs="Chev. Cuisses +3",
       feet="Eschite Greaves",
       neck="Creed Collar",
       waist="Creed Baudrier",
       left_ear="Trux Earring",
       right_ear="Cryptic Earring",
       left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
       right_ring="Apeile Ring",
       back="Rudianos's Mantle",
}
sets.defense.Enmitymax = {     ammo="Iron Gobbet",
   main="Burtgang",
   head={ name="Loess Barbuta +1", augments={'Path: A',}},
   body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet="Eschite Greaves",
   neck="Moonlight Necklace",
   waist="Creed Baudrier",
   left_ear="Trux Earring",
   right_ear="Cryptic Earring",
   left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
   right_ring="Apeile Ring",
   back="Rudianos's Mantle",
}
   
   sets.defense.PD = {    
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head="Chev. Armet +3",
   body="Chev. Cuirass +3",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet="Chev. Sabatons +3",
   neck={ name="Loricate Torque +1", augments={'Path: A',}},
   waist="Plat. Mog. Belt",
   left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ear="Tuisto Earring",
   right_ring="Defending Ring",
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   back="Rudianos's Mantle",
}

sets.defense.PDH = {
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head="Chev. Armet +3",
   body="Adamantite Armor",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck={ name="Loricate Torque +1", augments={'Path: A',}},
   waist="Plat. Mog. Belt",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ring="Defending Ring",
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   back="Rudianos's Mantle",
}

   sets.defense.HPBOOST = {
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body="Rev. Surcoat +3",
   hands="Regal Gauntlets",
   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   neck={ name="Unmoving Collar +1", augments={'Path: A',}},
   waist="Plat. Mog. Belt",
   left_ear="Tuisto Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Moonlight Ring",
   back="Moonlight Cape",
}

sets.defense.HP = set_combine(sets.defense.HPBOOST, {
   ammo="Iron Gobbet",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   waist="Plat. Mog. Belt",
})

sets.defense.Convert = {    
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head="Chev. Armet +3",
   body="Rev. Surcoat +3",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet="Rev. Leggings +3",
   neck={ name="Unmoving Collar +1", augments={'Path: A',}},
   waist="Flume Belt +1",
   left_ear="Tuisto Earring",
   right_ear="Ethereal Earring",
   left_ring="Moonlight Ring",
   right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   back="Rudianos's Mantle",
}

sets.defense.Block = {
   main="Burtgang",
   ammo="Staunch Tathlum +1",
   head="Chev. Armet +3",
   body="Chev. Cuirass +3",
   hands="Chev. Gauntlets +3",
   legs="Chev. Cuisses +3",
   feet="Rev. Leggings +3",
   neck={ name="Loricate Torque +1", augments={'Path: A',}},
   waist="Flume Belt +1",
   left_ear="Thureous Earring",
   right_ear="Chev. Earring +1",
   left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
   right_ring="Moonlight Ring",
   back="Rudianos's Mantle",
}

--Doom/RR",
    
   sets.defense.PDT.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
   sets.defense.PD.Reraise = set_combine(sets.defense.PD, sets.Reraise)
   sets.defense.MDT.Reraise = set_combine(sets.defense.MDT, sets.Reraise)
   sets.defense.Turtle.Reraise = set_combine(sets.defense.Turtle, sets.Reraise)
   sets.defense.Enmity.Reraise = set_combine(sets.defense.Enmity, sets.Reraise)
   sets.defense.Enmitymax.Reraise = set_combine(sets.defense.Enmitymax, sets.Reraise)
   sets.defense.Aminion.Reraise = set_combine(sets.defense.Aminion, sets.Reraise)
   sets.defense.HPBOOST.Reraise = set_combine(sets.defense.HPBOOST, sets.Reraise)
   sets.defense.Convert.Reraise = set_combine(sets.defense.Convert, sets.Reraise)
   sets.defense.Block.Reraise = set_combine(sets.defense.Block, sets.Reraise)
   sets.defense.Dagger.Reraise = set_combine(sets.defense.Dagger, sets.Reraise)
   sets.defense.ResistCharm.Reraise = set_combine(sets.defense.ResistCharm, sets.Reraise)
   sets.defense.PDH.Reraise = set_combine(sets.defense.PDH, sets.Reraise)


   sets.defense.PDT.Doom = set_combine(sets.defense.PDT, sets.Doom)
   sets.defense.PD.Doom = set_combine(sets.defense.PD, sets.Doom)
   sets.defense.MDT.Doom = set_combine(sets.defense.MDT, sets.Doom)
   sets.defense.Turtle.Doom = set_combine(sets.defense.Turtle, sets.Doom)
   sets.defense.Enmity.Doom = set_combine(sets.defense.Enmity, sets.Doom)
   sets.defense.Enmitymax.Doom = set_combine(sets.defense.Enmitymax, sets.Doom)
   sets.defense.Aminion.Doom = set_combine(sets.defense.Aminion, sets.Doom)
   sets.defense.HPBOOST.Doom = set_combine(sets.defense.HPBOOST, sets.Doom)
   sets.defense.Convert.Doom = set_combine(sets.defense.Convert, sets.Doom)
   sets.defense.Block.Doom = set_combine(sets.defense.Block, sets.Doom)
   sets.defense.Dagger.Doom = set_combine(sets.defense.Dagger, sets.Doom)
   sets.defense.ResistCharm.Doom = set_combine(sets.defense.ResistCharm, sets.Doom)
   sets.defense.PDH.Doom = set_combine(sets.defense.PDH, sets.Doom)

   sets.Obi = {waist="Hachirin-no-Obi"}
   sets.MoveSpeed = {legs="Carmine Cuisses +1",}
   sets.Adoulin = {body="Councilor's Garb",}

   sets.Kiting = {
   legs="Carmine Cuisses +1",
}
   --------------------------------------
   -- Engaged sets
   --------------------------------------
    
   sets.engaged = --1124 / 1264 avec enlight up 
   {}
   sets.engaged.Hybrid = --1179 / 1315 avec enlight up
   {   ammo="Aurgelmir Orb +1",
   head="Hjarrandi Helm",
   body="Hjarrandi Breast.",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck="Ainia Collar",
   waist="Tempus Fugit +1",
   left_ear="Dedition Earring",
   right_ear="Telos Earring",
   left_ring="Moonlight Ring",
   right_ring="Moonlight Ring",
   back="Tactical Mantle",
   }
   sets.engaged.Acc = --1179 / 1315 avec enlight up
   {
   ammo="Amar Cluster",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck="Lissome Necklace",
   waist={ name="Sailfi Belt +1", augments={'Path: A',}},
   left_ear="Crep. Earring",
   right_ear="Telos Earring",
   left_ring="Chirich Ring +1",
   right_ring="Chirich Ring +1",
   back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
}

sets.engaged.TP = --1179 / 1315 avec enlight up
{ 
   ammo="Aurgelmir Orb +1",
   head={ name="Sakpata's Helm", augments={'Path: A',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck="Lissome Necklace",
   waist={ name="Sailfi Belt +1", augments={'Path: A',}},
   left_ear="Cessance Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   left_ring="Moonlight Ring",
   right_ring="Moonlight Ring",
   back="Tactical Mantle",
  }

   sets.engaged.STP = --1179 / 1315 avec enlight up
{  main="Naegling",
   sub="Blurred Shield +1",
   ammo="Aurgelmir Orb +1",
   head="Flam. Zucchetto +2",
   body="Volte Harness",
   hands="Flam. Manopolas +2",
   legs="Flamma Dirs +2",
   feet="Flam. Gambieras +2",
   neck="Ainia Collar",
   waist={ name="Sailfi Belt +1", augments={'Path: A',}},
   left_ear="Dedition Earring",
   right_ear="Telos Earring",
   left_ring="Chirich Ring +1",
   right_ring="Chirich Ring +1",
   back="Tactical Mantle",
}
sets.engaged.CRIT = --1179 / 1315 avec enlight up
{
   ammo="Coiste Bodhar",
   head={ name="Blistering Sallet +1", augments={'Path: A',}},
   body="Hjarrandi Breast.",
   hands="Flam. Manopolas +2",
   legs={ name="Zoar Subligar +1", augments={'Path: A',}},
   feet="Thereoid Greaves",
   neck="Nefarious Collar +1",
   waist={ name="Sailfi Belt +1", augments={'Path: A',}},
   left_ear="Cessance Earring",
   right_ear="Brutal Earring",
   left_ring="Defending Ring",
   right_ring="Hetairoi Ring",
   back="Annealed Mantle",}



------------------------------------------------------------------------------------------------
    ---------------------------------------- DW ------------------------------------------
------------------------------------------------------------------------------------------------

    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    --DW cap all set haste capped
sets.engaged.DW = --1124 / 1264 avec enlight up 
{}
sets.engaged.DW.Acc = set_combine(sets.engaged.Acc,{
    right_ear="Eabani Earring", --4
left_ear="Suppanomimi",
}) -- 12%
sets.engaged.DW.TP = set_combine(sets.engaged.TP,{
    right_ear="Eabani Earring", --4
left_ear="Suppanomimi",
}) -- 12%
sets.engaged.DW.STP = set_combine(sets.engaged.STP,{
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Carmine Cuisses +1", --6
    feet="Flam. Gambieras +2",
    neck="Clotharius Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    left_ring="Petrov Ring",
    right_ring="Hetairoi Ring",
    back="Annealed Mantle",
}) -- 12%
sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT,{
    left_ring="Petrov Ring",
    right_ear="Eabani Earring", --4
    left_ear="Suppanomimi",
}) -- 12%
sets.engaged.DW.Hybrid = set_combine(sets.engaged.Hybrid,{
    right_ear="Eabani Earring", --4
    left_ear="Suppanomimi",
}) -- 12%
------------------------------------------------------------------------------------------------
  ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {})
sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.Acc, {
    legs="Carmine Cuisses +1", --6
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.TP.LowHaste = set_combine(sets.engaged.DW.TP, {
    legs="Carmine Cuisses +1", --6
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.STP.LowHaste = set_combine(sets.engaged.DW.STP, {
    legs="Carmine Cuisses +1", --6
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.CRIT.LowHaste = set_combine(sets.engaged.DW.CRIT, {
    legs="Carmine Cuisses +1", --6
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.Hybrid.LowHaste = set_combine(sets.engaged.DW.Hybrid, {
    legs="Carmine Cuisses +1", --6
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%

-- 30% Magic Haste (56% DW to cap)

sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW,{})
sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.Acc,{ 
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    legs="Carmine Cuisses +1", --6
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.TP.MidHaste = set_combine(sets.engaged.DW.TP,{ 
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    legs="Carmine Cuisses +1", --6
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.STP.MidHaste = set_combine(sets.engaged.DW.STP,{ 
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    legs="Carmine Cuisses +1", --6
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.CRIT.MidHaste = set_combine(sets.engaged.DW.CRIT,{ 
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    legs="Carmine Cuisses +1", --6
    --waist="Reiki Yotai", --7
}) -- 15%
sets.engaged.DW.Hybrid.MidHaste = set_combine(sets.engaged.DW.Hybrid,{ 
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    legs="Carmine Cuisses +1", --6
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --waist="Reiki Yotai", --7
}) -- 15%

sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW)
sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.Acc)-- 12%
sets.engaged.DW.TP.MaxHaste = set_combine(sets.engaged.DW.TP)-- 12%
sets.engaged.DW.STP.MaxHaste = set_combine(sets.engaged.DW.STP)-- 12%
sets.engaged.DW.CRIT.MaxHaste = set_combine(sets.engaged.DW.CRIT)-- 12%
sets.engaged.DW.Hybrid.MaxHaste = set_combine(sets.engaged.DW.Hybrid)-- 12%


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

   sets.engaged.PDT = --1179 / 1315 avec enlight up
   {
       ammo="Staunch Tathlum +1",
       left_ring="Defending Ring",
       right_ring="Moonlight Ring",
       back="Moonlight Cape",
      }
   sets.engaged.MDT = {
       neck={ name="Warder's Charm +1", augments={'Path: A',}},
       left_ring="Shadow Ring",
   }
   sets.engaged.Turtle = {
    ammo="Staunch Tathlum +1",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Rudianos's Mantle",
}
   sets.engaged.ReverenceGauntlets = {    
    hands="Rev. Gauntlets +3",
 }




    ------------------------------------------------------------------------------------------------
    ----------------------------------------DW - Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------


 sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc,{
    ammo="Staunch Tathlum +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})
sets.engaged.DW.TP.PDT = set_combine(sets.engaged.DW.TP,{
    ammo="Staunch Tathlum +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})
sets.engaged.DW.STP.PDT = set_combine(sets.engaged.DW.STP,{
    ammo="Staunch Tathlum +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})
sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.DW.CRIT,{
    ammo="Staunch Tathlum +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})

    --sets.engaged.DW.PDT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.PDT)
    --sets.engaged.DW.PDT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.PDT)
    --sets.engaged.DW.PDT.MaxHaste = set_combine(sets.engaged.DW.PDT.MaxHaste, sets.engaged.PDT)
    sets.engaged.DW.Acc.PDT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.engaged.PDT)
    sets.engaged.DW.Acc.PDT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.engaged.PDT)
    sets.engaged.DW.Acc.PDT.MaxHaste = set_combine(sets.engaged.DW.Acc.PDT.MaxHaste, sets.engaged.PDT)
    sets.engaged.DW.TP.PDT.LowHaste = set_combine(sets.engaged.DW.TP.LowHaste, sets.engaged.PDT)
    sets.engaged.DW.TP.PDT.MidHaste = set_combine(sets.engaged.DW.TP.MidHaste, sets.engaged.PDT)
    sets.engaged.DW.TP.PDT.MaxHaste = set_combine(sets.engaged.DW.TP.PDT.MaxHaste, sets.engaged.PDT)
    sets.engaged.DW.STP.PDT.LowHaste = set_combine(sets.engaged.DW.STP.LowHaste, sets.engaged.PDT)
    sets.engaged.DW.STP.PDT.MidHaste = set_combine(sets.engaged.DW.STP.MidHaste, sets.engaged.PDT)
    sets.engaged.DW.STP.PDT.MaxHaste = set_combine(sets.engaged.DW.STP.PDT.MaxHaste, sets.engaged.PDT)
    sets.engaged.DW.CRIT.PDT.LowHaste = set_combine(sets.engaged.DW.CRIT.LowHaste, sets.engaged.PDT)
    sets.engaged.DW.CRIT.PDT.MidHaste = set_combine(sets.engaged.DW.CRIT.MidHaste, sets.engaged.PDT)
    sets.engaged.DW.CRIT.PDT.MaxHaste = set_combine(sets.engaged.DW.CRIT.PDT.MaxHaste, sets.engaged.PDT)
end
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------Job-specific hooks that are called to process player actions at specific points in time-----------
------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------
-- Action events
------------------------------------------------------------------
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Remedy" <me>')
    end
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_precast(spell, action, spellMap, eventArgs)

    --[[if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
        return
    end]]
    --[[if spell.type == 'WeaponSkill' then
        if state.OffenseMode.value == "None" then
        equip({})
        end
    end]]
    if spell.type == "WeaponSkill" then
        if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Out of /eq]')
            return
        end
    end
    if rune_enchantments:contains(spell.english) then
        eventArgs.handled = true
    end
    if spell.english == 'Lunge' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            send_command('input /jobability "Swipe" <t>')
--            add_to_chat(122, '***Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.***')
            eventArgs.cancel = true
            return
        end
    end
    if spell.english == 'Valiance' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            send_command('input /jobability "Vallation" <me>')
            eventArgs.cancel = true
            return
        elseif spell.english == 'Valiance' and buffactive['vallation'] then
            cast_delay(0.2)
            send_command('cancel Vallation') -- command requires 'cancel' add-on to work
        end
    end
    if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
    if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)

    if spell.type:lower() == 'weaponskill' then
        if player.tp == 3000 then  -- Replace Moonshade Earring if we're at cap TP
            equip({left_ear="Ishvara Earring"})
        end
    end
    -- CP mantle must be worn when a mob dies, so make sure it's equipped for WS.
    if state.CapacityMode.value then
        equip(sets.CapacityMantle)
    end
    if spell.type == 'WeaponSkill' then
        if data.weaponskills.elemental:contains(spell.name) then
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

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
      if state.CastingMode.value == 'DT' then
      equip(sets.self_healing.DT)
      elseif state.CastingMode.value == 'MB' then
      equip(sets.self_healing.MB)
      else
      equip(sets.self_healing)
      end
    end
    if (spellMap == 'Cure' or spellMap == 'Regen') then
        if state.SrodaBelt.value then
            equip({waist="Sroda Belt"})
        end
    end
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end
    if (spell.skill == 'Elemental Magic' or spell.skill == 'Divine Magic') and (state.MagicBurst.value or AEBurst) then
        equip(sets.magic_burst)
    end
    if spell.skill == 'Divine Magic' and (spell.english == "Holy" or spell.english == "Holy II" or spell.english == "Banish" or spell.english == "Banish II" ) then     
           if (spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element])) then
            equip(sets.Obi)
        -- Target distance under 1.7 yalms.
        elseif spell.target.distance < (1.7 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Matching day and weather.
       elseif (spell.element == world.day_element and spell.element == world.weather_element) then
            equip(sets.Obi)
        -- Target distance under 8 yalms.
        elseif spell.target.distance < (8 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Match day or weather.
       elseif (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        elseif state.MagicBurst.value then
            equip(sets.magic_burst)
        end
    end
end


function job_aftercast(spell)
    if not spell.interrupted then
        if spell.type == 'Rune' then
            update_timers(spell)
        elseif spell.name == "Lunge" or spell.name == "Gambit" or spell.name == 'Rayke' then
            reset_timers()
        elseif spell.name == "Swipe" then
            send_command(trim(1))
        end
    end
    if spell.name == 'Rayke' and not spell.interrupted then
        send_command('@timers c "Rayke ['..spell.target.name..']" '..rayke_duration..' down spells/00136.png')
        send_command('wait '..rayke_duration..';input /echo [Rayke just wore off!];')
    elseif spell.name == 'Gambit' and not spell.interrupted then
        send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
        send_command('wait '..gambit_duration..';input /echo [Gambit just wore off!];')
    end
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
end
function job_buff_change(buff,gain)
    if buff == "Protect" then
        if gain then
            enable('ring2')
            state.ShelteredRing:set(false)
        end
    end
    if buff == "phalanx" or "Phalanx II" then
        if gain then
            state.phalanxset:set(false)
        end
    end
    if buff == "terror" then
        if gain then
            send_command('input /p i am TERROR cant move.')		
            equip(sets.defense.PDT)
        end
        handle_equipping_gear(player.status)
    end
    if buff == "doom" then
        if gain then
            equip(sets.Doom)
            send_command('@input /p Doomed, please Cursna.')
            send_command('@input /item "Holy Water" <me>')	
             disable('ring1','ring2','waist','neck')
        else
            enable('ring1','ring2','waist','neck')
            send_command('input /p Doom removed.')
            handle_equipping_gear(player.status)
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
    if buff == "Rampart" then
        if gain then  			
            send_command('input /p "Rampart" [ON]')		
        else	
            send_command('input /p "Rampart" [OFF]')
        end
    end
    if buff == "charm" then
        if gain then  			
           send_command('input /p Charmd, please Sleep me.')		
        else	
           send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
        end
    end
    if S{'terror','petrification','sleep','stun'}:contains(name) then
        if gain then
            equip(sets.defense.PDT)
        elseif not gain then 
            handle_equipping_gear(player.status)
        end
    end
    if buff == 'sleep' then
        if gain and player.hp > 120 and player.status == 'Engaged' then -- Equip Vim Torque When You Are Asleep
            equip({neck="Vim Torque +1"})
			disable('neck')
        elseif not gain then 
			enable('neck')
            handle_equipping_gear(player.status)
        end
    end	
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
        end
    end
    if not midaction() then
        job_update()
    end
end
function check_buffs(check)
     
end
function job_handle_equipping_gear(playerStatus, eventArgs)   
    determine_haste_group()
    check_moving()
    update_combat_form()
    check_weaponset()
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
end

function job_update(cmdParams, eventArgs)
    check_moving()
    --handle_equipping_gear(player.status)
end
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
function customize_idle_set(idleSet)
    if state.HippoMode.value == true then 
        idleSet = set_combine(idleSet, {feet="Hippo. Socks +1"})
    end
    if state.IdleMode.current == 'EnemyCritRate' then
        idleSet = set_combine(idleSet, sets.idle.EnemyCritRate )
    end
    if state.IdleMode.current == 'ReverenceGauntlets' then
        idleSet = set_combine(idleSet, sets.idle.ReverenceGauntlets)
    end
    if state.IdleMode.current == 'Refresh' then
        idleSet = set_combine(idleSet, sets.idle.Refresh)
    end
    if state.IdleMode.current == 'Resist' then
        idleSet = set_combine(idleSet, sets.idle.Resist)
    end
    if state.IdleMode.current == 'EnemyTPaccumulation' then
        idleSet = set_combine(idleSet, sets.idle.EnemyTPaccumulation)
    end
    if state.IdleMode.current == 'MEVA' then
        idleSet = set_combine(idleSet, sets.idle.MEVA)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    if world.area:contains("Adoulin") then
        idleSet = set_combine(idleSet, {body="Councilor's Garb"})
    end
    --[[if state.TartarusMode.value == "Tartarus" then
        idleSet = set_combine(idleSet, {body="Tartarus Platemail"})
    elseif state.TartarusMode.value == "normal" then
       equip({})
    end]]
    if state.Auto_Kite.value == true then
		idleSet = set_combine(idleSet, sets.Kiting)
	end
  return idleSet
end
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.HybridMode.current == 'MDT' then
        meleeSet = set_combine(meleeSet, sets.engaged.MDT)
    end
    if state.HybridMode.current == 'PDT' then
        meleeSet = set_combine(meleeSet, sets.engaged.PDT)
    end
    if state.HybridMode.current == 'ReverenceGauntlets' then
        meleeSet = set_combine(meleeSet, sets.engaged.ReverenceGauntlets)
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    --[[if state.TartarusMode.value == "Tartarus" then
        meleeSet = set_combine(meleeSet, {body="Tartarus Platemail"})
    elseif state.TartarusMode.value == "normal" then
       equip({})
    end]]
    if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Vim Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{neck="Vim Torque +1"})
    end

    check_weaponset()

  return meleeSet
end


function check_weaponset()
    equip(sets[state.WeaponSet.current])

end
---------------------------------------------------------------------------------------------
-- General hooks for other events.
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
	if state.DefenseMode.value ~= 'None' then
		moving = false
    elseif mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                state.Moving.value = true
                send_command('gs c update')
				if world.area:contains("Adoulin") then
                send_command('gs equip sets.Adoulin')
				else
                send_command('gs equip sets.MoveSpeed')
                end

        moving = true

            elseif dist < 1 and moving then
                state.Moving.value = false
                send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']
    
    local found_rune_element
    
    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end
    
    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
    if state.ShelteredRing .value == true then
        equip({ring2="Sheltered Ring"})
        disable('ring2')
    else 
        enable('ring2')
        state.ShelteredRing:set(false)
    end
    if state.phalanxset .value == true then
        --equip(sets.midcast.Phalanx)
        send_command('gs equip sets.midcast.Phalanx')
        send_command('input /p Phalanx set equiped [ON] PLZ GIVE ME PHALANX')		
    else 
        state.phalanxset:set(false)
    end
    if stateField == 'Runes' then
        local msg = ''
        if newValue == 'Ignis' then
            msg = msg .. 'Increasing resistence against ICE and deals FIRE damage.'
            add_to_chat(167, msg)
        elseif newValue == 'Gelus' then
            msg = msg .. 'Increasing resistence against WIND and deals ICE damage.'
            add_to_chat(210, msg)
        elseif newValue == 'Flabra' then
            msg = msg .. 'Increasing resistence against EARTH and deals WIND damage.'
            add_to_chat(215, msg)
        elseif newValue == 'Tellus' then
            msg = msg .. 'Increasing resistence against LIGHTNING and deals EARTH damage.'
            add_to_chat(206, msg)
        elseif newValue == 'Sulpor' then
            msg = msg .. 'Increasing resistence against WATER and deals LIGHTNING damage.'
            add_to_chat(050, msg)
        elseif newValue == 'Unda' then
            msg = msg .. 'Increasing resistence against FIRE and deals WATER damage.'
            add_to_chat(207, msg)
        elseif newValue == 'Lux' then
            msg = msg .. 'Increasing resistence against DARK and deals LIGHT damage.'
            add_to_chat(001, msg)
        elseif newValue == 'Tenebrae' then
            msg = msg .. 'Increasing resistence against LIGHT and deals DARK damage.'
            add_to_chat(160, msg)
        end
    -- elseif stateField == 'moving' then
    --     if state.Moving.value then
    --         local res = require('resources')
    --         local info = windower.ffxi.get_info()
    --         local zone = res.zones[info.zone].name
    --         if zone:match('Adoulin') then
    --             equip(sets.Adoulin)
    --         end
    --         equip(select_movement())
    --     end
        
    elseif stateField == 'Use Rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    elseif stateField == 'Use Warp' then
        add_to_chat(8, '------------WARPING-----------')
        --equip({ring1="Warp Ring"})
        send_command('input //gs equip sets.Warp;@wait 10.0;input /item "Warp Ring" <me>;')
    end
    if update_job_states then update_job_states() 
    end

    check_weaponset()

end

windower.register_event('zone change',
    function()
        --add that at the end of zone change
        if update_job_states then update_job_states() end
    end
)


function update_combat_form()
  -- Check for H2H or single-wielding
  if DW == true then
        state.CombatForm:set('DW')
  elseif DW == false then
        state.CombatForm:reset()
  end 
  if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
    if player.equipment.sub and not player.equipment.sub:endswith('Shield') and not player.equipment.sub:endswith('Strap') and
    player.equipment.sub ~= 'empty' and player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' and player.equipment.sub ~= 'Duban' and player.equipment.sub ~= 'Priwen' and 
    player.equipment.sub ~= 'Blurred Shield +1' and player.equipment.sub ~= 'Beatific Shield +1' and player.equipment.sub ~= 'Srivatsa' then
    state.CombatForm:set('DW')
    else
    state.CombatForm:reset()
    end
  end
end
function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 11 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 12 and DW_needed <= 21 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 21 and DW_needed <= 27 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 27 and DW_needed <= 31 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 31 and DW_needed <= 42 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 42 then
            classes.CustomMeleeGroups:append('')
        end
    end
end
function check_moving()
    --[[add_to_chat(123, 'Check Movement')
    if state.Kiting.value then
        add_to_chat(121, 'Kite True')
    else
        add_to_chat(121, 'Kite False')
    end
 
    if state.Auto_Kite.value then
        add_to_chat(122, 'A-Kite True')
    else
        add_to_chat(122, 'A-Kite False')
    end
 
    if moving then
        add_to_chat(120, 'Moving')
    else
        add_to_chat(120, 'Not Moving')
    end]]
 
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
            send_command('gs c update')

        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
            send_command('gs c update')

        end
    end
end


------------------------------------------------------------------
-- Timer manipulation
------------------------------------------------------------------

-- Add a new run to the custom timers, and update index values for existing timers.
function update_timers(spell)
    local expires_time = os.time() + 300
    local entry_index = rune_count(spell.name) + 1

    local entry = {rune=spell.name, index=entry_index, expires=expires_time}

    rune_timers:append(entry)
    local cmd_queue = create_timer(entry).. ';wait 0.05;'
    
    cmd_queue = cmd_queue .. trim()

    add_to_chat(123,'cmd_queue='..cmd_queue)

    send_command(cmd_queue)
end

-- Get the command string to create a custom timer for the provided entry.
function create_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    local duration = entry.expires - os.time()
    return 'timers c ' .. timer_name .. ' ' .. tostring(duration) .. ' down'
end

-- Get the command string to delete a custom timer for the provided entry.
function delete_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    return 'timers d ' .. timer_name .. ''
end

-- Reset all timers
function reset_timers()
    local cmd_queue = ''
    for index,entry in pairs(rune_timers) do
        cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
    end
    rune_timers:clear()
    send_command(cmd_queue)
end

-- Get a count of the number of runes of a given type
function rune_count(rune)
    local count = 0
    local current_time = os.time()
    for _,entry in pairs(rune_timers) do
        if entry.rune == rune and entry.expires > current_time then
            count = count + 1
        end
    end
    return count
end

-- Remove the oldest rune(s) from the table, until we're below the max_runes limit.
-- If given a value n, remove n runes from the table.
function trim(n)
    local cmd_queue = ''

    local to_remove = n or (rune_timers:length() - max_runes)

    while to_remove > 0 and rune_timers:length() > 0 do
        local oldest
        for index,entry in pairs(rune_timers) do
            if oldest == nil or entry.expires < rune_timers[oldest].expires then
                oldest = index
            end
        end
        
        cmd_queue = cmd_queue .. prune(rune_timers[oldest].rune)
        to_remove = to_remove - 1
    end
    
    return cmd_queue
end

-- Drop the index of all runes of a given type.
-- If the index drops to 0, it is removed from the table.
function prune(rune)
    local cmd_queue = ''
    
    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
            entry.index = entry.index - 1
        end
    end

    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            if entry.index == 0 then
                rune_timers[index] = nil
            else
                cmd_queue = cmd_queue .. create_timer(entry) .. ';wait 0.05;'
            end
        end
    end
    
    return cmd_queue
end

function sub_job_change(new,old)
    if user_setup then
        user_setup()
        send_command('wait 6;input /lockstyleset 177')
    end
end
function display_current_job_state(eventArgs)
    local i_msg = state.IdleMode.value
  
    local msg = ''
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end
    local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' ..state.CombatForm.value.. ')'
    end
    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' ..state.HybridMode.value
    end
  
    local ws_msg = state.WeaponskillMode.value
  
    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end
  
    local i_msg = state.IdleMode.value
  
    local msg = ''

    local r_msg = state.Runes.current
    local r_color = ''
    if state.Runes.current == 'Ignis' then r_color = 167
    elseif state.Runes.current == 'Gelus' then r_color = 210
    elseif state.Runes.current == 'Flabra' then r_color = 204
    elseif state.Runes.current == 'Tellus' then r_color = 050
    elseif state.Runes.current == 'Sulpor' then r_color = 215
    elseif state.Runes.current == 'Unda' then r_color = 207
    elseif state.Runes.current == 'Lux' then r_color = 001
    elseif state.Runes.current == 'Tenebrae' then r_color = 160 end


    add_to_chat(r_color, string.char(129,121).. '  ' ..string.upper(r_msg).. '  ' ..string.char(129,122)
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end
function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    end
end
function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
            DW_needed = tonumber(cmdParams[2])
            DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if not midaction() then
            job_update()
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

------------------------------------------------------------------
-- Reset events
------------------------------------------------------------------

windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)
windower.raw_register_event('status change',function(new, old)
    if gearswap.res.statuses[new].english == 'Dead' then
        reset_timers()
    end
end)

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Auto toggle Magic burst set.
MB_Window = 0
time_start = 0
AEBurst = false

if player and player.index and windower.ffxi.get_mob_by_index(player.index) then

    windower.raw_register_event('action', function(act)
        for _, target in pairs(act.targets) do
            local battle_target = windower.ffxi.get_mob_by_target("t")
            if battle_target ~= nil and target.id == battle_target.id then
                for _, action in pairs(target.actions) do
                    if action.add_effect_message > 287 and action.add_effect_message < 302 then
                        --last_skillchain = skillchains[action.add_effect_message]
                        MB_Window = 11
                        MB_Time = os.time()
                    end
                end
            end
        end
    end)

    windower.raw_register_event('prerender', function()
        --Items we want to check every second
        if os.time() > time_start then
            time_start = os.time()
            if MB_Window > 0 then
                MB_Window = 11 - (os.time() - MB_Time)
                if state.AutoEquipBurst.value then
                    AEBurst = true
                end
            else
                AEBurst = false
            end
        end
    end)
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'DNC' then
        set_macro_page(5, 37)
    elseif player.sub_job == 'NIN' then
        set_macro_page(5, 37)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 37)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 37)
        send_command('lua l AutoRUN')
        send_command('lua l runewidget')
	elseif player.sub_job == 'WAR' then
        set_macro_page(2, 37)
	elseif player.sub_job == 'BLU' then
        set_macro_page(1, 37)
        send_command('input //blupldsets set pld')
    elseif player.sub_job == 'SCH' then
        set_macro_page(7, 37)
    else
        set_macro_page(1, 37)
    end
end





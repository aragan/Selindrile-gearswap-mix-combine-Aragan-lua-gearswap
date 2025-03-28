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
    "Soy Ramen",
    "G. Curry Bun +1",
    "Pukatrice Egg",
    "Moogle Amp.",
    "Popo. con Queso",
    "Pear Crepe",
    "Crab Sushi",
    "Om. Sandwich",
    "Red Curry Bun",    
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

--[[
-- Scythe Light:
Insurgency > Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
Entropy > Guillotine > Entropy > Insurgency 
Guillotine > Entropy > Insurgency

-- Scythe Darkness: 
Insurgency (M) > Vorpal Scythe > Vorpal Scythe > Insurgency (M) > Entropy (MM) > Cross Reaper
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
Cross Reaper > Insurgency (M) > Entropy (MM) > Cross Reaper
Insurgency (M) > Entropy (MM) > Cross Reaper
Cross Reaper > Entropy (MM)
Entropy (MM) > Cross Reaper

-- Apoc Darkness
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM) > Catastrophe (R)
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
Insurgency (M) > Entropy (MM) > Cross Reaper > Catastrophe (R)
Insurgency (M) > Catastrophe (R) > Cross Reaper > Catastrophe (R)
Cross Reaper > Insurgency (M) > Catastrophe (R) > Cross Reaper
Catastrophe (R) > Cross Reaper > Catastrophe (R)
Insurgency (M) > Catastrophe (R) > Cross Reaper
Cross Reaper > Catastrophe (R) > Catastrophe (R)
Cross Reaper > Entropy (MM) > Catastrophe (R)
Entropy (MM) > Cross Reaper > Catastrophe (R)
Catastrophe (R) > Catastrophe (R)
Catastrophe (R) > Cross Reaper
Cross Reaper > Catastrophe (R)

-- Other Light
Catastrophe (R) > Savage Blade (Q) > Insurgency (M)
Entropy (MM) > Savage Blade (Q) > Insurgency (M)
Savage Blade (Q) > Insurgency (M)
Chant du Cygne (E) > Torcleaver (E)

-- Other Dark
Atonement (M) > Entropy (MM) > Cross Reaper
Savage Blade (Q) > Cross Reaper > Entropy (MM)
Chant du Cygne (E) > Catastrophe (R)
Chant du Cygne (E) > Entropy (MM)
Requiescat (MM) > Cross Reaper
Requiescat (MM) > Torcleaver (E)

-- GreatSword Light
Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM) > Torcleaver (E)
Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM)
Resolution (MM) > Scourge (R) > Torcleaver (E)
Scourge (R) > Resolution (MM) > Torcleaver (E)
Torcleaver (E) > Torcleaver (E)
Scourge (R) > Resolution (MM)
--]]

-- Setup vars that are user-independent.
function job_setup()
    state.CapacityMode = M(false, 'Capacity Point Mantle')
    send_command('wait 2;input /lockstyleset 165')
    send_command('bind !` gs c toggle MagicBurst')
    include('Mote-TreasureHunter')
    state.TreasureMode:set('None')
    state.MagicBurst = M(false, 'Magic Burst')
    state.WeaponLock = M(false, 'Weapon Lock')
    state.Buff.Souleater = buffactive.souleater or false
    state.Buff['Last Resort'] = buffactive['Last Resort'] or false
    -- Set the default to false if you'd rather SE always stay acitve
    state.SouleaterMode = M(true, 'Soul Eater Mode')
    state.LastResortMode = M(true,false)

    -- Use Gavialis helm?
    use_gavialis = true

    elemental_ws = S{"Flash Nova", "Sanguine Blade","Seraph Blade","Burning Blade","Red Lotus Blade"
    , "Shining Strike", "Aeolian Edge", "Gust Slash", "Cyclone","Energy Steal","Energy Drain"
    , "Leaden Salute", "Wildfire", "Hot Shot", "Flaming Arrow", "Trueflight", "Blade: Teki", "Blade: To"
    , "Blade: Chi", "Blade: Ei", "Blade: Yu", "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter"
    , "Primal Rend", "Dark Harvest", "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust"
    , "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki", "Rock Crusher", "Earth Crusher", "Starburst"
    , "Sunburst", "Omniscience", "Garland of Bliss"}
    -- Weaponskills you want Gavialis helm used with (only considered if use_gavialis = true)
    wsList = S{}
    -- Greatswords you use. 
    gsList = S{'Ragnarok','Caladbolg','Nandaka','Foreshock Sword','Agwu\'s Claymore'}
    scytheList = S{'Apocalypse', 'Anguta'}
    remaWeapons = S{'Caladbolg', 'Liberator', 'Apocalypse','Ragnarok','Nandaka', 'Anguta'}
  
    shields = S{'Blurred Shield +1'}
    -- Mote has capitalization errors in the default Absorb mappings, so we use our own
    absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-MaxAcc', 'Absorb-TP'}
    -- Offhand weapons used to activate DW mode
    swordList = S{"Naegling", "Sangarius +1", "Reikiko", "Perun +1", "Tanmogayi", "Loxotic Mace +1", "Ternion Dagger +1", "Zantetsuken"}
    sets.weaponList = {"Caladbolg", "Liberator", "Apocalypse", "Nandaka", "Blurred Shield +1", "Naegling", "Sangarius +1", "Usonmunku", "Perun +1", "Tanmogayi", "Loxotic Mace +1"}
    state.WeaponSet = M{['description']='Weapon Set', 'Normal', 'Caladbolg', 'Lycurgos', 'Liberator', 'Anguta', 'Apocalypse', 'AgwuClaymore', 'Naegling', 'Loxotic', 'TernionDagger'}
    state.shield = M{['description']='Weapon Set', 'Normal', 'shield'}

    get_combat_form()
    update_melee_groups()
    update_combat_form()
end
  
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
  
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'STP', 'DA', 'MaxAcc', 'SubtleBlow', 'CRIT')
    state.HybridMode:options('Normal', 'DT', 'DreadSP')
    state.WeaponskillMode:options('Normal', 'Mid', 'PDL', 'SC', 'Dread', 'None')  ---Mid for Scythe removes Ratri for safer WS---For Resolution removes Agrosy for Meva---
    state.CastingMode:options('Normal', 'ConserveMP', 'SIRD')
    state.PhysicalDefenseMode:options('Normal', 'PDT', 'HP', 'Enmity', 'Dread Spikes', 'SEboost', 'Reraise')
    state.MagicalDefenseMode:options('Normal','MDT')
    state.IdleMode:options('Normal','PDT' ,'Regen', 'MDT', 'HP', 'Evasion', 'EnemyCritRate', 'Refresh')
    
    state.AutoEquipBurst = M(true)
    state.RP = M(false, "Reinforcement Points Mode")    
    war_sj = player.sub_job == 'WAR' or false
    state.Auto_Kite = M(false, 'Auto_Kite')
    state.Moving  = M(false, "moving")
    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
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
    -- Additional local binds
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind @f9 gs c toggle SouleaterMode')
    send_command('bind f4 gs c toggle LastResortMode')
    send_command('bind f5 gs c cycle WeaponskillMode')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('wait 6;input /lockstyleset 165')
    send_command('bind !w gs c toggle WeaponLock')
    send_command('bind f7 gs c cycle shield')
    send_command('bind f6 gs c cycle WeaponSet')
    send_command('bind !f6 gs c cycleback WeaponSet')
    send_command('bind @x gs c toggle RP')  
	--send_command('bind f12 gs c cycle IdleMode')

    select_default_macro_book()
    if init_job_states then init_job_states({"WeaponLock","MagicBurst"},{"IdleMode","OffenseMode","WeaponskillMode","CastingMode","WeaponSet","shield","TreasureMode"}) 
    end
end
  
function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
    send_command('unbind f5')

end
  
  
-- Define sets and vars used by this job file.
function init_gear_sets()

--Weaponsets
sets.Normal = {}
sets.Caladbolg = {main="Caladbolg", sub="Utu Grip"}
sets.Liberator = {main="Liberator", sub="Utu Grip"}
sets.Anguta = {main="Anguta", sub="Utu Grip"}
sets.Apocalypse = {main="Apocalypse", sub="Utu Grip"}
sets.AgwuClaymore = {main="Agwu's Claymore", sub="Utu Grip"}
sets.Lycurgos = {main="Lycurgos", sub="Utu Grip",}
sets.Naegling = {main="Naegling", sub="Reikiko",}
sets.Loxotic = {main="Loxotic Mace +1", sub="Reikiko",}
sets.TernionDagger = {main="Ternion Dagger +1", sub="Reikiko",}

sets.Normal = {}
sets.shield = {sub="Blurred Shield +1"}
sets.DefaultShield = {sub="Blurred Shield +1"}

    --------------------------------------
    -- Precast sets
    --------------------------------------
      
    -- Precast sets to enhance JAs
    sets.precast.JA['Last Resort'] = {back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}, 
    feet={ name="Fall. Sollerets +3", augments={'Enhances "Desperate Blows" effect',}},}
    sets.precast.JA['Nether Void'] = {Legs="Heath. Flanchard +2"}
    sets.precast.JA['Blood Weapon'] = {body="Fall. Cuirass +3"}
    sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +3"}
    sets.precast.JA['Souleater'] = {head="Ig. Burgeonet +3"}
    sets.precast.JA['Dark Seal'] = {head="Fall. Burgeonet +3"}
    sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +3"}
      
    
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
          
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
      
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}
  
    -- Fast cast sets for spells
    sets.TreasureHunter = { 
        ammo="Per. Lucky Egg",
        head="White rarab cap +1", 
        waist="Chaac Belt",
     }

    sets.precast.FC = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck="Orunmila's Torque",
        waist="Austerity Belt +1",
        left_ear="Loquac. Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Rahab Ring",
        back="Solemnity Cape",
    }
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
  
    
    sets.precast.RA = { ammo=empty,
        range="Trollbane",  
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        waist="Yemaya Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Purity Ring",
        right_ring="Ilabrat Ring",
    }
    sets.midcast.RA = { ammo=empty,
        range="Trollbane",  
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        waist="Yemaya Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Purity Ring",
        right_ring="Ilabrat Ring",
    }	
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        right_ring="Cornelia's Ring",
        left_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS.Dread  = sets.defense['Dread Spikes']
    sets.precast.WS.None  = {}
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {       
        head={ name="Nyame Helm", augments={'Path: B',}},
       body={ name="Nyame Mail", augments={'Path: B',}},
       hands={ name="Nyame Gauntlets", augments={'Path: B',}},
       legs="Nyame Flanchard",
       feet="Heath. Sollerets +2",
        })

    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    head="Heath. Burgeon. +2",
    neck="Abyssal Beads +2",
    right_ear="Heathen's Earring",
    left_ring="Sroda Ring",

    })
    sets.precast.WS.SC = set_combine(sets.precast.WS, {       
       head="Nyame Helm",
       body="Nyame Mail",
       hands="Nyame Gauntlets",
       legs="Nyame Flanchard",
       feet="Nyame Sollerets",
       neck={ name="Warder's Charm +1", augments={'Path: A',}},
       })
    sets.precast.WS.Judgment = set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS.Judgment.PDL = set_combine(sets.precast.WS.Judgment, {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS.Judgment.SC = set_combine(sets.precast.WS.Judgment, {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS.Judgment.None = {}

    sets.precast.WS['Vorpal Scythe'] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",
        hands="Flam. Manopolas +2",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Thereoid Greaves",
        neck="Nefarious Collar +1",
        waist="Gerdr Belt",
        left_ear="Schere Earring",
        right_ear="Brutal Earring",
        left_ring="Hetairoi Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Vorpal Scythe'].None = {}
    sets.precast.WS['Power Slash'] = set_combine(sets.precast.WS['Vorpal Scythe'], {})
    sets.precast.WS['Power Slash'].None = {}
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Catastrophe'] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ear="Thrud Earring",
        right_ring="Cornelia's Ring",
        left_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Catastrophe'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Catastrophe'].Mid = set_combine(sets.precast.WS['Catastrophe'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Catastrophe'].PDL = set_combine(sets.precast.WS['Catastrophe'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",

    })
    sets.precast.WS['Catastrophe'].SC = set_combine(sets.precast.WS['Catastrophe'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Catastrophe'].PDL, {})
    sets.precast.WS['Savage Blade'].SC = set_combine(sets.precast.WS['Catastrophe'].SC, {})


    sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].Mid = set_combine(sets.precast.WS.Mid, {
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].PDL = set_combine(sets.precast.WS['Spiral Hell'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Spiral Hell'].SC = set_combine(sets.precast.WS['Spiral Hell'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].None = {
    }
sets.precast.WS['Insurgency'] = {
    ammo="Knobkierrie",
    head="Hjarrandi Helm",
    body="Nyame Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Nyame Flanchard",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Balder Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Insurgency'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Insurgency'].Mid = set_combine(sets.precast.WS['Insurgency'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",    })
    sets.precast.WS['Insurgency'].PDL = set_combine(sets.precast.WS['Insurgency'], {
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })

    sets.precast.WS['Insurgency'].SC = set_combine(sets.precast.WS['Insurgency'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},  })
    sets.precast.WS['Insurgency'].None = {}
    sets.precast.WS['Cross Reaper'] = {
        ammo="Knobkierrie",
        head="Hjarrandi Helm",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Cross Reaper'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Cross Reaper'].Mid = set_combine(sets.precast.WS['Cross Reaper'], {
    })
    sets.precast.WS['Cross Reaper'].PDL = set_combine(sets.precast.WS['Cross Reaper'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Cross Reaper'].SC = set_combine(sets.precast.WS['Cross Reaper'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Cross Reaper'].None = {
    }
sets.precast.WS['Quietus'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
} 
sets.precast.WS['Quietus'].Mid = set_combine(sets.precast.WS['Quietus'], {
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
})
sets.precast.WS['Quietus'].PDL = set_combine(sets.precast.WS['Quietus'], {
    head="Heath. Burgeon. +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    right_ring="Sroda Ring",
})
sets.precast.WS['Quietus'].SC = set_combine(sets.precast.WS['Quietus'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Quietus'].None =  {
}
sets.precast.WS['Entropy'] = {
    ammo="Knobkierrie",
    head="Hjarrandi Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    right_ear="Balder Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back="Annealed Mantle",
} 
sets.precast.WS['Entropy'].Mid = set_combine(sets.precast.WS['Entropy'], {})

sets.precast.WS['Entropy'].PDL = set_combine(sets.precast.WS['Entropy'], {
    ammo="Crepuscular Pebble",
    head="Heath. Burgeon. +2",
    neck="Abyssal Beads +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    left_ring="Sroda Ring",
})
sets.precast.WS['Entropy'].SC = set_combine(sets.precast.WS['Entropy'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Entropy'].None =  {}

sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS['Entropy'], {})
sets.precast.WS['Guillotine'].PDL = set_combine(sets.precast.WS['Entropy'].PDL, {})

sets.precast.WS['Infernal Scythe'] = {   
ammo="Pemphredo Tathlum",
head="Pixie Hairpin +1",
body="Nyame Mail",
hands="Nyame Gauntlets",
legs="Nyame Flanchard",
feet="Nyame Sollerets",
neck="Sibyl Scarf",
waist="Orpheus's Sash",
left_ear="Friomisi Earring",
right_ear="Malignance Earring",
left_ring="Archon Ring",
right_ring="Cornelia's Ring",
back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Infernal Scythe'].Dread  = sets.defense['Dread Spikes']
sets.precast.WS['Infernal Scythe'].Mid = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Infernal Scythe'].PDL = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Infernal Scythe'].SC = set_combine(sets.precast.WS['Infernal Scythe'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Infernal Scythe'].None = {}
sets.precast.WS['Shadow of Death'] = set_combine(sets.precast.WS['Infernal Scythe'], {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].Mid = set_combine(sets.precast.WS['Infernal Scythe'], {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].PDL = set_combine(sets.precast.WS['Infernal Scythe'].PDL, {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].SC = set_combine(sets.precast.WS['Infernal Scythe'].SC, {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].None = {}
sets.precast.WS['Dark Harvest'] = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Dark Harvest'].None = {}

sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Freezebite'] = set_combine(sets.precast.WS['Infernal Scythe'], {
    ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
sets.precast.WS['Frostbite'] = set_combine(sets.precast.WS['Infernal Scythe'], {
    ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
sets.precast.WS['Frostbite'].None = {}

sets.precast.WS['Nightmare Scythe'] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Olseni Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}

    sets.precast.WS['Nightmare Scythe'].None = {}

    sets.precast.WS['Resolution'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back="Annealed Mantle",
}
  
    sets.precast.WS['Resolution'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Resolution'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Resolution'].None  = {}

    sets.precast.WS['Sickle Moon'] = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Sickle Moon'].None =  {}

    sets.precast.WS['Ground Strike'] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Abyssal Beads +2",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Lugra Earring +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    } 
    sets.precast.WS['Ground Strike'].Mid = set_combine(sets.precast.WS['Ground Strike'], {
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Ground Strike'].PDL = set_combine(sets.precast.WS['Ground Strike'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Ground Strike'].SC = set_combine(sets.precast.WS['Ground Strike'], {
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Ground Strike'].None =  {}
    sets.precast.WS['Scourge'] = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Scourge'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Scourge'].PDL = set_combine(sets.precast.WS['Torcleaver'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
      
    sets.precast.WS['Torcleaver'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }       
    sets.precast.WS['Torcleaver'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Torcleaver'].Mid = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].PDL = set_combine(sets.precast.WS['Torcleaver'], {
        head="Heath. Burgeon. +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Torcleaver'].SC = set_combine(sets.precast.WS['Torcleaver'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Torcleaver'].None = {}
    sets.precast.WS['Spinning Scythe'] = {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Spinning Scythe'].PDL = set_combine(sets.precast.WS['Spinning Scythe'], {
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        right_ring="Sroda Ring",
})
sets.precast.WS['Spinning Slash'] = set_combine(sets.precast.WS['Spinning Scythe'], {
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Lugra Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",})

sets.precast.WS['Spinning Slash'].SC = set_combine(sets.precast.WS['Spinning Scythe'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Spinning Slash'].PDL = set_combine(sets.precast.WS['Spinning Scythe'], {
    head="Heath. Burgeon. +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    right_ring="Sroda Ring",
})
 
-- Elemental Weapon Skill --elemental_ws-- get from Mote-Mappings

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Cornelia's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

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
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Earth Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Rock Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Starburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Sunburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Flaming Arrow"] = set_combine(sets.precast.WS["Burning Blade"],{})


    --------------------------------------
    -- Midcast sets
    --------------------------------------
  
    sets.midcast.FastRecast = {   
         ammo="Staunch Tathlum +1",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    left_ear="Halasz Earring",
    right_ear="Mendi. Earring",
    right_ring="Evanescence Ring",
}
          
    sets.midcast.Enmity = {
        ammo="Iron Gobbet",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Emet Harness +1", augments={'Path: A',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
        feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Vengeful Ring",
        right_ring="Petrov Ring",
        back="Reiki Cloak",
    }
      
    sets.midcast.Cure = {    ammo="Staunch Tathlum +1",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
    body="Jumalik Mail",
    hands="Macabre Gaunt. +1",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Austerity Belt +1",
    left_ear="Halasz Earring",
    right_ear="Mendi. Earring",
    right_ring="Defending Ring",
    left_ring="Naji's Loop",
    back="Solemnity Cape",}

    sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure,{
    ammo="Pemphredo Tathlum",
    legs="Augury Cuisses",
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    right_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",} )
    
    sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure,{
        ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
    })
    sets.midcast['Dread Spikes'] = {
        ammo="Staunch Tathlum +1",
        head="Ratri Sallet +1",
        body="Heath. Cuirass +2",
        hands="Rat. Gadlings +1",
        legs="Ratri Cuisses +1",
        feet="Rat. Sollerets +1",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
}
    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Ig. Burgeonet +3",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Heath. Sollerets +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Dignitary's Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
    back={ name="Niht Mantle", augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +18',}},
    }
    sets.midcast['Dark Magic'].SIRD = set_combine(sets.SIRD,sets.midcast['Dark Magic'], {
    })
    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum",
        head="Fall. Burgeonet +3",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Rat. Sollerets +1",
        neck="Erra Pendant",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Digni. Earring",
        left_ring="Kishar Ring",
        right_ring="Stikini Ring +1",
        back={ name="Niht Mantle", augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +18',}},
    })
    sets.midcast['Endark'] = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum",
        head="Ig. Burgeonet +3",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Rat. Sollerets +1",
        neck="Erra Pendant",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
      })
      sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        -- neck="Sanctity Necklace",
        -- back="Niht Mantle",
        hands="Pavor Gauntlets",
        neck="Erra Pendant",
        ring1="Evanescence Ring", -- 10
        ring2="Kishar Ring",
        back="Chuparrosa Mantle",
    })
     -- Drain spells 
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        neck="Erra Pendant",
        waist="Austerity Belt +1",
        right_ring="Evanescence Ring",
    })
    sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        neck="Erra Pendant",
        waist="Austerity Belt +1",
        right_ring="Evanescence Ring",
    })
  
    sets.midcast.Drain.Acc = set_combine(sets.midcast['Dark Magic'], {
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        neck="Erra Pendant",
        waist="Austerity Belt +1",
        right_ring="Evanescence Ring",
    })
    sets.midcast.Aspir.Acc = sets.midcast.Drain.Acc
    
    sets.midcast.Phalanx = {
        ammo="Staunch Tathlum +1",
        head={ name="Odyssean Helm", augments={'INT+5','"Cure" potency +8%','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        body="Shab. Cuirass +1",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Incanter's Torque",
        waist="Olympus Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
    } 

    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Nyame Helm",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring="Locus Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Argocham. Mantle",
    }
    sets.midcast['Elemental Magic'].SIRD = set_combine(sets.midcast['Elemental Magic'],sets.SIRD, {
    })
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
        waist="Shinjutsu-no-Obi +1",
        })
    sets.magic_burst = set_combine(sets.midcast['Elemental Magic'], {
        head="Nyame Helm",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        left_ring="Locus Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
  
   sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Dark Magic'], {
    ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Ignominy Cuirass +3",
    hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Nyame Sollerets",
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    })
    sets.midcast['Enfeebling Magic'].SIRD = set_combine(sets.midcast['Enfeebling Magic'],sets.SIRD, {
    })
    sets.midcast['Enhancing Magic'] = {
    head="Befouled Crown",
    body="Shab. Cuirass +1",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
}
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Stone Gorget",
    legs="Haven Hose",
    left_ear="Earthcry Earring",
    waist="Siegel Sash",
})
sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD, {
    neck="Stone Gorget",
    legs="Haven Hose",
    left_ear="Earthcry Earring",
    waist="Siegel Sash",
})

    --------------------------------------
    -- Defense sets
    --------------------------------------

    -- Basic defense sets.
          
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",
        body="Adamantite Armor",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
    }
    sets.defense.Evasion = {
        ammo="Amar Cluster",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    }
sets.defense['Dread Spikes'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ratri Sallet +1",
    body="Heath. Cuirass +2",
    hands="Rat. Gadlings +1",
    legs="Ratri Cuisses +1",
    feet="Rat. Sollerets +1",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

sets.defense.SEboost = {
    ammo="Eluder's Sachet",
    head="Ratri Sallet +1",
    body="Ratri Plate +1",
    hands="Rat. Gadlings +1",
    legs="Ratri Cuisses +1",
    feet="Rat. Sollerets +1",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.MDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ring="Shadow Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.Enmity = {
        sub="Alber Strap",
        ammo="Iron Gobbet",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body="Obviation Cuirass",
        hands="Macabre Gaunt. +1",
        legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
        feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Vengeful Ring",
        right_ring="Petrov Ring",
        back="Reiki Cloak",
    }
    sets.defense.Reraise = set_combine(sets.defense.PDT, {
        ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    head="Crepuscular Helm",
    body="Crepuscular Mail",
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
})
  
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
  
         -- Resting sets
         sets.resting = {
            head=empty,
            body={ name="Lugra Cloak +1", augments={'Path: A',}},
            left_ear="Infused Earring",
            left_ring="Stikini Ring +1",
            right_ring="Stikini Ring +1",
        }
        -- Idle sets
        sets.idle = {
            ammo="Staunch Tathlum +1",
            head={ name="Sakpata's Helm", augments={'Path: A',}},
            body="Sacro Breastplate",
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
            feet={ name="Sakpata's Leggings", augments={'Path: A',}},
            neck={ name="Loricate Torque +1", augments={'Path: A',}},
            waist="Flume Belt +1",
            left_ear="Infused Earring",
            right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
            left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
            right_ring="Defending Ring",
            back="Moonlight Cape",
    }
      
    
        sets.Adoulin = {body="Councilor's Garb"}
        sets.Kiting = {legs="Carmine Cuisses +1"}
        sets.MoveSpeed = {legs="Carmine Cuisses +1"}
    
        sets.idle.Weak = {head="Crepuscular Helm",body="Crepuscular Mail"}
    
          
        sets.idle.Refresh = set_combine(sets.idle, {       
        head=empty,
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        })
        sets.idle.Regen = { 
            ammo="Staunch Tathlum +1",
            head="Crepuscular Helm",
            body="Sacro Breastplate",
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
            feet={ name="Sakpata's Leggings", augments={'Path: A',}},
            neck={ name="Bathy Choker +1", augments={'Path: A',}},
            waist="Flume Belt +1",
            left_ear="Infused Earring",
            right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
            left_ring="Chirich Ring +1",
            right_ring="Defending Ring",
            back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        }
        sets.idle.PDT = {
        ammo="Staunch Tathlum +1",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body="Adamantite Armor",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
    }
    sets.idle.MDT = sets.defense.MDT
    sets.idle.Evasion = sets.defense.Evasion
    sets.idle.HP = sets.defense.HP
    
    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
       ammo="Eluder's Sachet",
       left_ring="Warden's Ring",
       right_ring="Fortified Ring",
       back="Reiki Cloak",
    })
        sets.idle.Sphere = set_combine(sets.idle, {})
      
        sets.idle.Town = {
            legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
            left_ear="Infused Earring",
    }
    --------------------------------------
    -- Engaged sets
    --------------------------------------
      
    sets.engaged ={
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Crepuscular Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    right_ring="Moonlight Ring",
    left_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.Mid = {          
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    right_ring="Moonlight Ring",
    left_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
  
    sets.engaged.STP = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'"Store TP"+7','Accuracy+10','Attack+4',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Ainia Collar",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
sets.engaged.DA = set_combine(sets.engaged, {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Schere Earring",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})
sets.engaged.CRIT = set_combine(sets.engaged, {

    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Thereoid Greaves",
    neck="Nefarious Collar +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})

sets.engaged.PD = set_combine(sets.engaged, {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
})
      
    sets.engaged.MaxAcc = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Sulevia's Mask +2",
        body="Crepuscular Mail",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck={ name="Abyssal Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}

sets.engaged.SubtleBlow = set_combine(sets.engaged, {        
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Dagon Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})
      
      
    -- These only apply when delay is capped.
    sets.engaged.Haste = set_combine(sets.engaged, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
    })
    sets.engaged.Haste.Mid = set_combine(sets.engaged.Mid, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
    })
    sets.engaged.Haste.STP = set_combine(sets.engaged.STP, {
    })
    sets.engaged.Haste.DA = set_combine(sets.engaged.DA, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
    })
    sets.engaged.Haste.CRIT = set_combine(sets.engaged.CRIT, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    })
    sets.engaged.Haste.PD = set_combine(sets.engaged.PD, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
    })
    sets.engaged.Haste.MaxAcc = set_combine(sets.engaged.MaxAcc, {})
  
    sets.engaged.Haste.SubtleBlow = set_combine(sets.engaged.SubtleBlow, {})
      
    sets.engaged.Meva = {      
      ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back="Annealed Mantle",
}
    sets.engaged.DT = set_combine(sets.engaged, {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
})
    
      
    sets.engaged.MaxAcc.Meva = set_combine(sets.engaged.Meva, {})
    sets.engaged.MaxAcc.DT = {ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Annealed Mantle",
}       

    ---------------------------------------- DW-HASTE ------------------------------------------

sets.DW =  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",

}
sets.engaged.DW = set_combine(sets.engaged, sets.DW)

sets.engaged.DW.MaxAcc = set_combine(sets.engaged.MaxAcc, sets.DW)
sets.engaged.DW.STP = set_combine(sets.engaged.STP, sets.DW)
sets.engaged.DW.DA = set_combine(sets.engaged.DA, sets.DW)
sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, sets.DW)

sets.engaged.DW.MaxAcc.Haste = set_combine(sets.engaged.Haste.MaxAcc, sets.DW)
sets.engaged.DW.STP.Haste = set_combine(sets.engaged.Haste.STP, sets.DW)
sets.engaged.DW.DA.Haste = set_combine(sets.engaged.Haste.DA, sets.DW)
sets.engaged.DW.CRIT.Haste = set_combine(sets.engaged.Haste.CRIT, sets.DW)
------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------


sets.engaged.Hybrid = {
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
sets.engaged.MaxAcc.DT = set_combine(sets.engaged.MaxAcc, sets.engaged.Hybrid)
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
sets.engaged.DA.DT = set_combine(sets.engaged.DA, sets.engaged.Hybrid)
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)
sets.engaged.SubtleBlow.DT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid, {
    body="Dagon Breast.",
    left_ring="Defending Ring",
})
sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
sets.engaged.DW.MaxAcc.DT = set_combine(sets.engaged.DW.MaxAcc, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
sets.engaged.DW.DA.DT = set_combine(sets.engaged.DW.DA, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)
   

-- Apocalypse
    sets.engaged.Apocalypse = set_combine(sets.engaged, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'"Store TP"+7','Accuracy+10','Attack+4',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Dedition Earring",
        right_ring="Moonlight Ring",
        left_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    })
    sets.engaged.Apocalypse.STP = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'"Store TP"+7','Accuracy+10','Attack+4',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
   sets.engaged.Apocalypse.DA = set_combine(sets.engaged.Apocalypse, {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1", 
    left_ear="Brutal Earring",
    right_ear="Schere Earring",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})
   sets.engaged.Apocalypse.Mid = {    
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    right_ring="Moonlight Ring",
    left_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}   
    sets.engaged.Apocalypse.CRIT = set_combine(sets.engaged.Apocalypse, {
    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Thereoid Greaves",
    neck="Nefarious Collar +1",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.engaged.Apocalypse.PD = set_combine(sets.engaged.Apocalypse, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    })
    --[[sets.engaged.Apocalypse.DT = set_combine(sets.engaged.Apocalypse, {
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        left_ring="Niqmaddu Ring",
        right_ring="Defending Ring",
    })]]
    sets.engaged.Apocalypse.MaxAcc = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Sulevia's Mask +2",
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.Apocalypse.SubtleBlow = set_combine(sets.engaged.Apocalypse, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body="Dagon Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear="Digni. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.Apocalypse.DreadSP = set_combine(sets.engaged.Apocalypse, {
        body="Heath. Cuirass +2",
    })
    sets.engaged.Apocalypse.MaxAcc.DreadSP = set_combine(sets.engaged.MaxAcc.Apocalypse, {
        body="Heath. Cuirass +2",
    })
    sets.engaged.Apocalypse.STP.DreadSP = set_combine(sets.engaged.STP.Apocalypse, {
        body="Heath. Cuirass +2",
    })
    sets.engaged.Apocalypse.DA.DreadSP = set_combine(sets.engaged.DA.Apocalypse, {
        body="Heath. Cuirass +2",
    })
    sets.engaged.Apocalypse.CRIT.DreadSP = set_combine(sets.engaged.CRIT.Apocalypse, {
        body="Heath. Cuirass +2",
    })
    sets.engaged.Apocalypse.DreadSP.DT = set_combine(sets.engaged.Apocalypse, {
        body="Heath. Cuirass +2",
    })

    sets.engaged.Haste.Apocalypse = set_combine(sets.engaged.Apocalypse, {        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    waist="Ioskeha Belt +1",  })
    sets.engaged.Haste.Apocalypse.Mid = set_combine(sets.engaged.Apocalypse.Mid, {        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    waist="Ioskeha Belt +1",  })
    sets.engaged.Haste.Apocalypse.DA = set_combine(sets.engaged.Apocalypse.DA, {        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    waist="Ioskeha Belt +1",  })
    sets.engaged.Haste.Apocalypse.PD = set_combine(sets.engaged.Apocalypse.PD, {        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    waist="Ioskeha Belt +1",  })   

    sets.engaged.Haste.Apocalypse.STP = set_combine(sets.engaged.STP, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        waist="Ioskeha Belt +1",    })
    sets.engaged.Haste.Apocalypse.CRIT = set_combine(sets.engaged.CRIT, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},})
    sets.engaged.Haste.Apocalypse.MaxAcc = set_combine(sets.engaged.MaxAcc, {})
    sets.engaged.Haste.Apocalypse.SubtleBlow = set_combine(sets.engaged.Apocalypse.SubtleBlow, {
        body="Dagon Breast.",
        left_ring="Defending Ring",
    })


-- Apocalypse
---------------------------------------- Hybrid Sets -------------------------------------------

sets.engaged.Apocalypse.DT = set_combine(sets.engaged.Apocalypse, sets.engaged.Hybrid)
sets.engaged.Apocalypse.MaxAcc.DT = set_combine(sets.engaged.Apocalypse.MaxAcc, sets.engaged.Hybrid)
sets.engaged.Apocalypse.STP.DT = set_combine(sets.engaged.Apocalypse.STP, sets.engaged.Hybrid)
sets.engaged.Apocalypse.DA.DT = set_combine(sets.engaged.Apocalypse.DA, sets.engaged.Hybrid)
sets.engaged.Apocalypse.CRIT.DT = set_combine(sets.engaged.Apocalypse.CRIT, sets.engaged.Hybrid)

sets.engaged.Haste.Apocalypse.DT = set_combine(sets.engaged.Haste.Apocalypse, sets.engaged.Hybrid)
sets.engaged.Haste.Apocalypse.MaxAcc.DT = set_combine(sets.engaged.Haste.Apocalypse.MaxAcc, sets.engaged.Hybrid)
sets.engaged.Haste.Apocalypse.STP.DT = set_combine(sets.engaged.Haste.Apocalypse.STP, sets.engaged.Hybrid)
sets.engaged.Haste.Apocalypse.DA.DT = set_combine(sets.engaged.Haste.Apocalypse.DA, sets.engaged.Hybrid)
sets.engaged.Haste.Apocalypse.CRIT.DT = set_combine(sets.engaged.Haste.Apocalypse.CRIT, sets.engaged.Hybrid)

    sets.engaged.Reraise = set_combine(sets.engaged, {	
	head="Crepuscular Helm",
    body="Crepuscular Mail",})

    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",
    legs="Shabti Cuisses +1",
}
    sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
    sets.Sleep = {neck="Vim Torque +1",left_ear="Infused Earring",}
    sets.RP = {neck="Abyssal Beads +2"}
  
end
  
function job_post_precast(spell, action, spellMap, eventArgs)
    --[[if spell.type == 'WeaponSkill' then
        if world.time >= 17*60 or world.time < 7*60 and player.tp > 2600 then -- Dusk to Dawn time.
            equip({ear1="Lugra Earring +1", ear2="Thrud Earring"})
        end
        if world.time >= 17*60 or world.time < 7*60 then
            equip({ear2="Thrud Earring"})
        end
            if player.tp > 2700 then
            equip({ear1="Lugra Earring +1"})
        end
    end]]
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
  
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Remedy" <me>')
    end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Out of /eq]')
            return
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
    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == "None" then
            equip() 
        end
    end
    if spell.name == 'Impact' then
		equip(sets.precast.FC.Impact)
	end
    if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
end
  
  
  
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end
  
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    --if spell.english:startswith('Drain') then
        --if player.status == 'Engaged' and state.CastingMode.current == 'Normal' and player.hpp < 70 then
            --classes.CustomClass = 'OhShit'
        --end
    --end
    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == "None" then
            equip() 
        end
    end
    if spell.type:lower() == 'weaponskill' then
		if player.tp == 3000 then  -- Replace Moonshade Earring if we're at cap TP
            equip({left_ear="Lugra Earring +1"})
		end
	end
    if (state.HybridMode.current == 'DT' and state.PhysicalDefenseMode.current == 'Reraise') then
        equip(sets.Reraise)
    end
    if spell.skill == 'Elemental Magic' and (state.MagicBurst.value or AEBurst) then
        equip(sets.magic_burst)
        if spell.english == "Impact" then
            equip(sets.midcast.Impact)
        end
    end
    if spell.skill == 'Elemental Magic' then
        if (spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element])) and spellMap ~= 'Helix' then
            equip({waist="Hachirin-no-Obi"})
        -- Target distance under 1.7 yalms.
        elseif spell.target.distance < (1.7 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Matching day and weather.
       elseif (spell.element == world.day_element and spell.element == world.weather_element) and spellMap ~= 'Helix' then
            equip({waist="Hachirin-no-Obi"})
        -- Target distance under 8 yalms.
        elseif spell.target.distance < (8 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Match day or weather.
       elseif (spell.element == world.day_element or spell.element == world.weather_element) and spellMap ~= 'Helix' then
            equip({waist="Hachirin-no-Obi"})
        end
    end
end
  
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    aw_custom_aftermath_timers_aftercast(spell)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
    end
    if not spell.interrupted then
        if spell.english == "Sleep" then
            send_command('timers create "Sleep ' ..tostring(spell.target.name).. ' " 60 down spells/00235.png')
        elseif spell.english == "Sleepga" then
            send_command('timers create "Sleepga ' ..tostring(spell.target.name).. ' " 60 down spells/00273.png')
        elseif spell.english == "Sleep II" then
            send_command('timers create "Sleep II ' ..tostring(spell.target.name).. ' " 90 down spells/00259.png')
        elseif spell.english == "Sleepga II" then
            send_command('timers create "Sleepga II ' ..tostring(spell.target.name).. ' " 90 down spells/00274.png')
        elseif spell.english == 'Impact' then
                send_command('timers create "Impact ' ..tostring(spell.target.name).. ' " 180 down spells/00502.png')
        elseif spell.english == "Bind" then
            send_command('timers create "Bind" 60 down spells/00258.png')
        elseif spell.english == "Break" then
            send_command('timers create "Break Petrification" 33 down spells/00255.png')
        elseif spell.english == "Breakga" then
            send_command('timers create "Breakga Petrification" 33 down spells/00365.png') 
        end
    end
    check_weaponset()
end
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
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

function job_post_aftercast(spell, action, spellMap, eventArgs)
    --if spell.type == 'WeaponSkill' then
        --if state.Buff.Souleater and state.SouleaterMode.value then
            --send_command('@wait 1.0;cancel souleater')
            --enable("head")
        --end
    --end
end
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
    war_sj = player.sub_job == 'WAR' or false
    update_melee_groups()
    update_combat_form()
    user_job_lockstyle()
end
function check_weaponset()
    equip(sets[state.WeaponSet.current])
    equip(sets[state.shield.current])
end
function job_self_command(cmdParams, eventArgs)

end

windower.register_event('hpp change', -- code add from Aragan Asura
function(new_hpp,old_hpp)
    if new_hpp < 5 then
        equip(sets.Reraise)
    end
end
)

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.IdleMode.current == 'Refresh' then
        idleSet = set_combine(idleSet, sets.idle.Refresh)
    end
    if state.IdleMode.current == 'PDT' then
        idleSet = set_combine(idleSet, sets.idle.PDT)
    end
    if state.HybridMode.current == 'PDT' then
        idleSet = set_combine(idleSet, sets.defense.PDT)
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end       

    return idleSet
end
  
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    if state.Buff['Souleater'] then
        meleeSet = set_combine(meleeSet, sets.buff.Souleater)
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Vim Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{neck="Vim Torque +1"})
    end
    
    check_weaponset()

    return meleeSet
end
  
-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
  
-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
    if player.status == "Engaged" then
        if state.LastResortMode.value == true then
            send_command('@input /ja "Last Resort" <me>')
        end
    end
    if player.status == 'Engaged' then
        if state.LastResortMode.value == true then
            if (not buffactive['Last Resort'] and buffactive.hasso) then
                send_command('@input /ja "Last Resort" <me>')
            end
        end
    end
    if player.status == 'Engaged' then
        if not buffactive['Scarlet Delirium'] then
            send_command('@wait 0.5;input /ja "Scarlet Delirium" <me>')
        end
    end
        --    send_command('@wait 1.0;cancel hasso')
        --end
        -- handle weapon sets
    if swordList:contains(player.equipment.main) then
        send_command('input /lockstyleset 152')
    elseif gsList:contains(player.equipment.main) then
        send_command('input /lockstyleset 165')
    end
    if remaWeapons:contains(player.equipment.main) then
        state.CombatWeapon:set(player.equipment.main)
    end
        -- if gsList:contains(player.equipment.main) then
        --     state.CombatWeapon:set("GreatSword")
        -- elseif scytheList:contains(player.equipment.main) then
        --     state.CombatWeapon:set("Scythe")
        -- elseif remaWeapons:contains(player.equipment.main) then
        --     state.CombatWeapon:set(player.equipment.main)
        -- else -- use regular set, which caters to Liberator
        --     state.CombatWeapon:reset()
        -- end
        --elseif newStatus == 'Idle' then
        --    determine_idle_group()
    --end
end
  
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
  
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
    if not buffactive['Scarlet Delirium'] then
        if player.status == 'Engaged' then
            send_command('@wait 0.2;input /ja "Scarlet Delirium" <me>')
        end
    end
    if not buffactive['Last Resort'] then
        if player.status == 'Engaged' then
            send_command('@input /ja "hasso" <me>')	
        end	
    elseif (buffactive['Last Resort'] and buffactive.hasso) then
        if player.status == 'Engaged' then
            send_command('@input /ja "Last Resort" <me>')
            if not midaction() then
                status_change(player.status)
            end
        end
    elseif (not buffactive['Last Resort'] and buffactive.hasso) then
        if player.status == 'Engaged' then
            send_command('@input /ja "Last Resort" <me>')

            if not midaction() then
                status_change(player.status)
            end
        end
    end
    if buff == "Soul Enslavement" then
        if gain then  			
            send_command('input /p "Soul Enslavement" [ON]')		
        else	
            send_command('input /p "Soul Enslavement" [OFF]')
        end
    end
    if buff == "Souleater" then
        if gain then  			
            send_command('input /p "Souleater" [ON]')		
        else	
            send_command('input /p "Souleater" [OFF]')
        end
    end
    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed, please Cursna.')
            send_command('@input /item "Holy Water" <me>')	
             disable('ring1','ring2','waist','neck')
        else
            enable('ring1','ring2','waist','neck')
            send_command('input /p Doom removed.')
            handle_equipping_gear(player.status)
        end
    end
    --[[if buff == "weakness" then
        if gain then
            equip(sets.Reraise)
             disable('body', 'head')
            else
             enable('body', 'head')
        end
        return 
    end]]
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
    if S{'terror','petrification','sleep','stun'}:contains(name) then
        if gain then
            equip(sets.defense.PDT)
        elseif not gain then 
            handle_equipping_gear(player.status)
        end
    end
    if name == 'sleep' then
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
    if buff == "poison" then
        if gain then  
        send_command('input /item "remedy" <me>')
        end
    end
    if S{'haste', 'march', 'embrava', 'geo-haste', 'indi-haste', 'last resort'}:contains(buff:lower()) then
        if (buffactive['Last Resort']) then
            if (buffactive.embrava or buffactive.haste) and buffactive.march then
                state.CombatForm:set("Haste")
                if not midaction() then
                    handle_equipping_gear(player.status)
                end
            end
        else
            if state.CombatForm.current ~= 'DW' and state.CombatForm.current ~= 'SW' then
                state.CombatForm:reset()
            end
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        end
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
    -- Drain II/III HP Boost. Set SE to stay on.
    -- if buff == "Max HP Boost" and state.SouleaterMode.value then
    --     if gain or buffactive['Max HP Boost'] then
    --         state.SouleaterMode:set(false)
    --     else
    --         state.SouleaterMode:set(true)
    --     end
    -- end
    -- Make sure SE stays on for BW
    if buff == 'Blood Weapon' and state.SouleaterMode.value then
        if gain or buffactive['Blood Weapon'] then
            state.SouleaterMode:set(false)
        else
            state.SouleaterMode:set(true)
        end
    end
    -- AM custom groups
    if buff:startswith('Aftermath') then
        if player.equipment.main == 'Liberator' then
            classes.CustomMeleeGroups:clear()
  
            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '-------------Mythic AM3 UP-------------')
            -- elseif (buff == "Aftermath: Lv.3" and not gain) then
            --     add_to_chat(8, '-------------Mythic AM3 DOWN-------------')
            end
  
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        else
            classes.CustomMeleeGroups:clear()
  
            if buff == "Aftermath" and gain or buffactive.Aftermath then
                classes.CustomMeleeGroups:append('AM')
            end
  
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        end
    end
      
    -- if  buff == "Samurai Roll" then
    --     classes.CustomRangedGroups:clear()
    --     if (buff == "Samurai Roll" and gain) or buffactive['Samurai Roll'] then
    --         classes.CustomRangedGroups:append('SamRoll')
    --     end
         
    -- end
  
    --if buff == "Last Resort" then
    --    if gain then
    --        send_command('@wait 1.0;cancel hasso')
    --    else
    --        if not midaction() then
    --            send_command('@wait 1.0;input /ja "Hasso" <me>')
    --        end
    --    end
    --end
    if not midaction() then
        job_update()
    end
end
function check_buffs(check)
     
end
  
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
  
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    check_weaponset()
    get_combat_form()
    --handle_equipping_gear(player.status)
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
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
function update_melee_groups()
    classes.CustomMeleeGroups:clear()

end
-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end
-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
--function th_action_check(category, param)
--    if category == 2 or -- any ranged attack
--        --category == 4 or -- any magic action
--        (category == 3 and param == 30) or -- Aeolian Edge
--        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
--        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
--        then 
--            return true
--    end
--end
-- function get_custom_wsmode(spell, spellMap, default_wsmode)
--     if state.OffenseMode.current == 'Mid' then
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3Mid'
--         end
--     elseif state.OffenseMode.current == 'MaxAcc' then
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3MaxAcc'
--         end
--     else
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3'
--         end
--     end
-- end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function get_combat_form()
    --[[if swordList:contains(player.equipment.main) then
        send_command('input /lockstyleset 152')
    elseif gsList:contains(player.equipment.main) then
        send_command('input /lockstyleset 165')
    end]]
    if S{'NIN', 'DNC'}:contains(player.sub_job) and swordList:contains(player.equipment.sub) then
        state.CombatForm:set("DW")
    elseif player.equipment.sub == '' or player.equipment.sub == 'Blurred Shield +1' then
        state.CombatForm:set("SW")
    elseif buffactive['Last Resort'] then
        if (buffactive.embrava or buffactive.haste) and buffactive.march then
            --add_to_chat(8, '-------------Delay Capped-------------')
            state.CombatForm:set("Haste")
        else
            state.CombatForm:reset()
        end
    else
        state.CombatForm:reset()
    end
end
  
function get_combat_weapon()
    state.CombatWeapon:reset()
    if remaWeapons:contains(player.equipment.main) then
        state.CombatWeapon:set(player.equipment.main)
    end
    -- if remaWeapons:contains(player.equipment.main) then
    --     state.CombatWeapon:set(player.equipment.main)
    -- elseif gsList:contains(player.equipment.main) then
    --     state.CombatWeapon:set("GreatSword")
    -- elseif scytheList:contains(player.equipment.main) then
    --     state.CombatWeapon:set("Scythe")
    -- end

end
  
function aw_custom_aftermath_timers_precast(spell)
    if spell.type == 'WeaponSkill' then
        info.aftermath = {}
  
        local mythic_ws = "Insurgency"
  
        info.aftermath.weaponskill = mythic_ws
        info.aftermath.duration = 0
  
        info.aftermath.level = math.floor(player.tp / 1000)
        if info.aftermath.level == 0 then
            info.aftermath.level = 1
        end
  
        if spell.english == mythic_ws and player.equipment.main == 'Liberator' then
            -- nothing can overwrite lvl 3
            if buffactive['Aftermath: Lv.3'] then
                return
            end
            -- only lvl 3 can overwrite lvl 2
            if info.aftermath.level ~= 3 and buffactive['Aftermath: Lv.2'] then
                return
            end
  
            if info.aftermath.level == 1 then
                info.aftermath.duration = 90
            elseif info.aftermath.level == 2 then
                info.aftermath.duration = 120
            else
                info.aftermath.duration = 180
            end
        end
    end
end
  
-- Call from job_aftercast() to create the custom aftermath timer.
function aw_custom_aftermath_timers_aftercast(spell)
    if not spell.interrupted and spell.type == 'WeaponSkill' and
        info.aftermath and info.aftermath.weaponskill == spell.english and info.aftermath.duration > 0 then
  
        local aftermath_name = 'Aftermath: Lv.'..tostring(info.aftermath.level)
        send_command('timers d "Aftermath: Lv.1"')
        send_command('timers d "Aftermath: Lv.2"')
        send_command('timers d "Aftermath: Lv.3"')
        send_command('timers c "'..aftermath_name..'" '..tostring(info.aftermath.duration)..' down abilities/aftermath'..tostring(info.aftermath.level)..'.png')
  
        info.aftermath = {}
    end
end
function sub_job_change(new,old)
    if user_setup then
        user_setup()
        send_command('wait 6;input /lockstyleset 165')
    end
end

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


function user_job_lockstyle()
    if newStatus == "Idle" then
        if gsList:contains(player.equipment.main) then
            windower.chat.input('/lockstyleset 165')
        else
            windower.chat.input('/lockstyleset 152')
        end
    end
end
function select_default_macro_book()
      
    --if scytheList:contains(player.equipment.main) then
        --set_macro_page(7, 21)
   -- elseif gsList:contains(player.equipment.main) then
   if player.sub_job == 'WAR' then
        set_macro_page(7, 21)
    elseif player.sub_job == 'SAM' then
        set_macro_page(7, 21)
    else
        set_macro_page(7, 21)
    end
end

function update_combat_form()

end
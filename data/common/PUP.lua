-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--  __  __           _                     __   _____                        _
-- |  \/  |         | |                   / _| |  __ \                      | |
-- | \  / | __ _ ___| |_ ___ _ __    ___ | |_  | |__) |   _ _ __  _ __   ___| |_ ___
-- | |\/| |/ _` / __| __/ _ \ '__|  / _ \|  _| |  ___/ | | | '_ \| '_ \ / _ \ __/ __|
-- | |  | | (_| \__ \ ||  __/ |    | (_) | |   | |   | |_| | |_) | |_) |  __/ |_\__ \
-- |_|  |_|\__,_|___/\__\___|_|     \___/|_|   |_|    \__,_| .__/| .__/ \___|\__|___/
--                                                         | |   | |
--                                                         |_|   |_|
-----------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------


-- Initialization function for this job file.
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include("Mote-Include.lua")
    include('organizer-lib')
    send_command('wait 6;input /lockstyleset 160')
end

function user_setup()
    -- Alt-F10 - Toggles Kiting Mode.

    --[[
        F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
        
        These are for when you are fighting with or without Pet
        When you are IDLE and Pet is ENGAGED that is handled by the Idle Sets
    ]]
    state.OffenseMode:options("MasterPet", "Master", "Trusts")

    --[[
        Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
        
        Used when you are Engaged with Pet
        Used when you are Idle and Pet is Engaged
    ]]
    state.HybridMode:options("Normal", "Acc", "MaxAcc", "TP", "MaxTP", "Empy", "DT", "Regen", "Ranged")

    --[[
        Alt-F12 - Turns off any emergency mode
        
        Ctrl-F10 - Cycle type of Physical Defense Mode in use.
        F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    ]]
    state.PhysicalDefenseMode:options("PetDT", "MasterDT")

    --[[
        Alt-F12 - Turns off any emergency mode

        F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    ]]
    state.MagicalDefenseMode:options("PetMDT")

    --[[ IDLE Mode Notes:

        F12 - Update currently equipped gear, and report current status.
        Ctrl-F12 - Cycle Idle Mode.
        
        Will automatically set IdleMode to Idle when Pet becomes Engaged and you are Idle
    ]]
    state.IdleMode:options("Idle", "MasterDT", "Sphere")

    --Various Cycles for the different types of PetModes
    state.PetStyleCycleTank = M {"NORMAL", "DD", "MAGIC", "SPAM"}
    state.PetStyleCycleMage = M {"NORMAL", "HEAL", "SUPPORT", "MB", "DD"}
    state.PetStyleCycleDD = M {"NORMAL", "BONE", "SPAM", "OD", "ODACC"}

    --The actual Pet Mode and Pet Style cycles
    --Default Mode is Tank
    state.PetModeCycle = M {"DD", "TANK", "MAGE"}
    --Default Pet Cycle is Tank
    state.PetStyleCycle = state.PetStyleCycleDD

    --Toggles
    --[[
        Alt + E will turn on or off Auto Maneuver
    ]]
    state.AutoMan = M(true, "Auto Maneuver")

    --[[
        //gs c toggle autodeploy
    ]]
    state.AutoDeploy = M(false, "Auto Deploy")

    --[[
        Alt + D will turn on or off Lock Pet DT
        (Note this will block all gearswapping when active)
    ]]
    state.LockPetDT = M(false, "Lock Pet DT")

    --[[
        Alt + (tilda) will turn on or off the Lock Weapon
    ]]
    state.LockWeapon = M(false, "Lock Weapon")

    --[[
        //gs c toggle setftp
    ]]
    state.SetFTP = M(true, "Set FTP")

   --[[
        This will hide the entire HUB
        //gs c hub all
    ]]
    state.textHideHUB = M(false, "Hide HUB")

    --[[
        This will hide the Mode on the HUB
        //gs c hub mode
    ]]
    state.textHideMode = M(false, "Hide Mode")

    --[[
        This will hide the State on the HUB
        //gs c hub state
    ]]
    state.textHideState = M(false, "Hide State")

    --[[
        This will hide the Options on the HUB
        //gs c hub options
    ]]
    state.textHideOptions = M(false, "Hide Options")

    --[[
        This will toggle the HUB lite mode
        //gs c hub lite
    ]]  
    state.useLightMode = M(false, "Toggles Lite mode")

    --[[
        This will toggle the default Keybinds set up for any changeable command on the window
        //gs c hub keybinds
    ]]
    state.Keybinds = M(false, "Hide Keybinds")

    --[[ 
        This will toggle the CP Mode 
        //gs c toggle CP 
    ]] 
    state.CP = M(false, "CP") 
    CP_CAPE =  ""

    --[[
        Enter the slots you would lock based on a custom set up.
        Can be used in situation like Salvage where you don't want
        certain pieces to change.

        //gs c toggle customgearlock
        ]]
    state.CustomGearLock = M(false, "Custom Gear Lock")
    --Example customGearLock = T{"head", "waist"}
    customGearLock = T{}

    send_command("bind !f7 gs c cycle PetModeCycle")
    send_command("bind ^f7 gs c cycleback PetModeCycle")
    send_command("bind !f8 gs c cycle PetStyleCycle")
    send_command("bind ^f8 gs c cycleback PetStyleCycle")
    send_command("bind !e gs c toggle AutoMan")
    send_command("bind !d gs c toggle LockPetDT")
    send_command("bind !f6 gs c predict")
    send_command("bind ^` gs c toggle LockWeapon")
    send_command("bind home gs c toggle setftp")
    send_command("bind PAGEUP gs c toggle autodeploy")
    send_command("bind PAGEDOWN gs c hide keybinds")
    send_command("bind @c gs c toggle CP") 
    send_command('bind @x gs c toggle RP')  
    send_command("bind = gs c clear")
    send_command('wait 6;input /lockstyleset 160')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind f1 gs c cycle HippoMode')
    --send_command('bind delete gs c toggle setftp')
	state.RP = M(false, "Reinforcement Points Mode")

    state.HippoMode = M(false, "hippoMode")
	state.WeaponskillMode:options('Normal', 'PDL', 'SC')

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
    select_default_macro_book()

    -- Adjust the X (horizontal) and Y (vertical) position here to adjust the window
    pos_x = 0
    pos_y = 0
    setupTextWindow(pos_x, pos_y)
    
end

function file_unload()
    send_command("unbind !f7")
    send_command("unbind ^f7")
    send_command("unbind !f8")
    send_command("unbind ^f8")
    send_command("unbind !e")
    send_command("unbind !d")
    send_command("unbind !f6")
    send_command("unbind ^`")
    send_command("unbind home")
    send_command("unbind PAGEUP")
    send_command("unbind PAGEDOWN")       
    send_command("unbind end")
    send_command("unbind =")

end

function job_setup()
    include("PUP-LIB.lua")
    include('Mote-TreasureHunter')
    send_command('wait 2;input /lockstyleset 160')
    state.Moving  = M(false, "moving")
    sub_job_change()
    
    elemental_ws = S{"Flash Nova", "Sanguine Blade","Seraph Blade","Burning Blade","Red Lotus Blade"
    , "Shining Strike", "Aeolian Edge", "Gust Slash", "Cyclone","Energy Steal","Energy Drain"
    , "Leaden Salute", "Wildfire", "Hot Shot", "Flaming Arrow", "Trueflight", "Blade: Teki", "Blade: To"
    , "Blade: Chi", "Blade: Ei", "Blade: Yu", "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter"
    , "Primal Rend", "Dark Harvest", "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust"
    , "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki", "Rock Crusher", "Earth Crusher", "Starburst"
    , "Sunburst", "Omniscience", "Garland of Bliss"}
end

function init_gear_sets()
    --Table of Contents
    ---Gear Variables
    ---Master Only Sets
    ---Hybrid Only Sets
    ---Pet Only Sets
    ---Misc Sets
    Animators = {"Animator P +1", "Animator P II +1", "Neo Animator",}
    Animators.Range = "Animator P II +1"
    Animators.Melee = "Animator P +1"

   
        organizer_items = {
            "Kustawi +1",
            "Airmid's Gorget",
            "Moogle Amp.",
            "Mafic Cudgel",
            "Varga Purnikawa",
            "Sakpata's Fists",
            "Automat. Oil +3",
            "Dawn Mulsum",   
            "Gyudon",
            "Reraiser",
            "Hi-Reraiser",
            "Vile Elixir",
            "Vile Elixir +1",
            "Miso Ramen",
            "Carbonara",
            "Silent Oil",
            "Bean Daifuku",
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
            "Wh. Rarab Cap +1",
            "Emporox's Ring",
            "Red Curry Bun",
            "Instant Reraise",
            "Black Curry Bun",
            "Rolan. Daifuku",
            "Grape Daifuku",
            "Qutrub Knife",
            "Wind Knife +1",
            "Reraise Earring",}
    -------------------------------------------------------------------------
    --  _____                  __      __        _       _     _
    -- / ____|                 \ \    / /       (_)     | |   | |
    --| |  __  ___  __ _ _ __   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___
    --| | |_ |/ _ \/ _` | '__|   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
    --| |__| |  __/ (_| | |       \  / (_| | |  | | (_| | |_) | |  __/\__ \
    -- \_____|\___|\__,_|_|        \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
    -------------------------------------------------------------------------
    --[[
        This section is best ultilized for defining gear that is used among multiple sets
        You can simply use or ignore the below
    ]]
   

    --Adjust to your reforge level
    --Sets up a Key, Value Pair
    Artifact_Foire = {}
    Artifact_Foire.Head_PRegen = "Foire Taj +1"
    Artifact_Foire.Body_WSD_PTank = "Foire Tobe +1"
    Artifact_Foire.Hands_Mane_Overload = "Foire Dastanas +3"
    Artifact_Foire.Legs_PCure = "Foire Churidars +1"
    Artifact_Foire.Feet_Repair_PMagic = "Foire Babouches +1"

    Relic_Pitre = {}
    Relic_Pitre.Head_PRegen = "Pitre Taj +3" --Enhances Optimization
    Relic_Pitre.Body_PTP = "Pitre Tobe +3" --Enhances Overdrive
    Relic_Pitre.Hands_WSD = "Pitre Dastanas +2" --Enhances Fine-Tuning
    Relic_Pitre.Legs_PMagic = "Pitre Churidars +2" --Enhances Ventriloquy
    Relic_Pitre.Feet_PMagic = "Pitre Babouches +1" --Role Reversal

    Empy_Karagoz = {}
    Empy_Karagoz.Head_PTPBonus = "Kara. Cappello +2"
    Empy_Karagoz.Body_Overload = "Karagoz Farsetto +2"
    Empy_Karagoz.Hands = "Karagoz Guanti +2"
    Empy_Karagoz.Legs_Combat = "Karagoz Pantaloni +2"
    Empy_Karagoz.Feet_Tatical = "Karagoz Scarpe +2"

    Visucius = {}
    Visucius.PetDT = {
      
        
    }
    Visucius.PetMagic = {
   
        
    }

    --------------------------------------------------------------------------------
    --  __  __           _               ____        _          _____      _
    -- |  \/  |         | |             / __ \      | |        / ____|    | |
    -- | \  / | __ _ ___| |_ ___ _ __  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- | |\/| |/ _` / __| __/ _ \ '__| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  | | (_| \__ \ ||  __/ |    | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|  |_|\__,_|___/\__\___|_|     \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                                  __/ |
    --                                                 |___/
    ---------------------------------------------------------------------------------
    --This section is best utilized for Master Sets
    --[[
        Will be activated when Pet is not active, otherwise refer to sets.idle.Pet
    ]]

    -- neck JSE Necks Reinforcement Points Mode add u neck here 
	sets.RP = {}

    sets.idle = {       
    head="Malignance Chapeau",
    body="Adamantite Armor",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Odnowa Earring",
    left_ring="Warden's Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape", }
    
    sets.idle.Sphere = set_combine(sets.idle, {
        body="Annoint. Kalasiris",
    })
    -------------------------------------Fastcast
    sets.precast.FC = {
        head={ name="Herculean Helm", augments={'Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: "Store TP"+11','Pet: CHR+2','Pet: "Mag.Atk.Bns."+8',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet={ name="Regal Pumps +1", augments={'Path: A',}},
        neck="Orunmila's Torque",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Rahab Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
        legs="Doyen Pants",
        left_ear="Mendi. Earring",
    })
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs="Doyen Pants",
        waist="Siegel Sash",})

    -------------------------------------Midcast
    sets.midcast = {} --Can be left empty

    sets.midcast.FastRecast = {}
    sets.midcast['Healing Magic'] = {
        feet={ name="Regal Pumps +1", augments={'Path: A',}},
        neck="Reti Pendant",
        waist="Luminary Sash",
        left_ear="Mendi. Earring",
        right_ear="Enmerkar Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Naji's Loop",
        back="Solemnity Cape",
    }
    sets.midcast['Enhancing Magic'] = {
        feet={ name="Regal Pumps +1", augments={'Path: A',}},
        neck="Incanter's Torque",
        waist="Olympus Sash",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Stone Gorget",
	    legs="Haven Hose",
        left_ear="Earthcry Earring",
        waist="Siegel Sash",
    })
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})

    sets.midcast['Enfeebling Magic'] = {
        main={ name="Xiucoatl", augments={'Path: C',}},
        body={ name="Cohort Cloak +1", augments={'Path: A',}},
        hands="Karagoz Guanti +2",
        legs="Kara. Pantaloni +2",
        feet="Karagoz Scarpe +2",
        neck="Incanter's Torque",
        waist="Rumination Sash",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.midcast['Elemental Magic'] = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Stikini Ring +1",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Argocham. Mantle",
	}
    sets.midcast['Divine Magic'] = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Incanter's Torque",
        waist="Skrymir Cord",
        left_ear="Crematio Earring",
        right_ear="Hecate's Earring",
        left_ring="Stikini Ring +1",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.midcast['Blue Magic'] = { 
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        neck="Incanter's Torque",
        waist="Eschan Stone",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.TreasureHunter = { 
        --ammo="Per. Lucky Egg",
        head="White rarab cap +1", 
        waist="Chaac Belt",
     }

    -------------------------------------Kiting
    sets.Kiting = {feet="Hermes' Sandals +1",}
    sets.MoveSpeed = {feet="Hermes' Sandals +1",}
    sets.Adoulin = {body="Councilor's Garb",}

    -------------------------------------JA
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads", body="Passion Jacket"})

    -- Precast sets to enhance JAs
    sets.precast.JA = {} -- Can be left empty

    sets.precast.JA["Tactical Switch"] = {feet = Empy_Karagoz.Feet_Tatical}

    sets.precast.JA["Ventriloquy"] = {legs = Relic_Pitre.Legs_PMagic}

    sets.precast.JA["Role Reversal"] = {feet = Relic_Pitre.Feet_PMagic}

    sets.precast.JA["Overdrive"] = {body = Relic_Pitre.Body_PTP}

    sets.precast.JA["Repair"] = {
        right_ear="Pratik Earring",
        ammo = "Automat. Oil +3",
        feet = Artifact_Foire.Feet_Repair_PMagic
    }

    sets.precast.JA["Maintenance"] = set_combine(sets.precast.JA["Repair"], { hands="Foire Dastanas +3",})

    sets.precast.JA.Maneuver = {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        body = "Karagoz Farsetto +2",
        hands="Foire Dastanas +3",
        back = "Visucius's Mantle",
        ear1 = "Burana Earring"
    }

    sets.precast.JA["Activate"] = {range="Animator P +1",
        feet="Mpaca's Boots",
    right_ear="Kara. Earring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }

    sets.precast.JA["Deus Ex Automata"] = sets.precast.JA["Activate"]

    sets.precast.JA["Provoke"] = {}

    --Waltz set (chr and vit)
    sets.precast.Waltz = {
        body="Passion Jacket",
    }

    sets.precast.Waltz["Healing Waltz"] = {
        body="Passion Jacket",
    }
    sets.precast.Step = {    
        head="Kara. Cappello +2",
        body="Kara. Farsetto +2",
        hands="Karagoz Guanti +2",
    legs="Kara. Pantaloni +2",
    feet="Karagoz Scarpe +2",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

sets.precast.RA = {ammo=empty,
head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
left_ear="Crep. Earring",
right_ear="Telos Earring",
}
    sets.midcast.RA = {ammo=empty,
    range="Trollbane",  }

    -------------------------------------WS
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        head="Kara. Cappello +2",
        legs="Malignance Tights",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS.SC = set_combine(sets.precast.WS, {
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Stringing Pummel"] = {    
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS["Stringing Pummel"].PDL = set_combine(sets.precast.WS["Stringing Pummel"], {
        head="Kara. Cappello +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Asuran Fists"] = {    
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS["Asuran Fists"].PDL = set_combine(sets.precast.WS["Asuran Fists"], {
        head="Kara. Cappello +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Victory Smite"] = {    
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        right_ear="Brutal Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS["Victory Smite"].PDL = set_combine(sets.precast.WS["Victory Smite"], {
        head="Kara. Cappello +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Victory Smite"].SC = set_combine(sets.precast.WS["Victory Smite"], {
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })

    sets.precast.WS["Shijin Spiral"] = { 
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Mpaca's Boots",
            neck="Fotia Gorget",
            waist="Moonbow Belt +1",
            left_ear="Brutal Earring",
            left_ear="Mache Earring +1",
            left_ring="Niqmaddu Ring",
            right_ring="Gere Ring",
            back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS["Shijin Spiral"].PDL = set_combine(sets.precast.WS["Shijin Spiral"], {
        head="Kara. Cappello +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        left_ring="Sroda Ring",
    })

    sets.precast.WS["Aeolian Edge"] = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        right_ring="Cornelia's Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Sacro Mantle",
    }

    sets.precast.WS["Howling Fist"] = {    
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.precast.WS["Howling Fist"].PDL = set_combine(sets.precast.WS["Howling Fist"], {
        head="Kara. Cappello +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Tornado Kick"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Tornado Kick"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["Dragon Kick"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Dragon Kick"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["Raging Fists"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Raging Fists"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["Combo"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Combo"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["Spinning Attack"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Spinning Attack"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["One Inch Punch"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["One Inch Punch"].PDL = sets.precast.WS["Victory Smite"].PDL

    sets.precast.WS["Shoulder Tackle"] = sets.precast.WS["One Inch Punch"]
    sets.precast.WS["Shoulder Tackle"].PDL = sets.precast.WS["One Inch Punch"].PDL

    sets.precast.WS["Backhand Blow"] = sets.precast.WS["Victory Smite"]
    sets.precast.WS["Backhand Blow"].PDL = sets.precast.WS["Victory Smite"].PDL
    sets.precast.WS['Evisceration'] = sets.precast.WS["Stringing Pummel"]


    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}

    sets.Enmity = {
        body="Passion Jacket",
        hands="Kurys Gloves",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Petrov Ring",
        right_ring="Vengeful Ring",
    }

    -------------------------------------Idle
    --[[
        Pet is not active
        Idle Mode = MasterDT
    ]]
    sets.idle.MasterDT = {
        main="Tauret",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back="Moonlight Cape",
    }

    -------------------------------------Engaged
    --[[
        Offense Mode = Master
        Hybrid Mode = Normal
    ]]
    sets.engaged.Master = {
        ammo="Automat. Oil +3",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Lissome Necklace",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Balder Earring +1",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},    }

    -------------------------------------Acc
    --[[
        Offense Mode = Master
        Hybrid Mode = Acc
    ]]
    sets.engaged.Master.Acc = {    
        ammo="Automat. Oil +3",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Mache Earring +1",
        right_ear="Kara. Earring +1",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},    }

    -------------------------------------TP
    --[[
        Offense Mode = Master
        Hybrid Mode = TP
    ]]
    sets.engaged.Master.TP = {    
        ammo="Automat. Oil +3",
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands={ name="Herculean Gloves", augments={'"Triple Atk."+4',}},
        legs={ name="Ryuo Hakama", augments={'Accuracy+20','"Store TP"+4','Phys. dmg. taken -3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Kara. Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},    }

    -------------------------------------DT
    --[[
        Offense Mode = Master
        Hybrid Mode = DT
    ]]
    sets.engaged.Master.DT = {     

    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Balder Earring +1",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},    }
    
    sets.engaged.Master.Regen = {   
    
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Balder Earring +1",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},        
        }

    ----------------------------------------------------------------------------------
    --  __  __         _           ___     _     ___      _
    -- |  \/  |__ _ __| |_ ___ _ _| _ \___| |_  / __| ___| |_ ___
    -- | |\/| / _` (_-<  _/ -_) '_|  _/ -_)  _| \__ \/ -_)  _(_-<
    -- |_|  |_\__,_/__/\__\___|_| |_| \___|\__| |___/\___|\__/__/
    -----------------------------------------------------------------------------------

    --[[
        These sets are designed to be a hybrid of player and pet gear for when you are
        fighting along side your pet. Basically gear used here should benefit both the player
        and the pet.
    ]]
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Normal
    ]]
    sets.engaged.MasterPet = {
        ammo="Automat. Oil +3",  
      head="Heyoka Cap +1",
    body="Mpaca's Doublet",
    hands="Karagoz Guanti +2",
    legs="Heyoka Subligar +1",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Balder Earring +1",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  }

    -------------------------------------Acc
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Acc
    ]]
    sets.engaged.MasterPet.Acc = {
    head="Kara. Cappello +2",
    body="Malignance Tabard",
    hands="Karagoz Guanti +2",
    legs="Kara. Pantaloni +2",
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},    }

    -------------------------------------TP
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = TP
    ]]
    sets.engaged.MasterPet.TP = {
        
        ammo="Automat. Oil +3",
        head="Heyoka Cap +1",
        hands="Karagoz Guanti +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Mache Earring +1",
        right_ear="Balder Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},    }

    -------------------------------------DT
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = DT
    ]]
    sets.engaged.MasterPet.DT = {
       -- Add your set here 
    }

    -------------------------------------Regen
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Regen
    ]]
    sets.engaged.MasterPet.Regen = {
        
        ammo="Automat. Oil +3",      
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands="Karagoz Guanti +2",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Kara. Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},    }

    ----------------------------------------------------------------
    --  _____     _      ____        _          _____      _
    -- |  __ \   | |    / __ \      | |        / ____|    | |
    -- | |__) |__| |_  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- |  ___/ _ \ __| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  |  __/ |_  | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|   \___|\__|  \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                  __/ |
    --                                 |___/
    ----------------------------------------------------------------

    -------------------------------------Magic Midcast
    sets.midcast.Pet = {
       -- Add your set here 
    }

    sets.midcast.Pet.Cure = {
        legs={ name="Pitre Churidars +3", augments={'Enhances "Ventriloquy" effect',}},
        feet={ name="Pitre Babouches +3", augments={'Enhances "Role Reversal" effect',}},    }

    sets.midcast.Pet["Healing Magic"] = {
        legs={ name="Pitre Churidars +3", augments={'Enhances "Ventriloquy" effect',}},
        feet={ name="Pitre Babouches +3", augments={'Enhances "Role Reversal" effect',}},    }

    sets.midcast.Pet["Elemental Magic"] = {
        head={ name="Herculean Helm", augments={'Pet: "Mag.Atk.Bns."+26','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2',}},
        body="Udug Jacket",
    hands={ name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Store TP"+6','Pet: DEX+1',}},
    legs={ name="Pitre Churidars +3", augments={'Enhances "Ventriloquy" effect',}},
    feet={ name="Pitre Babouches +3", augments={'Enhances "Role Reversal" effect',}},
    neck="Adad Amulet",
    waist="Ukko Sash",
    left_ear="Enmerkar Earring",
    right_ear="Kara. Earring +1",
    left_ring="C. Palug Ring",
    right_ring="Tali'ah Ring",
    back="Argocham. Mantle",
     }

    sets.midcast.Pet["Enfeebling Magic"] = {
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Adad Amulet",
        waist="Ukko Sash",
        left_ear="Kyrene's Earring",
        right_ear="Enmerkar Earring",
        left_ring="C. Palug Ring",
        right_ring="Tali'ah Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},    }

    sets.midcast.Pet["Dark Magic"] = {
        head={ name="Herculean Helm", augments={'Pet: "Mag.Atk.Bns."+26','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2',}},
        	body="Udug Jacket",
        hands={ name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Store TP"+6','Pet: DEX+1',}},
        legs={ name="Pitre Churidars +3", augments={'Enhances "Ventriloquy" effect',}},
        feet={ name="Pitre Babouches +3", augments={'Enhances "Role Reversal" effect',}},
        neck="Adad Amulet",
        waist="Ukko Sash",
        left_ear="Kyrene's Earring",
        right_ear="Enmerkar Earring",
        left_ring="C. Palug Ring",
        right_ring="Tali'ah Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},     }

    sets.midcast.Pet["Divine Magic"] = {
       -- Add your set here 
    }

    sets.midcast.Pet["Enhancing Magic"] = {
       -- Add your set here 
    }

    -------------------------------------Idle
    --[[
        This set will become default Idle Set when the Pet is Active 
        and sets.idle will be ignored
        Player = Idle and not fighting
        Pet = Idle and not fighting

        Idle Mode = Idle
    ]]
    sets.idle.Pet = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Odnowa Earring",
        left_ring="Warden's Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",  }

    --[[
        If pet is active and you are idle and pet is idle
        Player = idle and not fighting
        Pet = idle and not fighting

        Idle Mode = MasterDT
    ]]
    sets.idle.Pet.MasterDT = {
    
    ammo="Automat. Oil +3",
    head={ name="Herculean Helm", augments={'Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: "Store TP"+11','Pet: CHR+2','Pet: "Mag.Atk.Bns."+8',}},
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+25','Pet: "Store TP"+11','Pet: VIT+9','Pet: Attack+14 Pet: Rng.Atk.+14','Pet: "Mag.Atk.Bns."+5',}},
    legs={ name="Herculean Trousers", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Store TP"+11',}},
    feet={ name="Herculean Boots", augments={'Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: "Store TP"+11','Pet: MND+2','Pet: "Mag.Atk.Bns."+13',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1 +1",
    right_ring="Varar Ring +1 +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }

    -------------------------------------Enmity
    sets.pet = {} -- Not Used

    --Equipped automatically
    sets.pet.Enmity = {
       -- Add your set here 
    }

    --[[
        Activated by Alt+D or
        F10 if Physical Defense Mode = PetDT
    ]]
    sets.pet.EmergencyDT = {
    
        main={ name="Xiucoatl", augments={'Path: C',}},
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head="Kara. Cappello +2",
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands="Mpaca's Gloves",
    legs="Kara. Pantaloni +2",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Kara. Earring +1",
    left_ring="Thurandaut Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }

    -------------------------------------Engaged for Pet Only
    --[[
      For Technical Users - This is layout of below
      sets.idle[idleScope][state.IdleMode][ Pet[Engaged] ][CustomIdleGroups] 

      For Non-Technical Users:
      If you the player is not fighting and your pet is fighting the first set that will activate is sets.idle.Pet.Engaged
      You can further adjust this by changing the HyrbidMode using Ctrl+F9 to activate the Acc/TP/DT/Regen/Ranged sets
    ]]
    --[[
        Idle Mode = Idle
        Hybrid Mode = Normal
    ]]
    sets.idle.Pet.Engaged = {                main={ name="Xiucoatl", augments={'Path: C',}},

    ammo="Automat. Oil +3",
          head={ name="Herculean Helm", augments={'Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: "Store TP"+11','Pet: CHR+2','Pet: "Mag.Atk.Bns."+8',}},
         body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
         hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+25','Pet: "Store TP"+11','Pet: VIT+9','Pet: Attack+14 Pet: Rng.Atk.+14','Pet: "Mag.Atk.Bns."+5',}},
        legs={ name="Herculean Trousers", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Store TP"+11',}},
         feet={ name="Herculean Boots", augments={'Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: "Store TP"+11','Pet: MND+2','Pet: "Mag.Atk.Bns."+13',}},
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Crep. Earring",
        right_ear="Enmerkar Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    
   }

    --[[
        Idle Mode = Idle
        Hybrid Mode = Acc
    ]]
    sets.idle.Pet.Engaged.Acc = {                main={ name="Xiucoatl", augments={'Path: C',}},

    ammo="Automat. Oil +3",
    
    head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Sroda Earring",
        left_ring="Thurandaut Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }  
    sets.idle.Pet.Engaged.MaxAcc ={      
     main={ name="Xiucoatl", augments={'Path: C',}}, 
    ammo="Automat. Oil +3",
    head="Kara. Cappello +2",
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands="Mpaca's Gloves",
    legs="Heyoka Subligar +1",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Kara. Earring +1",
    left_ring="Thurandaut Ring",
    right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
        }
    --[[
        Idle Mode = Idle
        Hybrid Mode = TP
    ]]
    sets.idle.Pet.Engaged.TP = {           main={ name="Xiucoatl", augments={'Path: C',}},
     
    ammo="Automat. Oil +3",
    
        head={ name="Herculean Helm", augments={'Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: "Store TP"+11','Pet: CHR+2','Pet: "Mag.Atk.Bns."+8',}},
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+25','Pet: "Store TP"+11','Pet: VIT+9','Pet: Attack+14 Pet: Rng.Atk.+14','Pet: "Mag.Atk.Bns."+5',}},
    legs={ name="Herculean Trousers", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Store TP"+11',}},
    feet={ name="Herculean Boots", augments={'Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: "Store TP"+11','Pet: MND+2','Pet: "Mag.Atk.Bns."+13',}},
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }
    sets.idle.Pet.Engaged.MaxTP = {          
        main={ name="Condemners", augments={'Pet: "Store TP"+9','Accuracy+21','Pet: Accuracy+18 Pet: Rng. Acc.+18','DMG:+7',}},     
        ammo="Automat. Oil +3",
        head="Tali'ah Turban +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Foire Dastanas +3",
        legs="Kara. Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Enmerkar Earring",
        right_ear="Crep. Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
            back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }
    sets.idle.Pet.Engaged.Empy = {          
        main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
        ammo="Automat. Oil +3",
        head="Kara. Cappello +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Karagoz Guanti +2",
        legs="Kara. Pantaloni +2",
        feet="Karagoz Scarpe +2",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }

    --[[        Idle Mode = Idle
        Hybrid Mode = DT
    ]]
    sets.idle.Pet.Engaged.DT = {                main={ name="Xiucoatl", augments={'Path: C',}},

    
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Thurandaut Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    
    }
    --[[
        Idle Mode = Idle
        Hybrid Mode = Regen
    ]]
    sets.idle.Pet.Engaged.Regen = {          
    
        main={ name="Xiucoatl", augments={'Path: C',}},
    ammo="Automat. Oil +3",
    head="Kara. Cappello +2",
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands="Mpaca's Gloves",
    legs="Kara. Pantaloni +2",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Kara. Earring +1",
    left_ring="Thurandaut Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
        }

    --[[
        Idle Mode = Idle
        Hybrid Mode = Ranged
    ]]
    sets.idle.Pet.Engaged.Ranged ={       main={ name="Xiucoatl", augments={'Path: C',}}, 
    ammo="Automat. Oil +3",
    head="Tali'ah Turban +2",
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands="Foire Dastanas +3",
    legs="Kara. Pantaloni +2",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Enmerkar Earring",
    right_ear="Crep. Earring",
    left_ring="Thurandaut Ring",
    right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
        }
    

    -------------------------------------WS
    --[[
        WSNoFTP is the default weaponskill set used
    ]]
    sets.midcast.Pet.WSNoFTP = {                main={ name="Xiucoatl", augments={'Path: C',}},

        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands="Mpaca's Gloves",
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        left_ear="Kyrene's Earring",    
        right_ear="Sroda Earring",
    
    }

    --[[
        If we have a pet weaponskill that can benefit from WSFTP
        then this set will be equipped
    ]]
    sets.midcast.Pet.WSFTP = {        
        main={ name="Xiucoatl", augments={'Path: C',}},
        ammo="Automat. Oil +3",
        head="Kara. Cappello +2",
        hands="Mpaca's Gloves",
        legs="Kara. Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Kara. Earring +1",
        left_ear="Kyrene's Earring",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Dispersal Mantle", augments={'STR+1','Pet: TP Bonus+480',}},
    }

    --[[
        Base Weapon Skill Set
        Used by default if no modifier is found
    ]]
    sets.midcast.Pet.WS = {                main={ name="Xiucoatl", augments={'Path: C',}},

    ammo="Automat. Oil +3",
        head={ name="Herculean Helm", augments={'Pet: "Mag.Atk.Bns."+26','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2',}},
        body={ name="Herculean Vest", augments={'Pet: "Mag.Atk.Bns."+25','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: AGI+10',}},
        hands={ name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Store TP"+6','Pet: DEX+1',}},
        legs={ name="Pitre Churidars +3", augments={'Enhances "Ventriloquy" effect',}},
        feet={ name="Pitre Babouches +3", augments={'Enhances "Role Reversal" effect',}},
        neck="Adad Amulet",
        waist="Ukko Sash",
        left_ear="Kyrene's Earring",
        right_ear="Kara. Earring +1",
        left_ring="C. Palug Ring",
        right_ring="Tali'ah Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},   
    

    }

    --Chimera Ripper, String Clipper
    sets.midcast.Pet.WS["STR"] = set_combine(sets.midcast.Pet.WSNoFTP, {        
    ammo="Automat. Oil +3",
        head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands="Mpaca's Gloves",
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        waist="Incarnation Sash",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        left_ear="Kyrene's Earring",  
        right_ear="Sroda Earring",
    })

    -- Bone crusher, String Shredder
    sets.midcast.Pet.WS["VIT"] =
        set_combine(
        sets.midcast.Pet.WSNoFTP,
        {                main={ name="Xiucoatl", augments={'Path: C',}},

        ammo="Automat. Oil +3",
            head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
            body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
            hands="Mpaca's Gloves",
            legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
            feet="Mpaca's Boots",
            waist="Incarnation Sash",
            left_ring="Thurandaut Ring",
            right_ring="C. Palug Ring",
            left_ear="Kyrene's Earring",    
            right_ear="Kara. Earring +1",
           
         
        }
    )

    -- Cannibal Blade
    sets.midcast.Pet.WS["MND"] = set_combine(sets.midcast.Pet.WSNoFTP, {        
    ammo="Automat. Oil +3",
        head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands="Mpaca's Gloves",
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        waist="Incarnation Sash",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        left_ear="Kyrene's Earring",    
        right_ear="Kara. Earring +1",
    }
    )

    -- Armor Piercer, Armor Shatterer
    sets.midcast.Pet.WS["DEX"] = set_combine(sets.midcast.Pet.WSNoFTP, {
        main={ name="Xiucoatl", augments={'Path: C',}},
        head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands="Mpaca's Gloves",
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        waist="Incarnation Sash",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        left_ear="Kyrene's Earring",    
        right_ear="Kara. Earring +1",
        }
    )

    -- Arcuballista, Daze
    sets.midcast.Pet.WS["DEXFTP"] =
        set_combine(
        sets.midcast.Pet.WSFTP,
        {                main={ name="Xiucoatl", augments={'Path: C',}},

        ammo="Automat. Oil +3",
            head="Kara. Cappello +2",
            hands="Mpaca's Gloves",
            legs="Kara. Pantaloni +2",
            feet="Mpaca's Boots",
            left_ear="Kyrene's Earring",
            right_ear="Kara. Earring +1",
            left_ring="Thurandaut Ring",
            right_ring="C. Palug Ring",
            back={ name="Dispersal Mantle", augments={'STR+1','Pet: TP Bonus+480',}},        }
    )

    ---------------------------------------------
    --  __  __ _             _____      _
    -- |  \/  (_)           / ____|    | |
    -- | \  / |_ ___  ___  | (___   ___| |_ ___
    -- | |\/| | / __|/ __|  \___ \ / _ \ __/ __|
    -- | |  | | \__ \ (__   ____) |  __/ |_\__ \
    -- |_|  |_|_|___/\___| |_____/ \___|\__|___/
    ---------------------------------------------
    -- Town Set
    sets.idle.Town = {
        main="Tauret",
        ear2="Infused Earring",
        feet="Hermes' Sandals +1",
    }

    -- Resting sets
    sets.resting = {
        main="Denouements",
        head={ name="Pitre Taj +3", augments={'Enhances "Optimization" effect',}},
        body="Hiza. Haramaki +2",
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Empath Necklace",
        waist="Isa Belt",
        left_ear="Infused Earring",
        right_ear="Hypaspist Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",    }

    sets.defense.MasterDT = sets.idle.MasterDT

    sets.defense.PetDT = {     
        main={ name="Xiucoatl", augments={'Path: C',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back="Moonlight Cape",}

    sets.defense.PetMDT = set_combine(sets.pet.EmergencyDT, {
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Thurandaut Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
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
    if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
end
function job_buff_change(buff,gain)
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
function check_buff(buff_name, eventArgs)
    --[[if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end]]
end
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end
    check_weaponset()

    return meleeSet
end
function customize_idle_set(idleSet)
    if state.HippoMode.value == true then 
        idleSet = set_combine(idleSet, {feet="Hippo. Socks +1"})
    end
    if world.area:contains("Adoulin") then
        idleSet = set_combine(idleSet, {body="Councilor's Garb"})
    end
    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end 
    return idleSet
end
function sub_job_change(new,old)
   -- if user_setup then
     --   user_setup()
       -- send_command('wait 5;input /lockstyleset 168')
   -- end
   if user_setup then
        user_setup()
        send_command('wait 6;input /lockstyleset 160')
    end
end

function job_update(cmdParams, eventArgs)

end
function job_self_command(cmdParams, eventArgs)
    if player.equipment.main == 'Tauret' then
        send_command('input /lockstyleset 164')
    else
        send_command('input /lockstyleset 160')
    end
    eventArgs.handled = true
end
mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
function job_handle_equipping_gear(playerStatus, eventArgs)   

    if state.HippoMode.value == true then 
        equip({feet="Hippo. Socks +1"})
    end
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
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(8, 39)
    -- Default macro set/book
    --[[if player.sub_job == "WAR" then
        set_macro_page(8, 39)
    elseif player.sub_job == "NIN" then
        set_macro_page(8, 39)
    elseif player.sub_job == "DNC" then
        set_macro_page(8, 39)
    else]]
    --end
end


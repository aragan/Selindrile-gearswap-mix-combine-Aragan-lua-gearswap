-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

add pup-LIB to easy Maneuver auto free u choose and can hide hud screen or lite :

bind f4 gs c toggle AutoMan 

        This will hide the entire HUB
        //gs c hub all

                This will hide the Mode on the HUB
        //gs c hub mode

                This will hide the State on the HUB
        //gs c hub state

                This will hide the Options on the HUB
        //gs c hub options

                This will toggle the HUB lite mode
        //gs c hub lite

                This will toggle the default Keybinds set up for any changeable command on the window
        //gs c hub keybinds
--------
for pup play easy need addon autocontrol to save more set name and autopup and tppet

]]
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc','MaxTP','SubtleBlow')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal', 'PDL', 'SC')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
	state.IdleMode:options('Normal','PDT','Empy','EnemyCritRate','Evasion','HP','MDT','Refresh','Sphere')
	state.Weapons:options('None','Godhands','Xiucoatl','Ohtas','Condemners','Tauret','CLUB','Staff')
    state.Animators = M{['description']='Animators', 'AnimatorPI', 'None', 'AnimatorPII', 'NeoAnimator'}

    state.PetMode = M{['description']='Pet Mode', 'None','Melee','MaxAcc','Ranged','MaxTP','Regen','Bruiser','Tank','LightTank','Magic','Heal','Nuke'}
	state.AutoRepairMode = M(false, 'Auto Repair Mode')
	state.AutoDeployMode = M(true, 'Auto Deploy Mode')
	state.AutoPetMode 	 = M(false, 'Auto Pet Mode')
	state.PetWSGear		 = M(false, 'Pet WS Gear')
	state.PetEnmityGear	 = M(false, 'Pet Enmity Gear')
    --state.Animators= M{['description']='Animators', 'None','AnimatorP1'}
	--state.Animators:options('None','AnimatorP1')

    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=1},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=0},
		},
		Bruiser = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Water Maneuver',   Amount=1},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=0},
		},
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=3},
			{Name='Fire Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}

	deactivatehpp = 85
	
    select_default_macro_book()
    send_command("bind !e gs c toggle AutoMan")
    send_command("bind ^home gs c toggle setftp")
    send_command("bind ^PAGEUP gs c toggle autodeploy")
    send_command("bind ^PAGEDOWN gs c hide keybinds")
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !f3 gs c toggle AutoPuppetMode')
	send_command('bind f2 gs c toggle AutoRepairMode')
    send_command('bind !f4 gs c toggle AutoManeuvers')
    send_command('bind f3 gs c toggle PetMode')
    send_command('bind f7 gs c toggle Animators')
	send_command('bind !f11 gs c cycle MagicalDefenseMode;gs c set DefenseMode Magical')
    send_command('bind f11 gs c cycle PhysicalDefenseMode;gs c set DefenseMode Physical') --Turns your physical defense set on.
    send_command('bind f10 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
	send_command('bind f7 gs c cycle Animators')

    send_command("bind f4 gs c toggle AutoMan")
    send_command('bind f1 gs c cycle HippoMode')
    send_command("bind @c gs c toggle CP") 
    send_command('bind @x gs c toggle RP')  
	init_job_states({"Capacity","AutoPuppetMode","PetWSGear","AutoRepairMode","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","HippoMode"},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","TreasureMode","PetMode","Animators"})

end

-- Define sets used by this job file.
function init_gear_sets()
    
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Xiucoatl = {main="Xiucoatl"}
	sets.weapons.Ohtas = {main="Ohtas"}
	sets.weapons.Condemners = {main="Condemners"}
    sets.weapons.Tauret = {main="Tauret", sub="Kustawi +1", }
    sets.weapons.Staff = {main="Gozuki Mezuki",sub="Niobid Strap"}
    sets.weapons.CLUB = {main="Mafic Cudgel",sub="Tauret",}

    -- .Animators
	sets.NeoAnimator = {range="Neo Animator"}
	sets.AnimatorPI = {range="Animator P +1"}
	sets.AnimatorPII = {range="Animator P II +1"}


    Animators = {"Animator P +1", "Animator P II +1", "Neo Animator",}
    Animators.Range = "Animator P II +1"
    Animators.Melee = "Animator P +1"

    Artifact_Foire = {}
    Artifact_Foire.Head_PRegen = ""
    Artifact_Foire.Body_WSD_PTank = ""
    Artifact_Foire.Hands_Mane_Overload = "Foire Dastanas +3"
    Artifact_Foire.Legs_PCure = ""
    Artifact_Foire.Feet_Repair_PMagic = "Foire Babouches +3"

    Relic_Pitre = {}
    Relic_Pitre.Head_PRegen = "Pitre Taj +3" --Enhances Optimization
    Relic_Pitre.Body_PTP = "Pitre Tobe +3" --Enhances Overdrive
    Relic_Pitre.Hands_WSD = "Pitre Dastanas +3" --Enhances Fine-Tuning
    Relic_Pitre.Legs_PMagic = "Pitre Churidars +3" --Enhances Ventriloquy
    Relic_Pitre.Feet_PMagic = "Pitre Babouches +3" --Role Reversal

    Empy_Karagoz = {}
    Empy_Karagoz.Head_PTPBonus = "Karagoz Cappello +2"
    Empy_Karagoz.Body_Overload = "Karagoz Farsetto +2"
    Empy_Karagoz.Hands = "Karagoz Guanti +2"
    Empy_Karagoz.Legs_Combat = "Karagoz Pantaloni +2"
    Empy_Karagoz.Feet_Tatical = "Karagoz Scarpe +2"

    Visucius = {}
    Visucius.PetDT = {}
    Visucius.PetMagic = {}

    -- neck JSE Necks Reinforcement Points Mode add u neck here 
	sets.RP = {}

    -- Precast Sets

    -- Fast cast sets for spells
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

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA = {} -- Can be left empty

    sets.precast.JA["Tactical Switch"] = {feet = Empy_Karagoz.Feet_Tatical}

    sets.precast.JA["Ventriloquy"] = {legs = Relic_Pitre.Legs_PMagic}

    sets.precast.JA["Role Reversal"] = {feet = Relic_Pitre.Feet_PMagic}

    sets.precast.JA["Overdrive"] = {body = Relic_Pitre.Body_PTP}

    sets.precast.JA["Repair"] = {
        ammo = "Automat. Oil +3",
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet = Artifact_Foire.Feet_Repair_PMagic,
        right_ear="Pratik Earring",
        left_ear="Guignol Earring",
        left_ring="Overbearing Ring",
    }

    sets.precast.JA["Maintenance"] = set_combine(sets.precast.JA["Repair"], {hands="Foire Dastanas +3",})

    sets.precast.JA.Maneuver = {
        main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
        body = "Karagoz Farsetto +2",
        hands="Foire Dastanas +3",
        back = "Visucius's Mantle",
    }

    sets.precast.JA["Activate"] = {range="Animator P +1",
        feet="Mpaca's Boots",
    right_ear="Karagoz Earring +1",
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
        head="Karagoz Cappello +2",
        body="Karagoz Farsetto +2",
        hands="Karagoz Guanti +2",
    legs="Karagoz Pantaloni +2",
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

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    
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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        head="Karagoz Cappello +2",
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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS["Stringing Pummel"].PDL = set_combine(sets.precast.WS["Stringing Pummel"], {
        head="Karagoz Cappello +2",
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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS["Asuran Fists"].PDL = set_combine(sets.precast.WS["Asuran Fists"], {
        head="Karagoz Cappello +2",
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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS["Victory Smite"].PDL = set_combine(sets.precast.WS["Victory Smite"], {
        head="Karagoz Cappello +2",
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
            back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS["Shijin Spiral"].PDL = set_combine(sets.precast.WS["Shijin Spiral"], {
        head="Karagoz Cappello +2",
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
    sets.precast.WS["Cyclone"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Gust Slash"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Shining Strike"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Cataclysm"] = set_combine(sets.precast.WS["Aeolian Edge"],{})

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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS["Howling Fist"].PDL = set_combine(sets.precast.WS["Howling Fist"], {
        head="Karagoz Cappello +2",
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

       sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Null Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Crep. Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back="Null Shawl",})

    sets.midcast.FastRecast = {}
	
    
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

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],{
        head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	})
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
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
        legs="Karagoz Pantaloni +2",
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
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})




	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
	-- Currently broken, preserved in case of future functionality.
	--sets.midcast.Pet.WeaponSkill = {}

    -- Sets to return to when not performing an action.
    
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
    

    -- Idle sets

    -- Town Set
    sets.idle.Town = {
            main="Tauret",
            ear2="Infused Earring",
            feet="Hermes' Sandals +1",
    }
    sets.idle = {
        head="Null Masque",
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
    sets.idle.MDT = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        right_ear="Eabani Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back="Moonlight Cape",
    }
    sets.idle.Sphere = set_combine(sets.idle, {
        body="Annoint. Kalasiris",
    })
	sets.idle.Refresh = {
        head="Null Masque",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Fucho-no-Obi",
        right_ear="Ethereal Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }
		
    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.HP={
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear="Tuisto Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }

    sets.idle.Evasion={
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

    -- Set for idle while pet is out (eg: pet regen gear)
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
        back="Moonlight Cape",}

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
        head={ name="Herculean Helm", augments={'Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: "Store TP"+11','Pet: CHR+2','Pet: "Mag.Atk.Bns."+8',}},
    body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+25','Pet: "Store TP"+11','Pet: VIT+9','Pet: Attack+14 Pet: Rng.Atk.+14','Pet: "Mag.Atk.Bns."+5',}},
    legs={ name="Herculean Trousers", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Store TP"+11',}},
    feet={ name="Herculean Boots", augments={'Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: "Store TP"+11','Pet: MND+2','Pet: "Mag.Atk.Bns."+13',}},
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {
        head="Pitre Taj +3",
        body="Pitre Tobe +3",
        hands="Mpaca's Gloves",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        ear1="Crep. Earring",
        ear2="Enmerkar Earring",
        ring1="Varar Ring +1",
        ring2="Varar Ring +1",
        waist="Klouskap Sash +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},    
    })
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {
        head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Sroda Earring",
            left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {
        head="Anwig Salade",
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
	sets.idle.Pet.Engaged.Bruiser = set_combine(sets.idle.Pet.Engaged, {
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
    sets.idle.Pet.Engaged.MaxTP = set_combine(sets.idle.Pet.Engaged, {
        head="Tali'ah Turban +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Foire Dastanas +3",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Enmerkar Earring",
        right_ear="Crep. Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
	sets.idle.Pet.Engaged.Regen = set_combine(sets.idle.Pet.Engaged, {
        main="Denouements",
        ammo="Automat. Oil +3",
        head={ name="Pitre Taj +3", augments={'Enhances "Optimization" effect',}},
        body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Isa Belt",
        left_ear="Hypaspist Earring",
        right_ear="Enmerkar Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}}, 
    })
	sets.idle.Pet.Engaged.MaxAcc = set_combine(sets.idle.Pet.Engaged, {
        head="Karagoz Cappello +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Karagoz Guanti +2",
        legs="Karagoz Pantaloni +2",
        feet="Karagoz Scarpe +2",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Enmerkar Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })

	sets.idle.Pet.Engaged.LightTank = set_combine(sets.idle.Pet.Engaged, {
        head="Karagoz Cappello +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Mpaca's Gloves",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Karagoz Earring +1",
        left_ring="Overbearing Ring",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    })
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic


    -- Defense sets

    sets.defense.PDT = {
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
    sets.defense.MDT = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        right_ear="Eabani Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back="Moonlight Cape",
    }
    sets.defense.MEVA = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        right_ear="Eabani Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring="Purity Ring",
        back="Moonlight Cape",
    }



	sets.idle.Empy = set_combine(sets.idle.PDT, {
        head="Karagoz Cappello +2",
        body="Karagoz Farsetto +2",
        hands="Karagoz Guanti +2",
        legs="Karagoz Pantaloni +2",
        feet="Karagoz Scarpe +2",
    })

    sets.Kiting = {feet="Hermes' Sandals +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
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
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},    
    }
    sets.engaged.Acc = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Mache Earring +1",
        right_ear="Karagoz Earring +1",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Null Shawl",
    }
    sets.engaged.FullAcc = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Mache Earring +1",
        right_ear="Karagoz Earring +1",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Null Shawl",
    }
	sets.engaged.MaxTP = {
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands="Karagoz Guanti +2",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Karagoz Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  
    }
    sets.engaged.SubtleBlow = {
        head="Malignance Chapeau",
        neck="Bathy Choker +1",
        ear1="Digni. Earring",
        ear2="Schere Earring",
        body="Malignance Tabard",
        hands="Herculean Gloves",
        ring1="Chirich Ring +1",
        ring2="Niqmaddu Ring",
        waist="Moonbow Belt +1",
        legs="Mpaca's Hose",
        feet="Herculean Boots",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  
    }
    sets.engaged.SubtleBlow2 = {
        head="Malignance Chapeau",
        neck="Bathy Choker +1",
        ear1="Digni. Earring",
        ear2="Schere Earring",
        body="Volte Harness",
        hands="Volte Mittens",
        ring1="Chirich Ring +1",
        ring2="Niqmaddu Ring",
        waist="Moonbow Belt +1",
        legs="Mpaca's Hose",
        feet="Volte Spats",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  
    }
    sets.engaged.SubtleBlow3 = {
        head="Malignance Chapeau",
        neck="Bathy Choker +1",
        ear1="Mache Earring +1",
        ear2="Karagoz Earring +1",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        ring1="Chirich Ring +1",
        ring2="Niqmaddu Ring",
        waist="Moonbow Belt +1",
        legs="Mpaca's Hose",
        feet="Malignance Boots",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  
    }

    sets.engaged.DT = {
head="Mpaca's Cap",
body="Mpaca's Doublet",
hands="Malignance Gloves",
legs="Mpaca's Hose",
feet="Mpaca's Boots",
neck="Lissome Necklace",
waist="Moonbow Belt +1",
ear1="Dedition Earring",
ear2="Schere Earring",
ring1="Gere Ring",
ring2="Epona's Ring",
    back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},    
    }
    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",
        neck="Shulmanu Collar",
        ear1="Domes. Earring",
        ear2="Handler's Earring +1",
        body="Malignance Tabard",
        hands="Karagoz Guanti +2",
        ring1="Defending Ring",
        ring2="C. Palug Ring",
        waist="Moonbow Belt +1",
        legs="Malignance Tights",
        feet="Malignance Boots",
        back={ name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},    
    } 
    sets.engaged.FullAcc.DT ={
        head="Heyoka Cap +1",
        neck="Loricate Torque +1",
        ear1="Crep. Earring",
        ear2="Karagoz Earring +1",
        body="Mpaca's Doublet",
        hands="Karagoz Guanti +2",
        ring1="Defending Ring",
        ring2="Niqmaddu Ring",
        back="Visucius's Mantle",
        waist="Moonbow Belt +1",
        legs="Heyoka Subligar +1",
        feet="Mpaca's Boots"
    } 
    sets.engaged.MaxTP.DT = sets.engaged.DT 
    
    sets.engaged.Pet = {
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
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},  
    }
    sets.engaged.Acc.Pet = {
        head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Sroda Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
        }  
    sets.engaged.FullAcc.Pet = {
        head="Karagoz Cappello +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Mpaca's Gloves",
        legs="Heyoka Subligar +1",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Rimeice Earring",
        right_ear="Karagoz Earring +1",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }
    sets.engaged.MaxTP.Pet = {
        head="Tali'ah Turban +2",
        body={ name="Pitre Tobe +3", augments={'Enhances "Overdrive" effect',}},
        hands="Foire Dastanas +3",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Enmerkar Earring",
        right_ear="Crep. Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
    }


    -- Midcast sets for pet actions
    sets.midcast.Pet = {
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
    right_ear="Karagoz Earring +1",
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
	-- The following sets are predictive and are equipped before we even know the ability will happen, as a workaround due to
	-- the fact that start of ability packets are too late in the case of Pup abilities, WS, and certain spells.
	sets.midcast.Pet.PetEnmityGear = {}

    
    -------------------------------------WS
    --[[
        WSNoFTP is the default weaponskill set used
    ]]
    sets.midcast.Pet.WSNoFTP = {                
        main={ name="Xiucoatl", augments={'Path: C',}},
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        hands="Mpaca's Gloves",
        legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ring="Varar Ring +1",
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
        head="Karagoz Cappello +2",
        hands="Mpaca's Gloves",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Karagoz Earring +1",
        left_ear="Kyrene's Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Dispersal Mantle", augments={'STR+1','Pet: TP Bonus+480',}},
    }

    --[[
        Base Weapon Skill Set
        Used by default if no modifier is found
    ]]
    sets.midcast.Pet.WS = {             
        main={ name="Xiucoatl", augments={'Path: C',}},
        ammo="Automat. Oil +3",
        head="Karagoz Cappello +2",
        hands="Mpaca's Gloves",
        legs="Karagoz Pantaloni +2",
        feet="Mpaca's Boots",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Karagoz Earring +1",
        left_ear="Kyrene's Earring",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Dispersal Mantle", augments={'STR+1','Pet: TP Bonus+480',}},
    }

	sets.midcast.Pet.PetWSGear ={}
	
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Bruiser = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.MaxTP = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Regen = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.MaxAcc = set_combine(sets.midcast.Pet.PetWSGear, {})


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
    sets.Enmity.Pet = {
        head="Heyoka Cap +1",
        ear1="Rimeice Earring",
        ear2="Domes. Earring",
        body="Heyoka Harness",
        hands="Heyoka Mittens",
        legs="Heyoka Subligar +1",
    }

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(8, 17)
    elseif player.sub_job == 'NIN' then
        set_macro_page(8, 17)
    elseif player.sub_job == 'THF' then
        set_macro_page(8, 17)
    else
        set_macro_page(8, 17)
    end
end
function user_job_lockstyle()
    if res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
        windower.chat.input('/lockstyleset 151')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
        windower.chat.input('/lockstyleset 164')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 10 then --Great Katana in main hand.
        windower.chat.input('/lockstyleset 172')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
        windower.chat.input('/lockstyleset 149')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 4 then --Great Sword in main hand.
        windower.chat.input('/lockstyleset 165')
    else
        windower.chat.input('/lockstyleset 159') --Catchall
    end
end

autows_list = {['Godhands']='Victory Smite',['Xiucoatl']='Victory Smite',['Ohtas']='Victory Smite',
['Condemners']='Victory Smite',['Karambit']='Asuran Fists'}
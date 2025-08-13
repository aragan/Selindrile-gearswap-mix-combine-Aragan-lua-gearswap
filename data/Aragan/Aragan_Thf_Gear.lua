-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'STP','DA', 'CRIT', 'Ranger')
    state.HybridMode:options('DT','Normal')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match', 'Proc','SubtleBlow', 'PDL', 'Mod')
	state.IdleMode:options('DT','Normal','PDT', 'HP', 'Evasion', 'MDT', 'Regen','Regain', 'EnemyCritRate')
    state.PhysicalDefenseMode:options('PDT', 'Evasion', 'HP','Regain')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Twashtar','Centovente', 'Tauret', 'Aeneas', 'Naegling', 'Proc')--'test',
	state.Passive:options('None', 'SubtleBlow','Parry','MDT', 'Enspell')
	state.AutoBuffMode:options('Off','Auto','Defend') --,'Vagary','Off','Off','Off','Off',

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry','SubtleBlow'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	--send_command('bind ^q gs c weapons ProcWeapons;gs c set WeaponSkillMode proc;')
	--send_command('bind !q gs c weapons SwordThrowing')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind !0 gs c weapons Default;gs c set WeaponSkillMode match') --Requips weapons and gear.
	send_command('bind !9 gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')
    send_command('bind f3 gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
    send_command('bind f2 gs c toggle AutoBuffMode')

    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
    update_combat_form()
    determine_haste_group()

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    -- Weapons sets

    sets.weapons.Twashtar = {main="Twashtar", sub="Crepuscular Knife",}
    sets.weapons.Centovente = {main="Twashtar", sub="Centovente",}
    sets.weapons.Tauret = {main="Tauret", sub={ name="Gleti's Knife", augments={'Path: A',}},}
    sets.weapons.Aeneas = {main="Aeneas", sub="Malevolence"}
    sets.weapons.Naegling = {main="Naegling", sub="Centovente"}
    sets.weapons.Proc = {main="Fermion Sword",sub="Trainee Sword",}
    -- sets.weapons.test = {    main="Excalipoor II",sub="Caduceus",}

	sets.TreasureHunter = {hands={ name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},feet="Skulk. Poulaines +2", }
    sets.Kiting =  {feet="Jute Boots +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {back="Toutatis's Cape"}
    sets.buff['Trick Attack'] = {}--"Pill. Armlets +3"

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Suppanomimi", ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi", ear2="Eabani Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Parry = {hands="Turms Mittens +1"}
	sets.Ambush = {body="Plunderer's Vest +3"}
    sets.SubtleBlow = {
    left_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",}
    sets.rollerRing = {left_ring="Roller's Ring"}

    	--Passive set
	sets.passive.MDT = {
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
    }
	sets.passive.Enspell = {waist="Orpheus's Sash",}
	sets.passive.Parry = {
        hands="Turms Mittens +1",
        feet="Turms Leggings +1",
    }

    sets.passive.SubtleBlow = {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        left_ear="Sherida Earring",
	}



    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",
        waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",
        waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet +2",}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet +2",}
    sets.precast.JA['Flee'] = {}--feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest +1"} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines +2",}
    sets.precast.JA['Perfect Dodge'] = {hands={ name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
    head="Mummu Bonnet +2",
    body="Gleti's Cuirass",
    legs="Dashing Subligar",}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet="Jute Boots +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
	sets.precast.RA = {ammo=empty,
    range="Trollbane",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	left_ear="Crep. Earring",
	right_ear="Telos Earring",
	}

    sets.precast.RA.Acc = {       
        legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
        feet="Meg. Jam. +2",
        waist="Yemaya Belt",}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {range=empty,
    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    head="Nyame Helm",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back="Sacro Mantle",
    }
    sets.precast.WS.PDL =  {
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    }
    sets.precast.WS.SubtleBlow =  {
        left_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.precast.WS.Proc =  {
    }
    -- sets.precast.WS["Fast Blade"] =  set_combine(sets.precast.WS.Proc,{})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {range=empty,
    ammo="C. Palug Stone",
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back="Null Shawl",
    })
    sets.precast.WS['Exenterator'].PDL = set_combine(sets.precast.WS['Exenterator'], {range=empty,
    ammo="Crepuscular Pebble",
    head="Skulker's Bonnet +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    left_ring="Sroda Ring", 

    })
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'], {ammo="Yetshila +1"})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'], {ammo="Yetshila +1"})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'], {ammo="Yetshila +1"})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS.Acc, {range=empty})
    sets.precast.WS['Dancing Edge'].PDL = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {})
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Yetshila +1"})
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Yetshila +1"})
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Yetshila +1"})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS['Dancing Edge'], {})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Lustr. Subligar +1",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Odr Earring",
        left_ring="Ilabrat Ring",
        right_ring="Regal Ring",
        back="Null Shawl",
    })
    sets.precast.WS['Evisceration'].PDL = set_combine(sets.precast.WS['Evisceration'], {range=empty,
    ammo="Crepuscular Pebble",
    head="Skulker's Bonnet +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    left_ring="Sroda Ring", 
    })
    sets.precast.WS.PDL['Evisceration'] = set_combine(sets.precast.WS['Evisceration'], {range=empty,
    ammo="Crepuscular Pebble",
    head="Skulker's Bonnet +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    left_ring="Sroda Ring", 
    })
    sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'], {})

    sets.precast.WS['True Strike'] = set_combine(sets.precast.WS['Evisceration'], {})


    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {range=empty,
    ammo="Yetshila +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Kentarch Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Odr Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back="Sacro Mantle",
})
    sets.precast.WS["Rudra's Storm"].PDL = set_combine(sets.precast.WS["Rudra's Storm"], {
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        right_ear="Skulk. Earring +1",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS.PDL["Rudra's Storm"] = set_combine(sets.precast.WS["Rudra's Storm"], {
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"])
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Kentarch Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Beithir Ring",
    back="Sacro Mantle",
    })
    sets.precast.WS['Shark Bite'].PDL = set_combine(sets.precast.WS['Shark Bite'], {
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    })

    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})

    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {range=empty,
    ammo="Yetshila +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Kentarch Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Odr Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back="Sacro Mantle",
    })
    sets.precast.WS['Mandalic Stab'].PDL = set_combine(sets.precast.WS['Mandalic Stab'], {
        ammo="Crepuscular Pebble",
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {})
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Yetshila +1",
        body="Pillager's Vest +3",})


    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {range=empty,
    ammo="Yetshila +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Gere Ring",
    back="Sacro Mantle",
})
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
    range=empty,
    ammo="Crepuscular Pebble",
    head="Skulker's Bonnet +2",
    body="Gleti's Cuirass",
    left_ring="Sroda Ring", 
    right_ring="Cornelia's Ring",
})  
   sets.precast.WS['Judgment'] = set_combine(sets.precast.WS, {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",
    back="Sacro Mantle",
    })
sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Black Halo'], {
        ammo="Crepuscular Pebble",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    })
    
-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Cornelia's Ring",
    right_ring="Archon Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
neck="Baetyl Pendant",
waist="Orpheus's Sash",
right_ear="Friomisi Earring",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ring="Dingir Ring",
right_ring="Cornelia's Ring",
back="Sacro Mantle",})

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

sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
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
    back="Null Shawl",
})

sets.precast.WS["Empyreal Arrow"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back="Sacro Mantle",
}
    sets.precast.WS["Empyreal Arrow"].PDL = set_combine(sets.precast.WS["Empyreal Arrow"], {
        head="Skulker's Bonnet +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
    })


	-- Extra Melee sets.  Apply these on top of melee sets.

	-- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet="Jute Boots +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",}


    sets.midcast["Dark Magic"] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
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
        back="Null Shawl",
    })
    

    -- Specific spells
	sets.midcast.Utsusemi = {ammo="Sapience Orb",
    body="Passion Jacket",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet="Jute Boots +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",}

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}

    -- Ranged gear
    sets.midcast.RA = {ammo=empty,
        range="Trollbane",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Dingir Ring",
        right_ring="Cacoethic Ring +1",
        back="Null Shawl",
    }

    sets.midcast.RA.Acc = {
        range="Ullr",
        ammo="Beryllium Arrow",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Null Loop",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Dingir Ring",
        right_ring="Cacoethic Ring +1",
        back="Null Shawl",

    }


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        head="Null Masque",
        body="Meg. Cuirie +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Meg. Jam. +2",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }

    -- Defense sets
    sets.defense.Evasion = {
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Vengeful Ring",
        right_ring="Defending Ring",
        back="Null Shawl",
    }

    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Adamantite Armor",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ring="Defending Ring",
        left_ring="Moonlight Ring",
        back="Moonlight Cape",
    }

    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Moonlight Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Warder's Charm +1",
    waist="Engraved Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shadow Ring",
    right_ring="Purity Ring",
    back="Moonlight Cape",}

    sets.defense.Regain = {
        ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back="Moonlight Cape", 
    }
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Adamantite Armor",hands="Malignance Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back="Moonlight Cape", waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}

        
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)


    sets.idle = {range=empty,
    ammo="Staunch Tathlum +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Null Belt",
    right_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Moonlight Cape",
    }
    sets.idle.PDT = sets.defense.PDT
    sets.idle.DT = sets.defense.PDT
   --[[    sets.idle.Town = {
        main="Caduceus",head="Shaded Specs.",hand="Smithy's Mitts",neck="Goldsm. Torque",sub="Toreutic Escutcheon",body="Goldsmith's Smock"
            } ]]

    sets.idle.HP = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
    }
    
    sets.idle.MDT = sets.defense.MDT
    sets.idle.Evasion = sets.defense.Evasion
    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
    ammo="Eluder's Sachet",
    left_ring="Warden's Ring",
    right_ring="Fortified Ring",
    back="Reiki Cloak",
    })
    sets.idle.Regen = set_combine(sets.idle, {
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Null Belt",
    right_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    })
    
    sets.idle.Regain = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Regal Gloves",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Sphere = set_combine(sets.idle, {})
    
    sets.idle.Weak = set_combine(sets.idle, {})
    
    sets.DayIdle = {}
    sets.NightIdle = {}
    sets.ExtraRegen = {hands="Turms Mittens +1"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
   
    sets.engaged = {range=empty,
    ammo="Aurgelmir Orb +1",
    head="Skulker's Bonnet +2",
    body="Pillager's Vest +3",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Skulk. Earring +1",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back="Toutatis's Cape",
    }

    sets.engaged.Acc = {range=empty,
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Pillager's Vest +3",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Null Loop",
        waist="Reiki Yotai",
        left_ear="Telos Earring",
        right_ear="Skulk. Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }
        
    sets.engaged.STP = {
        ammo="Aurgelmir Orb +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Toutatis's Cape",
    }

    sets.engaged.DA={
            ammo={ name="Coiste Bodhar", augments={'Path: A',}},
            head="Skulker's Bonnet +2",
            body="Pillager's Vest +3",
            hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
            feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
            neck="Asperity Necklace",
            waist="Windbuffet Belt +1",
            left_ear="Sherida Earring",
            right_ear="Cessance Earring",
            left_ring="Epona's Ring",
            right_ring="Gere Ring",
            back="Null Shawl",
    }
        sets.engaged.CRIT = {range=empty,
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Meg. Cuirie +2",
        hands="Adhemar Wrist. +1",
        legs="Gleti's Breeches",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        neck="Nefarious Collar +1",
        waist="Reiki Yotai",
        ear1="Odr Earring",
        ear2="Skulk. Earring +1",
        ring1="Hetairoi Ring",
        ring2="Gere Ring",
        back="Null Shawl",
    }


    sets.engaged.Ranger = {
        main="Kustawi +1",
        sub={ name="Aeneas", augments={'Path: A',}},
        range="Ullr",
        ammo="Beryllium Arrow",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Dingir Ring",
        right_ring="Cacoethic Ring +1",
        back="Toutatis's Cape",
}


------------------------------------------------------------------------------------------------
    ---------------------------------------- DW ------------------------------------------
------------------------------------------------------------------------------------------------

    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    --DW cap all set haste capped

    sets.engaged.DW = {range=empty,
    ammo="Aurgelmir Orb +1",
    head="Skulker's Bonnet +2",
    body="Pillager's Vest +3",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Skulk. Earring +1",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back="Toutatis's Cape",
    }

    sets.engaged.DW.Acc = {range=empty,
    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Pillager's Vest +3",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Skulk. Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    }
        
    sets.engaged.DW.STP = {
        ammo="Aurgelmir Orb +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Toutatis's Cape",
    }
    sets.engaged.DW.DA={
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Skulker's Bonnet +2",
        body="Pillager's Vest +3",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Asperity Necklace",
        waist="Reiki Yotai",
        left_ear="Sherida Earring",
        right_ear="Cessance Earring",
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back="Null Shawl",
}
        sets.engaged.DW.CRIT = {range=empty,
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Meg. Cuirie +2",
        hands="Adhemar Wrist. +1",
        legs="Gleti's Breeches",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        neck="Nefarious Collar +1",
        waist="Reiki Yotai",
        ear1="Odr Earring",
        ear2="Skulk. Earring +1",
        ring1="Hetairoi Ring",
        ring2="Gere Ring",
        back="Null Shawl",
    }

------------------------------------------------------------------------------------------------
    ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------

  -- 15% Magic Haste (67% DW to cap)
  sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
    range=empty,
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
    hands="Floral Gauntlets", --5
    feet=gear.taeon_dw_feet, --9
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
    }) -- 36%
    sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.Acc, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        hands="Floral Gauntlets", --5
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 36%
    sets.engaged.DW.STP.LowHaste = set_combine(sets.engaged.DW.STP, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        hands="Floral Gauntlets", --5
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 36%
    sets.engaged.DW.CRIT.LowHaste = set_combine(sets.engaged.DW.CRIT, {
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- 6
        hands="Floral Gauntlets", --5
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 36%

--MID-HASTE

sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.Acc, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.STP.MidHaste = set_combine(sets.engaged.DW.STP, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.CRIT.MidHaste = set_combine(sets.engaged.DW.CRIT, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%

--HIGH-HASTE

sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.Acc.HighHaste = set_combine(sets.engaged.DW.Acc, {
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.STP.HighHaste = set_combine(sets.engaged.DW.STP, {
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.CRIT.HighHaste = set_combine(sets.engaged.DW.CRIT, {
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%

--MAX-HASTE

sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW)
sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.Acc)
sets.engaged.DW.STP.MaxHaste = set_combine(sets.engaged.DW.STP)
sets.engaged.DW.CRIT.MaxHaste = set_combine(sets.engaged.DW.CRIT)

------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.Hybrid = {
    --head="Malignance Chapeau", --6/6
    body="Malignance Tabard", --9/9
    hands="Malignance Gloves", --5/5
    legs="Malignance Tights", --7/7
    feet="Malignance Boots", --4/4
    left_ring="Moonlight Ring",--5
    right_ring="Moonlight Ring",--5

    --ring2="Defending Ring", --10/10
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)


------------------------------------------------------------------------------------------------
---------------------------------------- DW-HASTE Hybrid Sets-----------------------------------
------------------------------------------------------------------------------------------------


sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)

sets.engaged.DW.DT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.LowHaste = set_combine(sets.engaged.DW.STP.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.LowHaste = set_combine(sets.engaged.DW.CRIT.LowHaste, sets.engaged.Hybrid)

sets.engaged.DW.DT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.MidHaste = set_combine(sets.engaged.DW.STP.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.MidHaste = set_combine(sets.engaged.DW.CRIT.MidHaste, sets.engaged.Hybrid)

sets.engaged.DW.DT.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.HighHaste = set_combine(sets.engaged.DW.Acc.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.HighHaste = set_combine(sets.engaged.DW.STP.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.HighHaste = set_combine(sets.engaged.DW.CRIT.HighHaste, sets.engaged.Hybrid)

sets.engaged.DW.DT.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.MaxHaste = set_combine(sets.engaged.DW.STP.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.MaxHaste = set_combine(sets.engaged.DW.CRIT.MaxHaste, sets.engaged.Hybrid)


end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 3)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 3)
    else
        set_macro_page(3, 3)
    end
end

function user_job_lockstyle()
    if res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
        windower.chat.input('/lockstyleset 152')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
        windower.chat.input('/lockstyleset 164')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 10 then --Great Katana in main hand.
        windower.chat.input('/lockstyleset 172')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
        windower.chat.input('/lockstyleset 149')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 4 then --Great Sword in main hand.
        windower.chat.input('/lockstyleset 165')
    else
        windower.chat.input('/lockstyleset 152') --Catchall
    end

    --[[ if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 164')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 164')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 164')
		else
			windower.chat.input('/lockstyleset 164') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 164')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 164')
		else
			windower.chat.input('/lockstyleset 164') --Catchall just in case something's weird.
		end
	end]]
end

autows_list = {['Twashtar']="Rudra's Storm",['Tauret']='Evisceration',['Naegling']='Savage Blade',
['Aeneas']="Aeolian Edge",['SwordThrowing']='Savage Blade',['Evisceration']='Evisceration',
['ProcWeapons']='Wasp Sting',['Bow']='Empyreal Arrow'}
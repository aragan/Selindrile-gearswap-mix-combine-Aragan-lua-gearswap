-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 
]]


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'CRIT', 'SubtleBlow')
    state.WeaponskillMode:options('Match', 'SubtleBlow', 'SC', 'PDL')
    state.HybridMode:options( 'DT','Normal')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Regain')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options( 'DT','Normal','Regen', 'HP', 'MDT', 'Evasion', 'EnemyCritRate', 'Regain')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('None', 'Naegling', 'Trishula', 'Shining', 'TernionDagger', 'Staff', 'Club', 'DualNaegling', 'DualTernionDagger', 'DualClub')
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight','MDT','Enspell', 'SubtleBlow', 'SubtleBlow20', 'SubtleBlow30','SubtleBlow62'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind f2 gs c toggle AutoBuffMode')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	
	-- Weapons sets
	sets.weapons.Normal = {}
	sets.weapons.Trishula = {main="Trishula", sub="Utu Grip"}
	sets.weapons.Shining = {main="Shining One", sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling", sub="Regis",}
	sets.weapons.TernionDagger = {main="Ternion Dagger +1", sub="Regis",}
	sets.weapons.Staff = {main="Malignance Pole", sub="Utu Grip",}
	sets.weapons.Club = {main="Mafic Cudgel", sub="Regis",}
	
	sets.weapons.DualNaegling = {main="Naegling", sub="Demers. Degen +1",}
	sets.weapons.DualTernionDagger = {main="Ternion Dagger +1", sub="Demers. Degen +1",}
	sets.weapons.DualClub = {main="Mafic Cudgel", sub="Demers. Degen +1",}

	sets.Normal = {}
	sets.Shield = {sub="Regis"}


	-- neck JSE Necks Reinf
    sets.RP = {}


	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +3"}
	sets.precast.JA.Jump =	{head="Flamma Zucchetto +2",
	neck="Anu Torque",
	ear1="Sherida Earring",
	ear2="Telos Earring",
	hands="Flamma Manopolas +2",
	--hands="Vishap Finger Gauntlets +1",
	body="Pelt. Plackart +3",
	ring1="Niqmaddu Ring",
	ring2="Petrov Ring",
    waist="Ioskeha Belt +1",
	legs="Pteroslaver Brais +3",}
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +1"}
	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
        legs="Vishap Brais +1",
    }) 
	sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {
		--body="Vishap Mail +2",
        --legs="Peltast's Cuissots +1"
    })
	sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {
        --legs="Peltast's Cuissots +1",
        --feet="Lancer's Schynbalds +2"
    })

	sets.precast.JA['Super Jump'] = set_combine(sets.precast.JA.Jump, {
        --legs="Peltast's Cuissots +1",
        --feet="Lancer's Schynbalds +2"
    })

	sets.precast.JA['Spirit Link'] = {
        --hands="Lancer's Vambraces +2", 
        --head="Vishap Armet +1"
    }
	sets.precast.JA['Call Wyvern'] = {body="Pelt. Plackart +3"}
	sets.precast.JA['Deep Breathing'] = {} --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Surge'] = { --body="Wyrm Mail +2"
	body="Pelt. Plackart +3"}
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.HealingBreath = {back="Brigantia's Mantle"}
	--sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {        ammo="Sapience Orb",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body="Sacro Breastplate",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
	feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
	neck="Orunmila's Torque",
	waist="Plat. Mog. Belt",
	left_ear="Loquac. Earring",
	right_ear="Mendi. Earring",
	left_ring="Prolix Ring",
	right_ring="Rahab Ring",
	back="Moonlight Cape",
    }
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	
    sets.Self_Refresh = {waist="Gishdubar Sash"}
    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},
        hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
        legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Taeon Boots", augments={'Phalanx +2',}},
	}
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

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Thrud Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS.SC = set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })

	sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    hands="Gleti's Gauntlets",
    body="Pelt. Plackart +3",
    right_ear="Pel. Earring +1",
    left_ring="Sroda Ring", 
    })
    sets.precast.WS.SubtleBlow =  {
        left_ear="Sherida Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
	sets.precast.WS['Sonic Thrust'] = sets.precast.WS

	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Sroda Ring", 
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })
	sets.precast.WS['Stardiver'].SC = set_combine(sets.precast.WS['Stardiver'], {    head="Nyame Helm",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    left_ring="Begrudging Ring",
    })
	sets.precast.WS['Stardiver'].PDL = set_combine(sets.precast.WS.PDL, {
        head="Nyame Helm",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ring="Sroda Ring", 
    })

    sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Fotia Belt",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
	sets.precast.WS["Camlann's Torment"].SC = set_combine(sets.precast.WS["Camlann's Torment"], {    head="Nyame Helm",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
	sets.precast.WS["Camlann's Torment"].PDL = set_combine(sets.precast.WS["Camlann's Torment"], {
        head="Nyame Helm",
        body="Pelt. Plackart +3",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Gleti's Breeches",
        left_ear="Thrud Earring",
        right_ear="Pel. Earring +1",
        left_ring="Sroda Ring", 
    })
	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Thereoid Greaves",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Pel. Earring +1",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
	sets.precast.WS['Drakesbane'].SC = set_combine(sets.precast.WS['Drakesbane'], {    head="Nyame Helm",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
	sets.precast.WS['Drakesbane'].PDL = set_combine(sets.precast.WS['Drakesbane'], {
        ammo="Crepuscular Pebble",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        right_ear="Pel. Earring +1",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS['Drakesbane'].PDL.SubtleBlow = set_combine(sets.precast.WS['Drakesbane'],sets.precast.WS.SubtleBlow, {
        hands="Gleti's Gauntlets",
        body="Pelt. Plackart +3",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",    })
    sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Sherida Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Geirskogul'].SC = set_combine(sets.precast.WS['Geirskogul'], {    head="Nyame Helm",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
	sets.precast.WS['Geirskogul'].PDL = set_combine(sets.precast.WS['Geirskogul'], {
        ammo="Crepuscular Pebble",
        hands="Gleti's Gauntlets",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        right_ring="Cornelia's Ring",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
	sets.precast.WS['Impulse Drive'].SC = set_combine(sets.precast.WS['Impulse Drive'], {    head="Nyame Helm",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
	sets.precast.WS['Impulse Drive'].PDL = set_combine(sets.precast.WS['Impulse Drive'], {
        head="Gleti's Mask",
        hands="Gleti's Gauntlets",
        body="Pelt. Plackart +3",
        feet="Gleti's Boots",
    right_ear="Pel. Earring +1",
    left_ring="Sroda Ring", 
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Thrud Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
        hands="Gleti's Gauntlets",
        body="Pelt. Plackart +3",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS['Savage Blade'].PDL.SubtleBlow = set_combine(sets.precast.WS['Savage Blade'],sets.precast.WS.SubtleBlow, {
        hands="Gleti's Gauntlets",
        body="Pelt. Plackart +3",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",    })
    
    sets.precast.WS['Black Halo'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS['Judgment'] = {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist="Fotia Belt",
        right_ear="Thrud Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS['Judgment'].SC = set_combine(sets.precast.WS['Judgment'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Judgment'], {
        hands="Gleti's Gauntlets",
        body="Pelt. Plackart +3",
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        right_ear="Pel. Earring +1",
        left_ring="Sroda Ring", 
    })
    sets.precast.WS['Shattersoul'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Ishvara Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
	
-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
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
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",
    back="Argocham. Mantle",})

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

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
        head="Null Masque",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
	}


	-- Defense sets
	sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }

	sets.defense.MDT = {
        ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",   }

    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",
        body="Hjarrandi Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear="Tuisto Earring",
        left__ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Moonlight Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape", 
    }
    sets.defense.Evasion = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear="Infused Earring",
        left_ear="Eabani Earring",
        right_ring="Defending Ring",
        left_ring="Vengeful Ring",
        back="Moonlight Cape",
    }

    sets.defense.Reraise = set_combine(sets.defense.PDT, {
        head="Crepuscular Helm",
        body="Crepuscular Mail",
    })

    sets.defense.Regain = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
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
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},}


	-- Idle sets
	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.DT = sets.defense.PDT
    sets.idle.MDT = sets.defense.MDT
    sets.idle.Evasion = sets.defense.Evasion
    sets.idle.HP = sets.defense.HP

    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })

    --sets.idle.Sphere = set_combine(sets.idle, {  })

    sets.idle.Regen = set_combine(sets.idle, {
        head="Crepuscular Helm",
        body="Sacro Breastplate",
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
	sets.idle.Weak = set_combine(sets.idle, {
		head="Crepuscular Helm",
		body="Crepuscular Mail",
    })


	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Crepuscular Helm",
	body="Crepuscular Mail",}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",
	})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
    sets.passive.Twilight = {head="Crepuscular Helm",
	body="Crepuscular Mail",}
    sets.passive.SubtleBlow ={        
        body="Dagon Breast.",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
    }
    sets.passive.SubtleBlow30 ={        
        body="Dagon Breast.",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.passive.SubtleBlow20 ={        
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.passive.SubtleBlow62 ={        
        body="Dagon Breast.",
        hands="Volte Mittens",
        feet="Volte Spats",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Sarissapho. Belt",
        left_ear="Sherida Earring",
        right_ear="Pel. Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
    }
    sets.passive.MDT = {
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
    }
	sets.passive.Enspell = {waist="Orpheus's Sash",}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
	-- Extra Melee sets.  Apply these on top of melee sets.

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
    sets.rollerRing = {left_ring="Roller's Ring"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +3",
        hands="Gleti's Gauntlets",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Petrov Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

	sets.engaged.Acc = set_combine(sets.engaged, {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +3",
        hands="Flam. Manopolas +2",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Null Loop",
        waist="Ioskeha Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",    })

    sets.engaged.STP = set_combine(sets.engaged.Mid, {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Pelt. Plackart +3",
        hands="Gleti's Gauntlets",
        legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
        feet="Flam. Gambieras +2",
        neck="Anu Torque",
        waist="Ioskeha Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    })

    sets.engaged.CRIT = set_combine(sets.engaged, {
        ranged=Empty,
        ammo="Coiste Bodhar",
        head="Blistering Sallet +1",
        body="Hjarrandi Breast.",
        hands="Flam. Manopolas +2",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Thereoid Greaves",
        neck="Dgn. Collar +2",
        waist="Sailfi Belt +1",
        ear1="Sroda Earring",
        ear2="Sherida Earring",
        ring1="Niqmaddu Ring",
        ring2="Begrudging Ring",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},    })

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {        
            body="Dagon Breast.",
            left_ear="Sherida Earring",
            left_ring="Chirich Ring +1",
            right_ring="Niqmaddu Ring",

    })

---------------------------------------- DW-HASTE ------------------------------------------

sets.engaged.DW = set_combine(sets.engaged, {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
sets.engaged.DW.Acc = set_combine(sets.engaged.Acc,  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
sets.engaged.DW.STP = set_combine(sets.engaged.STP,  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
sets.engaged.DW.DA = set_combine(sets.engaged.DA,  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT,  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.SubtleBlow,  {
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring",--4
}) -- 9%
	

------------------------------------------------------------------------------------------------
    ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------

-- 15% Magic Haste (67% DW to cap)
  sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
    head="Null Masque",
    legs="Carmine Cuisses +1", --6
    feet=gear.taeon_dw_feet, --9
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
    }) -- 27%
    sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.Acc, {
        head="Null Masque",
        legs="Carmine Cuisses +1", --6
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 27%
    sets.engaged.DW.STP.LowHaste = set_combine(sets.engaged.DW.STP, {
        head="Null Masque",
        legs="Carmine Cuisses +1", --6
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 27%
    sets.engaged.DW.CRIT.LowHaste = set_combine(sets.engaged.DW.CRIT, {
        head="Null Masque",
        legs="Carmine Cuisses +1", --6
        feet=gear.taeon_dw_feet, --9
        left_ear="Suppanomimi", --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
        }) -- 27%

--MID-HASTE

sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
    head="Null Masque",
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.Acc, {
    head="Null Masque",
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.STP.MidHaste = set_combine(sets.engaged.DW.STP, {
    head="Null Masque",
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.CRIT.MidHaste = set_combine(sets.engaged.DW.CRIT, {
    head="Null Masque",
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%

--HIGH-HASTE

sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {
    head="Null Masque",
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.Acc.HighHaste = set_combine(sets.engaged.DW.Acc, {
    head="Null Masque",
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.STP.HighHaste = set_combine(sets.engaged.DW.STP, {
    head="Null Masque",
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 11%
sets.engaged.DW.CRIT.HighHaste = set_combine(sets.engaged.DW.CRIT, {
    head="Null Masque",
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
    head="Hjarrandi Helm",
    hands="Gleti's Gauntlets",
    body="Gleti's Cuirass",
    waist="Tempus Fugit +1",
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
--sets.engaged.DA.DT = set_combine(sets.engaged.DA, sets.engaged.Hybrid)
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)
sets.engaged.SubtleBlow.DT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid, {  
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Dagon Breast.",
    hands="Pel. Vambraces +2",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
})

sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
--sets.engaged.DW.DA.DT = set_combine(sets.engaged.DW.DA, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)
sets.engaged.DW.SubtleBlow.DT = set_combine(sets.engaged.DW.SubtleBlow, sets.engaged.Hybrid,{  
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Dagon Breast.",
    hands="Pel. Vambraces +2",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
})


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


-----------------------

    sets.engaged.AM = {}
	sets.engaged.AM.Acc = {}
	
    sets.engaged.PDT = {}
	sets.engaged.Acc.PDT = {}
	
    sets.engaged.AM.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

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
        windower.chat.input('/lockstyleset 151') --Catchall
    end
end



autows_list = {['Naegling']='Savage Blade',['Trishula']='Stardiver',['Shining']='Impulse Drive',
['Polearm']='Impulse Drive',['TernionDagger']='Aeolian Edge',['Club']='Judgment',
['DualNaegling']='Savage Blade',['DualTernionDagger']='Aeolian Edge',['DualClub']='Judgment'}

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
    	set_macro_page(8, 38)
    elseif player.sub_job == 'SAM' then
    	set_macro_page(8, 38)
    elseif player.sub_job == 'BLU' then
    	set_macro_page(8, 38)
    else
    	set_macro_page(8, 38)
    end
end


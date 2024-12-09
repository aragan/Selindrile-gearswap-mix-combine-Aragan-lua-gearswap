-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

in macro for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
u can use addon automb 
]]


function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal', 'Acc', 'CRIT', 'Enspell', 'SubtleBlow')
    state.HybridMode:options('Normal','PDT')
	state.WeaponskillMode:options('Normal', 'PDL', 'SC')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options( 'Duration','Normal', 'Burst', 'SIRD', 'DT')
    state.IdleMode:options('Normal', 'PDT', 'MDT','Regen', 'HP', 'EnemyCritRate', 'Evasion', 'Enmity', 'Sphere')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualSWORDS','DualCrocea','DualClub','DualDAGGERS','SWORDS', 'Crocea', 'DAGGERS', 'Club')
	state.Shield = M{['description']='Weapon Set', 'Normal', 'Ammurapi', 'Bulwark'}
	--state.WeaponSet = M{['description']='Weapon Set', 'Normal', 'SWORDS', 'Crocea', 'DAGGERS', 'Club'}

	gear.stp_jse_back = {}
	gear.nuke_jse_back = {}
	gear.wsd_jse_back = {}

		--use //listbinds    .. to show command keys
    -- Additional local binds
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind ^f10 gs c set DefenseMode Physical')
	send_command('bind ^f11 gs c set DefenseMode Magical')
	send_command('bind f5 gs c cycle WeaponskillMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind f12 gs c cycle CastingMode')
	send_command('bind f1 gs c cycle HippoMode')
	send_command('bind @z gs c cycle EnSpell')
    send_command('bind f2 gs c cycle GainSpell')
    send_command('bind f3 gs c cycle BarElement')
    send_command('bind !f4 gs c cycle BarStatus')
    send_command('bind @a gs c toggle NM')
    send_command('bind !s gs c cycle SleepMode')
	send_command('bind @s gs c toggle SrodaNecklace')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
	send_command('bind ^3 gs c toggle AutoDefenseMode')
	send_command('bind f7 gs c cycle Shield')

	send_command('bind f6 gs c cycle Weapons') --Cycle through weapons sets.
    send_command('bind !f6 gs c cycleback Weapons') --Cycle through weapons sets.

	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
	--send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	

	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	---- Weapons ----

	sets.weapons.Normal = {}
	sets.weapons.SWORDS = {main="Naegling",}
	sets.weapons.Crocea = {main="Crocea Mors", }
	sets.weapons.Club = {main="Maxentius", }
	sets.weapons.DAGGERS = {main="Tauret", }
	sets.weapons.DualSWORDS = {main="Naegling", sub="Demers. Degen +1"}
	sets.weapons.DualCrocea = {main="Crocea Mors", sub="Daybreak"}
	sets.weapons.DualClub = {main="Maxentius", sub="Thibron"}
	sets.weapons.DualDAGGERS = {main="Tauret", sub="Gleti's Knife",}

    --[[sets.Normal = {}
	sets.SWORDS = {main="Naegling", sub="Demers. Degen +1"}
	sets.Crocea = {main="Crocea Mors", sub="Daybreak"}
	sets.Club = {main="Maxentius", sub="Thibron"}
	sets.DAGGERS = {main="Tauret", sub="Gleti's Knife",}
	]]

	sets.Ammurapi = {sub="Ammurapi Shield"}
	sets.Bulwark = {sub="Sacro Bulwark"}

	sets.DefaultShield = {sub="Sacro Bulwark"}

	-- neck JSE Necks Reinforcement Points Mode add u neck here 
    sets.RP = {}
	-- Capacity Points Mode back
    sets.Capacity = {}

	sets.Srodanecklace = {neck="Sroda necklace"}

	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	sets.precast.JA['Sublimation'] = {
		waist="Embla Sash",}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}
			
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.RA = {ammo=empty,
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	left_ear="Crep. Earring",
	right_ear="Telos Earring",
	}

	-- Fast cast sets for spells

	sets.precast.FC = {
		head={ name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6','INT+1',}},
		hands="Leyline Gloves",
		waist="Witful Belt",
		ear1="Loquacious Earring",
		ear2="Leth. Earring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},	}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs="Doyen Pants",
        head="Umuthi Hat",
        waist="Siegel Sash",})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Sacro Bulwark"})
       

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Aurgelmir Orb +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Cornelia's Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.precast.WS.PDL = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})
	sets.precast.WS.SC = set_combine(sets.precast.WS, {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
	})
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {
		ammo="Regal Gem",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Bunzi's Gloves",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Rufescent Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
	sets.precast.WS['Requiescat'].PDL = set_combine(sets.precast.WS['Requiescat'], {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})

    sets.precast.WS['Savage Blade'] = {
		ammo="Aurgelmir Orb +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		right_ear="Sherida Earring",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Cornelia's Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})
		
	sets.precast.WS['Death Blossom'] = {
    ammo="Aurgelmir Orb +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.precast.WS['Death Blossom'].PDL = set_combine(sets.precast.WS['Death Blossom'], {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})
	
	sets.precast.WS['Chant Du Cygne'] = {
		ammo="Yetshila +1",
		ammo="Staunch Tathlum +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Jhakri Robe +2",
		hands="Malignance Gloves",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Mache Earring +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Cornelia's Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.precast.WS['Chant Du Cygne'].PDL = set_combine(sets.precast.WS['Chant Du Cygne'], {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})

	sets.precast.WS['Evisceration'] = {
		ammo="Yetshila +1",
		ammo="Staunch Tathlum +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Jhakri Robe +2",
		hands="Malignance Gloves",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Mache Earring +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Cornelia's Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	} 
	sets.precast.WS['Evisceration'].PDL = set_combine(sets.precast.WS['Evisceration'], {
		ammo="Crepuscular Pebble",
		hands="Malignance Gloves",
		left_ring="Sroda Ring", 
	})

	
 sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {
})
sets.precast.WS['Black Halo'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
	ammo="Crepuscular Pebble",
	hands="Malignance Gloves",
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
	left_ring="Rufescent Ring",
	back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.precast.WS['Shattersoul'].PDL = set_combine(sets.precast.WS['Shattersoul'], {
	ammo="Crepuscular Pebble",
	hands="Malignance Gloves",
	left_ring="Sroda Ring", 
})

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
        left_ring="Cornelia's Ring",
        right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
	left_ring="Cornelia's Ring",
	right_ring="Freke Ring",
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


	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	sets.SIRD = {
		ammo="Staunch Tathlum +1",
		body={ name="Ros. Jaseran +1", augments={'Path: A',}},
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
		legs="Bunzi's Pants",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Rumination Sash",
		right_ring="Freke Ring",
	}
	sets.DT = {
		ammo="Staunch Tathlum +1",
		body={ name="Bunzi's Robe", augments={'Path: A',}},
		legs={ name="Bunzi's Pants", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
	}


	sets.midcast.Absorb = {
		ammo="Pemphredo Tathlum",
		neck="Erra Pendant",
		waist="Acuity Belt +1",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Kishar Ring",
	}
	sets.Duration = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub="Ammurapi Shield",
		head="Telchine Cap",
		body="Lethargy Sayon +3",
		hands="Lethargy Gantherots +2",
		legs="Telchine Braconi",
		feet="Leth. Houseaux +2",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		right_ear="Leth. Earring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range=empty,ammo="Hasty Pinion +1",
		head="Atrophy Chapeau +3",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}
		sets.midcast.Cure = {
			ammo="Staunch Tathlum +1",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+5','"Cure" potency +10%','MND+4','Mag. Acc.+1',}},
			hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
			neck="Incanter's Torque",
			waist="Luminary Sash",
			left_ear="Halasz Earring",
			right_ear="Mendi. Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Solemnity Cape",
		}
		sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, {
			ammo="Staunch Tathlum +1",
			body={ name="Ros. Jaseran +1", augments={'Path: A',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
			legs="Bunzi's Pants",
			neck={ name="Loricate Torque +1", augments={'Path: A',}},
			waist="Rumination Sash",
			right_ring="Freke Ring",
		})
			
		sets.midcast.Curaga = sets.midcast.Cure
		sets.midcast.Curaga.SIRD = set_combine(sets.midcast.Cure, {
			ammo="Staunch Tathlum +1",
			body={ name="Ros. Jaseran +1", augments={'Path: A',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
			legs="Bunzi's Pants",
			neck={ name="Loricate Torque +1", augments={'Path: A',}},
			waist="Rumination Sash",
			right_ring="Freke Ring",
		})
		sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi",back="Twilight Cape",})

		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = sets.midcast.LightWeatherCure
		
	sets.midcast.Cursna = {	legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck="Debilis Medallion",
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.Cursna, {})
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub="Ammurapi Shield",
		head="Befouled Crown",
		body="Telchine Chas.",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Leth. Houseaux +2",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Leth. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.midcast['Enhancing Magic'].SelfDuration = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub="Ammurapi Shield",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Leth. Houseaux +2",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Leth. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.midcast['Enhancing Magic'].Duration = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub="Ammurapi Shield",
		head="Leth. Chappel +2",   
		body="Telchine Chas.",
		hands="Leth. Ganth. +2",
		legs="Telchine Braconi",
		feet="Leth. Houseaux +2",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Leth. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		body="Lethargy Sayon +3",
		hands="Lethargy Gantherots +2",
		feet="Leth. Houseaux +2",
	}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub="Ammurapi Shield",
		head="Befouled Crown",
		hands="Leth. Ganth. +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Leth. Houseaux +2",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Leth. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",})
sets.midcast.Protectra = sets.midcast.Protect
sets.midcast.Shell = sets.midcast.Protect
sets.midcast.Shellra = sets.midcast.Shell
sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'].Skill, {})
sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'].Duration, {})
    sets.midcast['Enhancing Magic'].GainSpell = set_combine(sets.midcast['Enhancing Magic'].SelfDuration, {hands="Vitiation gloves +3"})
	
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'].Duration, {})
	sets.midcast.Aquaveil = {hands="Regal Cuffs",}
	sets.midcast.BarElement = {}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		legs="Haven Hose",
		left_ear="Earthcry Earring",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
	sets.midcast.Stoneskin.Duration = set_combine(sets.midcast['Enhancing Magic'].Duration, {
		legs="Haven Hose",
		left_ear="Earthcry Earring",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

-- If you have them, add Shedir Seraweels, Regal Cuffs, Amalric Coif (+1), or Chironic Hat
sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'].Duration, {
	hands="Regal Cuffs",
})
sets.midcast['Enfeebling Magic'] = {
	ammo=empty,
	range="Ullr",
	head="Leth. Chappel +2",   
	body="Lethargy Sayon +3",
	hands="Regal Cuffs",
	legs="Leth. Fuseau +2",
	feet="Leth. Houseaux +2",
	neck={ name="Dls. Torque +2", augments={'Path: A',}},
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring="Stikini Ring +1",
	right_ring="Kishar Ring",
	back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

sets.midcast['Enfeebling Magic'].Macc = set_combine(sets.midcast['Enfeebling Magic'], {
	ammo=empty,
	range="Ullr",
	head="Leth. Chappel +2",   
	body="Lethargy Sayon +3",
	hands="Regal Cuffs",
	legs="Leth. Fuseau +2",
	feet="Leth. Houseaux +2",
	neck={ name="Dls. Torque +2", augments={'Path: A',}},
	waist={ name="Acuity Belt +1", augments={'Path: A',}},
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	back={ name="Aurist's Cape +1", augments={'Path: A',}},
})
	
sets.midcast['Enfeebling Magic'].Skill = {
	ammo=empty,
	range="Ullr",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Lethargy Sayon +3",
	hands="Leth. Ganth. +2",
	legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
	feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
	neck={ name="Dls. Torque +2", augments={'Path: A',}},
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring="Stikini Ring",
	right_ring="Stikini Ring",
	back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.midcast['Enfeebling Magic'].Potency = {
	ammo="Regal Gem",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Lethargy Sayon +3",
	hands="Leth. Ganth. +2",
	legs="Leth. Fuseau +2",
	feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
	neck={ name="Dls. Torque +2", augments={'Path: A',}},
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring="Stikini Ring",
	right_ring="Kishar Ring",
	back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {})
		
    sets.Saboteur = set_combine(sets.midcast['Enfeebling Magic'].Potency, {
	hands="Lethargy Gantherots +2"})
	sets.midcast['Enfeebling Magic'].ParalyzeDuration = set_combine(sets.midcast['Enfeebling Magic'].Potency,{})
    sets.Dia = set_combine(sets.midcast['Enfeebling Magic'].Potency,{
	--main="Daybreak",
	--sub="Ammurapi Shield",
	legs="Malignance Tights",
    })
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic']
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'].Skill, {})
	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'])
		
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'])

	sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Leth. Chappel +2",
		body="Lethargy Sayon +3",
		hands="Amalric Gages +1",
		legs="Leth. Fuseau +2",
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck="Baetyl Pendant",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back="Argocham. Mantle",
	}

	-- Gear for Magic Burst mode.

	sets.magicburst = {    
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Ea Houppelande",
		hands="Amalric Gages +1",
		legs="Leth. Fuseau +2",
		feet="Leth. Houseaux +2",
		neck="Sibyl Scarf",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back="Argocham. Mantle",
	}
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak",
		hands="Leth. Ganth. +2",
		legs="Leth. Fuseau +2",
		feet="Leth. Houseaux +2",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		right_ear="Snotra Earring",
		left_ring="Stikini Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	})
	
    sets.midcast['Elemental Magic'].Proc = {}
		
		

	sets.midcast['Dark Magic'] = {
		ammo="Regal Gem",
		body="Cohort Cloak +1",
		hands="Regal Cuffs",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
	--sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		head="Pixie Hairpin +1",
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Drain" and "Aspir" potency +10','CHR+5','Mag. Acc.+4',}},
		feet="Merlinic Crackows",
		ring1="Evanescence ring",
		ring2="Archon Ring",
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
	})
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Stun = {
		ammo="Regal Gem",
		head=empty;
		body="Cohort Cloak +1",
		hands="Leth. Ganth. +2",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
		

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +2"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = { 
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +3",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
	})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {	head="Befouled Crown",
	body="Shamash Robe",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	left_ear="Infused Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",}
	

	-- Idle sets
	sets.idle = {	ammo="Homiliary",
	head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
	body="Lethargy Sayon +3",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Carrier's Sash",
	left_ear="Etiolation Earring",
	right_ear="Genmei Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	back="Moonlight Cape",}
		
	sets.idle.PDT = {	ammo="Homiliary",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body="Adamantite Armor",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Carrier's Sash",
	left_ear="Tuisto Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Paguroidea Ring",
	right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	back="Moonlight Cape",}
		
sets.idle.MDT = {
	ammo="Staunch Tathlum +1",
	head={ name="Bunzi's Hat", augments={'Path: A',}},
	body={ name="Bunzi's Robe", augments={'Path: A',}},
	hands={ name="Bunzi's Gloves", augments={'Path: A',}},
	legs="Malignance Tights",
	feet={ name="Bunzi's Sabots", augments={'Path: A',}},
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Carrier's Sash",
	left_ear="Sanare Earring",
	right_ear="Eabani Earring",
	left_ring="Purity Ring",
	right_ring="Shadow Ring",
	back="Moonlight Cape",
}

sets.idle.HP={
	ammo="Staunch Tathlum +1",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body="Adamantite Armor",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	waist="Plat. Mog. Belt",
	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Tuisto Earring",
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Ilabrat Ring",
	back="Moonlight Cape",
}

sets.idle.Enmity = {
	ammo="Sapience Orb",
	head="Halitus Helm",
	body={ name="Emet Harness +1", augments={'Path: A',}},
	hands="Merlinic Dastanas",
	legs={ name="Zoar Subligar +1", augments={'Path: A',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	waist="Flume Belt +1",
	left_ear="Trux Earring",
	right_ear="Cryptic Earring",
	left_ring="Eihwaz Ring",
	right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
	back="Reiki Cloak",
}
sets.idle.Evasion = {
	ammo="Amar Cluster",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Svelt. Gouriz +1",
	left_ear="Infused Earring",
	right_ear="Eabani Earring",
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Vengeful Ring",
	back="Moonlight Cape",
}
sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
	ammo="Eluder's Sachet",
	left_ring="Warden's Ring",
	right_ring="Fortified Ring",
	back="Reiki Cloak",
})
sets.idle.Sphere = set_combine(sets.idle, {
	body="Annoint. Kalasiris",
})
	-- Defense sets
	sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Adamantite Armor",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Paguroidea Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Moonlight Cape",}
	
	sets.defense.MDT = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Bunzi's Gloves",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Sanare Earring",
		right_ear="Eabani Earring",
		left_ring="Purity Ring",
		right_ring="Vengeful Ring",
		back="Moonlight Cape",}
		
	
	sets.defense.MEVA = {range=empty,ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}


	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.latent_refresh = {waist="Fucho-no-obi",}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

sets.engaged = {
	ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Sherida Earring",
	right_ear="Telos Earring",
	left_ring="Petrov Ring",
	right_ring="Chirich Ring +1",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
sets.engaged.Acc = {
	ammo="Aurgelmir Orb +1",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Sherida Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},		}
	
sets.engaged.CRIT = {
	ammo="Coiste Bodhar",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Ayanmo Corazza +2",
	hands="Bunzi's Gloves",
	legs={ name="Zoar Subligar +1", augments={'Path: A',}},
	feet="Thereoid Greaves",
	neck="Nefarious Collar +1",
	waist="Gerdr Belt",
	left_ear="Sherida Earring",
	right_ear="Brutal Earring",
	left_ring="Hetairoi Ring",
	right_ring="Petrov Ring",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},	} 

	sets.engaged.Enspell = {
		ammo="Coiste Bodhar",
		head="Umuthi Hat",
		body="Malignance Tabard",
		ands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.engaged.EnspellDBL = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Umuthi Hat",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Asperity Necklace",
		waist="Orpheus's Sash",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Petrov Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.SubtleBlow = set_combine(sets.engaged ,{
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    --DW cap all set haste capped

	sets.engaged.DW = set_combine(sets.engaged ,{
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})

	sets.engaged.DW.Acc = set_combine(sets.engaged.Acc ,{
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},    })

	sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT ,{
		ammo="Coiste Bodhar",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Thereoid Greaves",
		neck="Nefarious Collar +1",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Petrov Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})

	sets.engaged.DW.Enspell = {   
		ammo="Coiste Bodhar",
		head="Umuthi Hat",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.DW.EnspellDBL = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Umuthi Hat",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Asperity Necklace",
		waist="Orpheus's Sash",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Hetairoi Ring",
		right_ring="Petrov Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.DW ,{
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
	sets.engaged.Hybrid = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	}

	sets.engaged.PDT = set_combine(sets.engaged , {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})
	sets.engaged.Acc.PDT = set_combine(sets.engaged , {
			ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet="Malignance Boots",
	})
	sets.engaged.Enspell.PDT =  set_combine(sets.engaged.Enspell , {
		ammo="Coiste Bodhar",
		head="Umuthi Hat",
		body="Malignance Tabard",
		ands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Orpheus's Sash",
		left_ring="Chirich Ring +1",
		})
	sets.engaged.EnspellDBL.PDT = set_combine(sets.engaged.EnspellDBL , {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Umuthi Hat",
			body="Malignance Tabard",
			hands="Aya. Manopolas +2",
			legs="Malignance Tights",
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			waist="Orpheus's Sash",
			left_ring="Hetairoi Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT , {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})
	sets.engaged.SubtleBlow.PDT = set_combine(sets.SubtleBlow ,{
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

	--DW-DT

	sets.engaged.DW.PDT = set_combine(sets.engaged.DW , {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
	})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc , {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
	})
	sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.CRIT , {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
	})
	sets.engaged.DW.Enspell.PDT =  set_combine(sets.engaged.Enspell , {
		ammo="Coiste Bodhar",
		head="Umuthi Hat",
		body="Malignance Tabard",
		ands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Orpheus's Sash",
		left_ear="Suppanomimi",
		left_ear="Eabani Earring",
		left_ring="Chirich Ring +1",
	})
	sets.engaged.DW.EnspellDBL.PDT = set_combine(sets.engaged.EnspellDBL , {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Umuthi Hat",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		waist="Orpheus's Sash",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	sets.engaged.DW.SubtleBlow.PDT = set_combine(sets.SubtleBlow ,{
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
        set_macro_page(5, 22)
	elseif player.sub_job == 'NIN' then
        set_macro_page(5, 22)
	elseif player.sub_job == 'BLM' then
        set_macro_page(5, 22)
	elseif player.sub_job == 'WHM' then
        set_macro_page(5, 22)
	else
        set_macro_page(5, 22)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 152')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 152')
			else
				windower.chat.input('/lockstyleset 152') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 152')
			else
				windower.chat.input('/lockstyleset 152') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 152')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 152')
			else
				windower.chat.input('/lockstyleset 152') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 152')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 152')
	else
		windower.chat.input('/lockstyleset 152')
	end
end

autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',['DualEvisceration']='Evisceration',['DualClubs']='Black Halo',['DualAeolian']='Aeolian Edge',['EnspellDW']='Sanguine Blade'}
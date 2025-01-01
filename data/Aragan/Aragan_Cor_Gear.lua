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
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'Ranged', 'CRIT')
    state.HybridMode:options('Normal', 'PDT')
    state.RangedMode:options('Normal', 'Acc', 'STP', 'NOENMITY', 'Critical')
    state.WeaponskillMode:options('Match','Normal', 'PDL', 'SC')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Evasion', 'HP', 'Regen', 'EnemyCritRate')
    state.PhysicalDefenseMode:options('PDT', 'Evasion', 'HP')
    state.MagicalDefenseMode:options('MDT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('None','SWORDS','Tauret','Rostam','Kustawi','Ranged')
	state.CompensatorMode:options('Never','Always','300','1000')
    state.Weapongun = M{['description']='Weapon Set', 'normal', 'DeathPenalty', 'Anarchy', 'Fomalhaut', 'Earp'}

    gear.RAbullet = "Decimating Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15
    --Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind !f1 gs c toggle RngHelper')
    send_command('bind !a gs c toggle phalanxset') 

	--send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	--send_command('bind ^q gs c weapons DualAeolian;gs c update')
	--send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	
    send_command('bind @pause roller roll')
    send_command('bind f7 gs c cycle Weapongun')
    send_command('bind !f7 gs c cycleback Weapongun')
    send_command('bind !w gs c toggle WeaponLock')
    send_command('bind @x gs c toggle RP')  
	send_command('bind @z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
    send_command('bind f3 gs c cycle QDMode')
    send_command('bind !c gs c toggle CompensatorMode')  




    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------



	-- Weapons sets
    sets.weapons.SWORDS = {main="Naegling", sub="Crepuscular Knife",}
    sets.weapons.Rostam = {main={ name="Rostam", augments={'Path: A',}}, sub="Tauret"}
	sets.weapons.Tauret = {main="Tauret", sub="Crepuscular Knife",}
    sets.weapons.Kustawi = {main="Kustawi +1", sub="Crepuscular Knife",}
    sets.weapons.Ranged = {main="Rostam",sub="Nusku Shield",range="Fomalhaut"}

   --[[  sets.weapons.Default = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling", sub="Crepuscular Knife",}
	sets.weapons.DualEvisceration = {main="Tauret", sub="Crepuscular Knife",}
	sets.weapons.DualLeadenRanged = {main="Rostam",sub="Tauret",range="Fomalhaut"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Atoyac",range="Fomalhaut"}
	sets.weapons.DualAeolian = {main="Rostam",sub="Tauret",range="Ataktos"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualRanged = {main="Rostam",sub="Kustawi +1",range="Fomalhaut"}]]

    --Weapongun
    sets.normal = {}
    sets.DeathPenalty = {range="Death Penalty"}
    sets.Anarchy = {range="Anarchy +2"}
    sets.Fomalhaut = {range="Fomalhaut"}
    sets.Earp = {range="Earp"}

    sets.DefaultShield = {sub="Nusku Shield"}
    sets.FullTP = {ear1="Crematio Earring"}


     -- neck JSE Necks Reinforcement Points Mode add u neck here 
     sets.RP = {}
    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +2"}
    sets.precast.JA['Snake Eye'] = {}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

    sets.precast.CorsairRoll = {
        main={ name="Rostam", augments={'Path: C',}},
        range="Compensator", 
        head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
        body="Adamantite Armor",
        hands="Chasseur's Gants +3",
        legs="Desultor Tassets",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck="Regal Necklace",
        right_ear="Genmei Earring",
        left_ring="Defending Ring",
        right_ring="Luzaf's Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
        
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +3",})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +2",})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +2",})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3",})
    
    sets.precast.CorsairShot =  {ammo=gear.QDbullet,
    head="Nyame Helm",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Dingir Ring",
    right_ring="Cornelia's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
	sets.precast.CorsairShot.Damage =sets.precast.CorsairShot
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = { ammo=gear.QDbullet,
    head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Chass. Bottes +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Chas. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +2"})
    --sets.precast.CorsairShot.Enhance = {feet="Chass. Bottes +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Mummu Bonnet +2",    
        body="Passion Jacket",
        ring1="Asklepian Ring",
        waist="Gishdubar Sash",}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
    hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
    head="Chass. Tricorne +2",
    body="Oshosi Vest +1",
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
feet="Meg. Jam. +2",
neck={ name="Comm. Charm +2", augments={'Path: A',}},
waist="Yemaya Belt",
back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {    body="Laksa. Frac +3", --0/20
})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {  hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    head="Chass. Tricorne +2",
    body="Laksa. Frac +3",
 legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
 feet="Meg. Jam. +2",
 waist="Yemaya Belt",
 back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})

       
sets.precast.JA.Jump = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}) 
sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",
        body="Laksa. Frac +3",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        body="Ikenga's Vest",
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

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = {
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mummu Jacket +2",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Odr Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back="Annealed Mantle",
    }
    sets.precast.WS['Evisceration'].PDL = sets.precast.WS['Evisceration'], {
        body="Ikenga's Vest",
        left_ear="Mache Earring +1",
    }

    sets.precast.WS['Savage Blade'] = {
        head="Nyame Helm",
		body="Nyame Mail",
        hands="Chasseur's Gants +3",
        legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
        body="Ikenga's Vest",
		left_ring="Sroda Ring", 
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist="Kentarch Belt +1",
	})

    sets.precast.WS['Requiescat'] = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Telos Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Rufescent Ring",
        back="Annealed Mantle",
}

    sets.precast.WS['Last Stand'] = {
    ammo=gear.WSbullet,
    head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
    body="Ikenga's Vest",
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Last Stand'].PDL = set_combine(sets.precast.WS['Last Stand'], {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ikenga's Vest",
    legs="Ikenga's Trousers",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Sroda Ring", 
    right_ring="Cornelia's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS['Last Stand'].SC = set_combine(sets.precast.WS['Last Stand'], {
        ammo=gear.WSbullet,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Laksa. Frac +3",
        hands="Chasseur's Gants +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Ishvara Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Dingir Ring",
        right_ring="Regal Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head="Nyame Helm",
        body="Lanun Frac +3",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear="Crematio Earring",
        left_ring="Dingir Ring",
        right_ring="Cornelia's Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Wildfire'].SC = set_combine(sets.precast.WS['Wildfire'],  {
    head={ name="Nyame Helm", augments={'Path: B',}},
    right_ear="Chas. Earring +1",
    left_ear="Digni. Earring",
    neck="Fotia Gorget",
})
    sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Wildfire'],  {  
    hands="Chasseur's Gants +3",})

    sets.precast.WS['Leaden Salute'] = {     
    ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    
    sets.precast.WS['Leaden Salute'].PDL = {   
    ammo=gear.RAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS['Leaden Salute'].SC = set_combine(sets.precast.WS['Leaden Salute'],  {
        head={ name="Nyame Helm", augments={'Path: B',}},
        right_ear="Chas. Earring +1",
        left_ear="Digni. Earring",
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
    })


-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    head="Nyame Helm",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Cornelia's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast =  sets.precast.FC
        
    -- Specific spells

    sets.midcast.SpellInterrupt = {
        hands="Rawhide Gloves", --15
        legs="Carmine Cuisses +1", --20
        neck="Loricate Torque +1", --5
        ear1="Halasz Earring", --5
        ring2="Evanescence Ring", --5
        waist="Rumination Sash", --10
        }
	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
    
    sets.midcast['Enhancing Magic'] = {
            neck="Incanter's Torque",
            waist="Olympus Sash",
            left_ear="Brachyura Earring",
            right_ear="Andoaa Earring",
            left_ring="Stikini Ring +1",
            right_ring="Stikini Ring +1",
            back="Moonlight Cape",
    }

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = set_combine(sets.midcast['Enhancing Magic'], {
        body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    })
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
        body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    })
    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt
    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        neck="Erra Pendant",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    }
    -- Ranged gear
    sets.midcast.RA = {  ammo=gear.RAbullet,
    head="Ikenga's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

    sets.midcast.RA.Acc = {  ammo=gear.WSbullet,
    head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
sets.midcast.RA.STP = {
    ammo=gear.RAbullet,
    head="Ikenga's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Gerdr Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
sets.midcast.RA.NOENMITY = set_combine(sets.midcast.RA, {
    head="Ikenga's Hat",
    body="Ikenga's Vest",
    hands="Ikenga's Gloves",
    legs="Ikenga's Trousers",
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    right_ear="Enervating Earring",
    right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.midcast.RA.Critical = set_combine(sets.midcast.RA, {
    ammo=gear.WSbullet,
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Chasseur's Gants +3",
    legs="Mummu Kecks +2",
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="Gerdr Belt",
    left_ear="Odr Earring",
    right_ear="Chas. Earring +1",
    left_ring="Mummu Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +2"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {
        neck="Nicander's Necklace",
        waist="Gishdubar Sash",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1",
    })
    
    -- Resting sets
    sets.resting = {    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    left_ear="Infused Earring",
    ring1="Sheltered Ring",ring2="Paguroidea Ring"
}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {
    head="Malignance Chapeau",
    body="Adamantite Armor",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",}
		
sets.idle.Evasion = set_combine(sets.idle, {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    left_ear="Infused Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
sets.idle.Town ={legs="Carmine Cuisses +1",
    left_ear="Infused Earring",}
sets.idle.HP =  {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Ilabrat Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
}
sets.idle.Regen = set_combine(sets.idle, {
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    right_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.idle.EnemyCritRate = set_combine(sets.idle, { 
    ammo="Eluder's Sachet",
    left_ring="Warden's Ring",
    right_ring="Fortified Ring",
    back="Reiki Cloak",
})

    -- Defense sets
    sets.defense.PDT = {
        head="Nyame Helm",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Paguroidea Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    
    sets.defense.MDT = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Shadow Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.Evasion =  {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.defense.HP =  {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Ilabrat Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
        
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {
        body="Adhemar Jacket +1",
        hands="Floral Gauntlets", --5
        legs="Carmine Cuisses +1", --6        waist="Reiki Yotai"
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        }
    sets.engaged.Acc = {
        head="Malignance Chapeau",
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Kentarch Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.CRIT = {
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Mummu Gamash. +2",
        neck="Nefarious Collar +1",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Epona's Ring",
        right_ring="Hetairoi Ring",
            back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.Ranged = {    
        head="Malignance Chapeau",
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Chas. Culottes +3",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    
    sets.engaged.STP = set_combine(sets.engaged, {
            left_ear="Dedition Earring",
            ring1="Chirich Ring +1",
            ring2="Chirich Ring +1",
            waist="Kentarch Belt +1",
    })
    
    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    --DW cap all set haste capped

    sets.engaged.DW = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Suppanomimi",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc,{
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
    })
    sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT,{
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
    })
    sets.engaged.DW.Ranged = {    
        head="Malignance Chapeau",
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Chas. Culottes +3",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Epona's Ring",
        right_ring="Petrov Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.engaged.DW.STP = set_combine(sets.engaged, {
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
    })


------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------
sets.engaged.Hybrid = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
}
   
sets.engaged.PDT = set_combine(sets.engaged,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.Ranged.PDT = set_combine(sets.Ranged,{    
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.STP.PDT = set_combine(sets.engaged.STP,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})
sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.DW.CRIT,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})
sets.engaged.DW.Ranged.PDT = set_combine(sets.engaged.DW.Ranged,{    
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chas. Culottes +3",
    feet="Malignance Boots",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
})

sets.engaged.DW.STP.PDT = set_combine(sets.engaged.DW.STP,{
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    left_ear="Suppanomimi",
    waist="Reiki Yotai",
})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(5, 26)
    elseif player.sub_job == 'DNC' then
        set_macro_page(5, 26)
    elseif player.sub_job == 'RNG' then
        set_macro_page(5, 26)
    elseif player.sub_job == 'DRG' then
        set_macro_page(5, 26)
    else
        set_macro_page(5, 26)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 151')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 151')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 151')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 151')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 151')
		else
			windower.chat.input('/lockstyleset 151') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 151')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
				windower.chat.input('/lockstyleset 151')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 151')
		else
			windower.chat.input('/lockstyleset 151') --Catchall just in case something's weird.
		end
	end
end

autows_list = {['Default']='Savage Blade',['Evisceration']='Evisceration',['Savage']='Savage Blade',['Ranged']='Last Stand',['DualWeapons']='Savage Blade',['DualSavageWeapons']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}
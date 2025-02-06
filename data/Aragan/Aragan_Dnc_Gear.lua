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
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'CRIT', 'SubtleBlow', 'Regain', 'DT')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Match','Normal', 'SC', 'PDL')
	state.IdleMode:options('Normal','PDT', 'DT','Regen', 'HP', 'Evasion', 'Enmity', 'EnemyCritRate')
    state.PhysicalDefenseMode:options('Evasion', 'PDT', 'DT', 'Enmity', 'HP', 'Regain')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Twashtar','Centovente','Aeneas','Tauret','Swords','Club','H2H','Staff')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	
	gear.stp_jse_back = {}
	gear.wsd_jse_back = {}
	
    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
    send_command('bind f11 gs c cycle MagicalDefenseMode;gs c set DefenseMode Magical') --Changes your magical defense set.

	send_command('bind %~` gs c cycle SkillchainMode')
    send_command('bind f2 gs c toggle CurrentStep')
    send_command('bind f3 gs c cycle mainstep')
    send_command('bind f4 gs c cycle altstep')
    send_command('bind f7 gs c toggle usealtstep')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets

    sets.weapons.Twashtar = {main={ name="Twashtar", augments={'Path: A',}}, sub="Crepuscular Knife",}
    sets.weapons.Centovente = {main={ name="Twashtar", augments={'Path: A',}}, sub="Centovente"}
    sets.weapons.Aeneas = {main={ name="Aeneas", augments={'Path: A',}}, sub="Centovente"}
    sets.weapons.Tauret = {main="Tauret", sub={ name="Gleti's Knife", augments={'Path: A',}},}
    sets.weapons.Swords = {main={ name="Demers. Degen +1", augments={'Path: A',}},sub="Crepuscular Knife",}
    sets.weapons.Club = {main="Mafic Cudgel", sub="Centovente"}
    sets.weapons.H2H = {main="Karambit"}
    sets.weapons.Staff = {main="Gozuki Mezuki", sub="Alber Strap",}


    -- neck JSE Necks Reinf
    sets.RP = {}
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Suppanomimi", ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",head="Maxixi Tiara +3",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	

    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +1"} 

    sets.precast.JA['Trance'] = {} --head="Horos Tiara +1"
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {  ammo="Yamarang",
    head="Mummu Bonnet +2",
    body="Maxixi Casaque +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Dashing Subligar",
    feet="Maxixi Toe Shoes +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara +3",back="Senuna's Mantle"}

    sets.precast.Jig = {feet="Maxixi Toe Shoes +3",}

    sets.precast.Step = {  ammo="C. Palug Stone",
    head="Maxixi Tiara +3",
    body="Malignance Tabard",
    hands="Maxixi Bangles +3",
    legs="Malignance Tights",
    feet="Horos T. Shoes +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Olseni Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Sacro Mantle",}
		
    --sets.precast.Step['Feather Step'] = set_combine(sets.precast.Step, {feet="Macu. Toe Sh. +2"})

    sets.Enmity = {    ammo="Iron Gobbet",
    head="Halitus Helm",
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands="Kurys Gloves",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Ahosi Leggings",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Petrov Ring",
    back="Reiki Cloak",}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {  
    ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Sacro Mantle",}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {    ammo="C. Palug Stone",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Horos T. Shoes +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Olseni Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Sacro Mantle",}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle"} --hands="Charis Bangles +2"

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Macu. Casaque +1"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara +2"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
    body="Taeon Tabard",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    neck="Baetyl Pendant",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    right_ring="Rahab Ring",
    left_ring="Prolix Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket",})


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
    sets.precast.WS = {  
        ammo="Aurgelmir Orb +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},    
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back="Sacro Mantle",
    }
    sets.precast.WS.SC = set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
    
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    ammo="Crepuscular Pebble",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    right_ear="Maculele Earring",
    })
    
    sets.precast.WS.PDL.Clim = {
        ammo="Crepuscular Pebble",
        head="Maculele Tiara +2",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        right_ear="Maculele Earring",
        back="Sacro Mantle",
    }
    sets.precast.WS.Clim = {
        head="Maculele Tiara +2",
    }

    sets.precast.WS.Critical = {body="Meg. Cuirie +2"}
    
    
        -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
        sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},    
        head="Maculele Tiara +2",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",})
    
        sets.precast.WS['Exenterator'].SC = set_combine(sets.precast.WS['Exenterator'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
        sets.precast.WS['Exenterator'].PDL = set_combine(sets.precast.WS['Exenterator'], {
            ammo="Crepuscular Pebble",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    right_ear="Maculele Earring",
        })
    
        sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
            ammo={ name="Coiste Bodhar", augments={'Path: A',}},
            head="Maculele Tiara +2",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
            neck="Fotia Gorget",
            waist="Fotia Belt",
            left_ear="Sherida Earring",
            right_ear="Brutal Earring",
            left_ring="Gere Ring",
            right_ring="Regal Ring",
            back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Pyrrhic Kleos'].SC = set_combine(sets.precast.WS.SC, {
            head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
    
        sets.precast.WS['Pyrrhic Kleos'].PDL = set_combine(sets.precast.WS.SC, {
            ammo="Crepuscular Pebble",
            head={ name="Gleti's Mask", augments={'Path: A',}},
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
            legs={ name="Gleti's Breeches", augments={'Path: A',}},
            feet={ name="Gleti's Boots", augments={'Path: A',}},
            neck={ name="Etoile Gorget +2", augments={'Path: A',}},
            waist="Fotia Belt",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Maculele Earring",
            left_ring="Regal Ring",
            right_ring="Gere Ring",
            back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        })
    
        sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
            ammo="Aurgelmir Orb +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Mummu Wrists +2",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet="Mummu Gamash. +2",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            left_ear="Sherida Earring",
            right_ear="Odr Earring",
            left_ring="Ilabrat Ring",
            right_ring="Regal Ring",
        })
        sets.precast.WS['Evisceration'].SC = set_combine(sets.precast.WS['Evisceration'], {  
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
    
        sets.precast.WS['Evisceration'].PDL = set_combine(sets.precast.WS['Evisceration'], {
            ammo="Crepuscular Pebble",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            neck={ name="Etoile Gorget +2", augments={'Path: A',}},
            right_ear="Maculele Earring",    })
    
    
        sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
            ammo={ name="Coiste Bodhar", augments={'Path: A',}},
            head="Maculele Tiara +2",
            body={ name="Nyame Mail", augments={'Path: B',}},
            hands={ name="Nyame Gauntlets", augments={'Path: B',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Etoile Gorget +2", augments={'Path: A',}},
            waist={ name="Kentarch Belt +1", augments={'Path: A',}},
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Sherida Earring",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Rudra's Storm"].SC = set_combine(sets.precast.WS["Rudra's Storm"], {
            head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
    
        sets.precast.WS["Rudra's Storm"].PDL = set_combine(sets.precast.WS["Rudra's Storm"], {
            ammo="Crepuscular Pebble",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            right_ear="Maculele Earring",
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Rudra's Storm"].PDL.Clim = set_combine(sets.precast.WS["Rudra's Storm"], {
            ammo="Crepuscular Pebble",
            head="Maculele Tiara +2",
            hands="Maxixi Bangles +3",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            right_ear="Maculele Earring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Rudra's Storm"].Clim = set_combine(sets.precast.WS["Rudra's Storm"], {
            head="Maculele Tiara +2",
        })
        
        sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
            ammo={ name="Coiste Bodhar", augments={'Path: A',}},
            head="Maculele Tiara +2",
            body={ name="Nyame Mail", augments={'Path: B',}},
            hands="Maxixi Bangles +3",
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Etoile Gorget +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Sherida Earring",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Shark Bite"].SC = set_combine(sets.precast.WS["Shark Bite"], {
            head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},})
    
        sets.precast.WS["Shark Bite"].PDL = set_combine(sets.precast.WS["Shark Bite"], {
            ammo="Crepuscular Pebble",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            right_ear="Maculele Earring",
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Shark Bite"].PDL.Clim = set_combine(sets.precast.WS["Shark Bite"], {
            ammo="Crepuscular Pebble",
            head="Maculele Tiara +2",
            hands="Maxixi Bangles +3",
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            right_ear="Maculele Earring",
            back="Sacro Mantle",
        })
        sets.precast.WS["Shark Bite"].Clim = set_combine(sets.precast.WS["Shark Bite"], {
            head="Maculele Tiara +2",
        })
        

    -- Elemental Weapon Skill --elemental_ws--
    
    -- SANGUINE BLADE
    -- 50% MND / 50% STR Darkness Elemental
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
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
	ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's Ring",
        back="Sacro Mantle",
    })
    
    sets.precast.WS["Red Lotus Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Shining Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS["Burning Blade"],{})
    --sets.precast.WS["Aeolian Edge"].PDL = set_combine(sets.precast.WS["Burning Blade"],{})

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
        waist="Eschan Stone",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    })
    
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}
	
    sets.Skillchain = {} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        body="Taeon Tabard",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Prolix Ring",}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {    ammo="Sapience Orb",
    body="Passion Jacket",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",})

    sets.midcast['Phalanx'] = {
        body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
        waist="Olympus Sash",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    }
    sets.Phalanx_Received = set_combine(sets.midcast.Phalanx, {})

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Meg. Jam. +2",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    left_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Moonlight Cape",
    }
    sets.ExtraRegen = {left_ear="Infused Earring",}
    
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
        right_ring="Cacoethic Ring",
    }

    sets.midcast.RA.Acc = {
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
        right_ring="Cacoethic Ring",
    }

    -- Idle sets

    sets.idle = {
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Infused Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Paguroidea Ring",
        back="Moonlight Cape",
    }
    
    sets.idle.PDT = {        
        range="Trollbane",  
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back="Moonlight Cape",
    }
    
    sets.idle.DT = {
        ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    
    sets.idle.MDT = set_combine(sets.defense.MDT, {})
    sets.idle.Evasion = {
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Vengeful Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }
    
    sets.idle.HP = {
        main={ name="Twashtar", augments={'Path: A',}},
        sub={ name="Aeneas", augments={'Path: A',}},
        ammo="Eluder's Sachet",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Moonlight Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.Regen = set_combine(sets.idle, {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
        
        sets.idle.Weak = {    ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body="Adamantite Armor",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Infused Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Paguroidea Ring",
        back="Moonlight Cape",
    }
        sets.idle.Enmity = set_combine(sets.defense.Enmity, {})
    
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
    
    -- Defense sets

    sets.defense.Evasion = {
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Vengeful Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }
    
    sets.defense.PDT = {        
        ammo="Eluder's Sachet",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back="Moonlight Cape",
    }
    
    sets.defense.HP = {
        main={ name="Twashtar", augments={'Path: A',}},
        sub={ name="Aeneas", augments={'Path: A',}},
        ammo="Eluder's Sachet",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Moonlight Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.Regain = {
        ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
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
    
    sets.defense.Enmity = {
        ammo="Iron Gobbet",
        head="Halitus Helm",
        body={ name="Emet Harness +1", augments={'Path: A',}},
        hands="Kurys Gloves",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Ahosi Leggings",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Cryptic Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Eihwaz Ring",
        right_ring="Petrov Ring",
        back="Reiki Cloak",
    }
    
    sets.defense.MDT = {     
        ammo="Yamarang",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Etiolation Earring",
        right_ear="Sanare Earring",
        left_ring="Shadow Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",}
    
    sets.defense.DT = {
            ammo="Staunch Tathlum +1",
            head={ name="Gleti's Mask", augments={'Path: A',}},
            body={ name="Gleti's Cuirass", augments={'Path: A',}},
            hands="Turms Mittens +1",
            legs={ name="Gleti's Breeches", augments={'Path: A',}},
            feet="Turms Leggings +1",
            neck={ name="Loricate Torque +1", augments={'Path: A',}},
            waist="Flume Belt +1",
            left_ear="Tuisto Earring",
            right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
            left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
            right_ring="Fortified Ring",
            back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    
	sets.defense.MEVA = {  ammo="Yamarang",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Shadow Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",}

    sets.Kiting = {feet="Tandava Crackows",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {    ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Balder Earring +1",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

    sets.engaged.Acc = {      ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +2",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

sets.engaged.STP = {    
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +2",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Dedition Earring",
    right_ear="Balder Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
sets.engaged.CRIT = {  
    ammo="Staunch Tathlum +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Nefarious Collar +1",
    waist="Gerdr Belt",
    left_ear="Sherida Earring",
    right_ear="Eabani Earring",
    left_ring="Mummu Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
 }
 sets.engaged.SubtleBlow = set_combine(sets.engaged, {
 left_ear="Sherida Earring",    
 left_ring="Chirich Ring +1",
 })

 sets.engaged.Regain = {
    ammo="Staunch Tathlum +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
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

sets.engaged.DT =  {
        ammo="Staunch Tathlum +1",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Turms Mittens +1",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet="Turms Leggings +1",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Fortified Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
       

 ------------------------------------------------------------------------------------------------
    ---------------------------------------- DW ------------------------------------------
------------------------------------------------------------------------------------------------

    -- * DNC Native DW Trait: 30% DW
    -- * DNC Job Points DW Gift: 5% DW

    -- No Magic Haste (74% DW to cap)

    sets.engaged.DW = {    ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    right_ear="Sherida Earring",
    left_ear="Balder Earring +1",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

    sets.engaged.DW.Acc = {      ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +2",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

sets.engaged.DW.STP = {    
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +2",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Dedition Earring",
    right_ear="Balder Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
sets.engaged.DW.CRIT = {  
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'"Triple Atk."+4',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Balder Earring +1",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
 }
 sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.SubtleBlow, { 
    left_ear="Sherida Earring",    
    left_ring="Chirich Ring +1",
 })

 sets.engaged.DW.Regain = {
    ammo="Staunch Tathlum +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
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

    sets.engaged.DW.DT = set_combine(sets.engaged.DT, {})


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.engaged.Hybrid = { 
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Etoile Gorget +2", augments={'Path: A',}},
        ring1="Moonlight Ring", --5/5
        ring2="Moonlight Ring", --5/5
    }

    sets.engaged.PDT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
    sets.engaged.STP.PDT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
    sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)
    sets.engaged.SubtleBlow.PDT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid,{ 
    left_ring="Chirich Ring +1",})
    sets.engaged.Regain.PDT = set_combine(sets.engaged.Regain, sets.engaged.Hybrid,{
        neck="Rep. Plat. Medal",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Regal Gloves",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},})
    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
    sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)
    sets.engaged.DW.STP.PDT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
    sets.engaged.DW.SubtleBlow.PDT = set_combine(sets.engaged.DW.SubtleBlow, sets.engaged.Hybrid,{ 
    left_ring="Chirich Ring +1",})
    sets.engaged.DW.Regain.PDT = set_combine(sets.engaged.DW.Regain, sets.engaged.Hybrid,{
        neck="Rep. Plat. Medal",
        head={ name="Gleti's Mask", augments={'Path: A',}},
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Regal Gloves",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Gleti's Boots", augments={'Path: A',}},})


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {aist="Windbuffet Belt +1",}
    sets.buff['Climactic Flourish'] = {head="Maculele Tiara +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
        neck="Nicander's Necklace",
        waist="Gishdubar Sash",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1", -- +65%
    })
	sets.buff.Sleep = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 8)
    else
        set_macro_page(3, 8)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 164')
end

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Aeolian Edge",['Twashtar']="Rudra's Storm",['DualNaegling']='Savage Blade',['Tauret']='Evisceration',['DualTauret']='Evisceration',
['DualNaeglingCrepuscular']='Savage Blade',['Carnwenhan']="Mordant Rime",['DualCarnwenhan']="Mordant Rime",['DualTwashtarCrepuscular']="Rudra's Storm",['DualAeneas']="Aeolian Edge",['Xoanon']="Retribution"}

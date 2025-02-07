-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

-- use addon curepleas or healbot or addon trust for help  u 
--use f2 f3 f3 for switch barstatus barelement boostspell
--this makw whm  easy and help u 
--add macro 
-- /con gs c barelement
-- /console gs c barstatus
-- /console gs c boostspell

-- /console gs c smartcure
]]

-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'MaxAcc', 'Shield')
    state.CastingMode:options('Duration', 'Normal', 'ConserveMP', 'SIRD', 'Enmity')
    state.IdleMode:options('Normal','PDT', 'MDT', 'DT', 'HP', 'Evasion', 'MP', 'Refresh', 'Sphere')
	state.PhysicalDefenseMode:options('PDT','DT','HP', 'Evasion', 'MP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons','Queller','Daybreak')
	state.WeaponskillMode:options('Normal', 'PDL')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
    send_command('bind !s gs c toggle SrodaNecklace')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind f2 gs c cycle BoostSpell')
    send_command('bind !f2 gs c BoostSpell')
    send_command('bind f3 gs c cycle BarElement')
    send_command('bind !f3 gs c BarElement')
    send_command('bind f5 gs c cycle BarStatus')
    send_command('bind !f5 gs c BarStatus')
    send_command('bind f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @f5 gs c cycle WeaponskillMode')
    send_command('bind ^f2 gs c smartcure')
	send_command('bind !f5 gs c toggle AutoWSMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Gada",sub="Bunzi's Rod"}
	sets.weapons.Queller = {main="Queller Rod",sub="Sors Shield"}
	sets.weapons.Daybreak = {main="Daybreak",sub="Ammurapi Shield"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	-- neck JSE Necks Reinforcement Points Mode add u neck here 
	sets.RP = {}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Sapience Orb",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
    legs="Aya. Cosciales +2",
    feet={ name="Regal Pumps +1", augments={'Path: A',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Alaunus's Cape",}
		
    sets.precast.FC.DT = sets.precast.FC

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        head="Umuthi Hat",
        waist="Siegel Sash",})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		legs="Ebers Pant. +2",
		left_ear="Mendi. Earring",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Bunzi's Hat",
        back="Aurist's Cape +1"}

		
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
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    
	sets.precast.WS.PDL = set_combine(sets.precast.WS,{
		ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
	})
    sets.precast.WS['Flash Nova'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Clr. Torque +2", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Cornelia's Ring",
        back="Argocham. Mantle",
    }
    sets.precast.WS['Seraph Strike'] = sets.precast.WS['Flash Nova']
    sets.precast.WS['Starburst'] = sets.precast.WS['Flash Nova']
    sets.precast.WS['Sunburst'] = sets.precast.WS['Flash Nova']
    sets.precast.WS['Earth Crusher'] = sets.precast.WS['Flash Nova']
    sets.precast.WS['Rock Crusher'] = sets.precast.WS['Flash Nova']
    sets.precast.WS['Shining Strike'] = sets.precast.WS['Flash Nova']

    sets.precast.WS['Myrkr'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Mephitas's Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
        }

        sets.precast.WS['Cataclysm'] = {
            ammo="Oshasha's Treatise",
            head="Pixie Hairpin +1",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",
            neck="Sibyl Scarf",
            waist="Orpheus's Sash",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Regal Earring",
            right_ring="Cornelia's Ring",
            left_ring="Archon Ring",
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
        }
        
     sets.precast.WS['Black Halo'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Clr. Torque +2", augments={'Path: A',}},
        waist="Prosilio Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Regal Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Black Halo'].PDL = set_combine(sets.precast.WS['Black Halo'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
    })
    sets.precast.WS['Mystic Boon'] = set_combine(sets.precast.WS['Black Halo'],{
        neck="Fotia Gorget",
        waist="Fotia Belt",
    })
    sets.precast.WS['Mystic Boon'].PDL = set_combine(sets.precast.WS['Mystic Boon'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
    })
    sets.precast.WS['Judgment'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Regal Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Judgment'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
    })
    sets.precast.WS['Realmrazer'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Regal Earring",
        right_ear="Telos Earring",
        left_ring="Rufescent Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Realmrazer'].PDL = set_combine(sets.precast.WS['Realmrazer'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
    })

    sets.precast.WS['Shattersoul'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Regal Earring",
        right_ear="Brutal Earring",
        left_ring="Rufescent Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Shattersoul'].PDL = set_combine(sets.precast.WS['Realmrazer'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
    })
    sets.precast.WS['Hexa Strike'] = {
        ammo="Crepuscular Pebble",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear="Mache Earring +1",
        left_ring="Rufescent Ring",
        right_ring="Begrudging Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Hexa Strike'].PDL = set_combine(sets.precast.WS['Hexa Strik'],{
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
        right_ear="Brutal Earring",
        left_ear="Regal Earring",
    })
    sets.precast.WS['True Strike'] = set_combine(sets.precast.WS['Hexa Strik'],{})
    sets.precast.WS['True Strike'].PDL = set_combine(sets.precast.WS['True Strike'], {
        ammo="Crepuscular Pebble",
        body={ name="Bunzi's Robe", augments={'Path: A',}},
        right_ear="Brutal Earring",
        left_ear="Regal Earring",
    })
    sets.precast.WS.Dagan = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Ebers Bliaut +2",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs="Inyanga Shalwar +2",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Nodens Gorget",
        waist="Luminary Sash",
        left_ear="Andoaa Earring",
        right_ear="Halasz Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Mephitas's Ring",
        back="Alaunus's Cape",
    }

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
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
    sets.midcast.SIRD = {
        ammo="Staunch Tathlum +1",
        sub="Culminus",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        feet="Theo. Duckbills +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ring="Mephitas's Ring +1",
    }
    sets.SIRDT = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Theo. Duckbills +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Halasz Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MP+20','"Cure" potency +10%','Phys. dmg. taken-10%',}},
    }

    sets.ConserveMP = {   
	main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vedic Coat",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Reti Pendant",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",}
    
	sets.Duration = {
        sub="Ammurapi Shield",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        waist="Embla Sash",
    }
	sets.midcast.Teleport = sets.ConserveMP
	
    sets.midcast.FastRecast = {       
	ammo="Staunch Tathlum +1",
	hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
	legs="Bunzi's Pants",
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Rumination Sash",
	right_ear="Halasz Earring",
	left_ring="Freke Ring",
	right_ring="Evanescence Ring",}
		
    -- Cure sets

    sets.Srodanecklace = {neck="Sroda necklace"}

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+5','"Cure" potency +10%','MND+4','Mag. Acc.+1',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear="Glorious Earring",
    left_ring="Naji's Loop",
    right_ring="Mephitas's Ring",
    back="Alaunus's Cape",}
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, {
        main="Daybreak",
        sub="Culminus",
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        legs="Ebers Pant. +2",
        feet="Theo. Duckbills +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Mendi. Earring",
        right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
        left_ring="Mephitas's Ring +1",
        right_ring="Defending Ring",
        back="Alaunus's Cape",
    })

    sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure, {   
     main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vedic Coat",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Reti Pendant",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",})

    sets.midcast.Cure.Enmity = set_combine(sets.midcast.Cure, {  
        main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
        sub="Sors Shield",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Pinga Tunic +1",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs="Pinga Pants +1",
        feet="Bunzi's Sabots",
        neck={ name="Clr. Torque +2", augments={'Path: A',}},
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Glorious Earring",
        right_ear="Ebers Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
        back="Solemnity Cape",})

	sets.midcast.CureSolace = {main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear="Glorious Earring",
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",}
    sets.midcast.CureSolace.SIRD = set_combine(sets.midcast.CureSolace, {
        main="Daybreak",
        sub="Culminus",
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        legs="Ebers Pant. +2",
        feet="Theo. Duckbills +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Mendi. Earring",
        right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back="Alaunus's Cape",
    })

    sets.midcast.CureSolace.ConserveMP = set_combine(sets.midcast.CureSolace, { 
   main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vedic Coat",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Reti Pendant",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",})

    sets.midcast.CureSolace.Enmity = set_combine(sets.midcast.CureSolace, {  
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Pinga Tunic +1",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Pinga Pants +1",
    feet="Bunzi's Sabots",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Glorious Earring",
    right_ear="Ebers Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",})

	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
		back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightWeatherCureSolace =  set_combine(sets.midcast.CureSolace, {
		back="Twilight Cape",waist="Hachirin-no-Obi"})
		
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.CureSolace, {
		back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
		back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.LightWeatherCuraga = sets.midcast.LightDayCure
		
	sets.midcast.LightDayCuraga = sets.midcast.LightDayCure
    sets.midcast.Curaga.SIRD = set_combine(sets.midcast.Curaga, {
		main="Daybreak",
		sub="Culminus",
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Ros. Jaseran +1", augments={'Path: A',}},
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
		legs="Ebers Pant. +2",
		feet="Theo. Duckbills +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Mendi. Earring",
		right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		left_ring="Mephitas's Ring +1",
		right_ring="Defending Ring",
		back="Alaunus's Cape",
		})
	
		sets.midcast.Curaga.ConserveMP = set_combine(sets.midcast.Curaga, {   
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Vedic Coat",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
		legs="Ebers Pant. +2",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Reti Pendant",
		waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
		left_ear="Mendi. Earring",
		right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		left_ring="Naji's Loop",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Solemnity Cape",})
	
		sets.midcast.Curaga.Enmity = set_combine(sets.midcast.Curaga, {  
			main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
			sub="Sors Shield",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			body="Pinga Tunic +1",
			hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			legs="Pinga Pants +1",
			feet="Bunzi's Sabots",
			neck={ name="Clr. Torque +2", augments={'Path: A',}},
			waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
			left_ear="Glorious Earring",
			right_ear="Ebers Earring",
			left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
			right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
			back="Alaunus's Cape",
		})
	sets.midcast.Cure.DT = set_combine(sets.midcast.Cure,sets.SIRDT, {})
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure =   {}

		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {        ammo="Pemphredo Tathlum",
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
	body="Ebers Bliaut +2",
	hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
	legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck="Debilis Medallion",
	waist="Gishdubar Sash",
	right_ear="Ebers Earring",
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	back="Alaunus's Cape",}

	sets.midcast.StatusRemoval = {        main={ name="Gada", augments={'Indi. eff. dur. +1','VIT+1','"Mag.Atk.Bns."+19',}},
	ammo="Pemphredo Tathlum",
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
	body="Ebers Bliaut +2",
	hands="Ebers Mitts +2",
	legs="Ebers Pant. +2",
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck={ name="Clr. Torque +2", augments={'Path: A',}},
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	back="Alaunus's Cape",}

	sets.Duration = {
        sub="Ammurapi Shield",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        waist="Embla Sash",
    }
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {  
   main={ name="Gada", augments={'Indi. eff. dur. +1','VIT+1','"Mag.Atk.Bns."+19',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    body="Telchine Chas.",
    hands="Inyan. Dastanas +2",
    legs="Telchine Braconi",
    feet="Theo. Duckbills +3",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mendi. Earring",
    right_ring="Stikini Ring",
    left_ring="Stikini Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

    sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD) 
    sets.midcast['Enhancing Magic'].Duration = set_combine(sets.midcast['Enhancing Magic'],sets.Duration) 

    sets.midcast.Stoneskin = {
        main={ name="Gada", augments={'Indi. eff. dur. +1','VIT+1','"Mag.Atk.Bns."+19',}},
        ammo="Pemphredo Tathlum",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        neck="Nodens Gorget",
		legs="Haven Hose",
        waist="Siegel Sash",
		right_ear="Earthcry Earring",
        left_ear="Andoaa Earring",
        right_ring="Stikini Ring",
        left_ring="Stikini Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},}
        sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast.Stoneskin,sets.SIRD) 
        sets.midcast.Stoneskin.Duration = set_combine(sets.midcast.Stoneskin,sets.Duration) 


		sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})
		sets.midcast.Auspice.Duration = set_combine(sets.midcast['Enhancing Magic'].Duration, {
			ammo="Pemphredo Tathlum",
			head="Telchine Cap",
			body="Telchine Chas.",
			hands="Telchine Gloves",
			legs="Telchine Braconi",
			feet="Ebers Duckbills +2",
			neck="Incanter's Torque",
			left_ear="Andoaa Earring",
			right_ring="Stikini Ring",
			left_ring="Stikini Ring",
			back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}) 
	
    sets.midcast.Aquaveil = {
        main={ name="Gada", augments={'Indi. eff. dur. +1','VIT+1','"Mag.Atk.Bns."+19',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Regal Cuffs",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        neck="Incanter's Torque",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        left_ring="Mephitas's Ring",
        right_ring="Stikini Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

    sets.midcast.Aquaveil.SIRD = set_combine(sets.midcast.Aquaveil,sets.SIRD)
    sets.midcast.Aquaveil.Duration = set_combine(sets.midcast.Aquaveil,sets.Duration) 

    sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'])
    sets.midcast.Haste.Duration = set_combine(sets.midcast['Enhancing Magic'],sets.Duration) 

    sets.midcast.Regen =set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        ammo="Sapience Orb",
        head="Inyanga Tiara +2",
        body="Telchine Chas.",
        hands="Ebers Mitts +2",
        legs="Telchine Braconi",
        feet="Theo. Duckbills +3",
        waist="Embla Sash",})
    sets.midcast.Regen.Duration = set_combine(sets.midcast['Enhancing Magic'],sets.Duration, { 
        hands="Ebers Mitts +2",}) 
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main={ name="Gada", augments={'Indi. eff. dur. +1','VIT+1','"Mag.Atk.Bns."+19',}},
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +2",
		body="Ebers Bliaut +2",
		hands="Telchine Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ring="Stikini Ring",
		left_ring="Stikini Ring",
		back="Alaunus's Cape",
	})

	sets.midcast['Divine Magic'] = {
			main="Daybreak",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head="Inyanga Tiara +2",
			body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
			hands="Inyan. Dastanas +2",
			legs="Ebers Pant. +2",
			feet="Bunzi's Sabots",
			neck="Erra Pendant",
			waist="Luminary Sash",
			right_ear="Malignance Earring",
			left_ear="Regal Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
	sets.midcast.Repose = set_combine(sets.midcast['Divine Magic'], {
        hands="Regal Cuffs",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
        waist="Obstin. Sash",
        left_ear="Regal Earring",
        right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    })	
    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
		feet={ name="Medium's Sabots", augments={'MP+25','MND+2','"Conserve MP"+3',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		right_ear="Malignance Earring",
		left_ear="Regal Earring",
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}
		sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {
			head=empty,
			body="Twilight Cloak",
			ring2="Archon Ring",
			waist="Shinjutsu-no-Obi +1",
			})
	sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Divine Magic'],{
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Bunzi's Robe", augments={'Path: A',}},
        hands={ name="Bunzi's Gloves", augments={'Path: A',}},
        legs={ name="Bunzi's Pants", augments={'Path: A',}},
        feet={ name="Bunzi's Sabots", augments={'Path: A',}},
        neck="Mizu. Kubikazari",
        left_ring="Locus Ring",
        right_ring="Mujin Band",
    })

	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']

	-- Gear for Magic Burst mode.
    sets.MagicBurst = set_combine(sets.midcast['Divine Magic'],{
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Bunzi's Robe", augments={'Path: A',}},
        hands={ name="Bunzi's Gloves", augments={'Path: A',}},
        legs={ name="Bunzi's Pants", augments={'Path: A',}},
        feet={ name="Bunzi's Sabots", augments={'Path: A',}},
        neck="Mizu. Kubikazari",
        left_ring="Locus Ring",
        right_ring="Mujin Band",
    })

	sets.midcast.Holy = {ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Bunzi's Sabots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Freke Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}


    sets.midcast.Drain = sets.midcast['Dark Magic']

    sets.midcast.Drain.Resistant = sets.midcast['Dark Magic']

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Erra Pendant",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Chironic Hose",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet={ name="Bunzi's Sabots", augments={'Path: A',}},}
		
	sets.midcast.Dispel = {ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet={ name="Bunzi's Sabots", augments={'Path: A',}},}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {        head=empty,
	body={ name="Cohort Cloak +1", augments={'Path: A',}},
	hands="Regal Cuffs",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
	waist="Obstin. Sash",
	left_ear="Regal Earring",
	right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
	left_ring="Stikini Ring +1",
	right_ring="Kishar Ring",}

	sets.midcast['Enfeebling Magic'].Resistant = sets.midcast['Enfeebling Magic']
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = sets.midcast.ElementalEnfeeble 

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = sets.midcast.IntEnfeebles

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		head=empty,
        body={ name="Cohort Cloak +1", augments={'Path: A',}},
        hands="Regal Cuffs",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
        waist="Obstin. Sash",
        left_ear="Regal Earring",
        right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",})
	sets.midcast.MndEnfeebles.Resistant = sets.midcast.MndEnfeebles

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {     ammo="Homiliary",
	head="Befouled Crown",
	body="Shamash Robe",
	hands="Aya. Manopolas +2",
	legs="Assid. Pants +1",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Fucho-no-Obi",
	left_ear="Infused Earring",
	left_ring="Stikini Ring +1",
	right_ring="Inyanga Ring",}

	    -- Defense sets

		sets.defense.PDT = {
			main="Daybreak",
			sub="Culminus",
			ammo="Staunch Tathlum +1",
			head="Befouled Crown",
			body="Shamash Robe",
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs="Assid. Pants +1",
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck={ name="Loricate Torque +1", augments={'Path: A',}},
			waist="Plat. Mog. Belt",
			left_ear="Genmei Earring",
			right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Alaunus's Cape",}
		sets.defense.Evasion = {
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
			left_ring="Defending Ring",
			right_ring="Vengeful Ring",
			back="Alaunus's Cape",
		}
		sets.defense.DT = {
			ammo="Eluder's Sachet",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck={ name="Loricate Torque +1", augments={'Path: A',}},
			waist="Plat. Mog. Belt",
			left_ear="Tuisto Earring",
			right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			left_ring="Fortified Ring",
			right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
			back="Alaunus's Cape",
		}
		sets.defense.HP = {
			ammo="Eluder's Sachet",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
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
		sets.defense.MP = {       
			ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			body="Ebers Bliaut +2",
			hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			legs="Inyanga Shalwar +2",
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Nodens Gorget",
			waist="Luminary Sash",
			left_ear="Andoaa Earring",
			right_ear="Halasz Earring",
			left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
			right_ring="Mephitas's Ring",
			back="Alaunus's Cape",
		}
		sets.defense.MDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Bunzi's Hat", augments={'Path: A',}},
		body="Shamash Robe",
		hands={ name="Bunzi's Gloves", augments={'Path: A',}},
		legs={ name="Bunzi's Pants", augments={'Path: A',}},
		feet={ name="Bunzi's Sabots", augments={'Path: A',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Inyanga Ring",
		right_ring="Shadow Ring",
		back="Alaunus's Cape",}

    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Aurist's Cape +1",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        ammo="Homiliary",
        head="Befouled Crown",
        body="Shamash Robe",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Inyan. Crackows +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Genmei Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Inyanga Ring",
        back="Alaunus's Cape",
    }
    
    sets.idle.PDT = {
        ammo="Homiliary",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Assid. Pants +1", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Alaunus's Cape",}
    
    sets.idle.Refresh = {
    ammo="Homiliary",
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Alaunus's Cape",}


    sets.idle.Sphere = set_combine(sets.idle.PDT , {
    body="Annoint. Kalasiris"})

    sets.idle.MDT = set_combine(sets.defense.MDT , {})    
    sets.idle.DT = set_combine(sets.defense.DT , {})
    sets.idle.HP = set_combine(sets.defense.HP , {})
    sets.idle.Evasion = set_combine(sets.defense.Evasion , {})
    sets.idle.MP = set_combine(sets.defense.MP , {})

    
    sets.idle.Weak = {
    ammo="Homiliary",
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Andoaa Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back="Alaunus's Cape",}


		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	sets.engaged = {
        ammo="Amar Cluster",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Bunzi's Gloves",
        legs="Aya. Cosciales +2",
        feet="Battlecast Gaiters",
        neck="Combatant's Torque",
        waist="Cornelia's Belt",
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.engaged.MaxAcc = {
        ammo="Amar Cluster",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Bunzi's Gloves",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Combatant's Torque",
        waist="Olseni Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.engaged.Shield = {
        main="Maxentius",
        sub="Genmei Shield",
        ammo="Amar Cluster",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Bunzi's Gloves",
        legs="Aya. Cosciales +2",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Combatant's Torque",
        waist="Cornelia's Belt",
        left_ear="Brutal Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Defending Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
    sets.engaged.SubtleBlow = set_combine(sets.engaged, {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        left_ear="Digni. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
    sets.engaged.SubtleBlow.Shield = set_combine(sets.engaged.Shield, {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Digni. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    })
    sets.engaged.SubtleBlow.MaxAcc = set_combine(sets.engaged.MaxAcc, {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        left_ear="Digni. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
    sets.engaged.PDT = set_combine(sets.engaged, {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Combatant's Torque",
        waist="Plat. Mog. Belt",
        back="Moonlight Cape",
    })
    sets.engaged.PDT.MaxAcc = set_combine(sets.engaged.MaxAcc, {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Combatant's Torque",
        waist="Plat. Mog. Belt",
        back="Moonlight Cape",
    })
    sets.engaged.PDT.Shield = set_combine(sets.engaged.Shield, {
        sub="Ammurapi Shield",
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Combatant's Torque",
        waist="Plat. Mog. Belt",
        back="Moonlight Cape",
    })

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2", back="Mending Cape"}

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",
		ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Carrier's Sash",}

	sets.HPCure = {ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +2"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 13)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 178')
end

autows_list = {['DualWeapons']='Realmrazer',['MeleeWeapons']='Black Halo',
['Queller']='Dagan',['Daybreak']='Seraph Strike',['Black Halo']='Black Halo',}
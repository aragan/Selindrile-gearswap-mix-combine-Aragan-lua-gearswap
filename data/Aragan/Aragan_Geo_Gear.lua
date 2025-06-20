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

--[[
-- u can too work with addon AutoGEO and Gearinfo for more info on screen

Indi/Geo-Acumen    	Magic Attack Bonus
Indi/Geo-Attunement 	Magic Evasion
Indi/Geo-Barrier 	Defense
Indi/Geo-Fade   	- Down Magic Attack Bonus
Indi/Geo-Fend   	Magic Defense Bonus
Indi/Geo-Focus   	Magic Accuracy
Indi/Geo-Frailty 	- Down Defense
Indi/Geo-Fury   	Attack & Ranged Attack
Indi/Geo-Gravity 	Movement Speed
Indi/Geo-Haste 	    Haste
Indi/Geo-Languor 	- Down Magic Evasion
Indi/Geo-Malaise 	- Down Magic Defense Bonus
Indi/Geo-Paralysis 	Paralysis Proc Rate
Indi/Geo-Poison 	Poison Damage per Tick
Indi/Geo-Precision 	Accuracy & Ranged Accuracy
Indi/Geo-Refresh 	Refresh MP per Tick
Indi/Geo-Regen 	    Regen HP per Tick
Indi/Geo-Slip   	- Down Accuracy & Ranged Accuracy
Indi/Geo-Slow     	Slow
Indi/Geo-Torpor 	- Down Evasion
Indi/Geo-Vex    	- Down Magic Accuracy
Indi/Geo-Voidance 	Evasion
Indi/Geo-Wilt    	- down enemy Attack & Ranged Attack

Geomancer ALL spells


Geo Acumen        Indi Acumen
Geo Attunement    Indi Attunement
Geo Barrier       Indi Barrier
Geo Fade          Indi Fade
Geo Fend          Indi Fend
Geo Focus         Indi Focus
Geo Frailty       Indi Frailty
Geo Fury          Indi Fury
Geo Gravity       Indi Gravity
Geo Haste         Indi Haste
Geo Languor       Indi Languor
Geo Malaise       Indi Malaise
Geo Paralysis     Indi Paralysis
Geo Poison        Indi Poison
Geo Precision     Indi Precision
Geo Refresh       Indi Refresh
Geo Vex           Indi Vex
Geo Regen         Indi Regen
Geo Slip          Indi Slip
Geo Slow          Indi Slow
Geo Torpor        Indi Torpor
Geo Voidance      Indi Voidance
Geo Wilt          Indi Wilt

Geo STR  Indi STR
Geo INT  Indi INT
Geo MND  Indi MND
Geo AGI  Indi AGI
Geo CHR  Indi CHR
Geo DEX  Indi DEX
Geo VIT  Indi VIT

]]

function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Melee', 'Shield')
	state.CastingMode:options('Normal','SIRD', 'ConserveMP','OccultAcumen')
    state.WeaponskillMode:options('Match','SubtleBlow')
    state.IdleMode:options('Normal','DT','MDT','HP', 'Regen', 'Refresh', 'Evasion', 'EnemyCritRate','Sphere')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Idris','None', 'Maxentius','Bunzi','MalignancePole','Xoanon','TernionDagger')

	gear.nuke_jse_back = {}
	gear.idle_jse_back = {}
	
	gear.obi_cure_back = ""
	gear.obi_cure_waist = ""

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = ""

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = ""
	
	autoindi = "Haste"
	autogeo = "Frailty"
	autoentrust = 'Fury'

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind ^backspace input /ja "Entrust" <me>')
	--send_command('bind !backspace input /ja "Life Cycle" <me>')
	--send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	send_command('bind f1 gs c cycle Indi2')
    send_command('bind f2 gs c cycle Indi')
    send_command('bind f3 gs c cycle geo')
    --send_command('bind !f1 input //gs c Indi2')
    --send_command('bind !f2 input //gs c Indi')
    --send_command('bind !f3 input //gs c geo')
	send_command('bind ^f1 gs c cycle HippoMode')
	send_command('bind ^f2 gs c toggle AutoStunMode')
    send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  

	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	

	-- Weapons sets
		--sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
		--sets.weapons.DualWeapons = {main='Maxentius',sub='Bunzi's Rod'}

		sets.weapons.Idris = {main="Idris", sub="Ammurapi Shield"}
		sets.weapons.Maxentius = {main="Maxentius", sub="Ammurapi Shield"}
		sets.weapons.Bunzi = {main="Bunzi's Rod", sub="Ammurapi Shield"}
		sets.weapons.TernionDagger  = {main="Ternion Dagger +1", sub="Ammurapi Shield"}
		sets.weapons.MalignancePole  = {main="Malignance Pole", sub="Alber Strap"}
		sets.weapons.Xoanon  = {main="Xoanon", sub="Alber Strap"}
	
		sets.Normal = {}
		sets.Genmei = {sub="Genmei Shield"}
		sets.Ammurapi = {sub="Ammurapi Shield"}

    -- neck JSE Necks Reinforcement Points Mode add u neck here 
    sets.RP = {}
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
	sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +2", body="Geomancy Tunic +3", back="Nantosuelta's Cape"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +2",}--hands="Bagua Mitaines +1"
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
	hands="Agwu's Gages",
	body="Shango Robe",
	legs="Geomancy Pants +2",
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3','"Fast Cast"+6','CHR+1','"Mag.Atk.Bns."+4',}},
	ring1="Prolix Ring",
	ring2="Kishar Ring",
	ear1="Malignance Earring",
	ear2="Loquacious Earring",
	neck="Orunmila's Torque",        
	waist="Witful Belt",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands="Bagua Mitaines +1"})


    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        left_ear="Mendi. Earring",
        legs="Doyen Pants",
    })		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        ring1="Mallquis Ring",})

    sets.precast.RA = {ammo=empty,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    }

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        head="Umuthi Hat",
        legs="Doyen Pants",
        waist="Siegel Sash",})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring="Rufescent Ring",
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS.SubtleBlow =  {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.precast.WS['Flash Nova'] = {
        ammo="Pemphredo Tathlum",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Cornelia's Ring",
        back="Argocham. Mantle",
    }

    sets.precast.WS['Myrkr'] = {
            ammo="Pemphredo Tathlum",
            head="Nyame Helm",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",
            neck="Baetyl Pendant",
            waist="Orpheus's Sash",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Friomisi Earring",
            left_ring="Cornelia's Ring",
            right_ring="Freke Ring",
            back={ name="Aurist's Cape +1", augments={'Path: A',}},}

    sets.precast.WS['Cataclysm'] = {
            ammo="Pemphredo Tathlum",
            head="Pixie Hairpin +1",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",
            neck="Sibyl Scarf",
            waist="Orpheus's Sash",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Regal Earring",
            left_ring="Cornelia's Ring",
            right_ring="Archon Ring",
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
        }
        
     sets.precast.WS['Black Halo'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Exudation'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    sets.precast.WS['Starburst'] = sets.precast.WS['Myrkr']
    sets.precast.WS['Sunburst'] = sets.precast.WS['Myrkr']
    sets.precast.WS['Earth Crusher'] = sets.precast.WS['Myrkr']
    sets.precast.WS['Rock Crusher'] = sets.precast.WS['Myrkr']
    sets.precast.WS['Seraph Strike'] = sets.precast.WS['Myrkr']
    sets.precast.WS['Shining Strike'] = sets.precast.WS['Myrkr']

    sets.precast.WS['Shattersoul'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Ishvara Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        left_ring="Rufescent Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

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

    sets.precast.WS['Starlight'] = sets.precast.WS
    sets.precast.WS['Moonlight'] = sets.precast.WS


	--------------------------------------
	-- Midcast sets
	--------------------------------------
    sets.SIRD={
        main="Idris",
        sub="Culminus",
        ammo="Staunch Tathlum +1",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs="Geomancy Pants +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ring="Freke Ring",
    }
    sets.ConserveMP = {  
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Vedic Coat",
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3','"Fast Cast"+6','CHR+1','"Mag.Atk.Bns."+4',}},
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Calamitous Earring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",}

    sets.OccultAcumen = {
        ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",
        legs="Perdition Slops",
    }

    sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.Geomancy = {        main="Idris",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head="Azimuth Hood +2",
	body="Geomancy Tunic +3",
	hands="Geo. Mitaines +3",
	legs="Geomancy Pants +2",
	feet="Bagua Sandals +3",
	neck={ name="Bagua Charm +2", augments={'Path: A',}},
	waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Azimuth Earring +1",
	left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	right_ring="Stikini Ring +1",
	back="Lifestream Cape",}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {        main="Idris",
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head="Azimuth Hood +2",
	body="Geomancy Tunic +3",
	hands="Geo. Mitaines +3",
	legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
	feet="Azimuth Gaiters +2",
	neck={ name="Bagua Charm +2", augments={'Path: A',}},
	waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Azimuth Earring +1",
	left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	right_ring="Stikini Ring +1",
	back="Nantosuelta's Cape",})
		
    sets.midcast.Cure = {        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
	body="Annoint. Kalasiris",
	hands="Telchine Gloves",
	legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck="Incanter's Torque",
	waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
	left_ear="Regal Earring",
	right_ear="Mendi. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Naji's Loop",
	back="Solemnity Cape",}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        back="Twilight Cape",waist="Hachirin-no-Obi"})
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
        back="Twilight Cape",waist="Hachirin-no-Obi"})

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
    ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    
    sets.midcast['Elemental Magic'] = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Agwu's Cap",
        body="Azimuth Coat +2",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Bagua Sandals +3",
        neck="Sibyl Scarf",
		waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back="Argocham. Mantle",
	}

    sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']
		
    sets.midcast['Elemental Magic'].Proc = sets.midcast.FastRecast
		
    sets.midcast['Elemental Magic'].Fodder = sets.midcast['Elemental Magic']
		
    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic']

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = sets.midcast['Elemental Magic']
		
    sets.midcast.Macc = { 
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Ea Hat +1",
        body="Ea Houppelande",
        hands="Ea Cuffs",
        legs="Ea Slops",
        feet="Ea Pigaches +1",
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
       neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
       hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
       legs="Merlinic Shalwar"}
		
    sets.midcast.Drain = {        head="Pixie Hairpin +1",
	hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Drain" and "Aspir" potency +10','CHR+5','Mag. Acc.+4',}},
	feet={ name="Agwu's Pigaches", augments={'Path: A',}},
	neck="Erra Pendant",
    left_ear="Hirudinea Earring",
	ring1="Evanescence Ring",
	ring2="Archon Ring",
	waist="Fucho-no-obi",}

	sets.midcast.Absorb = set_combine(sets.midcast.Macc, {
        neck="Erra Pendant",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Evanescence Ring",
        body="Geomancy Tunic +3",
    })
    
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = sets.midcast.Macc

	sets.midcast.Stun.Resistant = sets.midcast.Stun
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
        waist="Shinjutsu-no-Obi +1",
        })
		
	sets.midcast.Dispel = sets.midcast.Macc

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        head="C. Palug Crown",
        body="Geomancy Tunic +3",
        hands="Geo. Mitaines +3",
        legs="Geomancy Pants +2",
        feet="Bagua Sandals +3",
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Crep. Earring",
        right_ear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Stikini Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    })
	sets.midcast['Enfeebling Magic'].Resistant = sets.midcast['Enfeebling Magic']
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ear2="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring +1"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
		
	sets.midcast['Enhancing Magic'] = {ammo="Pemphredo Tathlum",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",
	neck="Incanter's Torque",
	waist="Olympus Sash",
	left_ear="Andoaa Earring",
	right_ear="Mendi. Earring",
	right_ring="Stikini Ring +1",
	left_ring="Stikini Ring +1",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}}
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		head="Telchine Cap",
		hands="Telchine Gloves",
		legs="Haven Hose",
		left_ear="Earthcry Earring",
		feet="Telchine Pigaches",
		neck="Nodens Gorget",
		waist="Siegel Sash"
		})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Malignance Earring"})
    sets.Phalanx_Received = set_combine(sets.midcast['Enhancing Magic'], {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {        
    head="Null Masque",
	body="Shamash Robe",
	legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	left_ear="Infused Earring",
	waist="Fucho-no-Obi",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",}

	-- Idle sets
	sets.idle = {
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Null Masque",
        body="Shamash Robe",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",

    }
    sets.idle.DT = set_combine(sets.idle, {
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +2",
        body="Shamash Robe",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back="Moonlight Cape",

    })

    sets.idle.Regen = set_combine(sets.idle, {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
    sets.idle.Refresh = set_combine(sets.idle, {
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Null Masque",
        body="Shamash Robe",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Geo. Sandals +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
    })
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
        right_ring="Defending Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.idle.EnemyCritRate = set_combine(sets.idle.HP, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.MDT = sets.defense.MDT
    sets.idle.Evasion = sets.defense.Evasion
    sets.idle.Sphere = set_combine(sets.idle, {
        body="Annoint. Kalasiris",
    })

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle, {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +2",
		body="Shamash Robe",
		hands="Geo. Mitaines +3",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Bagua Sandals +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Isa Belt",
		left_ear="Handler's Earring +1",
		right_ear="Handler's Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back="Nantosuelta's Cape",
		})
	
        sets.idle.DT.Pet = set_combine(sets.idle, {
            main="Idris",
            sub="Genmei Shield",
            range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
            head="Azimuth Hood +2",
            body="Adamantite Armor",
            hands="Geo. Mitaines +3",
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
            neck={ name="Bagua Charm +2", augments={'Path: A',}},
            waist="Isa Belt",
            left_ear="Eabani Earring",
            right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
            left_ring="Stikini Ring +1",
            right_ring="Defending Ring",
            back={ name="Nantosuelta's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
        })

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 

    sets.idle.Weak = sets.idle

	-- Defense sets
	
    sets.defense.PDT = {
        range="Dunna",
        head="Nyame Helm",
        body="Shamash Robe",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }

    sets.defense.MDT = {
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Sanare Earring",
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }
    sets.defense.Evasion = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Vengeful Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }

		
    sets.defense.MEVA = sets.defense.MDT
		
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +3"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
	})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
    sets.engaged = {    
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Battlecast Gaiters",
        neck="Lissome Necklace",
        waist="Olseni Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.engaged.Melee = set_combine(sets.engaged, {  
	    ammo="Amar Cluster",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Lissome Necklace",
        waist="Olseni Belt",
        left_ear="Telos Earring",
        right_ear="Mache Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},    })
       
        sets.engaged.Shield = set_combine(sets.engaged, { 
			sub="Genmei Shield",
            head="Nyame Helm",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Lissome Necklace",
        waist="Olseni Belt",
        left_ear="Telos Earring",
        right_ear="Mache Earring +1",
        left_ring="Defending Ring",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},})

	sets.engaged.DW = set_combine(sets.engaged, { 
        waist="Reiki Yotai",
        left_ear="Suppanomimi", })
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = { 
	ammo="Pemphredo Tathlum",
	head="Ea Hat +1",
	body="Agwu's Robe",
	hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	legs="Agwu's Slops",
	feet="Ea Pigaches +1",
	neck="Mizu. Kubikazari",
	waist="Sacro Cord",
	left_ear="Malignance Earring",
	right_ear="Regal Earring",
	left_ring="Mujin Band",
	right_ring="Freke Ring",
	back="Argocham. Mantle",}

	sets.ResistantMagicBurst = sets.MagicBurst
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	

end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 198')
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(5, 6)
end

autows_list = {['Idris']='Exudation',['Maxentius']='Black Halo',['Bunzi']="Flash Nova",
['TernionDagger']='Aeolian Edge',['Xoanon']='Retribution',['MalignancePole']='Cataclysm'}


function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Indicolure"] = {gain = 'Indicolure is on.', lose = 'Indi-spell wore off.', announce_gain = false, announce_lose = true},
        ["Naturalist's Roll"] = {gain = 'Naturalist Roll is on.', lose = 'Naturalist Roll wore off.', announce_gain = true, announce_lose = false},
		--["Bolter's Roll"]     = {gain = 'Bolter Roll is on.', lose = 'Bolter Roll wore off.', announce_gain = true, announce_lose = false},
		--["Samurai Roll"] = {gain = 'Samurai Roll is on.', lose = 'Samurai Roll wore off.', announce_gain = false, announce_lose = true},
		--["Chaos Roll"]   = {gain = 'Chaos Roll is on.', lose = 'Chaos Roll wore off.', announce_gain = false, announce_lose = true},
		--["Tactician's Roll"] = {gain = 'Tactician\'s Roll is on.', lose = 'Tactician\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Warlock's Roll"]   = {gain = 'Warlock\'s Roll is on.', lose = 'Warlock\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Wizard's Roll"]    = {gain = 'Wizard\'s Roll is on.', lose = 'Wizard\'s Roll wore off.', announce_gain = false, announce_lose = true},
		
		["Scherzo"]    = {gain = 'Scherzo is on.', lose = 'Scherzo wore off', announce_gain = false, announce_lose = true},
        --["Blink"] = {gain = 'Blink is on.', lose = 'Blink wore off.', announce_gain = false, announce_lose = true},
        -- Add more buffs as needed with appropriate flags
    }

    -- Check for specific buffs and their flags
    if buff_messages[buff] then
        if gain and buff_messages[buff].announce_gain then
            local gain_message = buff_messages[buff].gain
            if gain_message then
                windower.send_command('input /p ' .. gain_message)
            end
        elseif not gain and buff_messages[buff].announce_lose then
            local lose_message = buff_messages[buff].lose
            if lose_message then
                windower.send_command('input /p ' .. lose_message)
            end
        end
    end
end

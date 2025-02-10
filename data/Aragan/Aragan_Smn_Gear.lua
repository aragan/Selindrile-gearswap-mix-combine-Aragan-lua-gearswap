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

-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal', 'PDT', 'Regen', 'Sphere', 'MagicalBloodPactRage', 'PhysicalBloodPactRage')
    state.PhysicalDefenseMode:options('Normal','PDT', 'Regen', 'Mdt', 'MagicalBloodPactRage', 'PhysicalBloodPactRage')

	state.Weapons:options('None','Gridarvor')

    gear.perp_staff = {name="Gridarvor"}
	
	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind !f3 gs c toggle PactSpamMode')
    send_command('bind !f2 gs c toggle AutoFavor')
	send_command('bind !f1 gs c toggle AutoConvert')

	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind f3 gs c cycle avatars')
    send_command('bind ^f3 gs c cycleback avatars')
    send_command('bind f2 input //gs c avatars')
    send_command('bind ^f2 input /pet "Release" <me>')
    send_command('bind f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
    send_command('bind @f4 input //gs c siphon')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    
    	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap +1"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
    
    
    -- neck JSE Necks Reinforcement Points Mode add u neck here 
	sets.RP = {}
	
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {
    neck="Incanter's Torque",ear1="Andoaa Earring",
   hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Stikini Ring +1",
    back="Conveyance Cape",waist="Kobo Obi",}


    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {  ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    hands="Baayami Cuffs",
    legs="Baayami Slops",}
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

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
    
    sets.precast.FC = {        ammo="Sapience Orb",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Inyanga Jubbah +2",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Regal Pumps +1",
        neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
        right_ear="Malignance Earring",
        left_ring="Prolix Ring",
		right_ring="Kishar Ring",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

        sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})

        sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
        
        sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
            legs="Doyen Pants",
            head="Umuthi Hat",
            waist="Siegel Sash",})
        sets.precast.FC.Cure = set_combine(sets.precast.FC, {
            legs="Doyen Pants",
            left_ear="Mendi. Earring",
            waist="Acerbic Sash +1",
        })
        
        sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Pemphredo Tathlum",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Caro Necklace",
        waist="Grunfeld Rope",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring="Freke Ring",
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
       }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Mephitas's Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Black Halo'] = {
            ammo="Crepuscular Pebble",
            head="Nyame Helm",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",
            neck="Caro Necklace",
            waist="Luminary Sash",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Ishvara Earring",
            left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
            right_ring="Cornelia's Ring",
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Cataclysm'] = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Cornelia's Ring",
        right_ring="Archon Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
        
    }
    sets.precast.WS['Garland of Bliss'] = {
        ammo="Pemphredo Tathlum",
        body="Nyame Mail",
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
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    sets.precast.WS['Starburst'] = sets.precast.WS['Garland of Bliss']
    sets.precast.WS['Sunburst'] = sets.precast.WS['Garland of Bliss']
    sets.precast.WS['Earth Crusher'] = sets.precast.WS['Garland of Bliss']
    sets.precast.WS['Rock Crusher'] = sets.precast.WS['Garland of Bliss']
    sets.precast.WS['Seraph Strike'] = sets.precast.WS['Garland of Bliss']
    sets.precast.WS['Shining Strike'] = sets.precast.WS['Garland of Bliss']

    sets.precast.WS['Shattersoul'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Bunzi's Gloves",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Ishvara Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        body="Baayami Robe",
    })

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body={ name="Bunzi's Robe", augments={'Path: A',}},
        hands="Telchine Gloves",
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Incanter's Torque",
        waist="Gishdubar Sash",
        left_ear="Mendi. Earring",
        right_ear="Etiolation Earring",
        left_ring="Kishar Ring",
        right_ring="Naji's Loop",
        back="Solemnity Cape",
}   
    sets.midcast['Enhancing Magic'] = {
        main="Oranyan",
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        neck="Incanter's Torque",
        left_ear="Mendi. Earring",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        main="Oranyan",
        sub="Enki Strap",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Gishdubar Sash",
    })
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Summoning Magic'] = {   main="Contemplator +1",
    sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head="Baayami Hat",
    body="Baayami Robe",
    hands="Baayami Cuffs",
    legs="Baayami Slops",
    feet="Bunzi's Sabots",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="Andoaa Earring",
    right_ear="Beck. Earring +1",
    left_ring="Stikini Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}
		
sets.midcast['Elemental Magic'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Argocham. Mantle",
}
sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
    head=empty,
    body="Twilight Cloak",
    ring2="Archon Ring",
    waist="Shinjutsu-no-Obi +1",
    })
sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield"})

sets.midcast['Enfeebling Magic'] = {
    ammo="Pemphredo Tathlum",
    head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="Bunzi's Sabots",
    neck="Erra Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
    
sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
    waist="Fuchi-no-Obi",})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], { left_ear="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], { left_ear="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        legs="Haven Hose",
        left_ear="Earthcry Earring",
        neck="Nodens Gorget",
        waist="Siegel Sash",
    })


    sets.midcast['Divine Magic'] = {        head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
    waist="Obstin. Sash",
    left_ear="Regal Earring",
    right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Kishar Ring",}
		
	sets.midcast.Drain = {      head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
    waist="Obstin. Sash",
    left_ear="Regal Earring",
    right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Kishar Ring",}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = set_combine(sets.midcast['Enfeebling Magic'], {})
		
    sets.midcast.Stun.Resistant = sets.midcast.Stun
		
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
		
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {  main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    ammo="Sancus Sachet +1",
    head="Baayami Hat",
    body="Baayami Robe",
    hands="Lamassu Mitts +1",
    legs="Baayami Slops",
    feet="Baayami Sabots",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="C. Palug Earring",
    left_ring="Stikini Ring +1",
    right_ring="Fervor Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}

    sets.midcast.Pet.DebuffBloodPactWard = { main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    ammo="Sancus Sachet +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Bunzi's Sabots",
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Fervor Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {   main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        right_ear="Beck. Earring +1",
        left_ear="Lugalbanda Earring",
    })

    sets.midcast.Pet.MagicalBloodPactRage = { main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="C. Palug Crown",
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Enticer's Pants", augments={'MP+20','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Mag. Acc.+3',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}

    sets.midcast.Pet.MagicalBloodPactRage.Acc =  set_combine(sets.midcast.Pet.MagicalBloodPactRage, {
        right_ear="Beck. Earring +1",
        left_ear="Lugalbanda Earring",
    })

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Impact'] = sets.midcast.Pet.DebuffBloodPactWard

	sets.midcast.Pet['Flaming Crush'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})
		
	sets.midcast.Pet['Flaming Crush'].Acc =set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {        main="Contemplator +1",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body="Con. Doublet +3",
    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats +1", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Baayami Sabots",
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Infused Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",}
    
    -- Idle sets
    sets.idle.PDT = {main="Contemplator +1",
    sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +1", augments={'Enhances "Astral Flow" effect',}},
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Assiduity Pants +1",
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="Enmerkar Earring",
    right_ear="Evans Earring",
    left_ring="Thurandaut Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}

    sets.idle.Regen = {
        main="Contemplator +1",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands="Baayami Cuffs",
        legs="Baayami Slops",
        feet="Baayami Sabots",
        neck="Empath Necklace",
        waist="Isa Belt",
        left_ear="Enmerkar Earring",
        right_ear="Evans Earring",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
    }
    
    sets.idle.Sphere = set_combine(sets.idle, {
        body="Annoint. Kalasiris",
    })

    sets.idle.PhysicalBloodPactRage = {
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
        legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
        feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
        neck={ name="Smn. Collar +2", augments={'Path: A',}},
        waist="Incarnation Sash",
        left_ear="Lugalbanda Earring",
        right_ear="Beck. Earring +1",
        left_ring="Varar Ring +1",
        right_ring="C. Palug Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
    }
    
    sets.idle.MagicalBloodPactRage = {
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="C. Palug Crown",
        body="Con. Doublet +3",
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
        legs={ name="Enticer's Pants", augments={'MP+20','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Mag. Acc.+3',}},
        feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
        neck={ name="Smn. Collar +2", augments={'Path: A',}},
        waist="Incarnation Sash",
        left_ear="Lugalbanda Earring",
        right_ear="Beck. Earring +1",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
    }
    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {
    main="Contemplator +1",
    sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +1", augments={'Enhances "Astral Flow" effect',}},
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Assiduity Pants +1",
    feet={ name="Glyph. Pigaches +3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="Enmerkar Earring",
    right_ear="Evans Earring",
    left_ring="Thurandaut Ring",
    right_ring="Varar Ring +1 +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},}

    sets.idle.PDT.Avatar = {
        main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
        ammo="Sancus Sachet +1",
        head="Baayami Hat",
        body="Baayami Robe",
        hands="Baayami Cuffs",
        legs="Baayami Slops",
        feet="Baayami Sabots",
        neck="Empath Necklace",
        waist="Isa Belt",
        left_ear="Handler's Earring +1",
        right_ear="Enmerkar Earring",
        left_ring="Thurandaut Ring",
        right_ring="Varar Ring +1",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

    sets.idle.Regen.Avatar = {
        main="Contemplator +1",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands="Baayami Cuffs",
        legs="Baayami Slops",
        feet="Baayami Sabots",
        neck="Empath Necklace",
        waist="Isa Belt",
        left_ear="Enmerkar Earring",
        right_ear="Evans Earring",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

sets.idle.PhysicalBloodPactRage.Avatar = {
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

sets.idle.MagicalBloodPactRage.Avatar = {
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="C. Palug Crown",
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Enticer's Pants", augments={'MP+20','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Mag. Acc.+3',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

    sets.idle.Spirit = {}

    sets.idle.Town = {
    feet="Herald's Gaiters",
    left_ear="Infused Earring",
}

    -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {    head="Beckoner's Horn +2",}
    sets.idle.Avatar.Melee = {}
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {
        main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands="Baayami Cuffs",
        legs="Tali'ah Sera. +2",
        feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
        neck="Caller's Pendant",
        waist="Isa Belt",
        left_ear="Enmerkar Earring",
        right_ear="Handler's Earring +1",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

    sets.defense.MDT = {
        main="Contemplator +1",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Tali'ah Turban +2",
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Klouskap Sash +1",
    left_ear="Enmerkar Earring",
    right_ear="Crep. Earring",
    left_ring="Thurandaut Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

    sets.defense.Regen = {
        main="Contemplator +1",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands="Baayami Cuffs",
        legs="Baayami Slops",
        feet="Baayami Sabots",
        neck="Empath Necklace",
        waist="Isa Belt",
        left_ear="Enmerkar Earring",
        right_ear="Evans Earring",
        left_ring="Thurandaut Ring",
        right_ring="C. Palug Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

sets.defense.PhysicalBloodPactRage = {
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
    body={ name="Glyphic Doublet +3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

sets.defense.MagicalBloodPactRage = {
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: Mag. Acc.+17',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="C. Palug Crown",
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Blood Pact Dmg.+10','Pet: CHR+1','Pet: "Mag.Atk.Bns."+2',}},
    legs={ name="Enticer's Pants", augments={'MP+20','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Mag. Acc.+3',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Beck. Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

    sets.defense.MEVA = {        
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    ear1="Lugalbanda Earring",ear2="Sanare Earring",
		ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Aurist's Cape +1"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",
		body="Seidr Cotehardie",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		feet="Apogee Pumps +1"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}



    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group

    sets.engaged = {

        ammo="Sancus Sachet +1",
        head="Nyame Helm",
        body="Tali'ah Manteel +2",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Shulmanu Collar",
        waist="Klouskap Sash +1",
        left_ear="Mache Earring +1",
        right_ear="Mache Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Defending Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}

sets.engaged.Acc = {

    ammo="Sancus Sachet +1",
    head="Nyame Helm",
    body="Tali'ah Manteel +2",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: Haste+10',}},
}
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 174')
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 14)
end
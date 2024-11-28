function user_job_setup()

	state.OffenseMode:options('Normal','Acc','CRIT','FullAcc')
	state.HybridMode:options('Tank','Tank_HP','Normal', 'DT','DTLite')
	state.WeaponskillMode:options('Match','Normal','ACC','PDL')
	state.CastingMode:options('SIRD','Normal')
	state.PhysicalDefenseMode:options('PDT_HP','PDT','PDH', 'HP', 'Evasion', 'Enmity')
	state.MagicalDefenseMode:options('MDT_HP','MDT','Resist','MEVA')
	state.ResistDefenseMode:options('MEVA','MEVA_HP')
	state.IdleMode:options('Tank','Normal','KiteTank', 'HP','PDH', 'PDT','Evasion', 'Resist','MEVA', 'Regen', 'Enmity') --,'Normal','Sphere'
	state.Weapons:options('None','Epeolatry','Lycurgos','Naegling','MalignanceSword','Reikiko','Loxotic','Dolichenus','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','EnemyCritRate','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

    --use //listbinds    .. to show command keys
    -- Additional local binds
	send_command('bind !1 gs c SubJobEnmity')
	send_command('bind f4 gs c cycle RuneElement')
	send_command('bind f3 gs c RuneElement')
	send_command('bind f2 gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind f11 gs c cycle CastingMode')
    send_command('bind @2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.
    send_command('bind @s gs c toggle SrodaBelt')
    send_command('bind f7 gs c toggle AutoSubMode')
    send_command('bind ^f11 gs c cycle ExtraDefenseMode')
    send_command('bind f1 gs c cycle HippoMode')

	--send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

	-- Weapons sets
    sets.weapons.Epeolatry = {main="Epeolatry", sub="Refined Grip +1",}
    sets.weapons.Lycurgos = {main="Lycurgos", sub="Refined Grip +1",}
    sets.weapons.Naegling = {main="Naegling", sub="Regis"}
    sets.weapons.MalignanceSword = {main="Malignance Sword", sub="Regis"}
    sets.weapons.Reikiko = {main="Reikiko", sub="Regis"}
    sets.weapons.Loxotic = {main="Loxotic Mace +1", sub="Regis"}
    sets.weapons.Dolichenus = {main="Dolichenus", sub="Regis"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
		--sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	--sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}

	-- neck JSE Necks Reinf
	sets.RP = {}
	sets.HippoMode = {}
	
    sets.Enmity = {    ammo="Iron Gobbet",
    head="Halitus Helm",
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands="Kurys Gloves",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Ahosi Leggings",
    neck="Moonlight Necklace",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Vengeful Ring",
    right_ring="Petrov Ring",
    back="Reiki Cloak",}
		 
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Ogma's Cape",}
		
    sets.Enmity.DT = {ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Ogma's Cape",}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +3",legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +2"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})
    sets.precast.JA['One for All'] = {
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

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +3", legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +2"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['One for All'].DT = {
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
    sets.precast.JA['Lunge'] = {    head="Agwu's Cap",
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back="Argocham. Mantle",}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring1="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +2",neck="Incanter's Torque",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear2="Handler's Earring +1",
        body="Passion Jacket",ring1="Defending Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {        ammo="Sapience Orb",
	head="Rune. Bandeau +3",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    body="Erilaz Surcoat +2",
	neck="Orunmila's Torque",
	legs="Agwu's Slops",
	feet="Carmine Greaves +1",
	waist="Plat. Mog. Belt",
	left_ear="Etiolation Earring",
	right_ear="Loquac. Earring",
	left_ring="Prolix Ring",
	right_ring="Kishar Ring",
	back="Moonlight Cape"}
			
	sets.precast.FC.DT = {       ammo="Sapience Orb",
	head="Rune. Bandeau +3",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    body="Erilaz Surcoat +2",
	neck="Orunmila's Torque",
	legs="Agwu's Slops",
	feet="Carmine Greaves +1",
	waist="Plat. Mog. Belt",
	left_ear="Etiolation Earring",
	right_ear="Loquac. Earring",
	left_ring="Prolix Ring",
	right_ring="Kishar Ring",
	back="Moonlight Cape"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        legs="Futhark Trousers +3",
        waist="Siegel Sash",
    })
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
    legs="Doyen Pants",
    waist="Siegel Sash",
})    
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
    sets.precast.FC.Cure = set_combine(sets.precast.FC,{
        legs="Doyen Pants",
})

-- Weaponskill sets
sets.precast.WS = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Regal Ring",
    back="Annealed Mantle",
}
    sets.precast.WS.PDL = {
        ammo="Crepuscular Pebble",
        left_ring="Sroda Ring",
    }

    sets.precast.WS['Resolution'] = {  
        ammo="Coiste Bodhar",
           head="Nyame Helm",
           body="Nyame Mail",
           hands="Nyame Gauntlets",
           legs="Nyame Flanchard",
           feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back="Annealed Mantle",
}
    sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Resolution'], {
        ammo="Crepuscular Pebble",
        left_ring="Sroda Ring",})

    sets.precast.WS['Dimidiation'] = {  
        ammo="Coiste Bodhar",
           head="Nyame Helm",
           body="Nyame Mail",
           hands="Nyame Gauntlets",
           legs="Nyame Flanchard",
           feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back="Annealed Mantle",
}
    sets.precast.WS['Dimidiation'].PDL = set_combine(sets.precast.WS['Dimidiation'], {
    ammo="Crepuscular Pebble",
    left_ring="Sroda Ring",})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Herculean Slash'].PDL = set_combine(sets.precast.WS['Herculean Slash'], {})
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, { 
           ammo="Knobkierrie",
           head="Nyame Helm",
           body="Nyame Mail",
           hands="Nyame Gauntlets",
           legs="Nyame Flanchard",
           feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Regal Ring",
    back="Annealed Mantle",
})
    sets.precast.WS['Ground Strike'].PDL = set_combine(sets.precast.WS['Ground Strike'], { 
        ammo="Crepuscular Pebble",
        left_ring="Sroda Ring",
})
sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",
    back="Annealed Mantle",
    })
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
        ammo="Crepuscular Pebble",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Judgment'] = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Judgment'], {
        ammo="Crepuscular Pebble",
        left_ring="Sroda Ring",
    })

	sets.precast.WS["Shockwave"] = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS["Power Slash"] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS["Black Halo"] = set_combine(sets.precast.WS["Savage Blade"], {left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
    sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS['Savage Blade'], {
        left_ring="Sroda Ring",})
    sets.precast.WS['Mistral Axe'].PDL= set_combine(sets.precast.WS['Savage Blade'].PDL, {})
    sets.precast.WS['Calamity'] = set_combine(sets.precast.WS['Savage Blade'], {
        left_ring="Sroda Ring",})
    sets.precast.WS['Calamity'].PDL= set_combine(sets.precast.WS['Savage Blade'].PDL, {})
	

	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS) 
	sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['One Inch Punch'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS) 
	sets.precast.WS['Combo'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS) 
	sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['Combo'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS) 
	sets.precast.WS['Combo'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS['Resolution'], sets.precast.WS)
	sets.precast.WS["Raging Axe"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Ruinator"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Exenterator"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Viper Bite"] = set_combine(sets.precast.WS["Resolution"], {ammo="Aurgelmir Orb +1",})
	sets.precast.WS["Realmrazer"] = set_combine(sets.precast.WS["Resolution"], {left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
	sets.precast.WS["Penta Thrust"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Double Thrust"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Bora Axe"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Decimation"] = set_combine(sets.precast.WS["Resolution"], {})
	sets.precast.WS["Decimation"].PDL= set_combine(sets.precast.WS["Decimation"], {})


    sets.precast.WS["True Strike"] = set_combine(sets.precast.WS["Resolution"], {})
    sets.precast.WS["True Strike"].PDL= set_combine(sets.precast.WS["True Strike"], {
    })
    sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Fell Cleave"].PDL= set_combine(sets.precast.WS["Fell Cleave"], {
    })
    sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, {
		ammo="Pemphredo Tathlum",
		head="Erilaz Galea +2",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +2",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Crep. Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	})
    sets.precast.WS["Shield Break"] = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Weapon Break"] = set_combine(sets.precast.WS["Armor Break"], {})
	sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Armor Break"],{})

-- Elemental Weapon Skill --elemental_ws--

    sets.precast.WS["Burning Blade"] = set_combine(sets.precast.JA['Lunge'], {})
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

    sets.precast.WS["Earth Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Rock Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Starburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Sunburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Flaming Arrow"] = set_combine(sets.precast.WS["Burning Blade"],{})

	
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.JA['Lunge'], {
		head="Pixie Hairpin +1",   
		right_ring="Archon Ring",	   
	})
	sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.SrodaBelt = {waist="Sroda Belt"}

    sets.midcast.FastRecast = {ammo="Pemphredo Tathlum",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {   ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Ogma's Cape"}
		
	sets.midcast.FastRecast.SIRD = {   ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Ogma's Cape"}

    sets.midcast.SIRD = {    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Ogma's Cape",}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{   ammo="Staunch Tathlum +1",
    head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs="Futhark Trousers +3",
    feet="Nyame Sollerets",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ogma's Cape",})
	
	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{})
	
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Fu. Bandeau +3",
	body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	})


	
	sets.midcast['Phalanx'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{back="Moonlight Cape",})
	
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{        
	head="Rune. Bandeau +3",
	neck="Sacro Gorget",
	right_ear="Erilaz Earring +2"}) 
	sets.midcast['Regen'].SIRD = set_combine(sets.midcast.SIRD, {
        head="Rune. Bandeau +3",
        right_ear="Erilaz Earring +2",
    })
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head="Erilaz Galea +2",
		waist="Gishdubar sash"})
    sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +2",
		body="Nyame Mail",
		hands="Regal Gauntlets",
		--legs="Futhark Trousers +3",
		feet="Nyame Sollerets",
		legs="Haven Hose",
		neck="Stone Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Ogma's Cape",})

	sets.midcast['Stoneskin'].SIRD = set_combine(sets.midcast['Stoneskin'],sets.midcast.SIRD)
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = set_combine(sets.defense.PDT, {
        feet="Skaoi Boots",
		ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		ear1="Odnowa Earring +1",ear2="Tuisto Earring",		
        neck="Sacro Gorget",
    })
    sets.midcast.Cure.SIRD = sets.midcast.SIRD
		
	sets.HPCure = set_combine(sets.midcast.Cure.SIRD, {})
	sets.HPDown = set_combine(sets.midcast.Cure.SIRD, {})

	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = set_combine(sets.midcast.Cure, {}) 
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {head="Erilaz Galea +2",waist="Gishdubar Sash"}
	sets.Phalanx_Received = {head="Fu. Bandeau +3",
	body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast['Elemental Magic'] = set_combine(sets.precast.JA['Lunge'],{})
    sets.midcast.Pet["Enfeebling Magic"] = set_combine(sets.midcast['Elemental Magic'],{})
    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        neck="Erra Pendant",
        waist="Acuity Belt +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    }

	sets.midcast.Raise = sets.midcast.SIRD
	sets.midcast.Raise.DT = sets.midcast.Raise
	sets.midcast.Reraise = sets.midcast.Raise
	sets.midcast.Reraise.DT = sets.midcast.Reraise

	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}
   --idle
    

   sets.idle = {ammo="Homiliary",
   head="Rawhide Mask",neck={ name="Bathy Choker +1", augments={'Path: A',}},ear1="Infused Earring",ear2="Ethereal Earring",
   body="Runeist Coat +3",hands="Regal Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
   back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

   --sets.idle.Sphere = set_combine(sets.idle,{})--body="Mekosu. Harness"

sets.idle.Regen = set_combine(sets.idle, {
	hands="Regal Gauntlets",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	right_ear="Infused Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
})
sets.idle.PDH = {
	ammo="Staunch Tathlum +1",
	head="Erilaz Galea +2",
	body="Erilaz Surcoat +3",
	hands="Erilaz Gauntlets +2",
	legs="Eri. Leg Guards +2",
	feet="Erilaz Greaves +2",
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Flume Belt +1",
	left_ear="Tuisto Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Defending Ring",
	right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	back="Ogma's Cape",
}

sets.idle.PDT = {   
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	body="Adamantite Armor",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Flume Belt +1",
	left_ear="Tuisto Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Defending Ring",
	right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	back="Ogma's Cape",}

	sets.idle.Evasion = {    
		ammo="Yamarang",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Svelt. Gouriz +1",
		right_ear="Infused Earring",
		left_ear="Eabani Earring",
		right_ring="Ilabrat Ring",
		left_ring="Vengeful Ring",
		back="Ogma's Cape",
	}
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
sets.idle.Resist = {
	ammo="Staunch Tathlum +1",
	head="Erilaz Galea +2",
	body="Runeist Coat +3",
	hands="Erilaz Gauntlets +2",
	legs="Rune. Trousers +3",
	feet="Erilaz Greaves +2",
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Engraved Belt",
	left_ear="Sanare Earring",
	right_ear="Erilaz Earring +2",
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Defending Ring",
	back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}
sets.idle.MEVA = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
 sets.idle.Enmity = {
	ammo="Iron Gobbet",
	head="Halitus Helm",
	body={ name="Emet Harness +1", augments={'Path: A',}},
	hands="Kurys Gloves",
	legs="Eri. Leg Guards +2",
	feet="Erilaz Greaves +2",
	neck="Moonlight Necklace",
	waist="Plat. Mog. Belt",
	left_ear="Cryptic Earring",
	right_ear="Trux Earring",
	left_ring="Vengeful Ring",
	right_ring="Petrov Ring",
	back="Reiki Cloak",
 }		
			
	sets.idle.Tank = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +2",waist="Flume Belt +1"}
	sets.EnemyCritRate =  {
		ammo="Eluder's Sachet",
		left_ring="Warden's Ring",
		right_ring="Fortified Ring",
		back="Reiki Cloak",
	 }
	 sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Defense Sets
	
	sets.defense.PDT = {   
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Adamantite Armor",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Ogma's Cape",}
	
		sets.defense.PDH = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +2",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +2",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Ogma's Cape",
		}
		sets.defense.Enmity = { 
			ammo="Iron Gobbet",
			head="Halitus Helm",
			body={ name="Emet Harness +1", augments={'Path: A',}},
			hands="Kurys Gloves",
			legs="Eri. Leg Guards +2",
			feet="Erilaz Greaves +2",
			neck="Moonlight Necklace",
			waist="Plat. Mog. Belt",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			left_ring="Vengeful Ring",
			right_ring="Petrov Ring",
			back="Reiki Cloak",
		}
		sets.defense.Evasion = {    
			ammo="Yamarang",
			head="Nyame Helm",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck={ name="Bathy Choker +1", augments={'Path: A',}},
			waist="Svelt. Gouriz +1",
			right_ear="Infused Earring",
			left_ear="Eabani Earring",
			right_ring="Ilabrat Ring",
			left_ring="Vengeful Ring",
			back="Ogma's Cape",
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
		sets.defense.MDT = {
			ammo="Staunch Tathlum +1",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body="Runeist Coat +3",
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck={ name="Warder's Charm +1", augments={'Path: A',}},
			waist="Engraved Belt",
			left_ear="Eabani Earring",
			right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			left_ring="Moonlight Ring",
			right_ring="Shadow Ring",
			back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
		}
		sets.defense.Resist = set_combine(sets.defense.MDT, {
			ammo="Staunch Tathlum +1",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body="Runeist Coat +3",
			hands="Erilaz Gauntlets +2",
			legs="Rune. Trousers +3",
			neck={ name="Warder's Charm +1", augments={'Path: A',}},
			waist="Engraved Belt",
		})


	sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist Coat +3",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.defense.MDT_HP = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.defense.MEVA = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.defense.MEVA_HP = {ammo="Yamarang",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = { ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ashera Harness",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back="Tactical Mantle"}

	sets.engaged.Acc = {ammo="Yamarang",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
			back="Tactical Mantle",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},}
	
	
		sets.engaged.CRIT = set_combine(sets.engaged.DD, {       ammo="Yetshila +1",
			head={ name="Blistering Sallet +1", augments={'Path: A',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
			legs={ name="Zoar Subligar +1", augments={'Path: A',}},
			feet="Thereoid Greaves",
			neck="Nefarious Collar +1",
			waist="Gerdr Belt",
			left_ear="Sherida Earring",
			right_ear="Brutal Earring",
			left_ring="Niqmaddu Ring",
			right_ring="Hetairoi Ring",
			back="Tactical Mantle",
		})
	
	sets.engaged.FullAcc = {ammo="C. Palug Stone",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back="Tactical Mantle",waist="Olseni Belt",legs="Carmine Cuisses +1",feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},}
			
    sets.engaged.DTLite = {ammo="Aurgelmir Orb +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Epona's Ring",
            back="Tactical Mantle",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Nyame Sollerets"}
    sets.engaged.Acc.DTLite = {ammo="Yamarang",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
            back="Tactical Mantle",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Nyame Sollerets"}
	sets.engaged.FullAcc.DTLite = {ammo="C. Palug Stone",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Ramuh Ring +1",
            back="Tactical Mantle",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Nyame Sollerets"}

    sets.engaged.Tank = {ammo="Staunch Tathlum +1",
            head="Nyame Helm",
			body="Nyame Mail",
			hands="Turms Mittens +1",
			legs="Eri. Leg Guards +2",
			feet="Turms Leggings +1",
			neck="Warder's Charm +1",
			ear1="Odnowa Earring +1",
			ear2="Tuisto Earring",
			ring1="Gelatinous Ring +1",
            ring2="Moonlight Ring",
            waist="Engraved Belt",
			back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
		}
	sets.engaged.Tank_HP = {ammo="Staunch Tathlum +1",
			head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
			body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
			back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank_HP = sets.engaged.Tank_HP
	sets.engaged.FullAcc.Tank_HP = sets.engaged.Tank_HP
	
	    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Hybrid = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Anu Torque",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    }
   
    sets.engaged.DT = set_combine(sets.engaged, sets.Hybrid)

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
	})
	sets.buff.Sleep = {} --head="Frenzy Sallet"
	sets.buff.Battuta = {
		hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Turms Leggings +1",
        back="Ogma's Cape",}
	sets.buff.Embolden = {
	head="Erilaz Galea +2",
    body="Nyame Mail",
    hands="Regal Gauntlets",
    legs="Futhark Trousers +3",
	ring2="Sheltered Ring",
    back="Evasionist's Cape",
	}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(7, 19)
    elseif player.sub_job == 'SCH' then
        set_macro_page(6, 19) 
		--send_command('gs c Light Arts')
    elseif player.sub_job == 'BLU' then
        set_macro_page(3, 19)
        send_command('input //blupldsets set pld')
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 19)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 19)
	else
		set_macro_page(3, 19)
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
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
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

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 165')
	else
		windower.chat.input('/lockstyleset 165')
	end
end

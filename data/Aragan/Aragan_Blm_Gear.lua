-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

in macro job blm sch rdm nin drk geo whm pld for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C and spam mb on bosses 
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
/con gs c elemental aga -- for spell aja 
u can use addon automb 

-------------
]]


function user_job_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal', 'SIRD', 'Spaekona', 'ConserveMP', 'Proc','OccultAcumen')
	state.OffenseMode:options('Normal','TP', 'CRIT', 'Locked')
	state.HybridMode:options('DT','Normal')
	state.PhysicalDefenseMode:options('PDT', 'MDT')
    state.MagicalDefenseMode:options('MDT')
	state.Enfeebling = M('None', 'Effect')
	state.IdleMode:options('DT','Normal','DT','Empy', 'PDT', 'MDT', 'HB', 'MB', 'Evasion', 'EnemyCritRate', 'Sphere')
	state.Weapons:options('None','Mpaca', 'Marin','BunziClub', 'MaxentiusClub', 'Drepanum', 'Maliya','TernionDagger')
	state.AutoBuffMode:options('Off','MB','Auto') --,'Off','Off','Off','Off','Off',
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

	gear.nuke_jse_back = {}
	gear.stp_jse_back = {}

		-- Additional local binds
	send_command('bind f4 gs c cycle ElementalMode')
	send_command('bind !f4 gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^f11 gs c cycle Enfeebling')
	send_command('bind !f11 gs c cycle MagicalDefenseMode;gs c set DefenseMode Magical')

	send_command('bind f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind !f2 gs c cycle RecoverMode')
	send_command('bind f3 gs c cycle DeathMode')
	send_command('bind !f3 gs c set DeathMode Single;gs c set MagicBurstMode Single')
	send_command('bind ^1 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.

	--send_command('bind ^` gs c cycle ElementalMode') 
	--send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^0 gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !9 gs c weapons Default;gs c reset CastingMode;gs c reset DeathMode;gs c reset MagicBurstMode')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir III" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind !w gs c toggle WeaponLock')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
	send_command('bind @x gs c toggle RP')  
    send_command('bind @c gs c toggle Capacity')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind !f6 gs c cycleback Weapons')
    send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  

    --[[]	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')]]
	select_default_macro_book()
end

autows_list = {['Marin']='Myrkr',['Mpaca']='Myrkr',['Drepanum']='Spiral Hell',
['Maliya']='Spinning Scythe',['TernionDagger']='Aeolian Edge',['MaxentiusClub']='Black Halo',}

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	--sets.weapons.BurstWeapons = {main=gear.grioavolr_nuke_staff,sub="Enki Strap"}
	--sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	
	sets.weapons.Marin = {main="Marin Staff +1",sub="Enki Strap"}
    sets.weapons.Mpaca = {main="Mpaca's Staff",sub="Enki Strap"}
    sets.weapons.Drepanum = {main="Drepanum",sub="Alber Strap"}
    sets.weapons.Maliya = {main="Maliya Sickle +1",sub="Alber Strap"}
    sets.weapons.MaxentiusClub = {main="Maxentius",sub="Ammurapi Shield",}
    sets.weapons.BunziClub = {main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",}

    sets.weapons.TernionDagger = {main="Ternion Dagger +1",sub="Ammurapi Shield",}

	-- neck JSE Necks Reinf
	sets.RP = {}
	-- Capacity Points Mode
	sets.Capacity = {}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}	
	
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs

    sets.precast.JA['Mana Wall'] = {back="Taranus's cape",feet="Wicce Sabots +2"}
 
    sets.precast.JA.Manafont = {body={ name="Arch. Coat +3", augments={'Enhances "Manafont" effect',}},}
    

    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {	ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6','INT+1',}},
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Regal Pumps +1", augments={'Path: A',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs="Doyen Pants",
        head="Umuthi Hat",
        waist="Siegel Sash",})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        legs="Doyen Pants",
        waist="Plat. Mog. Belt",
        back="Moonlight Cape",
       })
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

	sets.precast.FC.Death = {        ammo="Sapience Orb",
	head={ name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6','INT+1',}},
	body={ name="Ros. Jaseran +1", augments={'Path: A',}},
	hands={ name="Agwu's Gages", augments={'Path: A',}},
	legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
	feet={ name="Regal Pumps +1", augments={'Path: A',}},
	neck="Baetyl Pendant",
	waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
	left_ear="Malignance Earring",
	right_ear="Loquac. Earring",
	left_ring="Mephitas's Ring",
	right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

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
        right_ear="Ishvara Earring",
        left_ring="Rufescent Ring",
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},}
        
    sets.precast.WS['Myrkr'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands="Regal Cuffs",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Nyame Sollerets",
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Etiolation Earring",
        left_ring="Mephitas's Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Spinning Scythe'] = {
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
        left_ring="Rufescent Ring",
        right_ring="Cornelia's Ring",
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
        back="Taranus's Cape",}
       
    sets.precast.WS['Infernal Scythe'] = {
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
        back="Taranus's Cape",}
        
    sets.precast.WS['Cross Reaper']	= {
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
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.precast.WS['Black Halo'] = {
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
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    sets.precast.WS['Starburst'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Sunburst'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Earth Crusher'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Rock Crusher'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Seraph Strike'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Shining Strike'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Vidohunir'] = sets.precast.WS['Cataclysm']
    sets.precast.WS['Dark Harvest'] = sets.precast.WS['Cataclysm']
    
    sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Cataclysm"], {})

    sets.precast.WS["Aeolian Edge"] = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Regal Earring",
        left_ring="Cornelia's Ring",
        right_ring="Freke Ring",
        back="Taranus's Cape",
    }
    sets.precast.WS["Cyclone"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Gust Slash"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Shining Strike"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Seraph Strike"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Flash Nova"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Thunder Thrust"] = set_combine(sets.precast.WS["Aeolian Edge"],{})
    sets.precast.WS["Raiden Thrust"] = set_combine(sets.precast.WS["Aeolian Edge"],{})

    sets.precast.WS['Shattersoul'] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Malignance Earring",
        right_ear="Brutal Earring",
        left_ring="Rufescent Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    sets.precast.WS['Vorpal Scythe'] = set_combine(sets.precast.WS['Spinning Scythe'], {
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        neck="Nefarious Collar +1",
        left_ring="Hetairoi Ring",
    })

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
    sets.precast.WS['Vidohunir'] = sets.precast.WS["Shell Crusher"]

	sets.MaxTPMyrkr = {}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = sets.precast.FC

	sets.SIRD = {
        ammo="Staunch Tathlum +1",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet="Wicce Sabots +2",
        waist="Rumination Sash",
        right_ring="Freke Ring",
	} 
    sets.ConserveMP = {
        ammo="Pemphredo Tathlum",
        body="Spaekona's Coat +3",
        hands="Wicce Gloves +2",
        waist="Shinjutsu-no-Obi +1",
        left_ear="Calamitous Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    }
    sets.OccultAcumen = {
        ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",
        legs="Perdition Slops",
        waist="Oneiros Rope",

    }

    sets.midcast.Cure = {      
	ammo="Pemphredo Tathlum",
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    hands="Telchine Gloves",
	legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	neck="Incanter's Torque",
    waist="Plat. Mog. Belt",
	left_ear="Mendi. Earring",
	right_ear="Etiolation Earring",
	left_ring="Kishar Ring",
	right_ring="Naji's Loop",
    back="Moonlight Cape",
}
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure,sets.SIRD, {})

    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCure.SIRD = set_combine(sets.midcast.LightWeatherCure,sets.SIRD, {})

		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = sets.midcast.LightWeatherCure
	sets.midcast.LightDayCure.SIRD = set_combine(sets.midcast.LightDayCure,sets.SIRD, {})

    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Curaga.SIRD = sets.midcast.Cure.SIRD

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {      
	main="Oranyan",
	ammo="Pemphredo Tathlum",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",
	neck="Incanter's Torque",
	waist="Embla Sash",
	left_ear="Mendi. Earring",
	right_ear="Andoaa Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD, {
	})	

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        legs="Haven Hose",
        left_ear="Earthcry Earring",
        waist="Siegel Sash",
        neck="Nodens Gorget",})
    sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD, {
        legs="Haven Hose",
        left_ear="Earthcry Earring",
        waist="Siegel Sash",
        neck="Nodens Gorget",})	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif +1"
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {feet="Inspirited Boots",waist="Gishdubar Sash",back="Grapevine Cape",})

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD) 

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"})    
	sets.midcast.Aquaveil.SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD) 

	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.midcast['Enfeebling Magic'] = {   
    ammo="Pemphredo Tathlum",
	head=empty,
	body="Cohort Cloak +1",
	hands="Regal Cuffs",
	legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
	feet="Spae. Sabots +3",
	neck={ name="Src. Stole +2", augments={'Path: A',}},
	waist="Rumination Sash",
	ear1="Malignance Earring",
	ear2="Regal Earring",
	ring2="Kishar Ring",
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
    sets.midcast['Enfeebling Magic'].Resistant = sets.midcast['Enfeebling Magic']
		
    sets.midcast['Enfeebling Magic'].SIRD = set_combine(sets.midcast['Enfeebling Magic'],{
        ammo="Staunch Tathlum +1",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet="Wicce Sabots +2",
        waist="Rumination Sash",
        right_ring="Freke Ring",
    })
	
    sets.midcast['Enfeebling Magic'].Effect = set_combine(sets.midcast['Enfeebling Magic'],{
        main="Contemplator +1",
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head=empty,
        body="Cohort Cloak +1",
        hands="Regal Cuffs",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Spae. Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist="Rumination Sash",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring2="Kishar Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    })
    sets.midcast['Enfeebling Magic'].Effect.SIRD = set_combine(sets.midcast['Enfeebling Magic'].Effect,{
        main="Contemplator +1",
        sub="Enki Strap",
        ammo="Staunch Tathlum +1",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet="Wicce Sabots +2",
        waist="Rumination Sash",
        right_ring="Freke Ring",
    })
	sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'],{
        ammo="Pemphredo Tathlum",
        head="Wicce Petasos +2",
        body="Spaekona's Coat +3",
        hands="Spae. Gloves +3",
        legs="Arch. Tonban +3",
        feet="Arch. Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring2="Kishar Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    })


	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Ea Hat +1",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Ea Hat +1",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.SIRD = set_combine(sets.midcast.IntEnfeebles,sets.SIRD) 

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	sets.midcast.MndEnfeebles.SIRD = set_combine(sets.midcast.MndEnfeebles,sets.SIRD) 

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'])
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'])
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
        body="Shango Robe",
        hands="Amalric Gages +1",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Erra Pendant",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Archon Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
	}
	sets.midcast['Dark Magic'].SIRD = set_combine(sets.midcast['Dark Magic'],sets.SIRD) 

    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body={ name="Agwu's Robe", augments={'Path: A',}},
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet={ name="Agwu's Pigaches", augments={'Path: A',}},
        neck="Erra Pendant",
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    }
	
-- These next two sets are used later in the functions to determine what gear will be used in High MP and Low MP situations
-- SPECIFICALLY for Aspir spells.  In the LowMP set, put your best Aspir+ gear, in the other set put your best Max MP gear.
-- Find out how much your maximum MP is in each set, and adjust the MP values in the function area accordingly
-- (CTRL+F: Aspir Handling)
sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    head="Pixie Hairpin +1",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Drain" and "Aspir" potency +10','CHR+5','Mag. Acc.+4',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    left_ear="Hirudinea Earring",
    ring1="Evanescence Ring",
    ring2="Archon Ring",
    waist="Fucho-no-obi",
    })
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = sets.midcast.Drain
	
	-- Midcast set for Death, Might as well only have one set, unless you plan on free-nuking death for some unexplainable reason.

    sets.midcast['Death'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Pixie Hairpin +1",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Ea Pigaches +1",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Barkaro. Earring",
		left_ring="Archon Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
    }
    sets.midcast['Death'].magicburst = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Pixie Hairpin +1",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Ea Pigaches +1",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Barkaro. Earring",
		left_ring="Archon Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
    }

	sets.midcast['Comet'] = set_combine(sets.midcast['Elemental Magic'], {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Ea Pigaches +1",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Archon Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
    })
    sets.midcast['Comet'].magicburst = set_combine(sets.midcast['Elemental Magic'], {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Ea Pigaches +1",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Archon Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
    })
    sets.midcast['Comet'].Spaekona = set_combine(sets.midcast['Comet'], {
        body="Spaekona's Coat +3",
    })
    sets.midcast['Comet'].ConserveMP = set_combine(sets.midcast['Comet'], {
        ammo="Pemphredo Tathlum",
        body="Spaekona's Coat +3",
        hands="Wicce Gloves +2",
        waist="Shinjutsu-no-Obi +1",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    })

	sets.midcast['Comet'].FreeNuke = set_combine(sets.midcast['Elemental Magic'], {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Amalric Gages +1",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back="Taranus's Cape",
    })
    
	
    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum",
        head="Wicce Petasos +2",
        body="Wicce Coat +3",
        hands="Spae. Gloves +3",
        legs="Wicce Chausses +3",
        feet="Spae. Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
		back="Taranus's Cape",
    })

    sets.midcast.BardSong = {ammo="Ghastly Tathlum +1",
        neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Regal Earring",
        hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
        waist="Luminary Sash",legs="Merlinic Shalwar",feet="Medium's Sabots"}
		
		sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
			head=empty,
			body="Twilight Cloak",
			hands="Spae. Gloves +3",
			legs="Wicce Chausses +3",
			feet="Spae. Sabots +3",
			neck={ name="Src. Stole +2", augments={'Path: A',}},
			waist={ name="Acuity Belt +1", augments={'Path: A',}},
			ear1="Malignance Earring",
			ear2="Regal Earring",
			ring2="Kishar Ring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			back="Taranus's Cape"})
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Wicce Petasos +2",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +2",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Taranus's Cape",
	}
		
    sets.midcast['Elemental Magic'].Resistant =     sets.midcast['Elemental Magic']
		
	sets.midcast['Elemental Magic'].HighTierNuke =     sets.midcast['Elemental Magic']
	
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant =    sets.midcast['Elemental Magic']
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
		
		sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
            ammo="Seraphic Ampulla",
            head="Mall. Chapeau +2",
			body="Wicce Coat +3",
			hands="Amalric Gages +1",
            legs="Perdition Slops",
			feet="Ea Pigaches +1",
			neck={ name="Src. Stole +2", augments={'Path: A',}},
            waist="Oneiros Rope",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring="Freke Ring",
			right_ring="Mujin Band",
			back="Taranus's Cape",
		})
	
		sets.midcast['Elemental Magic'].Proc =  {
            ammo="Pemphredo Tathlum",
            head="Null Masque",
            body="Spaekona's Coat +3",
            hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
            legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
            feet={ name="Telchine Pigaches", augments={'Mag. Evasion+21','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
            neck="Reti Pendant",
            waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
            left_ear="Mendi. Earring",
            right_ear="Infused Earring",
            left_ring="Mephitas's Ring",
            right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}
	
		sets.midcast['Elemental Magic'].Spaekona = set_combine(sets.midcast['Elemental Magic'], {
			body="Spaekona's Coat +3",
		
		})
		sets.midcast['Elemental Magic'].ConserveMP = set_combine(sets.midcast['Elemental Magic'], {
			ammo="Pemphredo Tathlum",
			body="Spaekona's Coat +3",
			hands="Wicce Gloves +2",
			waist="Shinjutsu-no-Obi +1",
			left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	})
	
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat +3"}

	-- Gear for Magic Burst mode.
	
    sets.magicburst = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
        body="Wicce Coat +3",
        hands="Amalric Gages +1",
        legs="Wicce Chausses +3",
        feet="Agwu's Pigaches",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Taranus's Cape",
    }
    sets.magicburst.proc = {
			head=empty,
			body=empty,
			hands=empty,
			legs=empty,
			feet=empty,
			neck=empty,
			waist=empty,
			left_ear=empty,
			right_ear=empty,
			left_ring=empty,
			right_ring=empty,
			back=empty,
    }
    sets.magicburst.Spaekona = set_combine(sets.midcast.magicburst, {
        body="Spaekona's Coat +3",
    })
    sets.magicburst.ConserveMP = set_combine(sets.midcast.magicburst, {
        ammo="Pemphredo Tathlum",
        body="Spaekona's Coat +3",
        hands="Wicce Gloves +2",
        waist="Shinjutsu-no-Obi +1",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    })
    sets.element.Earth =  {neck="Quanpur Necklace"}

    sets.element.Earth.magicburst = {
        neck="Quanpur Necklace",
    }

    -- Sets to return to when not performing an action.
    
    -- Resting sets
		sets.resting = {      
			head="Befouled Crown",
			body="Shamash Robe",
			legs="Assid. Pants +1",
			neck={ name="Bathy Choker +1", augments={'Path: A',}},
			left_ear="Infused Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
		}
    -- Idle sets
    
    -- Normal refresh idle set
	

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Wicce Coat +3",
        hands="Wicce Gloves +2",
        legs={ name="Assid. Pants +1", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Taranus's Cape",}


    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
	sets.idle.PDT = {
		ammo="Staunch Tathlum +1",
		head="Wicce Petasos +2",
		body="Shamash Robe",
		hands="Wicce Gloves +2",
		legs="Nyame Flanchard",
		feet="Wicce Sabots +2",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Eabani Earring",
		right_ear="Ethereal Earring",
		right_ring="Stikini Ring +1",
		right_ring="Shadow Ring",
		back="Moonlight Cape",
		}
		sets.idle.MDT = {
			ammo="Staunch Tathlum +1",
			head="Wicce Petasos +2",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Warder's Charm +1",
			waist="Carrier's Sash",
			left_ear="Eabani Earring",
			right_ear="Ethereal Earring",
			left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
			right_ring="Shadow Ring",
			back="Moonlight Cape",
		}
		
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
	head="Pixie Hairpin +1",
	body={ name="Ros. Jaseran +1", augments={'Path: A',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs="Wicce Chausses +3",
	feet="Wicce Sabots +2",
	neck="Sanctity Necklace",
	waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
	left_ear="Etiolation Earring",
	right_ear="Evans Earring",
	left_ring="Mephitas's Ring",
	right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
	back="Taranus's Cape",}

    sets.idle.DeathMode = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +2",
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Mephitas's Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
        }
    sets.idle.MB = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body={ name="Ros. Jaseran +1", augments={'Path: A',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Wicce Chausses +3",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Mephitas's Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.idle.Sphere = set_combine(sets.idle, {
        body="Annoint. Kalasiris",
    })


    sets.idle.HB = {
        main="Malignance Pole",
        sub="Alber Strap",
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }

    sets.idle.DT = {
        sub="Alber Strap",
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear="Ethereal Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }
    sets.idle.Tank = sets.idle.DT 

    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        back="Reiki Cloak",
    })

    sets.idle.Evasion = set_combine(sets.idle.PDT, { 
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear="Ethereal Earring",
        left_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    })

    sets.idle.Empy = set_combine(sets.idle, { 
        head="Wicce Petasos +2",
        body="Wicce Coat +3",
        hands="Wicce Gloves +2",
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +2",

    })

    -- Defense sets

    sets.defense.PDT = {
        main="Malignance Pole",
        sub="Alber Strap",
        ammo="Staunch Tathlum +1",
        head="Wicce Petasos +2",
        body="Adamantite Armor",
        hands="Wicce Gloves +2",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }
 
    sets.defense.MDT = {
	main="Malignance Pole",
    sub="Alber Strap",
    ammo="Staunch Tathlum +1",
    head="Wicce Petasos +2",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Ethereal Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    right_ring="Shadow Ring",
    back="Moonlight Cape",
	}
		
    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = { body={ name="Ros. Jaseran +1", augments={'Path: A',}},}
    sets.passive.Twilight = {head=empty,body="Twilight Cloak"}

	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Genmei Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
	})
    sets.buff['Mana Wall'] = {back="Taranus's cape",feet="Wicce Sabots +2"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {           
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Nyame Mail",
	hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Combatant's Torque",
	waist="Olseni Belt",
	left_ear="Crep. Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back={ name="Aurist's Cape +1", augments={'Path: A',}},}
	
	sets.engaged.TP = {
        ammo="Amar Cluster",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Battlecast Gaiters",
        neck="Combatant's Torque",
        waist="Cornelia's Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	    }
    sets.engaged.CRIT = set_combine(sets.engaged.TP, {
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        neck="Nefarious Collar +1",
        left_ring="Hetairoi Ring",
    })
    sets.engaged.TH = {
        ammo="Per. Lucky Egg",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Chaac Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
    sets.engaged.Locked = {
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Olseni Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
    sets.engaged.DT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},waist="Olseni Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
    sets.Phalanx_Received = set_combine(sets.midcast['Enhancing Magic'], {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(6, 9)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 174')
end


function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Subtle Sorcery"] = {gain = 'Subtle Sorcery is on.', lose = 'Subtle Sorcery wore off.', announce_gain = true, announce_lose = true},
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
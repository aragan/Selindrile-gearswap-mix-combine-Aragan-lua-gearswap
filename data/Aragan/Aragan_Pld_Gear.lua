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
-----------
]]

function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal', 'TP', 'Acc', 'STP', 'CRIT')
    state.HybridMode:options('Tank','DDTank','Normal')
    state.WeaponskillMode:options('Match', 'PDL', 'Acc','Enmity')
    state.CastingMode:options('Duration','Normal','SIRD', 'DT', 'ConserveMP','Enmity')
	state.Passive:options('None','AbsorbMP','EnemyCritRate','ReverenceGauntlets','EnemyTPaccumulation','Resist')
    state.PhysicalDefenseMode:options('PDT', 'PD', 'Convert', 'Block', 'HPBOOST','Aminon', 'Enmity' ,'Enmitymax','Turtle','ResistCharm')
    state.MagicalDefenseMode:options('MDT','MDT_HP','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP')
	state.IdleMode:options('Tank','Kiting','DT','PDT','PDH','Block','Evasion','MDT','MEVA','Regen','Normal')
	state.Weapons:options('None','Burtgang','MalignanceSword','Naegling','Reikiko','SakpataSword','Malevolence','Club','Caladbolg','MalignancePole',
	'Shining','DualNaegling','DualReikiko','DualReikikoThibron','DualNaeglingThibron')
	state.ShieldMode = M{['description']='Shield Mode', 'Normal', 'Srivatsa','Ochain','Duban', 'Aegis', 'Priwen'} -- , 'Priwen' }
	state.AutoBuffMode:options('Off','Auto','Odyss','Defense','Reprisal','Aminon') --,'Off','Off','Off','Off','Off',

    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','EnemyCritRate','ReverenceGauntlets', 'Refresh', 'Resist', 'EnemyTPaccumulation','MP','Twilight'}
	
	gear.fastcast_jse_back = {}
	gear.enmity_jse_back = {}

	--use //listbinds    .. to show command keys
	-- Additional local binds
	--send_command('bind ^backspace input /ja "Shield Bash" <t>')
	--send_command('bind @backspace input /ja "Cover" <stpt>')
	--send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind ^f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind ^q gs c set IdleMode Kiting')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind f7 gs c cycle ShieldMode')
    send_command('bind !f7 gs c cycleback ShieldMode')
	send_command('bind !w gs c toggle WeaponLock')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind !f11 gs c set DefenseMode Magical')
    send_command('bind !f11 gs c set DefenseMode Magical')
    send_command('bind @3 gs c cycle passive')

	send_command('bind @s gs c toggle SrodaBelt')
	send_command('bind f1 gs c cycle HippoMode')
	send_command('bind f2 gs c toggle AutoRuneMode')
	--send_command('bind f3 gs c cycle RuneElement')
	send_command('bind f4 gs c cycle ElementalMode;gs c cycle RuneElement')

	send_command('bind !f3 gs c toggle AutoTankMode')
	send_command('bind !f2 gs c toggle TankAutoDefense')
	send_command('bind !f4 gs c toggle AutoDefenseMode')
	send_command('bind !f5 gs c toggle AutoWSMode')
	send_command('bind @f1 gs c toggle AutoEngageMode')
	send_command('bind @f2 gs c toggle AutoBuffMode')
	send_command('bind @f3 gs c toggle AutoTrustMode')
	send_command('bind @f4 gs c toggle AutoFoodMode')
	send_command('bind ^f1 gs c toggle AutoStunMode')
	--send_command('bind ^f2 gs c toggle SubJobEnmity')
	send_command('bind ^f3 gs c cycle SkillchainMode')
	send_command('bind @3 gs c curecheat')

    send_command('bind @c gs c toggle Capacity')
    send_command('bind @x gs c toggle RP')  --keeps neck JSE Reinforcement Points Mode on.
    --send_command('bind !t gs c cycle TartarusMode')

    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	-- Weapons sets

	sets.Normal = {}
    sets.weapons.Burtgang = {main="Burtgang"}
    sets.weapons.MalignanceSword = {main="Malignance Sword"}
    sets.weapons.Naegling = {main="Naegling"}
    sets.weapons.Reikiko = {main="Reikiko"}
    sets.weapons.Malevolence = {main="Malevolence"}
	sets.weapons.Club = {main="Mafic Cudgel"}
    sets.weapons.Caladbolg = {main="Caladbolg", sub="Alber Strap",}
	sets.weapons.Shining = {main="Shining One", sub="Alber Strap"}
    sets.weapons.MalignancePole = {main="Malignance Pole", sub="Alber Strap",}
	sets.weapons.SakpataSword = {main="Sakpata's Sword"}

	
    sets.weapons.DualReikiko = {main="Reikiko", sub="Demers. Degen +1"}
    sets.weapons.DualNaegling = {main="Naegling", sub="Demers. Degen +1"}

	sets.weapons.DualReikikoThibron = {main="Reikiko", sub="Thibron"}
    sets.weapons.DualNaeglingThibron = {main="Naegling", sub="Thibron"}

	sets.Normal = {}
	sets.Aegis = {sub="Aegis"}
	sets.Ochain = {sub="Ochain"}
	sets.Duban = {sub="Duban"}
	sets.Srivatsa = {sub="Srivatsa"}
	sets.Priwen = {sub="Priwen"}

     -- neck JSE Necks Reinf
	 sets.RP = {}

	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Paeapua",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back="Rudianos's Mantle",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
		
    sets.Enmity.SIRD = {		ammo="Staunch Tathlum +1",
	head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands="Chev. Gauntlets +3",
	legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
	feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
	neck="Moonlight Necklace",
	waist="Audumbla Sash",
	left_ear="Tuisto Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Defending Ring",
	back="Rudianos's Mantle",}
		
    sets.Enmity.DT = {			ammo="Staunch Tathlum +1",
	head="Sakpata's Helm",
	body="Adamantite Armor",
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs="Sakpata's Cuisses",
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Unmoving Collar +1", 
	waist="Flume Belt +1",
	left_ear="Tuisto Earring", 
	right_ear="Cryptic Earring",
	left_ring="Apeile Ring +1",
	right_ring="Shadow Ring", 
	back="Rudianos's Mantle",}

	sets.DT = {			
	ammo="Staunch Tathlum +1",
	head="Sakpata's Helm",
	body="Adamantite Armor",
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs="Sakpata's Cuisses",
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Unmoving Collar +1", 
	waist="Flume Belt +1",
	left_ear="Tuisto Earring", 
	right_ear="Cryptic Earring",
	left_ring="Apeile Ring +1",
	right_ring="Shadow Ring", 
	back="Rudianos's Mantle",
}
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +3"}) --(Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +3"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{head="Cab. Coronet +3"}) 
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +3"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Stikini Ring +1",ring2="Rufescent Ring",
		back="Rudianos's Mantle",waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}
		
    sets.precast.JA['Chivalry'].DT = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Regal Gauntlets",ring1="Stikini Ring +1",
		back="Moonlight Cape",waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {ammo="Aurgelmir Orb +1",
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Flamma Korazin +2",hands="Regal Gauntlets",
        waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Erra Pendant",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
        waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {   ammo="Sapience Orb",
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
	body="Rev. Surcoat +3",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	legs="Enif Cosciales",
	feet="Chev. Sabatons +3",
	neck="Orunmila's Torque",
	waist="Plat. Mog. Belt",
	left_ear="Etiolation Earring",
	right_ear="Loquac. Earring",
	left_ring="Rahab Ring",
	right_ring="Kishar Ring",
	back="Moonlight Cape",}
		
    sets.precast.FC.DT = set_combine(sets.precast.FC, {
		head="Chevalier's Armet +3",
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		left_ear="Tuisto Earring",
	})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendi. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"})
	sets.precast.FC.Cure.DT = set_combine(sets.precast.FC.DT, {ear1="Mendi. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {   
		ammo="Oshasha's Treatise",
	 head="Nyame Helm",
	 body="Nyame Mail",
	 body="Nyame Mail",
	 legs="Nyame Flanchard",
	 feet="Nyame Sollerets",
	 neck="Rep. Plat. Medal",
	 waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	 right_ear="Thrud Earring",
	 left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	 left_ring="Regal Ring",
	 right_ring="Cornelia's Ring",
	 }
	 sets.precast.WS.PDL = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		left_ring="Sroda Ring", 
	 })
	 sets.precast.WS.None = {}
	 sets.precast.WS.Enmity = set_combine(sets.Enmity, {})

    sets.precast.WS.DT = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Plat. Mog. Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.precast.WS.Acc = {
        head="Nyame Helm",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Nyame Mail",hands="Sakpata's Gauntlets",left_ring="Regal Ring",right_ring="Cornelia's Ring",
        back="Null Shawl",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}
	
   -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

   --Stat Modifier:     73~85% MND  fTP:    1.0
   sets.precast.WS['Requiescat'] = {
	ammo="Aurgelmir Orb +1",
	head="Hjarrandi Helm",
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Fotia Gorget",
	waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Cessance Earring",
	left_ring="Petrov Ring",
	right_ring="Regal Ring",
	back="Null Shawl",
	}
	sets.precast.WS['Requiescat'].PDL = set_combine(sets.precast.WS['Requiescat'], {
	   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Requiescat'].None = {}
	
	   --Stat Modifier: 50%MND / 50%STR fTP: 1000:4.0 2000:10.25 3000:13.75
	sets.precast.WS['Savage Blade'] = {
	   ammo="Oshasha's Treatise",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Rep. Plat. Medal",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	right_ear="Thrud Earring",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Sroda Ring", 
	right_ring="Cornelia's Ring",
	back="Null Shawl",
	}
	sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
	   ammo="Crepuscular Pebble",
	   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	   left_ring="Sroda Ring", 
	})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {ear1="Mache Earring +1",ear2="Telos Earring"})

	sets.precast.WS['Savage Blade'].None = {}
	
	  --Stat Modifier:  80%DEX  fTP:2.25
	  sets.precast.WS['Chant du Cygne'] = {	
	   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	   head={ name="Blistering Sallet +1", augments={'Path: A',}},
	   body="Hjarrandi Breast.",
	   hands="Flam. Manopolas +2",
	   legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
	   feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
	   neck="Fotia Gorget",
	   waist="Fotia Belt",
	   left_ear="Mache Earring +1",
	   right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
	   left_ring="Regal Ring",
	   right_ring="Hetairoi Ring",
	   back="Null Shawl",
	}
	sets.precast.WS['Chant du Cygne'].PDL = set_combine(sets.precast.WS['Chant du Cygne'], {
	   ammo="Crepuscular Pebble",
	   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'].None = {}
	
	   --Stat Modifier: WS damage + 30/31%   2211DMG maxaggro
	   sets.precast.WS['Atonement'] = {
	   ammo="Paeapua",
	   head={ name="Loess Barbuta +1", augments={'Path: A',}},
	   body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   neck="Moonlight Necklace",
	   waist="Fotia Belt",
	   left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	   right_ear="Cryptic Earring",
	   left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
	   right_ring="Apeile Ring",
	   back="Rudianos's Mantle",
	}
	sets.precast.WS['Atonement'].None = {}
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Impulse Drive'].PDL = set_combine(sets.precast.WS['Impulse Drive'], {    
	   ammo="Crepuscular Pebble",
	   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	   left_ring="Sroda Ring", 
	})
	sets.precast.WS['Impulse Drive'].None = {}
	
	sets.precast.WS["Realmrazer"] = set_combine(sets.precast.WS["Requiescat"], {})
	sets.precast.WS["Realmrazer"].PDL = set_combine(sets.precast.WS["Requiescat"].PDL, {})
	sets.precast.WS["True Strike"] = set_combine(sets.precast.WS["Chant du Cygne"], {})
	sets.precast.WS["True Strike"].PDL = set_combine(sets.precast.WS["Chant du Cygne"], {})
	sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS["Requiescat"], {
	   ammo="Oshasha's Treatise",
	   head="Nyame Helm",
	   body="Nyame Mail",
	   hands="Nyame Gauntlets",
	   legs="Nyame Flanchard",
	   feet="Nyame Sollerets",
	   neck="Fotia Gorget",
	   waist="Fotia Belt",
	   left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
	   right_ear="Brutal Earring",
	   left_ring="Rufescent Ring",
	   right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	   back="Null Shawl",
	})
	sets.precast.WS['Shattersoul'].PDL = set_combine(sets.precast.WS["Requiescat"].PDL, {
	   ammo="Crepuscular Pebble",
	   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	   left_ring="Sroda Ring", 
	})
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS['Requiescat'], {})
	sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Requiescat'].PDL, {})
	
	-- Elemental Weapon Skill --elemental_ws--
	
	-- SANGUINE BLADE
	-- 50% MND / 50% STR Darkness Elemental
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Nyame Mail",
		legs="Nyame Flanchard",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
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
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Cornelia's Ring",
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


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------
 --Spell interupt down (pro shell raise)104/102

 sets.SIRD = {   
	ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",}

   sets.ConserveMP={
    ammo="Pemphredo Tathlum",
    legs={ name="Augury Cuisses +1", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    left_ear="Mendi. Earring",
	right_ear="Calamitous Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}
sets.SrodaBelt = {waist="Sroda Belt"}

    sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Plat. Mog. Belt",legs="Enif Cosciales",feet="Odyssean Greaves"}
		
	sets.midcast.FastRecast.DT = set_combine(sets.DT, {})

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].ConserveMP = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

	sets.midcast['Frightful Roar'] = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Chev. Cuirass +3",
		hands="Chev. Gauntlets +3",
		legs="Chev. Cuisses +3",
		feet="Chev. Sabatons +3",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Crep. Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}
	sets.midcast['Frightful Roar'].DT = sets.midcast['Frightful Roar']	
	sets.midcast['Frightful Roar'].SIRD = sets.midcast['Frightful Roar']
    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Nourish. Earring +1",
		body="Jumalik Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Rudianos's Mantle",waist="Plat. Mog. Belt",legs="Carmine Cuisses +1",feet="Odyssean Greaves"}
		
    sets.midcast.Cure.SIRD = {    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",}
		
    sets.midcast.Cure.DT = set_combine(sets.DT, {})
	
	sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure,sets.ConserveMP, {
		ammo="Pemphredo Tathlum",
		legs={ name="Augury Cuisses +1", augments={'Path: A',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Reti Pendant",
		waist="Austerity Belt +1",
		left_ear="Mendi. Earring",
		right_ear="Calamitous Earring",
		left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Solemnity Cape",
	})
	sets.HPCure = set_combine(sets.midcast.Cure.SIRD, {})
	sets.HPDown = set_combine(sets.midcast.Cure.SIRD, {})

	sets.midcast.Raise = {       
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands="Chev. Gauntlets +3",
		legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
		feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back="Rudianos's Mantle",
		}	
		sets.midcast.Raise.DT = sets.midcast.Raise
		sets.midcast.Reraise =  sets.midcast.Raise

    sets.midcast.Reprisal = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		sets.midcast.Reprisal.DT = set_combine(sets.DT, {
			sub="Priwen",hands="Regal Gauntlets",body="Shab. Cuirass +1",})

	sets.Self_Healing = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Plat. Mog. Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.SIRD = {    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    right_ear="Chev. Earring +1",
    left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",}
		
	sets.Self_Healing.DT = set_combine(sets.DT, {})
		
	sets.Self_Healing.ConserveMP = set_combine(sets.Self_Healing,sets.ConserveMP, {
		ammo="Pemphredo Tathlum",
		legs={ name="Augury Cuisses +1", augments={'Path: A',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Reti Pendant",
		waist="Austerity Belt +1",
		left_ear="Mendi. Earring",
		right_ear="Calamitous Earring",
		left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Solemnity Cape",
	})

	sets.Cure_Received = {hands="Souv. Handsch. +1",	  
	legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},	
	}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {main="Colada",
	sub={ name="Ajax +1", augments={'Path: A',}}, 
	ammo="Staunch Tathlum +1",
   head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
   body="Shab. Cuirass +1",
   hands="Regal Gauntlets",
   legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
   feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   neck="Incanter's Torque",
   waist="Olympus Sash",
   right_ear="Andoaa Earring",
   right_ring="Stikini Ring +1",
   left_ring="Stikini Ring +1",
   back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},}
	 
   sets.midcast['Enhancing Magic'].SIRD = {
	main="Colada",
	sub={ name="Ajax +1", augments={'Path: A',}},
   ammo="Staunch Tathlum +1",
   head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
   body={ name="Sakpata's Plate", augments={'Path: A',}},
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
   feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
   neck="Moonlight Necklace",
   waist="Audumbla Sash",
   left_ear="Andoaa Earring",
   right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
   right_ring="Stikini Ring +1",
   left_ring="Stikini Ring +1",
   back="Rudianos's Mantle"}

   sets.midcast['Enhancing Magic'].DT = set_combine(sets.DT, {})
   sets.midcast['Enhancing Magic'].ConserveMP = set_combine(sets.midcast['Enhancing Magic'],sets.ConserveMP, {
	ammo="Pemphredo Tathlum",
    legs={ name="Augury Cuisses +1", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    left_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
   }) 

   sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
	legs="Haven Hose",
	left_ear="Earthcry Earring",
	waist="Siegel Sash",
    neck="Stone Gorget",
})
sets.midcast.Stoneskin.SIRD  = set_combine(sets.midcast['Enhancing Magic'].SIRD,sets.midcast.Stoneskin,sets.SIRD, {})
sets.midcast.Stoneskin.DT = set_combine(sets.DT, {})
sets.midcast.Stoneskin.ConserveMP = set_combine(sets.midcast['Enhancing Magic'].DT,sets.midcast.Stoneskin,sets.ConserveMP, {
	ammo="Pemphredo Tathlum",
    legs={ name="Augury Cuisses +1", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    left_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], { ring2="Sheltered Ring",})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], { ring2="Sheltered Ring",})
	sets.midcast.Protect.DT = set_combine(sets.DT, {sub="Srivatsa",ring2="Sheltered Ring"})
    sets.midcast.Protect.DT = set_combine(sets.DT, {sub="Srivatsa",ring2="Sheltered Ring"})

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		main="Sakpata's Sword",
		sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
		ammo="Staunch Tathlum +1",
		head={ name="Odyssean Helm", augments={'INT+5','"Cure" potency +8%','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
		body="Odyss. Chestplate",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
	})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {
		main="Sakpata's Sword",
		sub={ name="Ajax +1", augments={'Path: A',}},
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Chev. Cuirass +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Knightly Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
	})
	sets.midcast.Phalanx.DT = set_combine(sets.DT, {})
	sets.midcast.Phalanx.ConserveMP = set_combine(sets.midcast.Phalanx.SIRD, {})
	sets.midcast.Phalanx.Duration = set_combine(sets.midcast.Phalanx, {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub={ name="Ajax +1", augments={'Path: A',}},
		body="Shab. Cuirass +1",
		hands="Regal Gauntlets",
	})

	sets.Phalanx_Received = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+20','DMG:+6',}},
		sub={ name="Ajax +1", augments={'Path: A',}},
		head={ name="Odyssean Helm", augments={'INT+5','"Cure" potency +8%','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
		body="Shab. Cuirass +1",
		hands="Regal Gauntlets",
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Weard Mantle", augments={'VIT+1','Enmity+3','Phalanx +5',}},
	}

	sets.midcast.MAB = {
		ammo="Pemphredo Tathlum",
		head="Jumalik Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Baetyl Pendant",
		waist="Skrymir Cord",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Argocham. Mantle",
	}
	sets.midcast.MAB.MB = {
		ammo="Pemphredo Tathlum",
		head="Jumalik Helm",
		body="Sacro Breastplate",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Augury Cuisses +1", augments={'Path: A',}},
		feet="Nyame Sollerets",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Skrymir Cord",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
		back="Argocham. Mantle",
	}
	sets.midcast.Banish = sets.midcast.MAB
	sets.midcast['Banish II'] = set_combine(sets.midcast.MAB, {})
	sets.midcast.Holy = sets.midcast.MAB
	sets.midcast['Holy II'] = sets.midcast.MAB

	sets.magicburst = {
		ammo="Pemphredo Tathlum",
		head="Jumalik Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Skrymir Cord",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
		back="Argocham. Mantle",
	}
 
	sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back="Argocham. Mantle",}
 
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
	head="Null Masque",
	body="Sacro Breastplate",
	feet="Volte Sollerets",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Null Belt",
	left_ear="Infused Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	}

    -- Idle sets
    sets.idle = {ammo="Homiliary",
	head="Null Masque",neck="Coatl Gorget +1",ear1="Infused Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Regal Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Moonlight Cape",waist="Null Belt",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}
		
    sets.idle.PDT = {ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck={ name="Loricate Torque +1", augments={'Path: A',}},ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	
	sets.idle.DT = {    
			main="Burtgang",
			ammo="Staunch Tathlum +1",
			head="Chev. Armet +3",
			body="Chev. Cuirass +3",
			hands="Chev. Gauntlets +3",
			legs="Chev. Cuisses +3",
			feet="Chev. Sabatons +3",
			neck={ name="Loricate Torque +1", augments={'Path: A',}},
			waist="Plat. Mog. Belt",
			left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			right_ear="Chev. Earring +1",
			right_ring="Defending Ring",
			left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
			back="Rudianos's Mantle",
	}
	sets.idle.PDH ={
		main="Burtgang",
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Adamantite Armor",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Chev. Cuisses +3",
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Chev. Earring +1",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring"}
	

    sets.idle.Block = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",neck={ name="Loricate Torque +1", augments={'Path: A',}},ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
		
    sets.idle.MDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.Tank = {    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Chev. Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Chev. Earring +1",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Rudianos's Mantle",
   }		
	sets.idle.Kiting = {ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}
		
	sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, {
			ammo="Eluder's Sachet",
			left_ring="Warden's Ring",
			right_ring="Fortified Ring",
			back="Reiki Cloak",
	 })
	 sets.idle.EnemyTPaccumulation = set_combine(sets.idle.PDT, {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	})
	sets.idle.ReverenceGauntlets = set_combine(sets.idle.Block, {
		hands="Rev. Gauntlets +3",
    })
 sets.idle.Resist = set_combine(sets.idle.MDT, {
    ammo="Staunch Tathlum +1",
    head={ name="Founder's Corona", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Magic dmg. taken -5%',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands="Macabre Gaunt. +1",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
})
sets.idle.MEVA = set_combine(sets.idle.MDT, {
    ammo="Staunch Tathlum +1",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Eabani Earring",
    right_ear="Sanare Earring",
    left_ring="Vengeful Ring",
    right_ring="Purity Ring",
    back="Rudianos's Mantle",
})
sets.idle.Evasion={
	ammo="Amar Cluster",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Plat. Mog. Belt",
	left_ear="Infused Earring",
	right_ear="Eabani Earring",
	left_ring="Regal Ring",
	right_ring="Vengeful Ring",
	back="Rudianos's Mantle",}
	sets.idle.Regen = { 
		ammo="Staunch Tathlum +1",
        head="Null Masque",
		body="Sacro Breastplate",
        hands="Regal Gauntlets",
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet="Volte Sollerets",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
		left_ear="Infused Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Rudianos's Mantle",}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Adoulin = {body="Councilor's Garb",}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    --Passive set
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +3",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
	sets.passive.AbsorbMP = {head="Chev. Armet +3",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
	sets.passive.ReverenceGauntlets = {hands="Rev. Gauntlets +3",}
	sets.passive.EnemyCritRate = {
		ammo="Eluder's Sachet",
		left_ring="Warden's Ring",
		right_ring="Fortified Ring",
		back="Reiki Cloak",
    }
	sets.passive.EnemyTPaccumulation =  {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	}
	sets.passive.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail",}
	sets.passive.Refresh ={
		ammo="Homiliary",
		head="Null Masque",
		body="Jumalik Mail",
		hands="Regal Gauntlets",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
 }
 sets.passive.Resist ={
	ammo="Staunch Tathlum +1",
	head={ name="Founder's Corona", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Magic dmg. taken -5%',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands="Macabre Gaunt. +1",
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Carrier's Sash",
}
	sets.MP_Knockback = {}
    sets.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail",}
	sets.EnemyCritRate = {
		ammo="Eluder's Sachet",
		left_ring="Warden's Ring",
		right_ring="Fortified Ring",
		back="Reiki Cloak",
 }
	sets.ReverenceGauntlets ={
		hands="Rev. Gauntlets +3",
 }
	sets.Refresh ={
		ammo="Homiliary",
		head="Null Masque",
		body="Jumalik Mail",
		hands="Regal Gauntlets",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
 }
	sets.Resist ={
	 ammo="Staunch Tathlum +1",
	 head={ name="Founder's Corona", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Magic dmg. taken -5%',}},
	 body={ name="Sakpata's Plate", augments={'Path: A',}},
	 hands="Macabre Gaunt. +1",
	 neck={ name="Warder's Charm +1", augments={'Path: A',}},
	 waist="Carrier's Sash",
 }
	sets.EnemyTPaccumulation ={
	 head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
 }
 sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    
    sets.defense.Block = {ammo="Eluder's Sachet",
		head="Chev. Armet +3",neck="Diemer Gorget",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Warden's Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
		
	sets.defense.PDT = {ammo="Eluder's Sachet",
		head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Chev. Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.defense.PDT_HP = {   ammo="Iron Gobbet",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	waist="Plat. Mog. Belt",
	left_ear="Chev. Earring +1",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Moonlight Ring",
	back="Moonlight Cape",
}
		
	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Asklepian Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Asklepian Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.defense.Convert = {    
			main="Burtgang",
			ammo="Staunch Tathlum +1",
			head="Chev. Armet +3",
			body="Rev. Surcoat +3",
			hands="Chev. Gauntlets +3",
			legs="Chev. Cuisses +3",
			feet="Rev. Leggings +3",
			neck={ name="Unmoving Collar +1", augments={'Path: A',}},
			waist="Flume Belt +1",
			left_ear="Tuisto Earring",
			right_ear="Ethereal Earring",
			right_ring="Moonlight Ring",
			left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
			back="Rudianos's Mantle",
	}
	sets.defense.Block = {
		main="Burtgang",
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Chev. Cuirass +3",
		hands="Chev. Gauntlets +3",
		legs="Chev. Cuisses +3",
		feet="Rev. Leggings +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Thureous Earring",
		right_ear="Chev. Earring +1",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back="Rudianos's Mantle",
	}
	sets.defense.HPBOOST = {
		main="Burtgang",
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands="Regal Gauntlets",
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back="Moonlight Cape",
	 }
	 sets.defense.PD = {    
		main="Burtgang",
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Chev. Cuirass +3",
		hands="Chev. Gauntlets +3",
		legs="Chev. Cuisses +3",
		feet="Chev. Sabatons +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Chev. Earring +1",
		right_ring="Defending Ring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Rudianos's Mantle",
	}
	sets.defense.Enmity = { 
		ammo="Iron Gobbet",
		main="Burtgang",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body="Chev. Cuirass +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +3",
		feet="Eschite Greaves",
		neck="Creed Collar",
		waist="Creed Baudrier",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Rudianos's Mantle",
 }
 sets.defense.Enmitymax = {     ammo="Iron Gobbet",
	main="Burtgang",
	head={ name="Loess Barbuta +1", augments={'Path: A',}},
	body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	feet="Eschite Greaves",
	neck="Moonlight Necklace",
	waist="Creed Baudrier",
	left_ear="Trux Earring",
	right_ear="Cryptic Earring",
	left_ring="Apeile Ring +1",
	right_ring="Apeile Ring",
	back="Rudianos's Mantle",
 }
 sets.defense.Aminon = {
    main="Reikiko",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Carrier's Sash",
    ear2="Chev. Earring +1",
    ear1="Sanare Earring",
    ring1="Shadow Ring",
    ring2="Apeile Ring +1",
    back="Rudianos's Mantle",
}
sets.defense.Turtle ={   
	ammo="Staunch Tathlum +1",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Asklepian Belt",
	left_ear="Tuisto Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Shadow Ring",
	right_ring="Moonlight Ring",
	back="Rudianos's Mantle",
 }
  sets.defense.ResistCharm = {
	main="Burtgang",
	ammo="Staunch Tathlum +1",
	head="Founder's Corona",
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands="Chev. Gauntlets +3",
	legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	waist="Carrier's Sash",
	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Volunt. Earring",
	left_ring="Unyielding Ring",
	right_ring="Wuji Ring",
	back="Solemnity Cape",
 }	
	sets.Reraise = {head="Crepuscular Helm", body="Crepuscular Mail",}

    sets.defense.PDT_Reraise = set_combine(sets.defense.PDT_HP,{head="Crepuscular Helm", body="Crepuscular Mail",})
    sets.defense.MDT_Reraise = set_combine(sets.defense.MDT_HP,{head="Crepuscular Helm", body="Crepuscular Mail",})

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {   ammo="Aurgelmir Orb +1",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Lissome Necklace",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Cessance Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Moonlight Ring",
	right_ring="Moonlight Ring",
	back="Null Shawl",}
--1179 / 1315 avec enlight up
	sets.engaged.Acc = {
	ammo="Amar Cluster",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Null Loop",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Crep. Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back="Null Shawl",
}
 --1179 / 1315 avec enlight up
 sets.engaged.TP = { 
	ammo="Aurgelmir Orb +1",
	head="Hjarrandi Helm",
	body="Hjarrandi Breast.",
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Ainia Collar",
	waist="Tempus Fugit +1",
	left_ear="Dedition Earring",
	right_ear="Telos Earring",
	left_ring="Moonlight Ring",
	right_ring="Moonlight Ring",
	back="Null Shawl",
   }
 --1179 / 1315 avec enlight up
	sets.engaged.STP = {  
	main="Naegling",
	sub="Blurred Shield +1",
	ammo="Aurgelmir Orb +1",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Lissome Necklace",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Dedition Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back="Null Shawl",
 }
  --1179 / 1315 avec enlight up
 sets.engaged.CRIT = {
	ammo="Coiste Bodhar",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Hjarrandi Breast.",
	hands="Flam. Manopolas +2",
	legs={ name="Zoar Subligar +1", augments={'Path: A',}},
	feet="Thereoid Greaves",
	neck="Nefarious Collar +1",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Cessance Earring",
	right_ear="Brutal Earring",
	left_ring="Defending Ring",
	right_ring="Hetairoi Ring",
	back="Null Shawl"}
 

    sets.engaged.DW = set_combine(sets.engaged, {    
	left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
	})

    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {   
	left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
	})
	sets.engaged.DW.TP = set_combine(sets.engaged.TP, {   
		left_ear="Suppanomimi",  --5
		right_ear="Eabani Earring", --4
		})
    sets.engaged.DW.STP = set_combine(sets.engaged.STP, {   
		left_ear="Suppanomimi",  --5
		right_ear="Eabani Earring", --4
		})
	sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, {   
		left_ear="Suppanomimi",  --5
		right_ear="Eabani Earring", --4
		})

	sets.engaged.Tank = {   ammo="Aurgelmir Orb +1",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body={ name="Sakpata's Plate", augments={'Path: A',}},
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck="Lissome Necklace",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Cessance Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Moonlight Ring",
	right_ring="Moonlight Ring",
	back="Null Shawl",}

    sets.engaged.STP.Tank = set_combine(sets.engaged.STP, {
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
	})

	sets.engaged.DDTank = {
		ammo="Aurgelmir Orb +1",
   head="Hjarrandi Helm",
   body="Hjarrandi Breast.",
   hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
   legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
   feet={ name="Sakpata's Leggings", augments={'Path: A',}},
   neck="Ainia Collar",
   waist="Tempus Fugit +1",
   left_ear="Dedition Earring",
   right_ear="Telos Earring",
   left_ring="Moonlight Ring",
   right_ring="Moonlight Ring",
   back="Null Shawl",}

	sets.engaged.STP.DDTank = set_combine(sets.engaged.STP, {
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
	})

	sets.engaged.Acc.DDTank = {
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Tartarus Platemail",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.engaged.NoShellTank = {ammo="Staunch Tathlum +1",
	head="Jumalik Helm",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
        body="Rev. Surcoat +3",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Cab. Leggings +3"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
	
	sets.Skillchain = sets.precast.WS
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
	    set_macro_page(5, 20)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 20)
        send_command('lua l AutoRUN') --addon work with sub
        --send_command('lua l runewidget') --addon work with sub
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 20)
	elseif player.sub_job == 'BLU' then
        set_macro_page(1, 20)
        send_command('input //blupldsets set pld') --addon work with sub
	elseif player.sub_job == 'DNC' then
		set_macro_page(5, 20)
	elseif player.sub_job == 'WAR' then
        set_macro_page(2, 20)
    elseif player.sub_job == 'SCH' then
        set_macro_page(7, 20)
    else
        set_macro_page(1, 20)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 177')
end

autows_list = {['Naegling']='Savage Blade',['Burtgang']='Atonement',['MalignanceSword']='Sanguine Blade',
['Reikiko']='Chant du Cygne',
     ['Malevolence']='Aeolian Edge',['Club']='Judgment',['Caladbolg']='Torcleaver',
	 ['MalignancePole']='Shell Crusher',['Shining']='Impulse Drive'}

	 

function check_trust()
	if not moving and state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Reive Mark'] or buffactive['Elvorseal'] or not player.in_combat) then
		local party = windower.ffxi.get_party()
		if party.p5 == nil then
			local spell_recasts = windower.ffxi.get_spell_recasts()
			
			if spell_recasts[999] < spell_latency and not have_trust("Monberaux") then
				windower.chat.input('/ma "Monberaux" <me>')
				tickdelay = os.clock() + 4.5
				return true
			elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
				windower.chat.input('/ma "Sylvie (UC)" <me>')
				tickdelay = os.clock() + 4.5
				return true
			elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
				windower.chat.input('/ma "Koru-Moru" <me>')
				tickdelay = os.clock() + 4.5
				return true
			elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
				windower.chat.input('/ma "Joachim" <me>')
				tickdelay = os.clock() + 4.5
				return true
			elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
				windower.chat.input('/ma "Qultada" <me>')
				tickdelay = os.clock() + 4.5
				return true
			elseif spell_recasts[1013] < spell_latency and not have_trust("Lilisette II") then
				windower.chat.input('/ma "Lilisette" <me>')
				tickdelay = os.clock() + 4.5
				return true
			else
				return false
			end
		end
	
	end
	return false
end

function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Fealty"] = {gain = 'Fealty is on.', lose = 'Fealty wore off.', announce_gain = false, announce_lose = true},
		["Phalanx"] = {gain = 'Phalanx is on.', lose = 'Phalanx wore off.', announce_gain = false, announce_lose = true},
		["Crusade"] = {gain = 'Crusade is on.', lose = 'Crusade wore off.', announce_gain = false, announce_lose = true},
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
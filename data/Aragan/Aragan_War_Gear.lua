-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 




-- sortie 4step sword

 Burning Blade
Seraph Blade Scission
Red Lotus Blade Liquefaction
Flat Blade Fusion
Savage Blade Light 

or 

--sc 6step

 Savage Blade
Red Lotus Blad Liquefaction
Savage BladeS cission
Red Lotus Blade Liquefaction
Savage Blade Scission
Red Lotus Blade Liquefaction
Savage Blade Scission 

]]


function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'CRIT', 'SubtleBlow', 'H2H')
    state.WeaponskillMode:options('Match', 'SubtleBlow', 'SC', 'PDL','Proc')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP','Evasion','Empy', 'Enmity', 'MP', 'Reraise')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options( 'DT','Normal', 'Tank', 'MDT', 'HP', 'Regen', 'Regain', 'Evasion', 'EnemyCritRate', 'Enmity', 'Refresh')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Crepuscular', 'EnemyCritRate','EnemyTPaccumulation','Resist', 'Regen','SphereRegain' , 'Death Spikes'}
	state.Weapons:options('None','Naegling','Loxotic','Shining','Chango','AgwuClaymore','Malevo','Drepanum','IkengaAxe','DualNaegling','DualLoxotic','DualMalevo','DualIkengaAxe','ProcGreatSword','ProcScythe','ProcPolearm','ProcKatana','ProcDagger','ProcDagger2','ProcGreatKatana','ProcGreatKatana2','ProcSword','ProcSword2','ProcClub','ProcStaff','ProcStaff2')
    state.Shield = M{['description']='Weapon Set', 'Normal', 'BlurredShield', 'AdapaShield', 'SacroBulwark'}
	state.AutoBuffMode:options('Off','Auto','Full','Defend') --,'Vagary','Off','Off','Off','Off',

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.crit_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind f7 gs c cycle Shield')
    send_command('bind ^m gs c toggle Medicine')
	send_command('bind f2 gs c toggle AutoBuffMode')
	send_command('bind !n gs c toggle AutoReraiseeMode')

	send_command('bind !8 gs c weapons Greatsword;gs c update')
	send_command('bind !0 gs c set WeaponskillMode Proc;;gs c set CastingMode Proc;gs c update')
	send_command('bind !9 gs c weapons Default;gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
    -- send_command('bind f11 gs c cycle MagicalDefenseMode;gs c set DefenseMode Magical') --Changes your magical defense set.

    
    --Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1",}
sets.weapons.Shining = {main="Shining One", sub="Utu Grip"}
sets.weapons.Loxotic = {main="Loxotic Mace +1", sub="Blurred Shield +1",}
sets.weapons.Chango = {main="Chango", sub="Utu Grip"}
sets.weapons.AgwuClaymore = {main="Agwu's Claymore", sub="Utu Grip"}
sets.weapons.Malevo = {main="Malevolence", sub="Blurred Shield +1",}
sets.weapons.Drepanum = {main="Drepanum", sub="Utu Grip",}
sets.weapons.IkengaAxe = {main="Ikenga's Axe", sub="Blurred Shield +1",}

sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
sets.weapons.DualNaegling = {main="Naegling", sub="Demers. Degen +1",}
sets.weapons.DualLoxotic = {main="Loxotic Mace +1", sub="Demers. Degen +1",}
sets.weapons.DualMalevo = {main="Malevolence", sub="Malevolence",}
sets.weapons.DualIkengaAxe = {main="Ikenga's Axe", sub="Demers. Degen +1",}

sets.Normal = {}
sets.BlurredShield = {sub="Blurred Shield +1"}
sets.AdapaShield = {sub="Adapa Shield"}
sets.SacroBulwark = {sub="Sacro Bulwark"}
sets.BlurredShield = {sub="Blurred Shield +1"}

sets.DefaultShield = {sub="Blurred Shield +1"}

 
sets.weapons.ProcDagger = {main="Qutrub Knife",sub=empty}
sets.weapons.ProcDagger2 = {main="Qutrub Knife",sub=empty}
sets.weapons.ProcSword = {main="Fermion Sword",sub=empty}
sets.weapons.ProcSword2 = {main="Fermion Sword",sub=empty}
sets.weapons.ProcGreatSword = {main="Irradiance Blade",sub=empty}
sets.weapons.ProcScythe = {main="Maven's Scythe",sub=empty}
sets.weapons.ProcPolearm = {main="Sha Wujing's La. +1",sub=empty}
sets.weapons.ProcGreatKatana = {main="Zanmato +1",sub=empty}
sets.weapons.ProcGreatKatana2 = {main="Zanmato +1",sub=empty}
sets.weapons.ProcKatana = {main="Debahocho +1",sub=empty}
sets.weapons.ProcClub = {main="Caduceus",sub=empty}
sets.weapons.ProcStaff = {main="Profane Staff",sub=empty}
sets.weapons.ProcStaff2 = {main="Profane Staff",sub=empty}

	 -- neck JSE Necks Reinforcement Points Mode add u neck here 
	 sets.RP = {}
	-- Precast Sets

    sets.Enmity = {
		ammo="Iron Gobbet",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Plat. Mog. Belt",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Apeile Ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back="Reiki Cloak",
	}
	sets.Knockback = {}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = { body="Pummeler's Lorica +3",feet="Agoge Calligae +3",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	sets.precast.JA['Warcry'] = { head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},}
	sets.precast.JA['Defender'] = {hands="Agoge Mufflers +3"}
	sets.precast.JA['Aggressor'] = {body="Agoge Lorica +3"}
	sets.precast.JA['Mighty Strikes'] = {hands="Boii Mufflers +3"}
	sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses +3"}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet="Agoge Calligae +3"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {hands="Boii Mufflers +3"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +3",}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {body="Passion Jacket"}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {        
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body="Sacro Breastplate",
	hands="Leyline Gloves",
	legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
	feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
	neck="Baetyl Pendant",
	waist="Plat. Mog. Belt",
	left_ear="Loquac. Earring",
	right_ear="Mendi. Earring",
	left_ring="Prolix Ring",
	right_ring="Rahab Ring",
	back="Moonlight Cape",
    }
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Magoraga Beads" })
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
	   waist="Acerbic Sash +1",
	   right_ear="Mendi. Earring",
	})
	-- Midcast Sets
	sets.midcast.FastRecast =  sets.precast.FC
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
                   
	sets.midcast.Cure = {
		ammo="Pemphredo Tathlum",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck="Incanter's Torque",
        waist="Plat. Mog. Belt",
        left_ear="Ethereal Earring",
        right_ear="Mendi. Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back="Solemnity Cape",
	}
	
	sets.midcast['Enhancing Magic'] = {
        body="Shab. Cuirass +1",
        neck="Incanter's Torque",
        waist="Olympus Sash",
        ring2="Sheltered Ring",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        back="Moonlight Cape",
	}
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Stone Gorget",
        legs="Haven Hose",
        left_ear="Earthcry Earring",
        waist="Siegel Sash",
    })
    sets.midcast.Phalanx = {
        ammo="Staunch Tathlum +1",
        head={ name="Odyssean Helm", augments={'INT+5','"Cure" potency +8%','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        body="Shab. Cuirass +1",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Incanter's Torque",
        waist="Olympus Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
    } 
     sets.midcast['Enfeebling Magic'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Incanter's Torque",
        waist="Null Belt",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ear="Crep. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        feet="Shabti Sabatons",
        waist="Gishdubar sash"})
	sets.midcast.Refresh.sird = set_combine(sets.midcast.Refresh, {})
    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        neck="Erra Pendant",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    }

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {  
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    waist="Gishdubar Sash"}
    sets.Phalanx_Received = {hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},legs={ name="Sakpata's Cuisses", augments={'Path: A',}},}
	
	-- Ranged for xbow
	sets.precast.RA = {
		ammo=empty,
		range="Trollbane",  
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		right_ear="Telos Earring",
		 ring2="Crepuscular Ring",
	 }
	 sets.midcast.RA = {
		 ammo=empty,
		 range="Trollbane",  
		 body={ name="Nyame Mail", augments={'Path: B',}},
		 hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		 legs={ name="Nyame Flanchard", augments={'Path: B',}},
		 feet={ name="Nyame Sollerets", augments={'Path: B',}},
		 right_ear="Telos Earring",
		 ear2="Crepuscular Earring",
		  ring2="Crepuscular Ring",
	 }
	

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
        ammo="Knobkierrie",
        head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Thrud Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
     }
     sets.precast.WS.SubtleBlow =  {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
     sets.precast.WS.SC= set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS.PDL= set_combine(sets.precast.WS, {
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
	sets.precast.WS.Proc = {
    ammo="Pemphredo Tathlum",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Boii Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    neck="Null Loop",
    waist="Null Belt",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
    }

	--sets.Proc = {neck="Fotia Gorget",waist="Fotia Belt",left_ring="Rufescent Ring",right_ring={ name="Beithir Ring", augments={'Path: A',}}}

    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Thrud Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Niqmaddu Ring",
    left_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Upheaval'].SC= set_combine(sets.precast.WS['Upheaval'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Upheaval'].PDL= set_combine(sets.precast.WS['Upheaval'], {
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        left_ring="Sroda Ring",
    })
    --sets.precast.WS['Upheaval'].Mighty = set_combine(sets.precast.WS['Upheaval'], {})

    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS["Upheaval"], {})
    sets.precast.WS["King's Justice"].PDL= set_combine(sets.precast.WS["Upheaval"], {
        ammo="Crepuscular Pebble",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",
        hands="Boii Mufflers +3",
        legs="Boii Cuisses +3",
        feet="Thereoid Greaves",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Boii Earring +1",
        right_ring="Niqmaddu Ring",
        left_ring="Begrudging Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS["Ukko's Fury"].SC= set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS["Ukko's Fury"].PDL= set_combine(sets.precast.WS, {
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
        })
    sets.precast.WS["Stardiver"] = set_combine(sets.precast.WS["Ukko's Fury"], {
        body="Hjarrandi Breast.",
        hands="Flam. Manopolas +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
    })
    sets.precast.WS["Stardiver"].SC= set_combine(sets.precast.WS["Stardiver"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS["Stardiver"].PDL= set_combine(sets.precast.WS["Stardiver"], {
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })

    sets.precast.WS["Keen Edge"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Raging Rush"] = set_combine(sets.precast.WS["Ukko's Fury"], {
        hands="Flam. Manopolas +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
    })
    sets.precast.WS["Raging Rush"].PDL= set_combine(sets.precast.WS["Raging Rush"], {
        neck="Fotia Gorget",
        waist="Fotia Belt",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
    sets.precast.WS["Sturmwind"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Vorpal Blade"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Fast Blade"] = set_combine(sets.precast.WS["Ukko's Fury"], {left_ear={ name="Lugra Earring +1", augments={'Path: A',}},})
    sets.precast.WS["Swift Blade"] = set_combine(sets.precast.WS["Ukko's Fury"], {left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
    sets.precast.WS["Rampage"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Rampage"].PDL = set_combine(sets.precast.WS["Ukko's Fury"].PDL, {})
    sets.precast.WS["Hexa Strike"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Hexa Strike"].PDL = set_combine(sets.precast.WS["Ukko's Fury"].PDL, {})
    sets.precast.WS["Vorpal Scythe"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Vorpal Thrust"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS["Ukko's Fury"], {
        ammo="Aurgelmir Orb +1",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},})
    sets.precast.WS["Evisceration"].SC= set_combine(sets.precast.WS["Evisceration"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS["Evisceration"].PDL= set_combine(sets.precast.WS["Evisceration"], {
        ammo="Crepuscular Pebble",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })

    sets.precast.WS["True Strike"] = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["True Strike"].PDL= set_combine(sets.precast.WS["True Strike"], {
        ammo="Crepuscular Pebble",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Thrud Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS["Fell Cleave"].SC= set_combine(sets.precast.WS["Fell Cleave"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS["Fell Cleave"].PDL= set_combine(sets.precast.WS["Fell Cleave"], {
        ammo="Crepuscular Pebble",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Boii Cuisses +3",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Null Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Crep. Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    })
    sets.precast.WS["Shield Break"] = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Weapon Break"] = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Full Break"] = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS["Armor Break"], {})

     -- RESOLUTION
     -- 86-100% STR
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head="Hjarrandi Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
         left_ring="Niqmaddu Ring",
         right_ring="Sroda Ring", 
         left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
         right_ear="Schere Earring",
         back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
     })
    sets.precast.WS['Resolution'].SC= set_combine(sets.precast.WS['Resolution'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Resolution'].PDL= set_combine(sets.precast.WS['Resolution'], {
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
    })
     
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
     sets.precast.WS["Bora Axe"] = set_combine(sets.precast.WS, {
        ammo="Aurgelmir Orb +1",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},})

        sets.precast.WS["Decimation"] = set_combine(sets.precast.WS["Resolution"], {
            ammo="Coiste Bodhar",
            head="Hjarrandi Helm",
            body={ name="Nyame Mail", augments={'Path: B',}},
            hands="Boii Mufflers +3",
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck="Fotia Gorget",
            waist="Fotia Belt",
            left_ear="Schere Earring",
            right_ear="Boii Earring +1",           
            left_ring="Regal Ring",
            right_ring="Niqmaddu Ring",
            back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS["Decimation"].SC= set_combine(sets.precast.WS["Decimation"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
        sets.precast.WS["Decimation"].PDL= set_combine(sets.precast.WS["Decimation"], {
            ammo="Crepuscular Pebble",
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",
            left_ring="Sroda Ring",
        })

        sets.precast.WS["Cross Reaper"] = set_combine(sets.precast.WS, {
            right_ring="Niqmaddu Ring",
        })
        sets.precast.WS["Cross Reaper"].SC= set_combine(sets.precast.WS["Cross Reaper"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
        sets.precast.WS["Cross Reaper"].PDL= set_combine(sets.precast.WS["Cross Reaper"], {
            ammo="Crepuscular Pebble",
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",
            left_ring="Sroda Ring",
        })
        sets.precast.WS["Entropy"] = set_combine(sets.precast.WS, {
            right_ring="Niqmaddu Ring",
            right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        })
        sets.precast.WS["Entropy"].SC= set_combine(sets.precast.WS["Entropy"], {
            right_ring="Niqmaddu Ring",
            right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        })
        sets.precast.WS["Entropy"].PDL= set_combine(sets.precast.WS["Entropy"], {
            ammo="Crepuscular Pebble",
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",
            left_ring="Sroda Ring",
        })

          -- REQUISCAT
     -- 73% MND - breath damage
     sets.precast.WS.Requiescat = set_combine(sets.precast.WS, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Brutal Earring",
        left_ring="Rufescent Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
     })
     sets.precast.WS.Requiescat.SC= set_combine(sets.precast.WS.Requiescat, {
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
     })
     sets.precast.WS.Requiescat.PDL= set_combine(sets.precast.WS.Requiescat, {
        ammo="Crepuscular Pebble",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
     })
     sets.precast.WS['Spirits Within'] = {
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear="Tuisto Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
     }

     -- TORCLEAVER 
     -- VIT 80%
     sets.precast.WS.Torcleaver = set_combine(sets.precast.WS, {
         head={ name="Sakpata's Helm", augments={'Path: A',}},
         ammo="Knobkierrie",
         neck="Fotia Gorget",
     })
     sets.precast.WS.Torcleaver.SC= set_combine(sets.precast.WS.Torcleaver, {
        neck="Fotia Gorget",
     })
     sets.precast.WS.Torcleaver.PDL= set_combine(sets.precast.WS.Torcleaver, sets.precast.WS.PDL)


    sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",
        hands="Boii Mufflers +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Thereoid Greaves",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Boii Earring +1",
        right_ring="Niqmaddu Ring",
        left_ring="Begrudging Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Impulse Drive'].SC= set_combine(sets.precast.WS['Impulse Drive'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
    sets.precast.WS['Impulse Drive'].PDL= set_combine(sets.precast.WS['Impulse Drive'], {
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
        })
    sets.precast.WS["Sonic Thrust"] = set_combine(sets.precast.WS["Ukko's Fury"], {
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        left_ear="Lugra Earring +1",
    })
    sets.precast.WS["Sonic Thrust"].SC= set_combine(sets.precast.WS["Sonic Thrust"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS["Sonic Thrust"].PDL= set_combine(sets.precast.WS["Sonic Thrust"], {
        ammo="Crepuscular Pebble",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Impulse Drive'], {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Savage Blade'].SC= set_combine(sets.precast.WS['Savage Blade'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Savage Blade'].PDL= set_combine(sets.precast.WS['Savage Blade'], {
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        legs="Boii Cuisses +3",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS['Savage Blade'], {
        left_ring="Sroda Ring",})
    sets.precast.WS['Mistral Axe'].SC= set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Mistral Axe'].PDL= set_combine(sets.precast.WS['Savage Blade'].PDL, {})
    sets.precast.WS['Calamity'] = set_combine(sets.precast.WS['Savage Blade'], {
        left_ring="Sroda Ring",})
    sets.precast.WS['Calamity'].SC= set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Calamity'].PDL= set_combine(sets.precast.WS['Savage Blade'].PDL, {})
    sets.precast.WS['Judgment'] = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Judgment'].SC= set_combine(sets.precast.WS['Judgment'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
        sets.precast.WS['Judgment'].PDL= set_combine(sets.precast.WS['Judgment'], {
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",
            left_ring="Sroda Ring",
        })
        sets.precast.WS["Black Halo"] = set_combine(sets.precast.WS["Savage Blade"], {left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
        sets.precast.WS["Black Halo"].SC= set_combine(sets.precast.WS["Black Halo"], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
        sets.precast.WS["Black Halo"].PDL= set_combine(sets.precast.WS["Black Halo"], {
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",
            left_ring="Sroda Ring",
        })
        sets.precast.WS["Ground Strike"] = set_combine(sets.precast.WS['Savage Blade'], {
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Lugra Earring +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",    })
        sets.precast.WS["Ground Strike"].SC= set_combine(sets.precast.WS['Ground Strike'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
        sets.precast.WS["Ground Strike"].PDL= set_combine(sets.precast.WS['Ground Strike'], {
            ammo="Knobkierrie",
            body={ name="Sakpata's Plate", augments={'Path: A',}},
            hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
            legs="Boii Cuisses +3",   })

    sets.precast.WS["Shockwave"] = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS["Power Slash"] = set_combine(sets.precast.WS['Savage Blade'], {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",})



-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist="Hachirin-no-Obi",
    right_ear="Friomisi Earring",
    left_ear="Thrud Earring",
    right_ring="Archon Ring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},   
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

    sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Baetyl Pendant",
        waist="Hachirin-no-Obi",
        right_ear="Friomisi Earring",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},   
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
	sets.precast.WS['Tachi: Jinpu'] =  set_combine(sets.precast.WS["Burning Blade"],{})
	sets.precast.WS['Tachi: Koki'] =  set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Earth Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Rock Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Starburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Sunburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
    sets.precast.WS["Flaming Arrow"] = set_combine(sets.precast.WS["Burning Blade"],{})



	
	sets.precast.WS["Shadow of Death"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Cyclone"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Starburst"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Sunburst"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Earth Crusher"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Freezebite"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Red Lotus Blade"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Seraph Blade"].Proc = set_combine(sets.precast.WS.Proc,{})
    sets.precast.WS["Seraph Strike"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Energy Drain"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Shining Blade"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS["Raiden Thrust"].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS['Tachi: Jinpu'].Proc = set_combine(sets.precast.WS.Proc,{})
	sets.precast.WS['Tachi: Koki'].Proc = set_combine(sets.precast.WS.Proc,{})
	

    -- Extra Melee sets.  Apply these on top of melee sets.

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
    sets.rollerRing = {left_ring="Roller's Ring"}

	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {ammo="Yetshila +1",feet="Boii Calligae +2",}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {ammo="Yetshila +1",feet="Boii Calligae +2",}
	sets.WSMightyCharge = {ammo="Yetshila +1",feet="Boii Calligae +2",}
	sets.WSCharge = {}
	sets.WSMighty = {ammo="Yetshila +1",feet="Boii Calligae +2",}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {
        head="Null Masque",
        body="Sacro Breastplate",
        feet="Volte Sollerets",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
	 }

	 -- passive set
     sets.passive['Death Spikes'] = {body="Tartarus Platemail",}

     sets.passive.Crepuscular = {
		head="Crepuscular Helm",
        body="Crepuscular Mail",
	}
    sets.passive.EnemyCritRate = {
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    }
    sets.passive.Resist = {
       ammo="Staunch Tathlum +1",
       body={ name="Sakpata's Plate", augments={'Path: A',}},
       neck={ name="Warder's Charm +1", augments={'Path: A',}},
       waist="Carrier's Sash",
    }
    sets.passive.Regen = {
        body="Sacro Breastplate",
        feet="Volte Sollerets",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.passive.SphereRegain = {
        body="Makora Meikogai",
     }
	sets.passive.EnemyTPaccumulation ={
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    }
     -- Defense sets
	 
     sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body="Adamantite Armor",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Paguroidea Ring",
        back="Moonlight Cape",
    }

    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Hjarrandi Breast.",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Kyrene's Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
    }
    sets.defense.Evasion = {
        ammo="Amar Cluster",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    }
    sets.defense.Enmity = {
        ammo="Iron Gobbet",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Plat. Mog. Belt",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Apeile Ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back="Reiki Cloak",
    }

    sets.defense.Reraise =  sets.Reraise
 
    sets.defense.MDT = set_combine(sets.defense.PDT, {
        ammo="Staunch Tathlum +1",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        left_ear="Eabani Earring",
        left_ring="Shadow Ring",
    })
		
	sets.defense.MEVA = sets.defense.MDT

    sets.defense.Empy = set_combine(sets.defense.PDT, {
        head="Boii Mask +2",
        body="Boii Lorica +3",
        hands="Boii Mufflers +3",
        legs="Boii Cuisses +3",
        feet="Boii Calligae +2",
    })

     -- Idle sets
     sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Sacro Breastplate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        left_ear="Infused Earring",
        ear2={ name="Odnowa Earring +1", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }
     sets.idle.DT = sets.defense.PDT
	 sets.idle.Tank = sets.defense.PDT
     sets.idle.MDT = sets.defense.MDT
     sets.idle.Evasion = sets.defense.Evasion
     sets.idle.HP = sets.defense.HP
     sets.idle.Enmity = sets.defense.Enmity

     sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.Regen = set_combine(sets.idle, {
        body="Sacro Breastplate",
        feet="Volte Sollerets",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
    

    sets.idle.Regain = {
        head="Null Masque",
        body="Makora Meikogai",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	    feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Shadow Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	}

    sets.idle.Refresh = set_combine(sets.idle, {
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
    })
 
     sets.idle.Weak = set_combine(sets.idle, {
        head="Crepuscular Helm",
        body="Crepuscular Mail",
        back="Moonlight Cape",
    })
		
	sets.idle.Reraise = set_combine(sets.idle, {
		head="Crepuscular Helm",
        body="Crepuscular Mail",
        back="Moonlight Cape",
	})
	
	sets.Kiting = {feet="Hermes' Sandals +1"}
	sets.Reraise = {head="Crepuscular Helm",
	body="Crepuscular Mail",}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
		legs="Shabti Cuisses +1",
	})
	sets.buff.Sleep = {neck="Vim Torque +1"}
     
     -- Engaged set, 
    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Hjarrandi Helm",
        body="Boii Lorica +3",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Pumm. Cuisses +3",
        feet="Pumm. Calligae +3",
        neck={ name="War. Beads +2", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear="Schere Earring",
        right_ear="Boii Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Petrov Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.Acc = set_combine(sets.engaged, {
        ammo="Coiste Bodhar",
        head="Hjarrandi Helm",
        body="Boii Lorica +3",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Pumm. Cuisses +3",
        feet="Pumm. Calligae +3",
        neck="Null Loop",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Boii Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    })

    sets.engaged.STP = set_combine(sets.engaged, {
        ammo="Coiste Bodhar",
        head="Hjarrandi Helm",
        body="Boii Lorica +3",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        feet="Pumm. Calligae +3",
        neck="Ainia Collar",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    })

    sets.engaged.CRIT = set_combine(sets.engaged, {
    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Boii Calligae +2",
    neck="Nefarious Collar +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Boii Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Hetairoi Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {        
        body="Dagon Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear="Boii Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Niqmaddu Ring",
    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

     -- Defensive sets to combine with various weapon-specific sets below
     -- These allow hybrid acc/pdt sets for difficult content
     sets.Defensive = {
        head={ name="Sakpata's Helm", augments={'Path: A',}}, -- 4% haste
        body="Boii Lorica +3",-- 3% haste
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}}, -- 4% haste
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}}, -- 4% haste
        feet={ name="Sakpata's Leggings", augments={'Path: A',}}, -- 2% haste
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},-- 9% haste
    }


    sets.engaged.PDT = set_combine(sets.engaged, sets.Defensive)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.Defensive)
    sets.engaged.STP.PDT = set_combine(sets.engaged.STP, sets.Defensive)
    sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT, sets.Defensive)
    sets.engaged.SubtleBlow.PDT = set_combine(sets.engaged.SubtleBlow, sets.Defensive,{  
        body="Dagon Breast.",
        left_ring="Defending Ring",
    })

    ------------------------------------------------------------------------------------------------
      ---------------------------------------- DW-HASTE ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    sets.engaged.DW = set_combine(sets.engaged, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
     })

    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
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
     sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.SubtleBlow, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
     })

     sets.engaged.DW.PDT = set_combine(sets.engaged.DW, sets.Defensive)
     sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, sets.Defensive)
     sets.engaged.DW.STP.PDT = set_combine(sets.engaged.DW.STP, sets.Defensive)
     sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.DW.CRIT, sets.Defensive)
     sets.engaged.DW.SubtleBlow.PDT = set_combine(sets.engaged.DW.SubtleBlow, sets.Defensive,{  
        body="Dagon Breast.",
        left_ring="Defending Ring",
    })









	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}-- hands="Pummeler's Mufflers +1"
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
		set_macro_page(6, 24)
    elseif player.sub_job == 'DNC' then
		set_macro_page(6, 24)
    elseif player.sub_job == 'NIN' then
		set_macro_page(6, 24)
    elseif player.sub_job == 'THF' then
		set_macro_page(6, 24)
	elseif world.area:contains("Abyssea") then
		set_macro_page(4, 24)
    else
		set_macro_page(6, 24)
    end
end

function user_job_lockstyle()
    if not world.area:contains('Abyssea - Empyreal Paradox') and world.area:contains('Abyssea') then
        windower.chat.input('/lockstyleset 1')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
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


autows_list = {['DualNaegling']='Circle Blade',['Malevo']='Aeolian Edge',['Naegling']='Savage Blade',
['Chango']='Fell Cleave',['AgwuClaymore']='Resolution',['Drepanum']='Spiral Hell',['IkengaAxe']='Calamity',
['DualIkengaAxe']='Calamity',['ProcGreatSword']='Freezebite',['ProcScythe']='Shadow of Death',
['ProcDagger2']='Cyclone',['ProcDagger']='Energy Drain',['ProcStaff2']='Sunburst',
['ProcStaff']='Earth Crusher',['ProcSword2']='Seraph Blade',['ProcSword']='Red Lotus Blade',
['ProcClub']='Seraph Strike',['ProcGreatKatana']='Tachi: Jinpu',['ProcGreatKatana2']='Tachi: Koki',
['ProcKatana']='Blade: Ei',['ProcPolearm']='Raiden Thrust',['Hachimonji']='Tachi: Jinpu',
['Zanmato']='Tachi: Jinpu',['H2H']='Asuran Fists',['Loxotic']='Judgment',['DualLoxotic']='Judgment',
['DualMalevo']='Aeolian Edge',['Shining']='Impulse Drive'}


function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Warcry"] = {gain = 'Warcry is on.', lose = 'Warcry wore off.', announce_gain = true, announce_lose = false},
        ["Naturalist's Roll"] = {gain = 'Naturalist Roll is on.', lose = 'Naturalist Roll wore off.', announce_gain = true, announce_lose = false},
		--["Bolter's Roll"]     = {gain = 'Bolter Roll is on.', lose = 'Bolter Roll wore off.', announce_gain = true, announce_lose = false},
		--["Samurai Roll"] = {gain = 'Samurai Roll is on.', lose = 'Samurai Roll wore off.', announce_gain = false, announce_lose = true},
		--["Chaos Roll"]   = {gain = 'Chaos Roll is on.', lose = 'Chaos Roll wore off.', announce_gain = false, announce_lose = true},
		--["Tactician's Roll"] = {gain = 'Tactician\'s Roll is on.', lose = 'Tactician\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Warlock's Roll"]   = {gain = 'Warlock\'s Roll is on.', lose = 'Warlock\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Wizard's Roll"]    = {gain = 'Wizard\'s Roll is on.', lose = 'Wizard\'s Roll wore off.', announce_gain = false, announce_lose = true},
		
		["Scherzo"]    = {gain = 'Scherzo is on.', lose = 'Scherzo wore off,', announce_gain = false, announce_lose = true},
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



--[[
    sets.engaged.Charge = {}
	sets.engaged.SomeAcc.Charge = {}
	sets.engaged.Acc.Charge = {}
	sets.engaged.FullAcc.Charge = {}
	sets.engaged.Fodder.Charge = {}
	
    sets.engaged.Mighty = {}
	sets.engaged.SomeAcc.Mighty = {}
	sets.engaged.Acc.Mighty = {}
	sets.engaged.FullAcc.Mighty = {}
	sets.engaged.Fodder.Mighty = {}

    sets.engaged.Charge.Mighty = {}
	sets.engaged.SomeAcc.Charge.Mighty = {}
	sets.engaged.Acc.Charge.Mighty = {}
	sets.engaged.FullAcc.Charge.Mighty = {}
	sets.engaged.Fodder.Charge.Mighty = {}
	
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
    sets.engaged.Adoulin.Charge = {}
	sets.engaged.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Acc.Adoulin.Charge = {}
	sets.engaged.FullAcc.Adoulin.Charge = {}
	sets.engaged.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Acc.Adoulin.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.Adoulin.Charge.Mighty = {}

    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
    sets.engaged.PDT.Charge = {}
	sets.engaged.SomeAcc.PDT.Charge = {}
	sets.engaged.Acc.PDT.Charge = {}
	sets.engaged.FullAcc.PDT.Charge = {}
	sets.engaged.Fodder.PDT.Charge = {}
	
    sets.engaged.PDT.Mighty = {}
	sets.engaged.SomeAcc.PDT.Mighty = {}
	sets.engaged.Acc.PDT.Mighty = {}
	sets.engaged.FullAcc.PDT.Mighty = {}
	sets.engaged.Fodder.PDT.Mighty = {}

    sets.engaged.PDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Charge.Mighty = {}
	
    sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
    sets.engaged.PDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge = {}
	
    sets.engaged.PDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Mighty = {}
	
    sets.engaged.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge.Mighty = {}

    sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
    sets.engaged.MDT.Charge = {}
	sets.engaged.SomeAcc.MDT.Charge = {}
	sets.engaged.Acc.MDT.Charge = {}
	sets.engaged.FullAcc.MDT.Charge = {}
	sets.engaged.Fodder.MDT.Charge = {}
	
    sets.engaged.MDT.Mighty = {}
	sets.engaged.SomeAcc.MDT.Mighty = {}
	sets.engaged.Acc.MDT.Mighty = {}
	sets.engaged.FullAcc.MDT.Mighty = {}
	sets.engaged.Fodder.MDT.Mighty = {}

    sets.engaged.MDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Charge.Mighty = {}
	
    sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
    sets.engaged.MDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge = {}
	
    sets.engaged.MDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Mighty = {}
	
    sets.engaged.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Conqueror melee sets
    sets.engaged.Conqueror = {}
	sets.engaged.Conqueror.SomeAcc = {}
	sets.engaged.Conqueror.Acc = {}
	sets.engaged.Conqueror.FullAcc = {}
	sets.engaged.Conqueror.Fodder = {}
	
    sets.engaged.Conqueror.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin = {}
	sets.engaged.Conqueror.Acc.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.Adoulin = {}
	sets.engaged.Conqueror.Fodder.Adoulin = {}
	
    sets.engaged.Conqueror.AM = {}
	sets.engaged.Conqueror.SomeAcc.AM = {}
	sets.engaged.Conqueror.Acc.AM = {}
	sets.engaged.Conqueror.FullAcc.AM = {}
	sets.engaged.Conqueror.Fodder.AM = {}
	
    sets.engaged.Conqueror.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.AM = {}

    sets.engaged.Conqueror.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Charge = {}
	sets.engaged.Conqueror.Acc.Charge = {}
	sets.engaged.Conqueror.FullAcc.Charge = {}
	sets.engaged.Conqueror.Fodder.Charge = {}
	
    sets.engaged.Conqueror.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Conqueror.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.PDT = {}
	sets.engaged.Conqueror.SomeAcc.PDT = {}
	sets.engaged.Conqueror.Acc.PDT = {}
	sets.engaged.Conqueror.FullAcc.PDT = {}
	sets.engaged.Conqueror.Fodder.PDT = {}
	
	sets.engaged.Conqueror.PDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Conqueror.PDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.AM = {}
	sets.engaged.Conqueror.Acc.PDT.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.PDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.MDT = {}
	sets.engaged.Conqueror.SomeAcc.MDT = {}
	sets.engaged.Conqueror.Acc.MDT = {}
	sets.engaged.Conqueror.FullAcc.MDT = {}
	sets.engaged.Conqueror.Fodder.MDT = {}
	
	sets.engaged.Conqueror.MDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Conqueror.MDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.AM = {}
	sets.engaged.Conqueror.Acc.MDT.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.MDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Conqueror.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Mighty = {}
	sets.engaged.Conqueror.Acc.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Mighty = {}
	sets.engaged.Conqueror.Fodder.Mighty = {}
	
    sets.engaged.Conqueror.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Conqueror.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Mighty.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Conqueror.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Conqueror.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.PDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.MDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Bravura melee sets
    sets.engaged.Bravura = {}
	sets.engaged.Bravura.SomeAcc = {}
	sets.engaged.Bravura.Acc = {}
	sets.engaged.Bravura.FullAcc = {}
	sets.engaged.Bravura.Fodder = {}
	
    sets.engaged.Bravura.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.Adoulin = {}
	sets.engaged.Bravura.Acc.Adoulin = {}
	sets.engaged.Bravura.FullAcc.Adoulin = {}
	sets.engaged.Bravura.Fodder.Adoulin = {}
	
    sets.engaged.Bravura.AM = {}
	sets.engaged.Bravura.SomeAcc.AM = {}
	sets.engaged.Bravura.Acc.AM = {}
	sets.engaged.Bravura.FullAcc.AM = {}
	sets.engaged.Bravura.Fodder.AM = {}
	
    sets.engaged.Bravura.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.AM = {}

    sets.engaged.Bravura.Charge = {}
	sets.engaged.Bravura.SomeAcc.Charge = {}
	sets.engaged.Bravura.Acc.Charge = {}
	sets.engaged.Bravura.FullAcc.Charge = {}
	sets.engaged.Bravura.Fodder.Charge = {}
	
    sets.engaged.Bravura.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Bravura.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.AM = {}
	sets.engaged.Bravura.Acc.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Charge.AM = {}
	
    sets.engaged.Bravura.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.PDT = {}
	sets.engaged.Bravura.SomeAcc.PDT = {}
	sets.engaged.Bravura.Acc.PDT = {}
	sets.engaged.Bravura.FullAcc.PDT = {}
	sets.engaged.Bravura.Fodder.PDT = {}
	
	sets.engaged.Bravura.PDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Bravura.PDT.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.AM = {}
	sets.engaged.Bravura.Acc.PDT.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.AM = {}
	sets.engaged.Bravura.Fodder.PDT.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.PDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Charge = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.PDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.MDT = {}
	sets.engaged.Bravura.SomeAcc.MDT = {}
	sets.engaged.Bravura.Acc.MDT = {}
	sets.engaged.Bravura.FullAcc.MDT = {}
	sets.engaged.Bravura.Fodder.MDT = {}
	
	sets.engaged.Bravura.MDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Bravura.MDT.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.AM = {}
	sets.engaged.Bravura.Acc.MDT.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.AM = {}
	sets.engaged.Bravura.Fodder.MDT.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.MDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Charge = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.MDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Bravura.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Mighty = {}
	sets.engaged.Bravura.Acc.Mighty = {}
	sets.engaged.Bravura.FullAcc.Mighty = {}
	sets.engaged.Bravura.Fodder.Mighty = {}
	
    sets.engaged.Bravura.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Bravura.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Bravura.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Bravura.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.PDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.PDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.MDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.MDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Ragnarok melee sets
    sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
    sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
    sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

    sets.engaged.Ragnarok.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Charge = {}
	sets.engaged.Ragnarok.Acc.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Charge = {}
	sets.engaged.Ragnarok.Fodder.Charge = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Ragnarok.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Ragnarok.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty = {}
	sets.engaged.Ragnarok.Acc.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Ragnarok.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Ragnarok.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.PDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.MDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
]]--

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

function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc','STP', 'CRIT','Fodder', 'SubtleBlow')
    state.WeaponskillMode:options('Match', 'SubtleBlow', 'PDL', 'Fodder')
    state.HybridMode:options('DT', 'Normal','Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('DT','Normal', 'PDT', 'HP', 'Evasion', 'MDT', 'Regen','Regain', 'EnemyCritRate')
    state.Passive:options('None', 'SubtleBlow','MDT', 'Enspell')
    state.Weapons:options('None','Godhands','Karambit','Club','Staff','ProcStaff','ProcClub','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')
	state.AutoBuffMode:options('Off','Auto','Full','Defend') --,'Vagary','Off','Off','Off','Off',

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    autows_list = {['Godhands']='Victory Smite',['Staff']='Cataclysm',
    ['Club']='Black Halo',['Karambit']='Asuran Fists'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	-- send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind f2 gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.

	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------


	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Karambit = {main="Karambit"}
	sets.weapons.Club = {main="Mafic Cudgel"}
	sets.weapons.Staff = {main="Xoanon",sub="Alber Strap"}

    sets.weapons.ProcStaff = {main="Profane Staff",sub=empty}
	sets.weapons.ProcClub = {main="Caduceus",sub=empty}
	sets.weapons.ProcSword = {main="Fermion Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Irradiance Blade",sub=empty}
	sets.weapons.ProcScythe = {main="Maven's Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Sha Wujing's La. +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato +1",sub=empty}
	-- neck JSE Necks Reinforcement Points Mode add u neck here 
	sets.RP = {}
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {legs="Hes. Hose +3"}
    sets.precast.JA['Boost'] = {}--hands="Anchorite's Gloves +1"
    sets.precast.JA['Dodge'] = {feet="Anch. Gaiters +3"}
    sets.precast.JA['Focus'] = {}--head="Anchorite's Crown +1"
    sets.precast.JA['Counterstance'] = {}--feet="Hesychast's Gaiters +1"
    sets.precast.JA['Footwork'] = {feet="Anch. Gaiters +3"}
    sets.precast.JA['Formless Strikes'] = {}--body="Hesychast's Cyclas"
    sets.precast.JA['Mantra'] = {}--feet="Hesychast's Gaiters +1"

    sets.precast.JA['Chi Blast'] = {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
}

    sets.precast.JA['Chakra'] = {
        ammo="Iron Gobbet",
        head="Genmei Kabuto",
        body={ name="Tatena. Harama. +1", augments={'Path: A',}},
        hands={ name="Hes. Gloves +3", augments={'Enhances "Invigorate" effect',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        left_ear={ name="Handler's Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring="Niqmaddu Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {        body="Passion Jacket",
	legs="Dashing Subligar",}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {
		head="Malignance Chapeau",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = sets.precast.Step


	-- Fast cast sets for spells
	
    
    sets.precast.FC = {    ammo="Sapience Orb",
    neck="Orunmila's Torque",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Prolix Ring",
}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",
    body="Passion Jacket",

   })  
   
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

    sets.midcast.RA = { ammo=empty,
        range="Trollbane",  
    }
    sets.midcast.Phalanx = {
        head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
        ammo="Coiste Bodhar",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Telos Earring",
        left_ring="Ilabrat Ring",
        right_ring="Cornelia's Ring",
        back="Segomo's Mantle",
    }
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })
    sets.precast.WS.SubtleBlow =  {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.precast.WS.Mod = set_combine(sets.precast.WS, {})


    -- Specific weaponskill sets.
    
    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Nyame Flanchard",
        feet="Mpaca's Boots",
        neck="Rep. Plat. Medal",
        waist="Moonbow Belt +1",
        right_ear="Schere Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",
    })
    sets.precast.WS["Raging Fists"].PDL = set_combine(sets.precast.WS["Raging Fists"], {
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })
    sets.precast.WS["Raging Fists"].ImpetusWS = set_combine(sets.precast.WS["Raging Fists"], {
body="Bhikku Cyclas +2"
    })
    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {
    ammo="Coiste Bodhar",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    right_ear="Schere Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back="Segomo's Mantle",
    })
    sets.precast.WS["Howling Fist"].PDL = set_combine(sets.precast.WS["Howling Fist"], {
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        right_ear="Schere Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",
    })
    sets.precast.WS["Asuran Fists"].PDL = set_combine(sets.precast.WS["Asuran Fists"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Ascetic's Fury"].PDL = set_combine(sets.precast.WS["Ascetic's Fury"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {
    ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Mpaca's Boots",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back="Segomo's Mantle",
    })
    sets.precast.WS["Victory Smite"].PDL = set_combine(sets.precast.WS["Victory Smite"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",
    })
    sets.precast.WS["Shijin Spiral"].PDL = set_combine(sets.precast.WS["Shijin Spiral"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
    })

    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        right_ear="Schere Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",
    })
    sets.precast.WS["Dragon Kick"].PDL = set_combine(sets.precast.WS["Dragon Kick"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    waist="Moonbow Belt +1",
    right_ear="Schere Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back="Segomo's Mantle",
    })
    sets.precast.WS["Tornado Kick"].PDL = set_combine(sets.precast.WS["Tornado Kick"],{
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })
    sets.precast.WS["Black Halo"] = set_combine(sets.precast.WS, {
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
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back="Segomo's Mantle",  
    })
    sets.precast.WS["Black Halo"].PDL = set_combine(sets.precast.WS["Black Halo"], {
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })
    sets.precast.WS["Retribution"] = set_combine(sets.precast.WS, {
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
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back="Segomo's Mantle",   
    })
    sets.precast.WS["Retribution"].PDL = set_combine(sets.precast.WS["Retribution"], {
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
    })

    sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
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

    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, { 
        ammo="Coiste Bodhar",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Mpaca's Doublet",
          hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",  
    })
    sets.precast.WS['Spinning Attack'].PDL = set_combine(sets.precast.WS, {   
        ammo="Crepuscular Pebble",
        hands="Bhikku Gloves +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}}, 
})

    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WS.Mod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WS.Mod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WS.Mod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WS.Mod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WS.Mod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WS.Mod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WS.Mod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WS.Mod)

-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Sacro Mantle",
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
neck="Baetyl Pendant",
waist="Orpheus's Sash",
right_ear="Friomisi Earring",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ring="Dingir Ring",
right_ring="Cornelia's Ring",
back="Sacro Mantle",})

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

	-- Extra Melee sets.  Apply these on top of melee sets.

	-- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
    sets.rollerRing = {left_ring="Roller's Ring"}

    --Passive set
	sets.passive.MDT = {
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
    }
	sets.passive.Enspell = {waist="Orpheus's Sash",}

    sets.passive.SubtleBlow = {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ring="Niqmaddu Ring",

	}
    sets.passive.SubtleBlowII = {
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ring="Niqmaddu Ring",
	}
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {        
	head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
	body="Hiza. Haramaki +2",
	hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
	legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
	feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Moonbow Belt +1",
	left_ear="Infused Earring",
	right_ear="Odr Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",}
	

	-- Defense sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Adamantite Armor",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Odnowa Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }

    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head="Genmei Kabuto",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ear="Tuisto Earring",
        right_ring="Eihwaz Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }

    sets.defense.MDT = {	      
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Adamantite Armor",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Archon Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
}
sets.defense.Evasion = {
    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Infused Earring",
    right_ear="Eabani Earring",
    left_ring="Vengeful Ring",
    right_ring="Defending Ring",
    back="Null Shawl",
}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Idle sets
	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Hiza. Haramaki +2",
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear="Eabani Earring",
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }
    
    sets.idle.Weak = sets.idle
    sets.idle.PDT = sets.defense.PDT
    sets.idle.DT = sets.defense.PDT
    sets.idle.MDT = sets.defense.MDT
    sets.idle.Evasion = sets.defense.Evasion
    sets.idle.HP = sets.defense.HP
    sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.Regen = set_combine(sets.idle, {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        waist="Null Belt",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    })
	sets.idle.Regain = {
		head="Null Masque",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist="Carrier's Sash",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Shadow Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Moonlight Cape",
	}
	sets.Kiting = {feet="Hermes' Sandals +1",}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Mpaca's Doublet",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Bhikku Hose +2",
        feet="Anch. Gaiters +3",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Mache Earring +1",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back="Segomo's Mantle",
    }

    sets.engaged.Acc = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Bhikku Hose +2",
        feet="Anch. Gaiters +3",
        neck="Null Loop",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Mache Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.engaged.Fodder = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Anch. Gaiters +3",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Schere Earring", augments={'Path: A',}},
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back="Segomo's Mantle",
    }

    sets.engaged.CRIT = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands="Adhemar Wrist. +1",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Anch. Gaiters +3",
        neck="Mnk. Nodowa +2",
        waist="Moonbow Belt +1",
        ear1="Odr Earring",
        ear2="Schere Earring",
        ring1="Niqmaddu Ring",
        ring2="Gere Ring",
        back="Null Shawl",
    }    
    sets.engaged.STP = {    
        ammo="Aurgelmir Orb +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Moonbow Belt +1",
        left_ear="Mache Earring +1",
        right_ear={ name="Schere Earring", augments={'Path: A',}},
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    }

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        left_ring="Niqmaddu Ring",
    })

    -- Defensive melee hybrid sets

    sets.DT = {
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Malignance Boots",
        --right_ring="Defending Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.DT = set_combine(sets.engaged, sets.DT)
    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.DT)
    sets.engaged.Fodder.DT = set_combine(sets.engaged.Fodder, sets.DT,{
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
    })
    --sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.DT)
    --sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.Defensive)
    sets.engaged.SubtleBlow.DT = { 
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Bhikku Hose +2",
    feet="Malignance Boots",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
    
    --Counter

    sets.engaged.Counter = {
		ammo="Amar Cluster",
		head="Hiza. Somen +2",
		body="Mpaca's Doublet",
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs="Bhikku Hose +2",
		feet="Hiza. Sune-Ate +2",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
        right_ear="Mache Earring +1",
		left_ear="Cryptic Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back="Segomo's Mantle",
	}
    sets.engaged.Acc.Counter = {ammo="Amar Cluster",
	head="Hiza. Somen +2",
	body="Mpaca's Doublet",
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs="Bhikku Hose +2",
	feet="Hiza. Sune-Ate +2",
    neck="Anu Torque",
	waist="Moonbow Belt +1",
    right_ear="Mache Earring +1",
    left_ear="Cryptic Earring",
	left_ring="Niqmaddu Ring",
	right_ring="Defending Ring",
    back="Segomo's Mantle",
}
sets.engaged.SubtleBlow.Counter = set_combine(sets.engaged, {
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
})
	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {body="Bhikku Cyclas +2"})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas +2"})
    
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +2"}
    sets.buff.ImpetusWS = {body="Bhikku Cyclas +2"}
	sets.buff.Footwork = {feet="Anch. Gaiters +3"}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Anch. Gaiters +3"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	

end
function user_job_lockstyle()
    if state.Stylenotwingsemode.value  then
        windower.chat.input:schedule(6,'/lockstyleset 1')
        return
    end
    if res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
        windower.chat.input('/lockstyleset 152')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
        windower.chat.input('/lockstyleset 164')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 10 then --Great Katana in main hand.
        windower.chat.input('/lockstyleset 172')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
        windower.chat.input('/lockstyleset 149')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 4 then --Great Sword in main hand.
        windower.chat.input('/lockstyleset 165')
    else
        windower.chat.input('/lockstyleset 159') --Catchall
    end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
        set_macro_page(2, 12)
	elseif player.sub_job == 'NIN' then
        set_macro_page(2, 12)
	elseif player.sub_job == 'THF' then
        set_macro_page(2, 12)
	elseif player.sub_job == 'RUN' then
        set_macro_page(2, 12)
	else
        set_macro_page(2, 12)
	end
end


-- function check_trust()
-- 	if not moving and state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Reive Mark'] or buffactive['Elvorseal'] or not player.in_combat) then
-- 		local party = windower.ffxi.get_party()
-- 		if party.p5 == nil then
-- 			local spell_recasts = windower.ffxi.get_spell_recasts()
			
-- 			if spell_recasts[999] < spell_latency and not have_trust("Monberaux") then
-- 				windower.chat.input('/ma "Monberaux" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
-- 				windower.chat.input('/ma "Sylvie (UC)" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
-- 				windower.chat.input('/ma "Koru-Moru" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
-- 				windower.chat.input('/ma "Joachim" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
-- 				windower.chat.input('/ma "Qultada" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			elseif spell_recasts[1013] < spell_latency and not have_trust("Lilisette II") then
-- 				windower.chat.input('/ma "Lilisette" <me>')
-- 				tickdelay = os.clock() + 4.5
-- 				return true
-- 			else
-- 				return false
-- 			end
-- 		end
	
-- 	end
-- 	return false
-- end
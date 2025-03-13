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
	state.OffenseMode:options('Normal','Acc', 'DA', 'STP', 'Ranged')
	state.HybridMode:options( 'PDT','Normal')
	state.RangedMode:options('Normal', 'Acc', 'DA', 'STP', 'Ranged')
	state.WeaponskillMode:options('Match', 'PDL', 'SC')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
    state.MagicalDefenseMode:options('MDT')
    state.IdleMode:options('Normal', 'PDH', 'PDT', 'EnemyCritRate', 'Resist', 'Regen', 'Refresh', 'Enmity')
	
	state.Weapons:options('Default', 'SWORDS', 'DAGGERS', 'AXE','DualWeapons','DualSavageWeapons','DualEviscerationWeapons','DualMagicWeapons','DualMalevolence')
	state.Weapongun = M{['description']='Weapon Set', 'normal', 'Holliday', 'Hangaku', 'Fomalhaut', 'Earp','Ullr'}

	--Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20
	
	WeaponType =  {['Yoichinoyumi'] = "Bow",
				   ['Gandiva'] = "Bow",
				   ['Ullr'] = "Bow",
				   ['Hangaku-no-Yumi'] = "Bow",
				   ['Earp'] = "Gun",
				   ['Holliday'] = "Gun",
                   ['Fail-Not'] = "Bow",
                   ['Accipiter'] = "Bow",
                   ['Annihilator'] = "Gun",
                   ['Armageddon'] = "Gun",
                   ['Fomalhaut'] = "Gun",
				   ['Ataktos'] = "Gun",
				   ['Anarchy +2'] = "Gun",
                   ['Gastraphetes'] = "Crossbow",
				}

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Eminent Arrow",
					['WS'] = "Eminent Arrow",
					['Acc'] = "Eminent Arrow",
					['Magic'] = "Eminent Arrow",
					['MagicAcc'] = "Eminent Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Eminent Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Chrono Bullet",
					['Magic'] = "Chrono Bullet",
					['MagicAcc'] = "Chrono Bullet",
					['Unlimited'] = "Hauksbok Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Animikii Bullet"},
					
		['Crossbow'] = {['Default'] = "Eminent Bolt",
						['WS'] = "Eminent Bolt",
						['Acc'] = "Eminent Bolt",
						['Magic'] = "Eminent Bolt",
						['MagicAcc'] = "Eminent Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_jse_back = {name="Belenus's Cape",augments={'"Snapshot"+10',}}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !0 gs c weapons MagicWeapons;gs c update')
	send_command('bind ^0 gs c weapons SingleWeapon;gs c update')
	send_command('bind f2 gs c toggle RngHelper')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind f7 gs c cycle Weapongun')
    send_command('bind !f7 gs c cycleback Weapongun')
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------
	sets.DefaultShield = {sub="Nusku Shield"}

	-- Weapons sets
	sets.weapons.Default = {main="Kustawi +1",sub="Nusku Shield",}
	sets.weapons.DualWeapons = {main="Kustawi +1",sub="Blurred Knife +1",}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",}
	sets.weapons.DualMalevolence = {main="Malevolence",sub="Malevolence",}
	sets.weapons.DualMagicWeapons = {main="Tauret",sub="Naegling",}

	sets.weapons.SWORDS = {main="Naegling", sub="Blurred Knife +1"}
    sets.weapons.DAGGERS = {main="Ternion Dagger +1", sub="Malevolence"}
    sets.weapons.AXE = {main="Perun +1", sub="Nusku Shield"}

    sets.Holliday = {range="Holliday"}
    sets.Hangaku = {range="Hangaku-no-Yumi", ammo="Hauksbok Arrow"}
    sets.Fomalhaut = {range="Fomalhaut"}
    sets.Earp = {range="Earp"}
	sets.Ullr = {range="Ullr"}
	


	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = {}--hands="Sylvan Glovelettes +2"
	sets.precast.JA['Camouflage'] = {}--body="Orion Jerkin +1"
	sets.precast.JA['Scavenge'] = {}--feet="Orion Socks +1"
	sets.precast.JA['Shadowbind'] = {}--hands="Orion Bracers +1"
	sets.precast.JA['Sharpshot'] = {}--legs="Orion Braccae +1"
	sets.precast.JA['Eagle Eye Shot'] = {legs="Arc. Braccae +3"}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear2="Loquac. Earring",
        hands="Leyline Gloves",ring1="Prolix Ring",
        back="Moonlight Cape",waist="Plat. Mog. Belt",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Orion Beret +3",
		body="Oshosi Vest +1",
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
		feet="Meghanada Jambeaux +2",
		waist="Yemaya Belt",
		right_ring="Crepuscular Ring",
		back="Null Shawl"} --38
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Oshosi Vest +1",
	feet="Meghanada Jambeaux +2",})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head="Orion Beret +3",
	body="Oshosi Vest +1",
hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
feet="Arcadian Socks +3",
waist="Yemaya Belt",
right_ring="Crepuscular Ring",
back="Null Shawl",})


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
		back="Null Shawl",
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
		back="Null Shawl",}) 
		
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Scout's Gorget +2",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Regal Ring",
		right_ring="Cornelia's Ring",
		back="Belenus's Cape",
	}
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
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

    sets.precast.WS['Last Stand'] = {
		head="Orion Beret +3",
		body="Amini Caban +2",
		hands="Nyame Gauntlets",
		legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Regal Ring",
		right_ring="Dingir Ring",
		back="Belenus's Cape",
	}
	sets.precast.WS['Last Stand'].PDL = set_combine(sets.precast.WS['Last Stand'], {
		legs="Ikenga's Trousers",
		neck="Scout's Gorget +2",
		right_ear="Amini Earring +1",
		left_ring="Sroda Ring", 
		right_ring="Cornelia's Ring",
		back="Belenus's Cape",
		})

	sets.precast.WS.Wildfire  = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
    neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Cornelia's Ring",
	right_ring="Dingir Ring",
    back="Belenus's Cape",
	}

	sets.precast.WS.Trueflight = set_combine(sets.precast.WS.Wildfire, {
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

	sets.precast.WS["Jishnu's Radiance"] = {		
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Nisroch Jerkin",
    hands="Mummu Wrists +2",
    legs="Jokushu Haidate",
    feet="Thereoid Greaves",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Regal Ring",
	back="Null Shawl",
}
	sets.precast.WS["Flaming Arrow"] = sets.precast.WS.Wildfire
	sets.precast.WS["Hot Shot"] = sets.precast.WS.Wildfire

	sets.precast.WS["Heavy Shot"] = sets.precast.WS["Jishnu's Radiance"]
	sets.precast.WS["Sniper Shot"] = sets.precast.WS["Jishnu's Radiance"]

	sets.precast.WS["Blast Shot"] = {
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck="Scout's Gorget +2",
		waist="Svelt. Gouriz +1",
		left_ear="Sherida Earring",
		right_ear="Amini Earring +1",
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back="Belenus's Cape",
	}
	sets.precast.WS["Numbing Shot"] = set_combine(sets.precast.WS["Blast Shot"], {right_ear="Amini Earring +1",
		
	})
	sets.precast.WS["Slug Shot"] = set_combine(sets.precast.WS["Blast Shot"], {
		right_ear="Amini Earring +1",
	})

	sets.precast.WS["Savage Blade"] = {	  
    	head="Nyame Helm",
     	body="Nyame Mail",
		 hands="Nyame Gauntlets",
		 legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Cornelia's Ring",
		right_ring="Regal Ring",
		back="Belenus's Cape",
		}
		sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
			body="Amini Caban +2",
			neck="Scout's Gorget +2",
			right_ear="Amini Earring +1",
			left_ring="Sroda Ring", 
		})

		sets.precast.WS.Evisceration  = {
			head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			body="Mummu Jacket +2",
			hands="Mummu Wrists +2",
			legs="Mummu Kecks +2",
			feet="Mummu Gamash. +2",
			neck="Scout's Gorget +2",
			waist="Fotia Belt",
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Amini Earring +1",
			left_ring="Mummu Ring",
			right_ring="Regal Ring",
			back="Null Shawl",
		}

-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
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
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck="Sibyl Scarf",
	waist="Orpheus's Sash",
	right_ear="Ishvara Earring",
	left_ear="Moonshade Earring",
	left_ring="Cornelia's Ring",
	right_ring="Ilabrat Ring",
	back="Belenus's Cape",
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

sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS, {
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
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {}
		
	-- Ranged sets

    sets.midcast.RA = {
		head="Arcadian Beret +3",
		body="Nisroch Jerkin",
		hands="Malignance Gloves",
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
		feet="Malignance Boots",
		neck="Scout's Gorget +2",
		waist="Yemaya Belt",
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back="Null Shawl",}
	
    sets.midcast.RA.Acc = {
        head="Meghanada Visor +2",
		body="Nisroch Jerkin",
		hands="Ikenga's Gloves",
		legs="Ikenga's Trousers",
		feet="Meghanada Jambeaux +2",
		neck="Scout's Gorget +2",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Dingir Ring",
		back="Null Shawl",}
		
	sets.midcast.RA.MAXACC = {
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet="Malignance Boots",
			neck="Scout's Gorget +2",
			waist="Yemaya Belt",
			left_ear="Telos Earring",
			right_ear="Crep. Earring",
			left_ring="Cacoethic Ring +1",
			right_ring="Crepuscular Ring",
			back="Belenus's Cape",
	}
	sets.midcast.RA.Critical = set_combine(sets.midcast.RA, {
			head="Meghanada Visor +2",
			body="Nisroch Jerkin",
			hands="Mummu Wrists +2",
			legs="Mummu Kecks +2",
			feet="Osh. Leggings +1",
			neck={ name="Scout's Gorget +2", augments={'Path: A',}},
			waist="Yemaya Belt",
			left_ear="Odr Earring",
			right_ear="Telos Earring",
			left_ring="Mummu Ring",
			right_ring="Dingir Ring",
			back="Belenus's Cape",
	
	})
	
	sets.midcast.RA.Fomalhaut = set_combine(sets.midcast.RA)
	
	sets.midcast.RA.Earp = set_combine(sets.midcast.RA)
	sets.midcast.RA.Holliday = set_combine(sets.midcast.RA)

	sets.midcast.RA.Ullr = set_combine(sets.midcast.RA, {})

	sets.midcast.RA['Hangaku-no-Yumi'] = set_combine(sets.midcast.RA, {})
	
	sets.Phalanx_Received = {
		body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
		feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}

	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {}
	sets.buff.Camouflage.Acc = {}
	sets.buff['Double Shot'] = {body="Arc. Jerkin +3",}
	sets.buff['Double Shot'].Acc = {body="Arc. Jerkin +3",}
	sets.buff.Barrage = {}
	sets.buff['Velocity Shot'] = set_combine(sets.midcast.RA, {body="Amini Caban +2",})
	sets.DoubleShot = {
		head="Arcadian Beret +3",
		body="Arc. Jerkin +3",
		hands="Oshosi Gloves +1",
		legs="Osh. Trousers +1",
		feet="Osh. Leggings +1",
	}
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {        head="Meghanada Visor +2",
	body="Meg. Cuirie +2",
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	feet="Meghanada Jambeaux +2",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	left_ear="Infused Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back="Moonlight Cape", }

	-- Idle sets
    sets.idle = {
		head="Malignance Chapeau",
		body="Adamantite Armor",
		hands="Malignance Gloves",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Infused Earring",
		left_ring="Paguroidea Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape"}
    
    -- Defense sets
	sets.defense.PDT = {
		head="Malignance Chapeau",
		body="Adamantite Armor",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Infused Earring",
		left_ring="Paguroidea Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	}

	sets.defense.MDT = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
		legs="Malignance Tights",
        eet="Malignance Boots",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",} 
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group

	sets.engaged = {
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck="Clotharius Torque",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
	}


	sets.engaged.Ranged = {	
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck="Clotharius Torque",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
	}


	sets.engaged.Acc = {	
		head="Malignance Chapeau",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
		feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
		neck="Scout's Gorget +2",
		waist="Olseni Belt",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Null Shawl",
	}
	sets.engaged.CRIT = {	
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck="Clotharius Torque",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Eabani Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
	}

	sets.engaged.STP = {	
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Olseni Belt",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Null Shawl",
	}


	sets.engaged.DW = {
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck="Clotharius Torque",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		right_ear="Sherida Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",
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
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Iskur Gorget",
	waist="Windbuffet Belt +1",
	left_ear="Cessance Earring",
	right_ear="Telos Earring",
	left_ring="Epona's Ring",
	right_ring="Petrov Ring",
	back="Null Shawl",
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
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	}
	   
	sets.engaged.PDT = set_combine(sets.engaged,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	sets.engaged.Ranged.PDT = set_combine(sets.Ranged,{    
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	sets.engaged.STP.PDT = set_combine(sets.engaged.STP,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ring="Defending Ring",
	})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		waist="Reiki Yotai",
		left_ring="Defending Ring",
	})
	sets.engaged.DW.CRIT.PDT = set_combine(sets.engaged.DW.CRIT,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		waist="Reiki Yotai",
		left_ring="Defending Ring",
	})
	sets.engaged.DW.Ranged.PDT = set_combine(sets.engaged.DW.Ranged,{    
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})
	
	sets.engaged.DW.STP.PDT = set_combine(sets.engaged.DW.STP,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		waist="Reiki Yotai",
		left_ring="Defending Ring",
	})




	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 152')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
		set_macro_page(1,10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1,10)
    elseif player.sub_job == 'DRG' then
		set_macro_page(1,10)
    else
		set_macro_page(1,10)
    end
end


autows_list = {['SWORDS']='Savage Blade',['DAGGERS']='Trueflight',['Tauret']='Aeolian Edge',
['Ranged']='Leaden Salute',['AXE']='Last Stand',['DualSavageWeapons']='Savage Blade',
['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',
['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}


function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Overkill"] = {gain = 'Overkill is on.', lose = 'Overkill wore off.', announce_gain = true, announce_lose = true},
        ["Naturalist's Roll"] = {gain = 'Naturalist Roll is on.', lose = 'Naturalist Roll wore off.', announce_gain = true, announce_lose = false},
		--["Bolter's Roll"]     = {gain = 'Bolter Roll is on.', lose = 'Bolter Roll wore off.', announce_gain = true, announce_lose = false},
		--["Samurai Roll"] = {gain = 'Samurai Roll is on.', lose = 'Samurai Roll wore off.', announce_gain = false, announce_lose = true},
		--["Chaos Roll"]   = {gain = 'Chaos Roll is on.', lose = 'Chaos Roll wore off.', announce_gain = false, announce_lose = true},
		--["Tactician's Roll"] = {gain = 'Tactician\'s Roll is on.', lose = 'Tactician\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Warlock's Roll"]   = {gain = 'Warlock\'s Roll is on.', lose = 'Warlock\'s Roll wore off.', announce_gain = false, announce_lose = true},
		--["Wizard's Roll"]    = {gain = 'Wizard\'s Roll is on.', lose = 'Wizard\'s Roll wore off.', announce_gain = false, announce_lose = true},
		
		["Scherzo"]    = {gain = 'Scherzo is on.', lose = 'Scherzo wore off, Daddy!', announce_gain = false, announce_lose = true},
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

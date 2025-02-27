-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    include('Display.lua')
	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib')
	autoRAmode = 0
	send_command('bind f12 gs c auto') --Gearset update toggle--

end

	organizer_items = {
	    "Earp",
		"Mafic Cudgel",
		"Perun 1+",
		"Holliday",
		"Decimating Bullet",
		"Beryllium Arrow",
		"Eminent Arrow",
		"Eminent Quiver",
		"Chr. Bul. Pouch",
		"Dec. Bul. Pouch",
	    "Em. Bul. Pouch",
		"Chrono Bullet",
		"Eminent Bullet",
		"Hauksbok Arrow",
		"Gyudon",
		"Reraiser",
		"Hi-Reraiser",
		"Vile Elixir",
		"Vile Elixir +1",
		"Miso Ramen",
		"Carbonara",
		"Silent Oil",
		"Salt Ramen",
		"Panacea",
		"Sublime Sushi",
		"Sublime Sushi 1+",
		"Prism Powder",
		"Antacid",
		"Icarus Wing",
		"Warp Cudgel",
		"Holy Water",
		"Sanjaku-Tenugui",
		"Shinobi-Tabi",
		"Shihei",
		"Remedy",
		"Wh. Rarab Cap +1",
		"Emporox's Ring",
		"Red Curry Bun",
		"Instant Reraise",
		"Black Curry Bun",
		"Rolan. Daifuku",
		"Qutrub Knife",
		"Wind Knife +1",
		"Reraise Earring",}
    

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff.Barrage = buffactive.Barrage or false
	state.Buff.Camouflage = buffactive.Camouflage or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
    state.Buff['Velocity Shot'] = buffactive['Velocity Shot'] or false
    state.Buff['Double Shot'] = buffactive['Double Shot'] or false
	state.CapacityMode = M(false, 'Capacity Point Mantle')
    send_command('wait 2;input /lockstyleset 152')
	include('Mote-TreasureHunter')
	state.WeaponLock = M(false, 'Weapon Lock')
	-- Whether a warning has been given for low ammo
	state.warned = M(false)
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'MAXAcc', 'Critical')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'PDL', 'SC')
	state.OffenseMode:options('Normal', 'Acc', 'DA', 'STP', 'Ranged')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
    state.MagicalDefenseMode:options('MDT')
    state.IdleMode:options('Normal', 'PDH', 'PDT', 'EnemyCritRate', 'Resist', 'Regen', 'Refresh', 'Enmity')

    state.HippoMode = M(false, "hippoMode")

	gear.default.weaponskill_neck = ""
	gear.default.weaponskill_waist = ""

	sub_weapons = S{"Sangarius +1", "Usonmunku", "Perun 1+", "Tanmogayi +1", "Reikiko", "Digirbalag", "Twilight Knife",
	"Kustawi +1", "Zantetsuken", "Excalipoor II", "Warp Cudgel", "Qutrub Knife", "Wind Knife +1", "Firetongue", "Nihility",
		"Extinction", "Heartstopper +1", "Twashtar", "Aeneas", "Gleti's Knife", "Naegling", "Tauret", "Caduceus", "Loxotic Mace +1",
		"Debahocho +1", "Dolichenus", "Arendsi Fleuret", "Demers. Degen +1", "Ternion Dagger +1", "Fomalhaut", "Ullr", "Perun 1+", "Naegling", "Gleti's Crossbow", "Anarchy +2", "Trollbane", 
	"Nusku Shield", "Malevolence", "Kustawi +1", "Arendsi Fleuret", "Gleti's Knife", "Dolichenus", "Tauret", 
	"Blurred Knife +1", "Ternion Dagger +1", "Beryllium Arrow", "Eminent Arrow", "Hangaku-no-Yumi", "Decimating bullett",

}

elemental_ws = S{"Flash Nova", "Sanguine Blade","Seraph Blade","Burning Blade","Red Lotus Blade"
, "Shining Strike", "Aeolian Edge", "Gust Slash", "Cyclone","Energy Steal","Energy Drain"
, "Leaden Salute", "Wildfire", "Hot Shot", "Flaming Arrow", "Trueflight", "Blade: Teki", "Blade: To"
, "Blade: Chi", "Blade: Ei", "Blade: Yu", "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter"
, "Primal Rend", "Dark Harvest", "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust"
, "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki", "Rock Crusher", "Earth Crusher", "Starburst"
, "Sunburst", "Omniscience", "Garland of Bliss"}	no_shoot_ammo = S{"Animikii Bullet", "Hauksbok Bullet"}

	DefaultAmmo = {['Hangaku-no-Yumi'] = "Eminent Arrow",
	               ['Ullr'] = "Eminent Arrow",
				   ['Fomalhaut'] = "Eminent Bullet",
				   ['Earp'] = "Eminent Bullet",
				   ['Holliday'] = "Eminent Bullet",
				}
	WSAmmo = {     ['Hangaku-no-Yumi'] = "Beryllium Arrow",
	               ['Ullr'] = "Beryllium Arrow",
				   ['Fomalhaut'] = "Chrono Bullet",
				   ['Earp'] = "Chrono Bullet",
				   ['Holliday'] = "Chrono Bullet",
				}
	AccAmmo = {   ['Hangaku-no-Yumi'] = "Eminent Arrow",
	              ['Ullr'] = "Eminent Arrow",
				  ['Fomalhaut'] = "Eminent Bullet",
				  ['Earp'] = "Eminent Bullet",
				  ['Holliday'] = "Eminent Bullet",
				}
	MagicAmmo = { ['Hangaku-no-Yumi'] = "Beryllium Arrow",
	              ['Ullr'] = "Beryllium Arrow",
	              ['Fomalhaut'] = "Chrono Bullet",
				  ['Earp'] = "Chrono Bullet",
				  ['Holliday'] = "Chrono Bullet",
				}

					-- 'Out of Range' distance; WS will auto-cancel
				range_mult = {
						[0] = 0,
						[2] = 1.70,
						[3] = 1.490909,
						[4] = 1.44,
						[5] = 1.377778,
						[6] = 1.30,
						[7] = 1.20,
						[8] = 1.30,
						[9] = 1.377778,
						[10] = 1.45,
						[11] = 1.490909,
						[12] = 1.70,
					}
	select_default_macro_book()
	--send_command('bind f12 gs c auto---------------------------------------------------------------') --Gearset update toggle--
	--send_command('bind f9 gs c cycle RangedMode')
	--send_command('bind ^f9 gs c cycle OffenseMode')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind !w gs c toggle WeaponLock')
    send_command('wait 6;input /lockstyleset 152')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind f5 gs c cycle WeaponskillMode')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind f7 gs c cycle Weapongun')
    send_command('bind !f7 gs c cycleback Weapongun')
    send_command('bind f6 gs c cycle WeaponSet')
    send_command('bind !f6 gs c cycleback WeaponSet')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('bind f4 input //fillmode')

	state.WeaponSet = M{['description']='Weapon Set', 'normal', 'SWORDS', 'DAGGERS', 'AXE'}
    state.Weapongun = M{['description']='Weapon Set', 'normal', 'Holliday', 'Hangaku', 'Fomalhaut', 'Earp','Ullr'}
    
	update_combat_form()

	Haste = 0
    DW_needed = 0
    DW = false
    moving = false
	if init_job_states then init_job_states({"WeaponLock","HippoMode"},{"IdleMode","OffenseMode","RangedMode","WeaponskillMode","WeaponSet","Weapongun","TreasureMode"}) 
    end
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !w')

end


-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------
    
	sets.normal = {}
    sets.SWORDS = {main="Naegling", sub="Blurred Knife +1"}
    sets.DAGGERS = {main="Ternion Dagger +1", sub="Malevolence"}
    sets.AXE = {main="Perun 1+", sub="Nusku Shield"}

    sets.normal = {}
    sets.Holliday = {range="Holliday"}
    sets.Hangaku = {range="Hangaku-no-Yumi", ammo="Hauksbok Arrow"}
    sets.Fomalhaut = {range="Fomalhaut"}
    sets.Earp = {range="Earp"}
	sets.Ullr = {range="Ullr"}
	
	sets.DefaultShield = {sub="Nusku Shield"}

	
	sets.CapacityMantle  = {}

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Eagle Eye Shot'] = {legs="Arc. Braccae +3"}



	-- Fast cast sets for spells

	sets.precast.FC = {
		neck="Orunmila's Torque",
		ear2="Loquacious Earring",
		ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

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
		back="Tactical Mantle",
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
		back="Tactical Mantle",}) 
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
	head="Orion Beret +3",
	body="Oshosi Vest +1",
	hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +1",
    waist="Yemaya Belt",
	right_ring="Crepuscular Ring",
	back="Tactical Mantle",
	}
	sets.precast.RA.Flurry1 = set_combine(sets.precast.RA, {
		body="Oshosi Vest +1",
		feet="Meg. Jam. +1",

	}) --47/52
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA.Flurry1, {
		head="Orion Beret +3",
		body="Oshosi Vest +1",
	hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Arcadian Socks +3",
    waist="Yemaya Belt",
	right_ring="Crepuscular Ring",
	back="Tactical Mantle",
		}) --32/73
	


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
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%',}},
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
	back="Annealed Mantle",
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
			back="Annealed Mantle",
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

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Orion Beret +1",ear1="Loquacious Earring",
		ring1="Prolix Ring",
		waist="Pya'ekue Belt +1",legs="Orion Braccae +1",feet="Orion Socks +1"}

	sets.midcast.Utsusemi = {body="Passion Jacket",neck="Magoraga Beads",}

	-- Ranged sets
	sets.TreasureHunter = { 
		head="White rarab cap +1", 
		waist="Chaac Belt",
	 }
	sets.midcast.RA = {		
		head="Arcadian Beret +1",
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
		back="Tactical Mantle",
	}
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {	
		head="Meghanada Visor +2",
		body="Nisroch Jerkin",
		hands="Ikenga's Gloves",
		legs="Ikenga's Trousers",
		feet="Meg. Jam. +2",
		neck="Scout's Gorget +2",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Cacoethic Ring 1+",
		right_ring="Dingir Ring",
		back="Tactical Mantle",
	})
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
		left_ring="Cacoethic Ring 1+",
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
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {
        head="Meghanada Visor +2",
        body="Meg. Cuirie +2",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Meg. Jam. +2",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        left_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",	}

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
		back="Moonlight Cape",

	}
	
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

	sets.Kiting = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},

	}


	--------------------------------------
	-- Engaged sets
	--------------------------------------


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
		back="Tactical Mantle",
	}

	sets.engaged.DD = {
		sub="Blurred Knife +1",
		range="Hangaku-no-Yumi",
		ammo="Hauksbok Arrow",
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
		back="Tactical Mantle",
	}
	sets.engaged.Shield = {
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
		back="Tactical Mantle",
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
		back="Tactical Mantle",
	}

	sets.engaged.ShieldAcc = {	
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
		back="Annealed Mantle",
	}
	sets.engaged.DDACC = {
		sub="Blurred Knife +1",
		range="Hangaku-no-Yumi",
		ammo="Hauksbok Arrow",
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
		back="Tactical Mantle",
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
		back="Annealed Mantle",
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
		back="Annealed Mantle",
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
		back="Tactical Mantle",
	}

	-- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    --DW cap all set haste capped

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
		back="Tactical Mantle",
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
	back="Tactical Mantle",
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
		legs="Chas. Culottes +3",
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
		legs="Chas. Culottes +3",
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
	sets.buff['Velocity Shot'] = set_combine(sets.midcast.RA, {body="Amini Caban +2",})
	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {})
	sets.DoubleShot = {
	head="Oshosi Mask +1",
    body="Oshosi Vest +1",
    hands="Oshosi Gloves +1",
    legs="Osh. Trousers +1",
    feet="Osh. Leggings +1",
}
	sets.buff.Camouflage = {}
	sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}


	sets.DefaultShield = {sub="Nusku Shield"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end
	if state.CapacityMode.value then
        equip(sets.CapacityMantle)
    end
    if spell.type == "WeaponSkill" then
        if (spell.target.model_size + spell.range * range_mult[spell.range]) < spell.target.distance then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Out of /eq]')
            return
        end
    end
	if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
    if spell.action_type == 'Ranged Attack' or (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo(spell, action, spellMap, eventArgs)
	end
	if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
	end
	if state.DefenseMode.value ~= 'None' and spell.type == 'WeaponSkill' then
		-- Don't gearswap for weaponskills when Defense is active.
		eventArgs.handled = true
	end
end
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		if player.tp == 3000 then  -- Replace Moonshade Earring if we're at cap TP
            equip({left_ear="Ishvara Earring"})
		end
	end
    if spell.action_type == 'Ranged Attack' then
        special_ammo_check()
        if flurry == 2 then
            equip(sets.precast.RA.Flurry2)
        elseif flurry == 1 then
            equip(sets.precast.RA.Flurry1)
        end
    elseif spell.type == 'WeaponSkill' then
        if spell.skill == 'Marksmanship' then
            special_ammo_check()
        end
		-- Replace TP-bonus gear if not needed.
		if spell.english == 'Trueflight' or spell.english == 'Wildfire' or spell.english == 'Aeolian Edge' and player.tp > 2900 then
			equip({ear1="Crematio Earring"})
		end
	end
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Trueflight' then
			if world.weather_element == 'Light' or world.day_element == 'Light' then
				equip({waist="Hachirin-no-Obi"})
			end
		elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
			equip({waist="Hachirin-no-Obi"})
		end
	end
	if spell.type == 'WeaponSkill' then
        if elemental_ws:contains(spell.name) then
            -- Matching double weather (w/o day conflict).
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 1.7 yalms.
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Matching day and weather.
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            -- Target distance under 8 yalms.
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Match day or weather.
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip({waist="Hachirin-no-Obi"})
            end
        end
    end
end
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.english == "Shadowbind" then
        send_command('@timers c "Shadowbind ['..spell.target.name..']" 42 down abilities/00122.png')
    end
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
end
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
    if update_job_states then update_job_states() 
    end

    check_weaponset()
end

windower.register_event('zone change',
    function()
        --add that at the end of zone change
        if update_job_states then update_job_states() end
    end
)

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
		equip(sets.buff.Barrage)
		eventArgs.handled = true
	end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if buffactive['Double Shot'] then
            equip(sets.DoubleShot)
        end
		if spell.action_type == 'Ranged Attack' then
			if buffactive['Velocity Shot'] then
				equip(sets.buff['Velocity Shot'])
			end
		end
--        if state.Buff['Velocity Shot'] and state.RangedMode.value == 'STP' then
--            equip(sets.buff['Velocity Shot'])
--        end
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function check_weaponset()
    equip(sets[state.WeaponSet.current])
    equip(sets[state.Weapongun.current])
    if (player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC') then
        equip(sets.DefaultShield)
    elseif player.sub_job == 'NIN' and player.sub_job_level < 10 or player.sub_job == 'DNC' and player.sub_job_level < 20 then
        equip(sets.DefaultShield)
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.HippoMode.value == true then 
        idleSet = set_combine(idleSet, {feet="Hippo. Socks +1"})
    end
    
    return idleSet
end
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    check_weaponset()

	return meleeSet
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	-- If we gain or lose any flurry buffs, adjust gear.
    if S{'flurry'}:contains(buff:lower()) then
        if not gain then
            flurry = nil
            --add_to_chat(122, "Flurry status cleared.")
        end
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
	if buff == "Camouflage" then
		if gain then
			equip(sets.buff.Camouflage)
			disable('body')
		else
			enable('body')
		end
	end
	if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed, please Cursna.')
            send_command('@input /item "Holy Water" <me>')	
             disable('ring1','ring2','waist','neck')
        else
            enable('ring1','ring2','waist','neck')
            send_command('input /p Doom removed.')
            handle_equipping_gear(player.status)
        end
    end
	if buff == "Charm" then
        if gain then  			
           send_command('input /p Charmd, please Sleep me.')		
        else	
           send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
        end
    end
    if buff == "petrification" then
        if gain then    
            equip(sets.defense.PDT)
            send_command('input /p Petrification, please Stona.')		
        else
            send_command('input /p '..player.name..' is no longer Petrify!')
            handle_equipping_gear(player.status)
        end
    end
    if buff == "Sleep" then
        if gain then    
            send_command('input /p ZZZzzz, please cure.')		
        else
            send_command('input /p '..player.name..' is no longer Sleep!')
        end
    end
    if buff == "Defense Down" then
        if gain then  			
            send_command('input /item "Panacea" <me>')
        end
    elseif buff == "Magic Def. Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Max HP Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Evasion Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Magic Evasion Downn" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Dia" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end  
    elseif buff == "Bio" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Bind" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "slow" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "weight" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Attack Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "Accuracy Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
        end
    end

    if buff == "VIT Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "INT Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "MND Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "STR Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
    elseif buff == "AGI Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
    end
    if buff == "curse" then
        if gain then  
        send_command('input /item "Holy Water" <me>')
        end
    end
    if not midaction() then
        job_update()
    end
end
function check_buffs(check)
     
end

windower.register_event('action',
    function(act)
        --check if you are a target of spell
        local actionTargets = act.targets
        playerId = windower.ffxi.get_player().id
        isTarget = false
        for _, target in ipairs(actionTargets) do
            if playerId == target.id then
                isTarget = true
            end
        end
        if isTarget == true then
            if act.category == 4 then
                local param = act.param
                if param == 845 and flurry ~= 2 then
                    --add_to_chat(122, 'Flurry Status: Flurry I')
                    flurry = 1
                elseif param == 846 then
                    --add_to_chat(122, 'Flurry Status: Flurry II')
                    flurry = 2
              end
            end
        end
    end)
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function job_handle_equipping_gear(playerStatus, eventArgs)
    update_combat_form()

end
function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
            DW_needed = tonumber(cmdParams[2])
            DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end
function display_current_job_state(eventArgs)
	local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' ..state.CombatForm.value.. ')'
    end

    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' ..state.HybridMode.value
    end

    local ws_msg = state.WeaponskillMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(002, '| ' ..string.char(31,210).. 'Melee' ..cf_msg.. ': ' ..string.char(31,001)..m_msg.. string.char(31,002)..  ' |'
        ..string.char(31,207).. ' WS: ' ..string.char(31,001)..ws_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end
function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
	if player.equipment.sub:endswith('Shield') then
        state.CombatForm:reset()
    end
end
function update_offense_mode()
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        state.CombatForm:set('DW')
    else
        state.CombatForm:reset()
    end
end
function job_update(cmdParams, eventArgs)
	update_combat_form()
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Check for proper ammo when shooting or weaponskilling
function check_ammo(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if player.equipment.ammo == 'empty' or player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
            if DefaultAmmo[player.equipment.range] then
                if player.inventory[DefaultAmmo[player.equipment.range]] then
                    --add_to_chat(3,"Using Default Ammo")
                    equip({ammo=DefaultAmmo[player.equipment.range]})
                else
                    add_to_chat(3,"Default ammo unavailable.  Leaving empty.")
                    equip({ammo=WSAmmo[player.equipment.range]})

                end
            else
                add_to_chat(3,"Unable to determine default ammo for current weapon.  Leaving empty.")

            end
        end
    elseif spell.type == 'WeaponSkill' then
        -- magical weaponskills
        if elemental_ws:contains(spell.english) then
            if player.inventory[MagicAmmo[player.equipment.range]] then
                equip({ammo=MagicAmmo[player.equipment.range]})
            else
                add_to_chat(3,"Magic ammo unavailable.  Using default ammo.")
                equip({ammo=DefaultAmmo[player.equipment.range]})
            end
        --physical weaponskills
        else
            if state.RangedMode.value == 'Acc' then
                if player.inventory[AccAmmo[player.equipment.range]] then
                    equip({ammo=AccAmmo[player.equipment.range]})
                else
                    add_to_chat(3,"Acc ammo unavailable.  Using default ammo.")
                    equip({ammo=DefaultAmmo[player.equipment.range]})
                end
            else
                if player.inventory[WSAmmo[player.equipment.range]] then
                    equip({ammo=WSAmmo[player.equipment.range]})
                else
                    add_to_chat(3,"WS ammo unavailable.  Using default ammo.")
                    equip({ammo=DefaultAmmo[player.equipment.range]})
                end
            end
        end
    end
    if player.equipment.ammo ~= 'empty' and player.inventory[player.equipment.ammo].count < 15 then
        add_to_chat(39,"*** Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low! *** ("..player.inventory[player.equipment.ammo].count..")")
    end
end

function special_ammo_check()
    -- Stop if Animikii/Hauksbok equipped
    if no_shoot_ammo:contains(player.equipment.ammo) then
        cancel_spell()
        add_to_chat(123, '** Action Canceled: [ '.. player.equipment.ammo .. ' equipped!! ] **')
        return
    end
end
function sub_job_change(new,old)
    if user_setup then
        user_setup()
        send_command('wait 6;input /lockstyleset 152')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1,10)
end
         
function autoRA()
		send_command('@wait 2.5; input /ra <t>')
end

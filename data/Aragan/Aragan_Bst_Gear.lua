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
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('PDT','Normal','PetTank','BothDD')
	state.WeaponskillMode:options('Match', 'Acc', 'PDL')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'MDTMaster', 'Turtle', 'MEva')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT', 'PetPDT', 'Reraise', 'Killer')
	state.MagicalDefenseMode:options('PetMDT', 'MDT', 'Petregen')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('None', 'SWORDS', 'AXE', 'SCYTHE', 'DAGGERS', 'CLUB','Staff')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Knockback','Suppa','DWEarrings'}
	
	autows_list = {['PetPDTAxe']='Ruinator',['DualWeapons']='Ruinator'}

	gear.PHYKumbha1 = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+18','Pet: Haste+3','Pet: TP Bonus+160',}}
	gear.PHYKumbha2 = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+16','Pet: Phys. dmg. taken -1%','Pet: TP Bonus+160',}}
	gear.PDTMABKumbha = {}
	gear.MABKumbha = {}
	
	send_command('lua l PetCharges')
	send_command('alias lamp input /targetnpc;wait .1; input //tradenpc 1 "Smoldering Lamp";wait 1.4;setkey numpadenter down;wait 0.1;setkey numpadenter up;wait .1;setkey up down;wait .1;setkey up up;wait .1;setkey numpadenter down;wait 0.1;setkey numpadenter up;wait .1;setkey right down;wait .4;setkey right up;wait .1;setkey numpadenter down;wait .1;setkey numpadenter up;')  --//lamp
	send_command('alias glowing input /targetnpc;wait .1; input //tradenpc 1 "Glowing Lamp";wait 1.8;setkey up down;wait .1;setkey up up;wait .1;setkey numpadenter down;wait 0.1;setkey numpadenter up;') -- //glowing 
	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode','FatsoFargann','ScissorlegXerin','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar'}
	send_command('bind f1 gs c cycle JugMode')
	send_command('bind !f1 gs c cycleback JugMode')
	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','Tank','DD'}
	send_command('bind f4 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind f2 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')
	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'
	send_command('bind !f3 gs c toggle AutoCallPet')
	send_command('bind !` gs c toggle ready')


	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above

	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()



    sets.weapons.SWORDS = {main="Naegling"}
    sets.weapons.AXE = {main="Dolichenus"}
    sets.weapons.SCYTHE = {main="Drepanum"}
    sets.weapons.DAGGERS = {main="Ternion Dagger +1",}
    sets.weapons.CLUB = {main="Mafic Cudgel"}
	sets.weapons.Staff = {main="Gozuki Mezuki",sub="Niobid Strap"}

    sets.SACRO = {sub="Sacro Bulwark",}

	-- Weapons sets
	--sets.weapons.PetPDTAxe = {main ="Izizoeksi"}
	--sets.weapons.DualWeapons = {main ="Izizoeksi",sub="Hunahpu"}



		-- PRECAST SETS
	sets.precast.JA['Killer Instinct'] = {head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},} --head="Ankusa Helm +1"
	sets.precast.JA['Bestial Loyalty'] = {
		hands={ name="Ankusa Gloves +3", augments={'Enhances "Beast Affinity" effect',}},
		right_ear="Nukumi Earring +1",
	}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {legs={ name="Ankusa Trousers +3", augments={'Enhances "Familiar" effect',}},}
	sets.precast.JA.Tame = {}
	sets.precast.JA.Spur = {back="Artio's Mantle"}
	sets.SpurAxe = {main="Skullrender"}
	sets.SpurAxesDW = {main="Skullrender",sub="Skullrender"}

	sets.precast.JA['Feral Howl'] = {body={ name="An. Jackcoat +3", augments={'Enhances "Feral Howl" effect',}},}

	sets.precast.JA.Reward = {
	    body={ name="An. Jackcoat +3", augments={'Enhances "Feral Howl" effect',}},
    legs={ name="Ankusa Trousers +3", augments={'Enhances "Familiar" effect',}},
    feet={ name="Ankusa Gaiters +3", augments={'Enhances "Beast Healer" effect',}},
    back="Artio's Mantle",}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})
	
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	sets.precast.JA.Charm = {}

	-- CURING WALTZ
	sets.precast.Waltz = {
		body="Gleti's Cuirass",
		legs="Dashing Subligar",}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {ammo="Voluspa Tathlum",}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
	ammo="Voluspa Tathlum",
	head="Tali'ah Turban +2",
	body="Tali'ah Manteel +2",
	hands="Tali'ah Gages +2",
	legs="Tali'ah Seraweels +2",
	feet="Tali'ah Crackows +2",
	neck="Sanctity Necklace",
	waist="Null Belt",
	right_ring="Varar Ring +1",}

	sets.precast.FC = {				
	ammo="Sapience Orb",
	hands="Leyline Gloves",
	left_ear="Etiolation Earring",
	right_ear="Loquac. Earring",
	left_ring="Varar Ring +1",
	right_ring="Prolix Ring",
	neck="Orunmila's Torque",}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		hands="Leyline Gloves",
		neck="Baetyl Pendant",
		waist="Siegel Sash",
		left_ear="Etiolation Earring",
		right_ring="Sheltered Ring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
	})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		waist="Siegel Sash",})
sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo="Sapience Orb",
		neck="Magoraga Beads",
		hands="Leyline Gloves", 
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Varar Ring +1",
		right_ring="Prolix Ring",})
		
sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		ammo="Sapience Orb",
		hands="Leyline Gloves",
		right_ear="Loquac. Earring",
		left_ear="Mendi. Earring",
		right_ring="Prolix Ring",
		})
	
	sets.precast.RA = {ammo=empty,
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		}

		-- MIDCAST SETS
	sets.midcast.FastRecast = {	
		ammo="Sapience Orb",
    	hands="Leyline Gloves",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Varar Ring +1",
		right_ring="Prolix Ring",}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Cure = {
		body="Jumalik Mail",
		hands="Leyline Gloves",
		waist="Gishdubar Sash",
		ear2="Mendi. Earring",
		back="Solemnity Cape",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
        body="Shab. Cuirass +1",
        neck="Incanter's Torque",
        waist="Olympus Sash",
        ring2="Sheltered Ring",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
        back="Moonlight Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		legs="Haven Hose",
		left_ear="Earthcry Earring",
		waist="Siegel Sash",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	})

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})

	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Shell


	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		neck="Debilis Medallion",
		waist="Gishdubar Sash",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",})



sets.midcast['Enfeebling Magic'] = {
	ammo="Voluspa Tathlum",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Enmerkar Earring",
	right_ear="Crep. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	}

sets.midcast['Divine Magic'] = {
	ammo="Voluspa Tathlum",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Enmerkar Earring",
	right_ear="Crep. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	}		
		
sets.midcast['Dark Magic'] = {
	ammo="Voluspa Tathlum",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Enmerkar Earring",
	right_ear="Crep. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	}		
		
sets.midcast['Elemental Magic'] = {
	ammo="Voluspa Tathlum",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Eschan Stone",
	left_ear="Enmerkar Earring",
	right_ear="Crep. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
}
		
sets.midcast.Stun = set_combine(sets.midcast['Elemental Magic'], {
	ammo="Voluspa Tathlum",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Null Belt",
	left_ear="Enmerkar Earring",
	right_ear="Crep. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
})

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

		-- WEAPONSKILLS
		-- Default weaponskill sets.

		sets.precast.WS = {
			ammo="Coiste Bodhar",
			head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Shulmanu Collar",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Thrud Earring",
			left_ring="Regal Ring",
			right_ring="Cornelia's Ring",
			back="Sacro Mantle",
		}
	
		sets.precast.WS.Acc = {
			ammo="Coiste Bodhar",
			head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Shulmanu Collar",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Thrud Earring",
			left_ring="Regal Ring",
			right_ring="Cornelia's Ring",
			back="Sacro Mantle",
		}
	
		sets.precast.WS.PDL = set_combine(sets.precast.WS, {
			ammo="Crepuscular Pebble",
			head={ name="Gleti's Mask", augments={'Path: A',}},
			body={ name="Gleti's Cuirass", augments={'Path: A',}},
			hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
			legs={ name="Gleti's Breeches", augments={'Path: A',}},
			feet={ name="Gleti's Boots", augments={'Path: A',}},
			right_ear="Nukumi Earring +1",
			left_ring="Sroda Ring",
		})
	
		-- Specific weaponskill sets.
		sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {
			ammo="Coiste Bodhar",
			head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
			right_ear="Sherida Earring",
			left_ring="Sroda Ring",
			right_ring="Gere Ring",
			back="Null Shawl",
		})
			
		sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
			
		sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
		
		sets.precast.WS['Ruinator'].PDL = set_combine(sets.precast.WS.PDL, {})
	
		sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {})
				
		sets.precast.WS['Onslaught'].Acc = set_combine(sets.precast.Acc, {})
		
		sets.precast.WS['Onslaught'].PDL = set_combine(sets.precast.PDL, {})
	
		sets.precast.WS['Decimation'] = set_combine(sets.precast.WS, {
			ammo={ name="Coiste Bodhar", augments={'Path: A',}},
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Sherida Earring",
			right_ear="Nukumi Earring +1",
			left_ring="Sroda Ring",
			right_ring="Gere Ring",
			back="Null Shawl",
		})
		sets.precast.WS['Decimation'].PDL = set_combine(sets.precast.WS['Decimation'], {
			ammo="Crepuscular Pebble",
			head={ name="Gleti's Mask", augments={'Path: A',}},
			body={ name="Gleti's Cuirass", augments={'Path: A',}},
			hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
			legs={ name="Gleti's Breeches", augments={'Path: A',}},
			feet={ name="Gleti's Boots", augments={'Path: A',}},
			right_ear="Nukumi Earring +1",
			left_ring="Sroda Ring",
		})
		sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
			ammo={ name="Coiste Bodhar", augments={'Path: A',}},
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Rep. Plat. Medal",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Thrud Earring",
			left_ring="Sroda Ring",
			right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			back="Sacro Mantle",
		})
		sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
			ammo="Crepuscular Pebble",
			hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
			right_ear="Nukumi Earring +1",
			left_ring="Sroda Ring",
		})
		sets.precast.WS['Rampage '] = set_combine(sets.precast.WS['Decimation'], {})
		sets.precast.WS['Rampage '].PDL = set_combine(sets.precast.WS['Decimation'].PDL, {})
	
	
		sets.precast.WS['Calamity'] = set_combine(sets.precast.WS, {
			ammo="Aurgelmir Orb +1",
			head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Shulmanu Collar",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Thrud Earring",
			left_ring="Sroda Ring",
			right_ring="Cornelia's Ring",
			back="Null Shawl",
		})
	
		sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS['Calamity'], {})
	
		sets.precast.WS['Primal Rend'] = {
			ammo="Pemphredo Tathlum",
			head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Baetyl Pendant",
			waist="Orpheus's Sash",
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Friomisi Earring",
			left_ring="Epaminondas's Ring",
			right_ring="Cornelia's Ring",
			back="Sacro Mantle",
	
	}   
	
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
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring="Cornelia's Ring",
		right_ring="Archon Ring",
		back="Sacro Mantle",
	})
	
	sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
	sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
	sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
	sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
	sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
	sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]
	
	sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
		ammo="Pemphredo Tathlum",
		head={ name="Ankusa Helm +3", augments={'Enhances "Killer Instinct" effect',}},
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back="Sacro Mantle",
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
	
	-- Calamity, Meditate, Sekkanoki > brain > tail, leave, cb, fight > Primal Rend > tegmina > Clerrrdplerrterrr
	--------------------------------------------------------------------------------		
	-- tail   >  tegmi  >  sensi >  brain  >  tail  >  " "
	-- razor  >  brain  >  claw  >  brain  >  tail  >  Clerrrdplerrterrr
	-- (impac)	(lique)   (sciss)  (lique)   (impac)    (fragment)
	
	-- Up In Arms
	-- Wild oats > frogkick > raging axe OR head butt > rampage > frogkick
	-- blockhead > spinning top > doubleclaw (fireball) > spinning top (fireball)
	-- Razor Fang > Brain Crush > Claw Cyclone > Brain Crush > Razor Fang > fireball

		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {main="Agwu's Axe",
    sub={ name="Arktoi", augments={'Accuracy+50','Pet: Accuracy+50','Pet: Attack+30',}},
    ammo="Voluspa Tathlum",
    head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
	body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands="Nukumi Manoplas +2",
    legs={ name="Ankusa Trousers +3", augments={'Enhances "Familiar" effect',}},
    feet="Gleti's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Sroda Earring",
    right_ear="Kyrene's Earring",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back="Artio's Mantle",}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {})
				
	sets.midcast.Pet.MagicReady = {main={ name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+18','Pet: Haste+3','Pet: TP Bonus+160',}},
    sub={ name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+16','Pet: Phys. dmg. taken -1%','Pet: TP Bonus+160',}},
    ammo="Voluspa Tathlum",
    head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Subtle Blow"+10','Pet: STR+2',}},
    body="Udug Jacket",
    hands="Nukumi Manoplas +2",
    legs={ name="Valorous Hose", augments={'Pet: "Mag.Atk.Bns."+29','Pet: "Dbl. Atk."+2','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Attack+10 Pet: Rng.Atk.+10',}},
    feet="Gleti's Boots",
    neck="Adad Amulet",
    waist="Incarnation Sash",
    left_ear="Enmerkar Earring",
    right_ear="Crep. Earring",
    left_ring="C. Palug Ring",
    right_ring="Tali'ah Ring",
    back="Argocham. Mantle",}
		
	sets.midcast.Pet.DebuffReady = {
	ammo="Voluspa Tathlum",
	head="Nuk. Cabasset +2",
	body="Nukumi Gausape +2",
	hands="Nukumi Manoplas +2",
	legs="Nukumi Quijotes +2",
	feet={ name="Gleti's Boots", augments={'Path: A',}},
	neck="Bst. Collar +2",
	waist="Incarnation Sash",
	left_ear="Enmerkar Earring",
	right_ear="Nukumi Earring +1",
	left_ring="C. Palug Ring",
	right_ring="Tali'ah Ring",
	back="Artio's Mantle",}
		
	sets.midcast.Pet.PhysicalDebuffReady = {	
	ammo="Voluspa Tathlum",
	head="Nuk. Cabasset +2",
	body="Nukumi Gausape +2",
	hands="Nukumi Manoplas +2",
	legs="Nukumi Quijotes +2",
	feet={ name="Gleti's Boots", augments={'Path: A',}},
	neck="Bst. Collar +2",
	waist="Incarnation Sash",
	left_ear="Enmerkar Earring",
	right_ear="Nukumi Earring +1",
	left_ring="C. Palug Ring",
	right_ring="Tali'ah Ring",
	back="Artio's Mantle",}

	sets.midcast.Pet.ReadyRecast = {main="Charmer's Merlin",legs="Gleti's Breeches"}
	sets.midcast.Pet.ReadyRecastDW = {sub="Charmer's Merlin",legs="Gleti's Breeches"}
	sets.midcast.Pet.Neutral = {}
	sets.midcast.Pet.Favorable = {head="Nukumi Cabasset +2"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +2"}

	-- RESTING
	sets.resting = {		head="Crepuscular Helm",
	body="Sacro Breastplate",
	hands="Meg. Gloves +2",
	legs="Meg. Chausses +2",
	feet={ name="Gleti's Boots", augments={'Path: A',}},
	neck="Empath Necklace",
	waist="Isa Belt",
	left_ear="Infused Earring",
	right_ear="Hypaspist Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",}

    sets.idle = {
		ammo="Iron Gobbet",
		head="Gleti's Mask",
		body="Adamantite Armor",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
        feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
}
			
	sets.idle.MDTMaster = {		
		main="Izizoeksi",
		sub={ name="Digirbalag", augments={'Pet: Damage taken -4%','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+19 Pet: Rng.Atk.+19',}},
        head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
		body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands="Gleti's Gauntlets",
		legs="Tali'ah Sera. +2",
		feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		neck="Shepherd's Chain",
		waist="Isa Belt",
		left_ear="Rimeice Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Defending Ring",
		back="Artio's Mantle",
}
			
	sets.idle.Turtle = set_combine(sets.idle, {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Adamantite Armor",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Asklepian Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Sanare Earring",
		left_ring="Shadow Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
})
			
	sets.idle.MEva = set_combine(sets.idle, {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Asklepian Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Sanare Earring",
		left_ring="Shadow Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
		})
			
    sets.idle.Refresh = set_combine(sets.idle, {
		body="Crepuscular Mail"
})
			
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.idle.Pet = set_combine(sets.idle, {
        head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
		body={ name="Emicho Haubert +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		hands="Gleti's Gauntlets",
		legs="Tali'ah Sera. +2",
		feet={ name="Ankusa Gaiters +3", augments={'Enhances "Beast Healer" effect',}},
		neck="Empath Necklace",
		waist="Isa Belt",
		left_ear="Hypaspist Earring",
		right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
		left_ring="Varar Ring +1",
		right_ring="Defending Ring",
		back="Artio's Mantle",
})

		-- sub="Sacro Bulwark",
		
		-- sub="Astolfo",
			
	sets.idle.Pet.Engaged = set_combine(sets.idle, {
		main={ name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}},
		sub="Izizoeksi",
		head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
		body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		neck="Shepherd's Chain",
		waist="Isa Belt",
		left_ear="Hypaspist Earring",
		right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
		left_ring="Varar Ring +1",
		right_ring="Defending Ring",
		back="Artio's Mantle",
	})
        
	sets.idle.SingleWield = {			main={ name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}},
	head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
	body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	neck="Shepherd's Chain",
	waist="Isa Belt",
	left_ear="Hypaspist Earring",
	right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
	left_ring="Varar Ring +1",
	right_ring="Defending Ring",
	back="Artio's Mantle",}

	sets.idle.Pet.Engaged.DW = 		{			main={ name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}},
	head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
	body={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	hands={ name="Taeon Gloves", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	legs={ name="Taeon Tights", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	neck="Shepherd's Chain",
	waist="Isa Belt",
	left_ear="Hypaspist Earring",
	right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
	left_ring="Varar Ring +1",
	right_ring="Defending Ring",
	back="Artio's Mantle",}

	-- DEFENSE SETS
	sets.defense.PDT = {
		ammo="Iron Gobbet",
		head="Nyame Helm",
		body="Adamantite Armor",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Fortified Ring",
		right_ring="Warden's Ring",
		back="Moonlight Cape",
	}
	
		sets.defense.PetPDT = {				
			main={ name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}},
			sub="Izizoeksi",
			ammo="Staunch Tathlum +1",
			head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
			body="Tot. Jackcoat +3",
			hands="Gleti's Gauntlets",
			legs="Tali'ah Sera. +2",
			feet={ name="Ankusa Gaiters +3", augments={'Enhances "Beast Healer" effect',}},
			neck="Shepherd's Chain",
			waist="Isa Belt",
			left_ear="Hypaspist Earring",
			right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
			left_ring="Varar Ring +1",
			right_ring="Defending Ring",
			back="Artio's Mantle",
		}

		sets.defense.MDT = set_combine(sets.defense.PDT, {
			ammo="Staunch Tathlum +1",
			head={ name="Gleti's Mask", augments={'Path: A',}},
			body={ name="Gleti's Cuirass", augments={'Path: A',}},
			hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
			legs={ name="Gleti's Breeches", augments={'Path: A',}},
			feet={ name="Gleti's Boots", augments={'Path: A',}},
			neck={ name="Warder's Charm +1", augments={'Path: A',}},
			waist="Engraved Belt",
			left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			right_ear="Sanare Earring",
			left_ring="Shadow Ring",
			right_ring="Defending Ring",
			back="Moonlight Cape",
	})
	

		sets.defense.PetMDT =  {
			main="Izizoeksi",
			sub={ name="Digirbalag", augments={'Pet: Damage taken -4%','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+19 Pet: Rng.Atk.+19',}},
			head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
			body="Tot. Jackcoat +3",
			hands="Gleti's Gauntlets",
			legs="Tali'ah Sera. +2",
			feet={ name="Taeon Boots", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
			neck="Shepherd's Chain",
			waist="Isa Belt",
			left_ear="Rimeice Earring",
			right_ear="Enmerkar Earring",
			left_ring="Varar Ring +1",
			right_ring="Defending Ring",
			back="Artio's Mantle",
	}
	
	sets.defense.Petregen = {			
		main={ name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}},
		sub="Izizoeksi",
		  head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','ATTACK+3','PET: "REGEN"+1',}},		
		  body={ name="Emicho Haubert +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		  hands="Gleti's Gauntlets",
		legs="Tali'ah Sera. +2",
		feet={ name="Ankusa Gaiters +3", augments={'Enhances "Beast Healer" effect',}},
		neck="Empath Necklace",
		waist="Isa Belt",
		left_ear="Hypaspist Earring",
		right_ear={ name="Handler's Earring +1", augments={'Path: A',}},
		left_ring="Varar Ring +1",
		back="Artio's Mantle",
	}


	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +2"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {			
	head="Crepuscular Helm",
	body="Crepuscular Mail",})

	sets.defense.MEVA = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Etiolation Earring",
		ring1="Vengeful Ring",ring2="Purity Ring",
		waist="Engraved Belt",
		back="Moonlight Cape",}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +2"})

	sets.Kiting = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {		ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Dedition Earring",
	right_ear="Sherida Earring",
	left_ring="Gere Ring",
	right_ring="Epona's Ring",
	back="Null Shawl",}

	sets.engaged.Acc = {	ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Dedition Earring",
	right_ear="Sherida Earring",
	left_ring="Gere Ring",
	right_ring="Epona's Ring",
	back="Null Shawl",}

	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		})


	sets.engaged.Acc.PDT = set_combine(sets.engaged, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		})


	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {		ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist="Reiki Yotai",
	left_ear="Suppanomimi",
	right_ear="Sherida Earring",
	left_ring="Gere Ring",
	right_ring="Epona's Ring",
	back="Null Shawl",}


	sets.engaged.DW.Acc = {		ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Anu Torque",
	waist="Reiki Yotai",
	left_ear="Suppanomimi",
	right_ear="Sherida Earring",
	left_ring="Gere Ring",
	right_ring="Epona's Ring",
	back="Null Shawl",}


	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {		waist="Reiki Yotai",
	left_ear="Suppanomimi",})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc.PDT, {		waist="Reiki Yotai",
	left_ear="Suppanomimi",})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{})
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {})


	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{})
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {})


	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {})


	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {})


	sets.buff['Killer Instinct'] = {body="Nukumi Gausape +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Suppanomimi", ear2="Sherida Earring"}
	

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
	sets.precast.JA['Bestial Loyalty'].WeevilFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pristine Sap"})
	sets.precast.JA['Bestial Loyalty'].StalwartAngelina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="T. Pristine Sap"})
	sets.precast.JA['Bestial Loyalty'].SweetCaroline = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Aged Humus"})
	sets.precast.JA['Bestial Loyalty']['P.CrabFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rancid Broth"})
	sets.precast.JA['Bestial Loyalty'].JovialEdwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pungent Broth"})
	sets.precast.JA['Bestial Loyalty']['Y.BeetleFamiliar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Zestful Sap"})
	sets.precast.JA['Bestial Loyalty'].EnergizedSefina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gassy Sap"})
	sets.precast.JA['Bestial Loyalty'].LynxFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Frizzante Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousGaston = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spumante Broth"})
	sets.precast.JA['Bestial Loyalty']['Hip.Familiar'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Turpid Broth"})
	sets.precast.JA['Bestial Loyalty'].DaringRoland = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Feculent Broth"})
	sets.precast.JA['Bestial Loyalty'].SlimeFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Decaying Broth"})
	sets.precast.JA['Bestial Loyalty'].SultryPatrice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Putrescent Broth"})
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 147')
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(9, 11)
	elseif player.sub_job == 'NIN' then
		set_macro_page(9, 11)
	elseif player.sub_job == 'THF' then
		set_macro_page(9, 11)
	elseif player.sub_job == 'RUN' then
		set_macro_page(9, 11)
	else
		set_macro_page(9, 11)
	end
end



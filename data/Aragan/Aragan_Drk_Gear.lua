-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

in macro for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
u can use addon automb 

/con gs c cycle Absorbs -- for cycle Absorbs
/con gs c cycleback Absorbs -- for cycleback Absorbs
/con gs c Absorbs -- for USE Absorbs

and i add bind alt+f1 reset addon zonetime on screen to know when u fight
sortie boss 3min u can run away before or bind before 20s
and i add code in gs if u engage zonetime will reset every engage

--]]
--[[ 

-- Scythe Light:
Insurgency > Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
Entropy > Guillotine > Entropy > Insurgency 
Guillotine > Entropy > Insurgency

-- Scythe Darkness: 
Insurgency (M) > Vorpal Scythe > Vorpal Scythe > Insurgency (M) > Entropy (MM) > Cross Reaper
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
Cross Reaper > Insurgency (M) > Entropy (MM) > Cross Reaper
Insurgency (M) > Entropy (MM) > Cross Reaper
Cross Reaper > Entropy (MM)
Entropy (MM) > Cross Reaper

-- Apoc Darkness
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM) > Catastrophe (R)
Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
Insurgency (M) > Entropy (MM) > Cross Reaper > Catastrophe (R)
Insurgency (M) > Catastrophe (R) > Cross Reaper > Catastrophe (R)
Cross Reaper > Insurgency (M) > Catastrophe (R) > Cross Reaper
Catastrophe (R) > Cross Reaper > Catastrophe (R)
Insurgency (M) > Catastrophe (R) > Cross Reaper
Cross Reaper > Catastrophe (R) > Catastrophe (R)
Cross Reaper > Entropy (MM) > Catastrophe (R)
Entropy (MM) > Cross Reaper > Catastrophe (R)
Catastrophe (R) > Catastrophe (R)
Catastrophe (R) > Cross Reaper
Cross Reaper > Catastrophe (R)

-- Other Light
Catastrophe (R) > Savage Blade (Q) > Insurgency (M)
Entropy (MM) > Savage Blade (Q) > Insurgency (M)
Savage Blade (Q) > Insurgency (M)
Chant du Cygne (E) > Torcleaver (E)

-- Other Dark
Atonement (M) > Entropy (MM) > Cross Reaper
Savage Blade (Q) > Cross Reaper > Entropy (MM)
Chant du Cygne (E) > Catastrophe (R)
Chant du Cygne (E) > Entropy (MM)
Requiescat (MM) > Cross Reaper
Requiescat (MM) > Torcleaver (E)

-- GreatSword Light
Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM) > Torcleaver (E)
Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM)
Resolution (MM) > Scourge (R) > Torcleaver (E)
Scourge (R) > Resolution (MM) > Torcleaver (E)
Torcleaver (E) > Torcleaver (E)
Scourge (R) > Resolution (MM)



--6step 

-- GreatSword --6step 

Detonation Scission

Crescent Moon > Freezebite > Crescent Moon > Freezebite  ~
Crescent Moon > Herculean Slash > Crescent Moon ~
Sickle Moon > Freezebite > Sickle Moon > > Freezebite ~

Impaction Detonation
Sickle Moon > Herculean Slash > Sickle Moon ~
Herculean Slash > Hard Slash > Herculean Slash ~
Freezebite > Hard Slash > Freezebite ~

-- Scythe  --6step 

Nightmare Scythe > Vorpal Scythe > Nightmare Scythe >  Vorpal Scythe > Nightmare Scythe >  Vorpal Scythe > Nightmare Scythe >

--]]


function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','TP', 'STP', 'DA', 'Acc', 'SubtleBlow', 'CRIT')
    state.WeaponskillMode:options('Match', 'Acc', 'PDL', 'SC', 'Dread', 'None')
    state.HybridMode:options('DT', 'Normal', 'DreadSP')
	state.CastingMode:options('Normal', 'ConserveMP', 'SIRD')
    state.PhysicalDefenseMode:options( 'PDT', 'HP', 'Enmity','Aminon', 'Dread Spikes', 'SEboost', 'Reraise')
    state.MagicalDefenseMode:options('Normal','MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Tank','Normal','PDT' ,'Regen', 'MDT', 'HP', 'Evasion', 'EnemyCritRate', 'Refresh')
	state.Weapons:options('Normal', 'Caladbolg', 'Lycurgos', 'Liberator', 'Anguta', 'Apocalypse', 'Drepanum', 
    'AgwuClaymore', 'Naegling', 'Loxotic', 'TernionDagger', 'Dolichenus',
    'ProcScythe','ProcGreatSword')
	state.shield = M{['description']='Weapon Set', 'Normal', 'shield'}

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

		--use //listbinds    .. to show command keys
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind f3 gs c cycle Absorbs')
    send_command('bind !f3 gs c cycleback Absorbs')
    send_command('bind f2 input //gs c Absorbs')
    send_command('bind f7 gs c cycle shield')
	send_command('bind f5 gs c cycle WeaponskillMode')
	send_command('bind f4 gs c cycle ElementalMode')
	send_command('bind @f4 gs c cycleback ElementalMode') --Robbiewobbie's idea
    send_command('bind @c gs c toggle Capacity')
    send_command('bind @x gs c toggle RP')  --keeps neck JSE Reinforcement Points Mode on.
    --send_command('bind !t gs c cycle TartarusMode')
    --send_command('bind @f9 gs c toggle SouleaterMode')
    --send_command('bind f3 gs c toggle LastResortMode')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	--Weapons
sets.weapons.Normal = {}
sets.weapons.Caladbolg = {main="Caladbolg", sub="Utu Grip"}
sets.weapons.Liberator = {main="Liberator", sub="Utu Grip"}
sets.weapons.Anguta = {main="Anguta", sub="Utu Grip"}
sets.weapons.Apocalypse = {main="Apocalypse", sub="Utu Grip"}
sets.weapons.Drepanum = {main="Drepanum", sub="Utu Grip"}
sets.weapons.AgwuClaymore = {main="Agwu's Claymore", sub="Utu Grip"}
sets.weapons.Lycurgos = {main="Lycurgos", sub="Utu Grip",}

sets.weapons.DualNaegling = {main="Naegling", sub="Sangarius +1"}
sets.weapons.DualLoxotica = {main="Loxotic Mace +1", sub="Sangarius +1"}
sets.weapons.DualTernionDagger = {main="Ternion Dagger +1", sub="Sangarius +1",}
sets.weapons.DualDolichenus = {main="Dolichenus", sub="Sangarius +1",}

sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1",}
sets.weapons.Loxotic = {main="Loxotic Mace +1", sub="Blurred Shield +1",}
sets.weapons.TernionDagger = {main="Ternion Dagger +1", sub="Blurred Shield +1",}
sets.weapons.Dolichenus = {main="Dolichenus", sub="Blurred Shield +1",}

sets.weapons.ProcScythe = {main="Maven's Scythe",sub="Sword Strap",}
sets.weapons.ProcGreatSword = {main="Irradiance Blade",sub="Sword Strap",}


sets.Normal = {}
sets.shield = {sub="Blurred Shield +1"}
sets.DefaultShield = {sub="Blurred Shield +1"}

-- neck JSE Necks Reinforcement Points Mode add u neck here 
sets.RP = {}
-- Capacity Points Mode
sets.Capacity = {}

	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",
	feet={ name="Fall. Sollerets +3", augments={'Enhances "Desperate Blows" effect',}},}
	sets.precast.JA['Nether Void'] = {Legs="Heath. Flanchard +2"}
	sets.precast.JA['Blood Weapon'] = {body="Fall. Cuirass +3"}
	sets.precast.JA['Arcane Circle'] = {}--feet="Ignominy Sollerets +3"
	sets.precast.JA['Weapon Bash'] = {}--hands="Ignominy Gauntlets +3"
	sets.precast.JA['Souleater'] = {head="Ignominy Burgeonet +3"}
	sets.precast.JA['Dark Seal'] = {head="Fall. Burgeonet +3"}
	sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +3"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           

    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}
  
		   
	-- Fast cast sets for spells

	sets.precast.FC = {        ammo="Sapience Orb",
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
	body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
	feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
	neck="Orunmila's Torque",
	waist="Plat. Mog. Belt",
	left_ear="Loquac. Earring",
	right_ear="Malignance Earring",
	left_ring="Kishar Ring",
	right_ring="Rahab Ring",
	back="Solemnity Cape",}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	-- Midcast Sets
	sets.midcast.FastRecast = {         ammo="Staunch Tathlum +1",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    left_ear="Halasz Earring",
    right_ear="Mendi. Earring",
    right_ring="Evanescence Ring",
}
    
sets.ConserveMP = {
    ammo="Pemphredo Tathlum",
    legs="Augury Cuisses +1",
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    right_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",} 
    
    sets.SIRD = {
        ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
    }
    sets.midcast.Enmity = {
        ammo="Iron Gobbet",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body={ name="Emet Harness +1", augments={'Path: A',}},
        hands="Macabre Gaunt. +1",
        legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
        feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Vengeful Ring",
        right_ring="Petrov Ring",
        back="Reiki Cloak",
    }
      
	-- Specific spells

		   

	sets.midcast['Dread Spikes'] = {
			ammo="Staunch Tathlum +1",
			head="Ratri Sallet +1",
			body="Heath. Cuirass +2",
			hands="Rat. Gadlings +1",
			legs="Ratri Cuisses +1",
			feet="Rat. Sollerets +1",
			neck={ name="Unmoving Collar +1", augments={'Path: A',}},
			waist="Plat. Mog. Belt",
			left_ear="Tuisto Earring",
			right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
			right_ring="Moonlight Ring",
			left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
			back="Moonlight Cape",
	}
	sets.midcast['Dread Spikes'].SIRD = set_combine(sets.midcast['Dread Spikes'],sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Ignominy Burgeonet +3",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Heath. Sollerets +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Dignitary's Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
    back={ name="Niht Mantle", augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +18',}},
    }
	sets.midcast['Dark Magic'].SIRD = set_combine(sets.midcast['Dark Magic'],sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        -- neck="Sanctity Necklace",
        -- back="Niht Mantle",
        hands="Pavor Gauntlets",
        neck="Erra Pendant",
        ring1="Evanescence Ring", -- 10
        ring2="Kishar Ring",
        back="Chuparrosa Mantle",
    })
	sets.midcast.Absorb.SIRD = set_combine(sets.midcast.Absorb,sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})    
    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum",
        head="Fall. Burgeonet +3",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Rat. Sollerets +1",
        neck="Erra Pendant",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Digni. Earring",
        left_ring="Kishar Ring",
        right_ring="Stikini Ring +1",
        back={ name="Niht Mantle", augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +18',}},
    })
	sets.midcast.Stun.SIRD = set_combine(sets.midcast.Stun,sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})        

     -- Drain spells 
	 sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        neck="Erra Pendant",
        left_ear="Hirudinea Earring",
        waist="Austerity Belt +1",
        right_ring="Evanescence Ring",
    })
	sets.midcast.Drain.SIRD = set_combine(sets.midcast.Drain,sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
    sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {
        body={ name="Lugra Cloak +1", augments={'Path: A',}},
        hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
        neck="Erra Pendant",
        waist="Austerity Belt +1",
        right_ring="Evanescence Ring",
    })	
	sets.midcast.Aspir.SIRD = set_combine(sets.midcast.Aspir,sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
	sets.DrainWeapon = {}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	--sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 	
                   
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
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
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast.Phalanx,sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
    sets.midcast['Elemental Magic'] = {
        ammo="Ghastly Tathlum +1",
        head="Heath. Burgeon. +2",
        body="Sacro Breastplate",
        hands="Fall. Fin. Gaunt. +3",
        legs="Augury Cuisses +1",
        feet="Heath. Sollerets +2",
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Malignance Earring",
        ear2="Lugra Earring +1",
        ring1="Locus Ring",
        ring2="Metamor. Ring +1",
        back="Argocham. Mantle",
    }
	sets.midcast['Elemental Magic'].SIRD = set_combine(sets.midcast['Elemental Magic'],sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
        waist="Shinjutsu-no-Obi +1",
        })
    sets.magicburst = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Ghastly Tathlum +1",
        head="Heath. Burgeon. +2",
        body="Sacro Breastplate",
        hands="Fall. Fin. Gaunt. +3",
        legs="Augury Cuisses +1",
        feet="Heath. Sollerets +2",
        neck="Warder's Charm +1",
        waist="Orpheus's Sash",
        ear1="Halasz Earring",
        ear2="Malignance Earring",
        ring1="Mujin Band",
        ring2="Metamor. Ring +1",
    })
  
   sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Dark Magic'], {
    ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Ignominy Cuirass +3",
    hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Nyame Sollerets",
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    })
	sets.midcast['Enfeebling Magic'].SIRD = set_combine(sets.midcast['Enfeebling Magic'],sets.SIRD, {
		ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
	})
    sets.midcast['Enhancing Magic'] = {
    head="Befouled Crown",
    body="Shab. Cuirass +1",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
}
sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD, {
	ammo="Staunch Tathlum +1",
	legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
	feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	left_ear="Halasz Earring",
	left_ring="Evanescence Ring",
})
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Stone Gorget",
    legs="Haven Hose",
    left_ear="Earthcry Earring",
    waist="Siegel Sash",
})
sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast['Enhancing Magic'],sets.SIRD, {
    neck="Stone Gorget",
    legs="Haven Hose",
    left_ear="Earthcry Earring",
    waist="Siegel Sash",
})

    sets.midcast.Cure = {    ammo="Staunch Tathlum +1",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
    body="Jumalik Mail",
    hands="Macabre Gaunt. +1",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Austerity Belt +1",
    left_ear="Halasz Earring",
    right_ear="Mendi. Earring",
    right_ring="Defending Ring",
    left_ring="Naji's Loop",
    back="Solemnity Cape",}

    sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure,{
    ammo="Pemphredo Tathlum",
    legs="Augury Cuisses +1",
    neck="Reti Pendant",
    waist="Austerity Belt +1",
    right_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",} )
    
    sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure,{
        ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        left_ring="Evanescence Ring",
    })

	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
    sets.Phalanx_Received = set_combine(sets.midcast.Phalanx, {})

	
    sets.precast.RA = { ammo=empty,
        range="Trollbane",  
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        waist="Yemaya Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Purity Ring",
        right_ring="Ilabrat Ring",
    }
    sets.midcast.RA = { ammo=empty,
        range="Trollbane",  
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        waist="Yemaya Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Purity Ring",
        right_ring="Ilabrat Ring",
    }	
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        right_ring="Cornelia's Ring",
        left_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS.Dread  = sets.defense['Dread Spikes']
    sets.precast.WS.None  = {}
    sets.precast.WS.Proc = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {       
        head={ name="Nyame Helm", augments={'Path: B',}},
       body={ name="Nyame Mail", augments={'Path: B',}},
       hands={ name="Nyame Gauntlets", augments={'Path: B',}},
       legs="Nyame Flanchard",
       feet="Heath. Sollerets +2",
        })

    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    head="Heath. Burgeon. +2",
    neck="Abyssal Beads +2",
    right_ear="Heathen's Earring",
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
    sets.precast.WS.Judgment = set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS.Judgment.PDL = set_combine(sets.precast.WS.Judgment, {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS.Judgment.SC = set_combine(sets.precast.WS.Judgment, {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS.Judgment.None = {}

    sets.precast.WS['Vorpal Scythe'] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Hjarrandi Breast.",
        hands="Flam. Manopolas +2",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Thereoid Greaves",
        neck="Nefarious Collar +1",
        waist="Gerdr Belt",
        left_ear="Schere Earring",
        right_ear="Brutal Earring",
        left_ring="Hetairoi Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    sets.precast.WS['Vorpal Scythe'].None = {}
    sets.precast.WS['Power Slash'] = set_combine(sets.precast.WS['Vorpal Scythe'], {})
    sets.precast.WS['Power Slash'].None = {}
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Catastrophe'] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ear="Thrud Earring",
        right_ring="Cornelia's Ring",
        left_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Catastrophe'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS['Catastrophe'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Catastrophe'].PDL = set_combine(sets.precast.WS['Catastrophe'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",

    })
    sets.precast.WS['Catastrophe'].SC = set_combine(sets.precast.WS['Catastrophe'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Catastrophe'].None = {}

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Catastrophe'].PDL, {})
    sets.precast.WS['Savage Blade'].SC = set_combine(sets.precast.WS['Catastrophe'].SC, {})
    sets.precast.WS['Savage Blade'].None = {}


    sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].Acc = set_combine(sets.precast.WS.Acc, {
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].PDL = set_combine(sets.precast.WS['Spiral Hell'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Spiral Hell'].SC = set_combine(sets.precast.WS['Spiral Hell'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Spiral Hell'].None = {
    }
sets.precast.WS['Insurgency'] = {
    ammo="Knobkierrie",
    head="Hjarrandi Helm",
    body="Nyame Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Nyame Flanchard",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Balder Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Insurgency'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",    })
    sets.precast.WS['Insurgency'].PDL = set_combine(sets.precast.WS['Insurgency'], {
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })

    sets.precast.WS['Insurgency'].SC = set_combine(sets.precast.WS['Insurgency'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},  })
    sets.precast.WS['Insurgency'].None = {}
    sets.precast.WS['Cross Reaper'] = {
        ammo="Knobkierrie",
        head="Hjarrandi Helm",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
  
    sets.precast.WS['Cross Reaper'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'], {
    })
    sets.precast.WS['Cross Reaper'].PDL = set_combine(sets.precast.WS['Cross Reaper'], {
        head="Heath. Burgeon. +2",
        neck="Abyssal Beads +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Cross Reaper'].SC = set_combine(sets.precast.WS['Cross Reaper'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Cross Reaper'].None = {
    }
sets.precast.WS['Quietus'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
} 
sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Quietus'], {
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
})
sets.precast.WS['Quietus'].PDL = set_combine(sets.precast.WS['Quietus'], {
    head="Heath. Burgeon. +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    right_ring="Sroda Ring",
})
sets.precast.WS['Quietus'].SC = set_combine(sets.precast.WS['Quietus'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Quietus'].None =  {
}
sets.precast.WS['Entropy'] = {
    ammo="Knobkierrie",
    head="Hjarrandi Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    right_ear="Balder Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back="Null Shawl",
} 
sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS['Entropy'], {})

sets.precast.WS['Entropy'].PDL = set_combine(sets.precast.WS['Entropy'], {
    ammo="Crepuscular Pebble",
    head="Heath. Burgeon. +2",
    neck="Abyssal Beads +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    left_ring="Sroda Ring",
})
sets.precast.WS['Entropy'].SC = set_combine(sets.precast.WS['Entropy'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Entropy'].None =  {}
sets.precast.WS['Infernal Scythe'] = {   
ammo="Pemphredo Tathlum",
head="Pixie Hairpin +1",
body="Nyame Mail",
hands="Nyame Gauntlets",
legs="Nyame Flanchard",
feet="Nyame Sollerets",
neck="Sibyl Scarf",
waist="Orpheus's Sash",
left_ear="Friomisi Earring",
right_ear="Malignance Earring",
left_ring="Archon Ring",
right_ring="Cornelia's Ring",
back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Infernal Scythe'].Dread  = sets.defense['Dread Spikes']
sets.precast.WS['Infernal Scythe'].Acc = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Infernal Scythe'].PDL = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Infernal Scythe'].SC = set_combine(sets.precast.WS['Infernal Scythe'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Infernal Scythe'].None = {}
sets.precast.WS['Shadow of Death'] = set_combine(sets.precast.WS['Infernal Scythe'], {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].Acc = set_combine(sets.precast.WS['Infernal Scythe'], {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].PDL = set_combine(sets.precast.WS['Infernal Scythe'].PDL, {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].SC = set_combine(sets.precast.WS['Infernal Scythe'].SC, {neck="Sibyl Scarf",})
sets.precast.WS['Shadow of Death'].None = {}
sets.precast.WS['Dark Harvest'] = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Dark Harvest'].None = {}

sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Infernal Scythe'], {})
sets.precast.WS['Freezebite'] = set_combine(sets.precast.WS['Infernal Scythe'], {
    ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
    sets.precast.WS['Freezebite'].None = {}

sets.precast.WS['Frostbite'] = set_combine(sets.precast.WS['Infernal Scythe'], {
    ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},})
sets.precast.WS['Frostbite'].None = {}

sets.precast.WS['Nightmare Scythe'] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Olseni Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}

    sets.precast.WS['Nightmare Scythe'].None = {}

    sets.precast.WS['Resolution'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back="Null Shawl",
}
  
    sets.precast.WS['Resolution'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Resolution'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Resolution'].None  = {}

    sets.precast.WS['Sickle Moon'] = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Sickle Moon'].None =  {}

    sets.precast.WS['Ground Strike'] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
        neck="Abyssal Beads +2",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Lugra Earring +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Cornelia's Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    } 
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS['Ground Strike'], {
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Ground Strike'].PDL = set_combine(sets.precast.WS['Ground Strike'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Ground Strike'].SC = set_combine(sets.precast.WS['Ground Strike'], {
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +2",
    })
    sets.precast.WS['Ground Strike'].None =  {}
    sets.precast.WS['Scourge'] = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Scourge'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Scourge'].PDL = set_combine(sets.precast.WS['Torcleaver'], {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
      
    sets.precast.WS['Torcleaver'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Cornelia's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }       
    sets.precast.WS['Torcleaver'].Dread  = sets.defense['Dread Spikes']
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].PDL = set_combine(sets.precast.WS['Torcleaver'], {
        head="Heath. Burgeon. +2",
        right_ear="Heathen's Earring",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Torcleaver'].SC = set_combine(sets.precast.WS['Torcleaver'], {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Torcleaver'].None = {}
    sets.precast.WS['Spinning Scythe'] = {
        ammo="Crepuscular Pebble",
        head="Heath. Burgeon. +2",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Abyssal Beads +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Spinning Scythe'].PDL = set_combine(sets.precast.WS['Spinning Scythe'], {
        head="Heath. Burgeon. +2",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        right_ear="Heathen's Earring",
        right_ring="Sroda Ring",
})
sets.precast.WS['Spinning Slash'] = set_combine(sets.precast.WS['Spinning Scythe'], {
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Lugra Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Cornelia's Ring",})

sets.precast.WS['Spinning Slash'].SC = set_combine(sets.precast.WS['Spinning Scythe'], {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})
sets.precast.WS['Spinning Slash'].PDL = set_combine(sets.precast.WS['Spinning Scythe'], {
    head="Heath. Burgeon. +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    right_ear="Heathen's Earring",
    right_ring="Sroda Ring",
})
 
-- Elemental Weapon Skill --elemental_ws-- get from Mote-Mappings

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
    left_ear="Friomisi Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Cornelia's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

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
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
sets.precast.WS["Burning Blade"].None = {}

sets.precast.WS["Shining Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Burning Blade"],{})

sets.precast.WS["Gust Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Shining Strike"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Seraph Strike"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Flash Nova"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Thunder Thrust"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Raiden Thrust"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Earth Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Rock Crusher"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Starburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Sunburst"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Flaming Arrow"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Tachi: Jinpu"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Tachi: Jinpu"].None = {}

sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Aeolian Edge"].None = {}

sets.precast.WS["Cyclone"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Cyclone"].None = {}

sets.precast.WS["Red Lotus Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Red Lotus Blade"].None = {}

sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Herculean Slash"].None = {}
sets.precast.WS["Crescent Moon"] = set_combine(sets.precast.WS,{})
sets.precast.WS["Crescent Moon"].None = {}
sets.precast.WS["Hard Slash"] = set_combine(sets.precast.WS,{})
sets.precast.WS["Hard Slash"].None = {}
sets.precast.WS["Fast Blade"] = set_combine(sets.precast.WS,{})
sets.precast.WS["Fast Blade"].None = {}

sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, {
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
sets.precast.WS["Shield Break"] = set_combine(sets.precast.WS["Armor Break"], {})
sets.precast.WS["Weapon Break"] = set_combine(sets.precast.WS["Armor Break"], {})
sets.precast.WS["Full Break"] = set_combine(sets.precast.WS["Armor Break"], {})
sets.precast.WS["Shell Crusher"] = set_combine(sets.precast.WS["Armor Break"], {})


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
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Telos Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},}
     

    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail",}
    sets.MP = {neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",}

    -- Defense sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Adamantite Armor",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.HP = {
        ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",
        body="Adamantite Armor",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
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
        waist="Carrier's Sash",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    }
sets.defense['Dread Spikes'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ratri Sallet +1",
    body="Heath. Cuirass +2",
    hands="Rat. Gadlings +1",
    legs="Ratri Cuisses +1",
    feet="Rat. Sollerets +1",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

sets.defense.SEboost = {
    ammo="Eluder's Sachet",
    head="Ratri Sallet +1",
    body="Ratri Plate +1",
    hands="Rat. Gadlings +1",
    legs="Ratri Cuisses +1",
    feet="Rat. Sollerets +1",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.MDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Plat. Mog. Belt",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ring="Shadow Ring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.Enmity = {
        ammo="Iron Gobbet",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body="Crepuscular Mail",
        hands="Macabre Gaunt. +1",
        legs={ name="Odyssean Cuisses", augments={'Attack+29','"Fast Cast"+5','CHR+10',}},
        feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Cryptic Earring",
        right_ear="Trux Earring",
        left_ring="Vengeful Ring",
        right_ring="Petrov Ring",
        back="Reiki Cloak",
    }
    sets.defense.Reraise = set_combine(sets.defense.PDT, {
        ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    head="Crepuscular Helm",
    body="Crepuscular Mail",
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
})
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Eabani Earring",
		right_ear="Sanare Earring",
		left_ring="Shadow Ring",
		right_ring="Archon Ring",
		back="Moonlight Cape",}

    sets.defense.Aminon = {
        ammo="Staunch Tathlum +1",
        head="Ratri Sallet +1",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Macabre Gaunt. +1", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Carrier's Sash",
        left_ear="Eabani Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Defending Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
        head="Null Masque",
		body="Jumalik Mail",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        waist="Null Belt",
		ear1="Genmei Earring",ear2="Ethereal Earring",
		ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
		
    sets.idle.Refresh = set_combine(sets.idle, {       
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
	})
	sets.idle.Regen = { 
		ammo="Staunch Tathlum +1",
        head="Null Masque",
		body="Sacro Breastplate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet="Volte Sollerets",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Null Belt",
		left_ear="Infused Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.idle.PDT = {
	ammo="Staunch Tathlum +1",
	head={ name="Sakpata's Helm", augments={'Path: A',}},
	body="Adamantite Armor",
	hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
	feet={ name="Sakpata's Leggings", augments={'Path: A',}},
	neck={ name="Loricate Torque +1", augments={'Path: A',}},
	waist="Carrier's Sash",
	left_ear="Eabani Earring",
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	right_ring="Moonlight Ring",
	back="Moonlight Cape",
    }
	sets.idle.Tank = sets.idle.PDT
    sets.idle.DT = sets.idle.PDT

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
	sets.idle.Sphere = set_combine(sets.idle, {})

	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
           
	
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged ={
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Flam. Zucchetto +2",
		body="Crepuscular Mail",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Ignominy Flanchard +3",
		feet="Flam. Gambieras +2",
		neck="Abyssal Beads +2",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		right_ring="Moonlight Ring",
		left_ring="Chirich Ring +1",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
    sets.engaged.TP = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'"Store TP"+7','Accuracy+10','Attack+4',}},
        hands="Sakpata's Gauntlets",
        legs="Ig. Flanchard +3",
        feet="Carmine Greaves +1",
        neck="Vim Torque +1",
        waist="Ioskeha Belt +1",
        ear1="Brutal Earring",
        ear2="Dedition Earring",
        ring1="Petrov Ring",
        ring2="Niqmaddu Ring",
        back="Null Shawl",
	}
	sets.engaged.STP = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body={ name="Valorous Mail", augments={'"Store TP"+7','Accuracy+10','Attack+4',}},
        hands="Sakpata's Gauntlets",
        legs="Ig. Flanchard +3",
        feet="Carmine Greaves +1",
        neck="Vim Torque +1",
        waist="Ioskeha Belt +1",
        ear1="Schere Earring",
        ear2="Dedition Earring",
        ring1="Petrov Ring",
        ring2="Niqmaddu Ring",
        back="Null Shawl",
	}
	sets.engaged.DA = set_combine(sets.engaged, {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Flam. Zucchetto +2",
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Ignominy Flanchard +3",
		feet="Flam. Gambieras +2",
		neck="Abyssal Beads +2",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Brutal Earring",
		right_ear="Schere Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
        back="Null Shawl",
	})
	sets.engaged.CRIT = set_combine(sets.engaged, {
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Hjarrandi Breast.",
		hands="Flam. Manopolas +2",
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Thereoid Greaves",
		neck="Nefarious Collar +1",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Schere Earring",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	
	sets.engaged.PD = set_combine(sets.engaged, {
		ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Ignominy Flanchard +3",
		feet="Flam. Gambieras +2",
		neck="Abyssal Beads +2",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Cessance Earring",
		right_ear="Dedition Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	})
		  
	sets.engaged.Acc = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Heath. Burgeon. +2",
        body="Crepuscular Mail",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Ignominy Flanchard +3",
        feet="Flam. Gambieras +2",
        neck="Null Loop",
        waist="Ioskeha Belt +1",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
        }
	
	sets.engaged.SubtleBlow = set_combine(sets.engaged, {        
		ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body="Dagon Breast.",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Digni. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
		  

    ---------------------------------------- DW-HASTE ------------------------------------------

	sets.DW =  {
		left_ear="Suppanomimi",  --5
		right_ear="Eabani Earring",
	
	}
	sets.engaged.DW = set_combine(sets.engaged, sets.DW)
	
	sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, sets.DW)
	sets.engaged.DW.STP = set_combine(sets.engaged.STP, sets.DW)
	sets.engaged.DW.DA = set_combine(sets.engaged.DA, sets.DW)
	sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, sets.DW)
	


------------------------------------------------------------------------------------------------
---------------------------------------- AM3 Sets -------------------------------------------
------------------------------------------------------------------------------------------------
--[[
	sets.engaged.Caladbolg.AM = {
		ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands="Flam. Manopolas +2",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}
		
	sets.engaged.Apocalypse.AM = {
			ammo="Aurgelmir Orb +1",
			head="Hjarrandi Helm",
			body="Hjarrandi Breast.",
			hands="Flam. Manopolas +2",
			legs="Sulev. Cuisses +2",
			feet="Flam. Gambieras +2",
			neck={ name="Abyssal Beads +2", augments={'Path: A',}},
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Dedition Earring",
			right_ear="Telos Earring",
			left_ring="Chirich Ring +1",
			right_ring="Niqmaddu Ring",
			back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}
	
	sets.engaged.Liberator.AM = {
				ammo="Aurgelmir Orb +1",
			head="Hjarrandi Helm",
			body="Hjarrandi Breast.",
			hands="Flam. Manopolas +2",
			legs="Sulev. Cuisses +2",
			feet="Flam. Gambieras +2",
			neck={ name="Abyssal Beads +2", augments={'Path: A',}},
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Telos Earring",
			right_ear="Dedition Earring",
			left_ring="Hetairoi Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}	]]
	--sets.engaged.Liberator.AM.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
	--sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
	--sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
	--sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
	
		
------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------


sets.engaged.Hybrid = {
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
sets.engaged.DA.DT = set_combine(sets.engaged.DA, sets.engaged.Hybrid)
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)
sets.engaged.SubtleBlow.DT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid, {
    body="Dagon Breast.",
    left_ring="Defending Ring",
})
sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
sets.engaged.DW.DA.DT = set_combine(sets.engaged.DW.DA, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)
   


	--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
		legs="Shabti Cuisses +1",
	})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}

	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(7, 4)
    elseif player.sub_job == 'SAM' then
        set_macro_page(7, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(7, 4)
    elseif player.sub_job == 'THF' then
        set_macro_page(7, 4)
    else
        set_macro_page(7, 4)
    end
end

function user_job_lockstyle()
    if res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
        windower.chat.input('/lockstyleset 152')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 4 then --Great Sword in main hand.
        windower.chat.input('/lockstyleset 165')
    else
        windower.chat.input('/lockstyleset 165') --Catchall
    end
end

autows_list = {['Caladbolg']='Torcleaver',['Liberator']='Insurgency',['Anguta']='Cross Reaper',['Apocalypse']='Catastrophe',
     ['Drepanum']='Spiral Hell',['AgwuClaymore']='Resolution',['Lycurgos']='Fell Cleave',['DualNaegling']='Savage Blade',
     ['DualLoxotica']='Judgment',['DualTernionDagger']='Aeolian Edge',['DualDolichenus']='Decimation',
     ['Naegling']='Savage Blade',['Loxotic']='Judgment',['TernionDagger']='Aeolian Edge',['Dolichenus']='Decimation'}


     
function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
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
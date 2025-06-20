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

----- buff -----
--[[
usage : for AutoBuffMode u find buff_spell_lists in blu.lua last down line
add
	state.AutoBuffMode:options('Off','Auto','Cleave') or any

bind add any like

	send_command('bind ^f2 gs c toggle AutoBuffMode')

	----
for buffup 

gc c buffup name 

like 
gc c buffup mp 

bind add any like

	send_command('bind !f2 gs c buffup')


]]

function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'CRIT')--, 'Learning'
	state.HybridMode:options('DT','Normal')
    state.WeaponskillMode:options('Match', 'SubtleBlow','PDL', 'SC','Proc')
    state.CastingMode:options('Normal', 'SIRD', 'ConserveMP', 'Duration', 'DT','Proc')
    state.IdleMode:options('DT','Normal','Empy','MDT', 'Evasion','Regen','Regain', 'HP', 'EnemyCritRate', 'Enmity')--, 'Learning'
	state.Passive:options('None','Resist','Refresh','Empy', 'SubtleBlow', 'SubtleBlow40', 'SubtleBlow50')--, 'EnemyCritRate', 'Regen'
	state.PhysicalDefenseMode:options('PDT', 'Evasion', 'Enmity')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Naegling', 'Naegling2','None', 'Maxentius', 'Nuking', 'MaccWeapons','Staff','proc')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}
	state.AutoBuffMode:options('Off','Auto','Cleave','Vagary','VagaryParty','melee','Defend') --,'Vagary','Off','Off','Off','Off',

	gear.wsd_jse_back = {}

	autows = 'Expiacion'

    --use //listbinds    .. to show command keys
    -- Additional local binds
    send_command('lua l azureSets')
    send_command('bind f7 input //Sublimator')
    send_command('bind f3 gs c cycle Storms')
    send_command('bind f2 input //gs c Storms')	
	--send_command('bind ^` input /ja "Chain Affinity" <me>')
	--send_command('bind @` input /ja "Efflux" <me>')
	--send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	--send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	--send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind ^0 input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind ^9 input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !0 gs c weapons None;gs c update')
	send_command('bind @9 gs c weapons MaccWeapons;gs c update')
	send_command('bind ^9 gs c weapons Almace;gs c update')
	send_command('bind !9 gs c weapons HybridWeapons;gs c update')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('alias destroy setkey down down;')
	--send_command('bind ^f2 gs c toggle AutoBuffMode')
    send_command('bind ` gs c cycle Spellset;')
    send_command('bind @` gs c cycleback Spellset;')
    send_command('bind ^` gs c Spellset')
	send_command('bind @6 gs c toggle AutoBLUSpam')

	send_command('bind !` input //lua l bluguide') --Turns addon on .addon 

	
    send_command('alias lamp input /targetnpc;wait .1; input //tradenpc 1 "Smoldering Lamp";wait 1.4;setkey numpadenter down;wait 0.1;setkey numpadenter up;wait .1;setkey up down;wait .1;setkey up up;wait .1;setkey numpadenter down;wait 0.1;setkey numpadenter up;wait .1;setkey right down;wait .4;setkey right up;wait .1;setkey numpadenter down;wait .1;setkey numpadenter up;')  --//lamp
    send_command('alias glowing input /targetnpc;wait .1; input //tradenpc 1 "Glowing Lamp";wait 1.8;setkey up down;wait .1;setkey up up;wait .1;setkey numpadenter down;wait 0.1;setkey numpadenter up;') -- //glowing 
	


	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------


	gear.taeon_phalanx_feet= {name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}}
	gear.taeon_dw_feet= {name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}}
	
	-- Weapons sets
    sets.weapons.Naegling = {main="Naegling", sub="Thibron"}
    sets.weapons.Naegling2 = {main="Naegling", sub="Zantetsuken"}
    sets.weapons.Maxentius = {main="Maxentius", sub="Thibron"}
    sets.weapons.Nuking = {main="Maxentius", sub="Bunzi's Rod"}
    sets.weapons.MaccWeapons = {main="Iris", sub="Iris",}
	sets.weapons.Staff = {main="Gozuki Mezuki",sub="Niobid Strap"}
	sets.weapons.proc = {main="Fermion Sword",sub="Trainee Sword",}




 -- neck JSE Necks Reinf
 sets.RP = {}


    sets.Enmity = {
        ammo="Sapience Orb", --2
        head="Halitus Helm", --8
        body="Emet Harness +1", --10
        hands="Kurys Gloves", --9
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet="Ahosi Leggings", --7
        neck="Unmoving Collar +1", --10
        ear1="Cryptic Earring", --4
        ear2="Trux Earring", --5
		left2="Eihwaz Ring",
        right2="Vengeful Ring",
        back="Reiki Cloak",
    }

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--
    -- Precast Sets


    sets.precast.JA['Sublimation'] = {
    }
    sets.precast.JA['Provoke'] = sets.Enmity

    sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +3", feet="Hashi. Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +2", }
    sets.buff.Convergence = {head="Luh. Keffiyeh +3"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
    sets.buff.Enchainment = {}
    sets.buff.Efflux = {legs="Hashishin Tayt +3",}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Jhakri Robe +2",hands="Telchine Gloves",ring1="Mephitas's Ring +1",ring2="Menelaus's Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = { body="Passion Jacket", 
    waist="Gishdubar Sash",
    right_ear="Mendi. Earring",
    legs="Dashing Subligar",}
	
	sets.Self_Waltz = sets.precast.Waltz

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {  head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
	body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
	back="Moonlight Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.precast.Flourish1 = 	sets.precast.Step

	-- Fast cast sets for spells

	sets.precast.FC = {        ammo="Sapience Orb",
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
	body="Pinga Tunic +1",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	legs="Pinga Pants +1",
	feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
	neck="Orunmila's Torque",
	waist="Witful Belt",
	left_ear="Etiolation Earring",
	right_ear="Loquac. Earring",
	left_ring="Kishar Ring",
	right_ring="Prolix Ring",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}
	
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
	})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, { ear1="Mendi. Earring"})
	
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		waist="Rumination Sash",
	})
	--Ranged Attack
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

    --===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--                                                                               --
--===============================================================================--

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

sets.precast.WS = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS.SubtleBlow =  {
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
}
sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    ammo="Crepuscular Pebble",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    left_ring="Sroda Ring", 
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
})
sets.precast.WS.Proc =  {}

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
neck="Fotia Gorget",
waist="Fotia Belt",
right_ear="Brutal Earring",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
right_ring="Rufescent Ring",
back="Null Shawl"
})

sets.precast.WS['Requiescat'].PDL = set_combine(sets.precast.WS, {
    ammo="Crepuscular Pebble",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
})

sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Ishvara Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
    ammo="Crepuscular Pebble",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    left_ring="Sroda Ring", 
})
    
sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
    ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Gleti's Cuirass",
    hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Odr Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
    --sets.precast.WS['Chant du Cygn'].PDL = set_combine(sets.precast.WS['Chant du Cygn'], {
    --ammo="Crepuscular Pebble",
    --body="Gleti's Cuirass",
    --hands="Gleti's Gauntlets",
    --legs="Gleti's Breeches",
    --feet="Gleti's Boots",
    --left_ring="Sroda Ring", 
--})
sets.precast.WS['Chant du Cygne'].SC = set_combine(sets.precast.WS['Chant du Cygne'], {
    ammo="Crepuscular Pebble",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    left_ring="Sroda Ring", 
})
    
sets.precast.WS['Expiacion'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hashi. Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Expiacion'].PDL = set_combine(sets.precast.WS['Expiacion'], {
    ammo="Crepuscular Pebble",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    left_ring="Sroda Ring", 
    right_ear="Ishvara Earring",
})


--[[Club Weaponskill]]


sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
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
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
sets.precast.WS['Black Halo'].PDL = set_combine(sets.precast.WS['Black Halo'], {
        ammo="Crepuscular Pebble",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        left_ring="Sroda Ring", 
})

sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
sets.precast.WS['Vorpal Blade'].PDL = sets.precast.WS['Chant du Cygne'].PDL
sets.precast.WS['Realmrazer'] = sets.precast.WS['Requiescat']
sets.precast.WS['Realmrazer'].PDL = sets.precast.WS['Requiescat'].PDL

sets.precast.WS['Shattersoul'] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    left_ring="Rufescent Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Evasion+10','"Mag.Atk.Bns."+10','Evasion+15',}},
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Cornelia's Ring",
    right_ring="Freke Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Evasion+10','"Mag.Atk.Bns."+10','Evasion+15',}},
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

sets.precast.WS["Fast Blade"] =  set_combine(sets.precast.WS,{})
sets.precast.WS["Flat Blade"] =  set_combine(sets.precast.WS,{})

--[[

]]

sets.precast.WS["Savage Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Red Lotus Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Burning Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Fast Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Flat Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})

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
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.ConserveMP = {    
		ammo="Pemphredo Tathlum",
		body="Vedic Coat",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		left_ear="Calamitous Earring",
		waist="Austerity Belt +1",
	}
	sets.SIRD = {
		ammo="Staunch Tathlum +1",
		sub="Culminus",
		hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
		legs="Assim. Shalwar +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		left_ear="Halasz Earring",
		right_ring="Evanescence Ring",
		waist="Rumination Sash",
	}
	sets.DT={
		ammo="Staunch Tathlum +1",
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
		legs="Hashishin Tayt +3",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
	}

	sets.midcast.Duration = {
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}
	sets.midcast.FastRecast = {}
	sets.midcast.Utsusemi = sets.SIRD
	
	sets.midcast.RA = {
	ammo=empty,
	range="Trollbane",
	head="Malignance Chapeau",
	body="Nisroch Jerkin",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	}

	sets.midcast['Blue Magic'] = {  
		head="Luh. Keffiyeh +3",
		body="Assim. Jubbah +3",
		hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +3",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		right_ear="Hashi. Earring +1", 
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Cornflower Cape",
	}
	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {  ammo="Aurgelmir Orb +1",
    head="Gleti's Mask",
    body="Hashishin Mintan +2",
    hands="Hashishin Bazubands +2",
    legs="Hashishin Tayt +3",
    feet="Luhlaza Charuqs +3",
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear="Ethereal Earring",
    right_ear="Balder Earring +1",
    left_ring="Shukuyu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
	
	sets.midcast['Blue Magic'].Physical.SIRD = set_combine(sets.SIRD, sets.midcast['Blue Magic'].Physical)

	sets.midcast['Blue Magic'].Physical.Resistant = {}

	sets.midcast['Blue Magic'].Physical.Fodder = {}

	sets.midcast['Blue Magic'].PhysicalAcc = {    head="Gleti's Mask",
    body="Hashishin Mintan +2",
    hands="Hashishin Bazubands +2",
    legs="Hashishin Tayt +3",
    feet="Luhlaza Charuqs +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Olseni Belt",
    right_ear="Hashi. Earring +1",
    left_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Hashishin Kavuk +2",
    body="Hashishin Mintan +2",
    hands="Hashishin Bazubands +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Hashi. Basmak +2",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Jhakri Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Evasion+10','"Mag.Atk.Bns."+10','Evasion+15',}},}
		 
	sets.midcast['Blue Magic'].Magical.SIRD = set_combine(sets.SIRD, sets.midcast['Blue Magic'].Magical)

		 
	sets.midcast['Blue Magic'].Subduction = sets.midcast['Blue Magic'].Magical
					 
	sets.midcast['Blue Magic'].Magical.Proc = {}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].Magical.Fodder = {}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {    ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},   }
		
	sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
	sets.midcast['Blue Magic'].Subduction.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
	sets.midcast['Blue Magic']['Cruel Joke'] = {
		ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Crep. Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},   
	}
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {
		head=empty;
		body="Cohort Cloak +1",
	})
	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back="Null Shawl"
	})


	sets.midcast['Enhancing Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	}
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Regal Cuffs",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	})


	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Stone Gorget",
		legs="Haven Hose",
		left_ear="Earthcry Earring",
		waist="Siegel Sash"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	

	sets.midcast.Haste = {
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Protect

	sets.midcast['Divine Magic'] = sets.midcast['Enfeebling Magic']
	sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical
	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Blue Magic'].Magical

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Pinga Tunic +1",
		hands="Telchine Gloves",
		legs="Pinga Pants +1",
		feet="Medium's Sabots",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Eihwaz Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Moonlight Cape",
	}
	sets.midcast['Blue Magic']['White Wind'].SIRD = set_combine(sets.SIRD ,sets.midcast['Blue Magic'].MagicAccuracy, {})
	
	sets.midcast.Cure = sets.midcast['Blue Magic']['White Wind']
		
	sets.midcast.UnlockedCure = sets.midcast['Blue Magic']['White Wind']

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
	ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, { 
		ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",
	})

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})

	sets.midcast['Blue Magic'].Stun.Resistant = sets.midcast['Blue Magic'].Stun
	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic'].Healing = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Pinga Tunic +1",
    hands="Telchine Gloves",
    legs="Pinga Pants +1",
    feet="Medium's Sabots",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",}

	sets.midcast['Blue Magic'].Healing.SIRD = set_combine(sets.SIRD, sets.midcast['Blue Magic'].Healing)
	sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing, {
		waist="Gishdubar Sash", -- (10)
	})
	sets.self_healing.SIRD = set_combine(sets.midcast['Blue Magic'].Healing, {
		waist="Gishdubar Sash", -- (10)
	})
	sets.midcast['Blue Magic'].UnlockedHealing = sets.midcast['Blue Magic'].Healing

	sets.midcast['Blue Magic'].UnlockedAoEHealing = sets.midcast['Blue Magic'].Healing
					
	sets.midcast['Blue Magic'].AoEHealing = sets.midcast['Blue Magic'].Healing


	sets.midcast['Blue Magic'].SkillBasedBuff = {    ammo="Mavi Tathlum",
    head="Luh. Keffiyeh +3",
    body="Assim. Jubbah +3",
    hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
    legs="Hashishin Tayt +3",
    feet="Luhlaza Charuqs +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    right_ear="Hashi. Earring +1", 
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Cornflower Cape",}
	sets.midcast['Blue Magic'].SkillBasedBuff.SIRD = set_combine(sets.SIRD, sets.midcast['Blue Magic'].SkillBasedBuff) 

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
    head="Luh. Keffiyeh +3",
    body="Assim. Jubbah +3",
    hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
    legs="Hashishin Tayt +3",
    feet="Luhlaza Charuqs +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    right_ear="Hashi. Earring +1", 
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Cornflower Cape",}
	sets.midcast['Blue Magic'].Buff.SIRD = set_combine(sets.SIRD, sets.midcast['Blue Magic'].Buff) 

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {
		waist="Gishdubar Sash",
		feet="Inspirited Boots",
		back="Grapevine Cape",
	})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {hands="Regal Cuffs"})

	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		--main="Sakpata's Sword",
		ammo="Staunch Tathlum +1",
		head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	})
	sets.midcast.Phalanx.Duration = set_combine(sets.midcast.Duration, {})

	sets.midcast.Phalanx.SIRD = set_combine(sets.SIRD, sets.midcast.Phalanx) 
		
	sets.Phalanx_Received = {
		main="Sakpata's Sword",
		head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}


	sets.MagicBurst = set_combine(sets.midcast['Blue Magic'].Magical, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",        --(6)
		legs="Nyame Flanchard", --10
		feet="Hashi. Basmak +2",--15
		neck="Warder's Charm +1", --10
		--ear1="Static Earring",--5
		ring1="Mujin Band", --(5)
		ring2="Jhakri Ring", --5
		--back="Seshaw Cape", --5
	})
	

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {    hands="Malignance Gloves",}

	-- Resting sets
	sets.resting = {
		head="Null Masque",
		body="Shamash Robe",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Null Belt",
		left_ear="Infused Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",}


--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--                                 --
--=================================--

-- Idle sets
sets.idle = {     
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    back="Null Shawl",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Infused Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

sets.idle.Evasion = {
    ammo="Amar Cluster",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    left_ear="Infused Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Evasion+10','"Mag.Atk.Bns."+10','Evasion+15',}},
}
sets.idle.DT = {    
ammo="Staunch Tathlum +1",
head="Nyame Helm",
body="Adamantite Armor",
hands="Nyame Gauntlets",
legs="Nyame Flanchard",
feet="Nyame Sollerets",
neck={ name="Loricate Torque +1", augments={'Path: A',}},
waist="Flume Belt +1",
left_ear="Ethereal Earring",
right_ear="Genmei Earring",
right_ring="Defending Ring",
left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
back="Shadow Mantle",}

sets.idle.HP = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Eihwaz Ring",
    back="Moonlight Cape",
}

sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
    ammo="Eluder's Sachet",
    left_ring="Warden's Ring",
    right_ring="Fortified Ring",
    back="Reiki Cloak",
})
sets.idle.Regen = set_combine(sets.idle, {
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
	waist="Null Belt",
    right_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})


sets.idle.Regain = {
	head="Null Masque",
	body={ name="Gleti's Cuirass", augments={'Path: A',}},
	hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
	legs={ name="Gleti's Breeches", augments={'Path: A',}},
	feet={ name="Gleti's Boots", augments={'Path: A',}},
	neck="Rep. Plat. Medal",
	waist="Carrier's Sash",
	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Chirich Ring +1",
	right_ring="Defending Ring",
	back="Moonlight Cape",
}
sets.idle.MDT = set_combine(sets.defense.MDT, {})
sets.idle.Enmity = set_combine(sets.defense.Enmity, {})
sets.idle.Town = {legs="Carmine Cuisses +1",
left_ear="Infused Earring",}

sets.idle.Empy = set_combine(sets.idle, { 
head="Hashishin Kavuk +2",
body="Hashishin Mintan +2",
hands="Hashishin Bazubands +2",
legs="Hashishin Tayt +3",
feet="Hashi. Basmak +2",
})

sets.idle.Learning = set_combine(sets.idle, sets.Learning, { 
    main="Iris", 
    sub="Iris",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
})
 
    -- Defense sets
	sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Gleti's Mask", augments={'Path: A',}},
		body="Adamantite Armor",
		hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		feet="Gleti's Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Shadow Mantle",}
	
	sets.defense.Evasion = {
		main="Naegling",
		sub="Sakpata's Sword",
		ammo="Amar Cluster",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Svelt. Gouriz +1",
		left_ear="Infused Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Vengeful Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Evasion+10','"Mag.Atk.Bns."+10','Evasion+15',}},
	}
	
	sets.defense.Enmity = {
		ammo="Iron Gobbet",        --2
		head="Halitus Helm", --8
		body="Emet Harness +1", --10
		hands="Kurys Gloves", --9
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet="Ahosi Leggings", --7
		neck="Unmoving Collar +1", --10
		ear1="Cryptic Earring", --4
		ear2="Trux Earring", --5
		left_ring="Eihwaz Ring",
		right_ring="Vengeful Ring",
		back="Reiki Cloak",
	}
	
	sets.defense.MDT = { 
		ammo="Staunch Tathlum +1",
		head={ name="Gleti's Mask", augments={'Path: A',}},
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Sanare Earring",
		left_ring="Defending Ring",
		left_ring="Shadow Ring",
		back="Moonlight Cape",
	}

    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Gleti's Breeches",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	
--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--                                                                      --
--======================================================================--

	sets.Kiting = {legs="Carmine Cuisses +1"}

------------------------------------------------------------------------------------------------
---------------------------------------- Special Sets ------------------------------------------
------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------	
---- _____    ____    _   _   _____    _____   _______   _____    ____    _   _              _      ----
--  / ____|  / __ \  | \ | | |  __ \  |_   _| |__   __| |_   _|  / __ \  | \ | |     /\     | |       --
-- | |      | |  | | |  \| | | |  | |   | |      | |      | |   | |  | | |  \| |    /  \    | |       --
-- | |      | |  | | | . ` | | |  | |   | |      | |      | |   | |  | | | . ` |   / /\ \   | |       --
-- | |____  | |__| | | |\  | | |__| |  _| |_     | |     _| |_  | |__| | | |\  |  / ____ \  | |____   --
--  \_____|  \____/  |_| \_| |_____/  |_____|    |_|    |_____|  \____/  |_| \_| /_/    \_\ |______|  --
----																								----
--------------------------------------------------------------------------------------------------------
-- Extra Melee sets.  Apply these on top of melee sets.
sets.Knockback = {}
sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
sets.MP_Knockback = {}
sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
sets.DWEarrings = {ear1="Suppanomimi",ear2="Eabani Earring"}
sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
sets.rollerRing = {left_ring="Roller's Ring"}


-- Passive set

sets.passive.Resist ={
	ammo="Staunch Tathlum +1",
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Carrier's Sash",
}
sets.passive.Empy = { 
	head="Hashishin Kavuk +2",
	body="Hashishin Mintan +2",
	hands="Hashishin Bazubands +2",
	legs="Hashishin Tayt +3",
	feet="Hashi. Basmak +2",
}
	
sets.passive.Refresh = { 
	body="Shamash Robe",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
}


sets.passive.SubtleBlow = {
left_ring="Chirich Ring +1",
right_ring="Chirich Ring +1",
}
sets.passive.SubtleBlow40 = {
body="Volte Harness",
neck={ name="Bathy Choker +1", augments={'Path: A',}},
left_ring="Chirich Ring +1",
right_ring="Chirich Ring +1",
}
sets.passive.SubtleBlow50 = {
body="Volte Harness",
neck={ name="Bathy Choker +1", augments={'Path: A',}},
left_ear="Digni. Earring",
left_ring="Chirich Ring +1",
right_ring="Chirich Ring +1",
}
--[[
sets.Passive.EnemyCritRate = { 
ammo="Eluder's Sachet",
left_ring="Warden's Ring",
right_ring="Fortified Ring",
back="Reiki Cloak",
}
sets.Passive.Regen = {
neck={ name="Bathy Choker +1", augments={'Path: A',}},
waist="Null Belt",
right_ear="Infused Earring",
left_ring="Chirich Ring +1",
right_ring="Chirich Ring +1",
}
]]
	
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--                                                    --
--====================================================--

	-- Engaged sets

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Dampening Tam",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		right_ear="Dedition Earring",
		left_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, 
	}
	sets.engaged.DPL = set_combine(sets.engaged, {
		neck="Clotharius Torque",
		right_ear="Mache Earring +1",
		waist="Windbuffet Belt +1",
	})
		
	sets.engaged.Acc = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Null Shawl",
	}
	sets.engaged.STP = set_combine(sets.engaged, {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		waist="Gerdr Belt",
		back="Null Shawl",
	})
	
	sets.engaged.CRIT = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		body="Gleti's Cuirass",
		hands="Adhemar Wrist. +1",
		legs="Zoar Subligar +1",
		feet="Thereoid Greaves",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		ring1="Hetairoi Ring",
		ring2="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.engaged.SubtleBlow = set_combine(sets.engaged ,{
		right_ear="Cessance Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})
	
	sets.engaged.Refresh = set_combine(sets.engaged, { 
			body="Shamash Robe",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
	})
	sets.engaged.Learning = { 
		ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",
		body="Assim. Jubbah +3",
		hands="Malignance Gloves", --5/5
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +3",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		right_ear="Hashi. Earring +1", 
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}

	

------------------------------------------------------------------------------------------------
    ---------------------------------------- DW ------------------------------------------
------------------------------------------------------------------------------------------------
    -- Base Dual-Wield Values:
    -- * DW6: +37%
    -- * DW5: +35%
    -- * DW4: +30%
    -- * DW3: +25% (NIN Subjob)
    -- * DW2: +15% (DNC Subjob)
    -- * DW1: +10%
    -- No Magic Haste (74% DW to cap)

    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

	sets.engaged.DW = {
		ammo="Aurgelmir Orb +1",
		head="Dampening Tam",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		right_ear="Dedition Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}
	
	sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})
		
	sets.engaged.DW.STP = set_combine(sets.engaged.STP, {
		left_ear="Suppanomimi",
		waist="Gerdr Belt",
	})
	sets.engaged.DW.DPL = set_combine(sets.engaged.DPL, {
		head="Dampening Tam",
		left_ear="Suppanomimi",
	})
	
	sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, {
		ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Thereoid Greaves",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Gerdr Belt",
		left_ear="Suppanomimi",
		right_ear="Odr Earring",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})
	sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.SubtleBlow,{
		right_ear="Cessance Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})
	
	sets.engaged.DW.Refresh =  set_combine(sets.engaged.Refresh, { 
		body="Shamash Robe",
		left_ear="Suppanomimi",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	})
		
	sets.engaged.DW.Learning =  set_combine(sets.engaged.DW, sets.Learning, {
		head="Luh. Keffiyeh +3",
		body="Assim. Jubbah +3",
		hands="Malignance Gloves", --5/5
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +3",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		right_ear="Hashi. Earring +1", 
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	})

	
------------------------------------------------------------------------------------------------
    ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------

    -- 15% Magic Haste (67% DW to cap)

sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs="Carmine Cuisses +1", --6
	feet=gear.taeon_dw_feet, --9
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 37%

sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.Acc, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs="Carmine Cuisses +1", --6
	feet=gear.taeon_dw_feet, --9
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 37%

sets.engaged.DW.STP.LowHaste = set_combine(sets.engaged.DW.STP, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs="Carmine Cuisses +1", --6
	feet=gear.taeon_dw_feet, --9
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 37%
sets.engaged.DW.CRIT.LowHaste = set_combine(sets.engaged.DW.CRIT, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs="Carmine Cuisses +1", --6
	feet=gear.taeon_dw_feet, --9
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 37%
sets.engaged.DW.Refresh.LowHaste = set_combine(sets.engaged.DW.Refresh, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs="Carmine Cuisses +1", --6
	feet=gear.taeon_dw_feet, --9
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 37%


--MID-HASTE
sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 22%

sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.Acc, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 22%

sets.engaged.DW.STP.MidHaste = set_combine(sets.engaged.DW.STP, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 22%
sets.engaged.DW.CRIT.MidHaste = set_combine(sets.engaged.DW.CRIT, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 22%
sets.engaged.DW.Refresh.MidHaste = set_combine(sets.engaged.DW.Refresh, {
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
}) -- 22%
sets.engaged.DW.SubtleBlow.MidHaste = set_combine(sets.engaged.DW.SubtleBlow,{
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    ear2="Eabani Earring", --5
    ear1="Suppanomimi", --4
    waist="Reiki Yotai", --7
})

--MAX-HASTE

sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW, {})
sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.Acc)
sets.engaged.DW.STP.MaxHaste = set_combine(sets.engaged.DW.STP)
sets.engaged.DW.CRIT.MaxHaste = set_combine(sets.engaged.DW.CRIT)
sets.engaged.DW.Refresh.MaxHaste = set_combine(sets.engaged.DW.Refresh)
sets.engaged.DW.Learning.MaxHaste = set_combine(sets.engaged.DW.Learning)
sets.engaged.DW.SubtleBlow.MaxHaste = set_combine(sets.engaged.DW.SubtleBlow, {})


	
------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.Hybrid = {
    head="Malignance Chapeau", --6/6
    body="Malignance Tabard", --9/9
    hands="Malignance Gloves", --5/5
    legs="Malignance Tights", --7/7
    feet="Malignance Boots", --4/4
    left_ring="Defending Ring", --10/10
    --waist="Reiki Yotai",
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid, {})
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid, {})
sets.engaged.Refresh.DT = set_combine(sets.engaged.Refresh, sets.engaged.Hybrid, {})
sets.engaged.SubtleBlow.DT = set_combine(sets.engaged.SubtleBlow ,sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.engaged.Learning.DT = set_combine(sets.engaged.Learning, sets.engaged.Hybrid, {
    ammo="Staunch Tathlum +1",
    head={ name="Luh. Keffiyeh +3", augments={'Enhances "Convergence" effect',}},
    body="Assim. Jubbah +3",
    hands="Malignance Gloves", --5/5
    legs="Hashishin Tayt +3",
    feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Genmei Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

------------------------------------------------------------------------------------------------
---------------------------------------- DW-HASTE Hybrid Sets-----------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid, {})
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid, {})
sets.engaged.DW.Refresh.DT = set_combine(sets.engaged.DW.Refresh, sets.engaged.Hybrid, {})
sets.engaged.DW.Learning.DT = set_combine(sets.engaged.DW.Learning, sets.engaged.Learning.DT, {})
sets.engaged.DW.SubtleBlow.DT = set_combine(sets.engaged.DW.SubtleBlow ,sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})

sets.engaged.DW.DT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.STP.DT.LowHaste = set_combine(sets.engaged.DW.STP.LowHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.CRIT.DT.LowHaste = set_combine(sets.engaged.DW.CRIT.LowHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Refresh.DT.LowHaste = set_combine(sets.engaged.DW.Refresh.LowHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Learning.DT.LowHaste = set_combine(sets.engaged.DW.Learning.LowHaste, sets.engaged.Learning.DT, {})
sets.engaged.DW.SubtleBlow.DT.LowHaste = set_combine(sets.engaged.DW.SubtleBlow.LowHaste ,sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.engaged.DW.DT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.STP.DT.MidHaste = set_combine(sets.engaged.DW.STP.MidHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.CRIT.DT.MidHaste = set_combine(sets.engaged.DW.CRIT.MidHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Refresh.DT.MidHaste = set_combine(sets.engaged.DW.Refresh.MidHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Learning.DT.MidHaste = set_combine(sets.engaged.DW.Learning.MidHaste, sets.engaged.Learning.DT, {})
sets.engaged.DW.SubtleBlow.DT.MidHaste = set_combine(sets.engaged.DW.SubtleBlow.MidHaste ,sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.engaged.DW.DT.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.STP.DT.MaxHaste = set_combine(sets.engaged.DW.STP.MaxHaste, sets.engaged.Hybrid, {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
sets.engaged.DW.CRIT.DT.MaxHaste = set_combine(sets.engaged.DW.CRIT.MaxHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Refresh.DT.MaxHaste = set_combine(sets.engaged.DW.Refresh.MaxHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.Learning.DT.MaxHaste = set_combine(sets.engaged.DW.Learning.MaxHaste, sets.engaged.Hybrid, {})
sets.engaged.DW.SubtleBlow.DT.MaxHaste = set_combine(sets.engaged.DW.SubtleBlow.MaxHaste ,sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",})

-------------------

end
function user_job_lockstyle()
    if res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
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
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
        set_macro_page(6, 18)
	elseif player.sub_job == "SCH" then
        set_macro_page(8, 18)
	elseif player.sub_job == 'NIN' then
        set_macro_page(6, 18)
	elseif player.sub_job == 'WAR' then
        set_macro_page(6, 18)
	elseif player.sub_job == 'RUN' then
        set_macro_page(6, 18)
	elseif player.sub_job == 'THF' then
        set_macro_page(6, 18)
	elseif player.sub_job == 'RDM' then
        set_macro_page(6, 18)
	else
        set_macro_page(6, 18)
	end
end

autows_list = {['Naegling']='Savage Blade',['Naegling2']='Expiacion',['Maxentius']='Black Halo',['Nuking']='Seraph Strike',
     ['MaccWeapons']='Chant Du Cygne',['Naegbron']='Black Halo',['Naegmace']='Chant Du Cygne'}

	 
function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Nat. Meditation"]   = {gain = 'Nat. Meditation is on.', lose = 'Nat. Meditation wore off.', announce_gain = false, announce_lose = true},
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

-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

state.Songset have songsset its copy from AutoBuffBard addon file abb_sets 
u can add name songsset there and copy name in state.Songset

cycle Songset

send_command('bind f2 gs c cycle Songset')
send_command('bind !f2 gs c Songset')

macro

/con gs c Songset

its do all ja first then do u  songset

]]

function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'Shield', 'CRIT')
	state.HybridMode:options('DT','Normal')
    state.CastingMode:options('Normal','Resistant','AoE')
	state.PhysicalDefenseMode:options('PDT', 'Evasion','Aminon')
    state.MagicalDefenseMode:options('MDT')
    state.WeaponskillMode:options('Match', 'PDL')
    state.IdleMode:options('DT', 'MDT', 'HP', 'Regen', 'Evasion', 'EnemyCritRate', 'Refresh', 'Sphere')
	state.Weapons:options('None','Naegling', 'Twashtar','Tauret','Aeneas','Xoanon','DualNaegling','DualNaeglingCrepuscular','DualTwashtar','DualTwashtarCrepuscular','DualTauret','DualAeneas','DualCarnwenhan')
	-- Whether to use Carn (or song daggers in general) under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Always','300','1000','Never'}

	gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	info.SongHorn = 'Gjallarhorn'
    info.SongMarsyas = 'Marsyas'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !0 gs c weapons None;gs c update')
	send_command('bind !8 gs c weapons NukeWeapons;gs c update')
	send_command('bind !9 gs c weapons Swords;gs c update')
	send_command('bind @3 gs c cycle CarnMode')
    send_command('bind f7 gs c cycle ExtraSongsMode')
	send_command('bind !f7 gs c cycleback ExtraSongsMode')

    send_command('bind ^4 gs c cycle ElementalMode') --Changes element that the other commands use.
	send_command('bind ^3 gs c Elemental BardSong')  --Casts Threnody based on chosen element.
	
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind ^2 gs c cycle Etude')
    --send_command('bind ^4 gs c Etude')
    send_command('bind f3 gs c cycle Carol')
    send_command('bind !f3 gs c Carol')
    send_command('bind f4 gs c cycle Threnody')
    send_command('bind !f4 gs c Threnody')
	send_command('bind @f4 gs c toggle AutoSongMode')
	send_command('bind ^f4 gs c toggle AutoDefenseMode')
    send_command('bind f2 gs c cycle Songset')
    send_command('bind ^f2 gs c cycleback Songset')
    send_command('bind !f2 gs c Songset')
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
    
	---- WeaponSet ----

    sets.weapons.Twashtar = {main="Twashtar", sub="Genmei Shield"}
    sets.weapons.Tauret = {main="Tauret", sub="Genmei Shield"}
    sets.weapons.Naegling = {main="Naegling", sub="Genmei Shield"}
    sets.weapons.Carnwenhan = {main="Carnwenhan", sub="Genmei Shield"}
    sets.weapons.Aeneas = {main="Aeneas", sub="Genmei Shield"}
    sets.weapons.Xoanon = {main="Xoanon", sub="Alber Strap"}

	sets.weapons.DualTwashtar = {main="Twashtar", sub="Centovente"}
    sets.weapons.DualTwashtarCrepuscular = {main="Twashtar", sub="Crepuscular Knife"}
    sets.weapons.DualTauret = {main="Tauret", sub="Crepuscular Knife"}
    sets.weapons.DualNaegling = {main="Naegling", sub="Centovente"}
    sets.weapons.DualNaeglingCrepuscular = {main="Naegling", sub="Crepuscular Knife"}
    sets.weapons.DualAeneas = {main="Aeneas", sub="Centovente"}
    sets.weapons.DualCarnwenhan = {main="Carnwenhan", sub="Crepuscular Knife"}


	--[[sets.weapons.DualTwashtar = {main="Twashtar", sub="Centovente"}
    sets.weapons.DualTwashtarCrepuscular = {main="Twashtar", sub="Crepuscular Knife"}
    sets.weapons.DualTauret = {main="Tauret", sub="Crepuscular Knife"}
    sets.weapons.DualNaegling = {main="Naegling", sub="Centovente"}
    sets.weapons.DualNaeglingCrepuscular = {main="Naegling", sub="Crepuscular Knife"}
    sets.weapons.DualAeneas = {main="Aeneas", sub="Centovente"}
    sets.weapons.DualCarnwenhan = {main="Carnwenhan", sub="Crepuscular Knife"}]]

    sets.DefaultShield = {sub="Genmei Shield"}



    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +2",
    waist="Witful Belt",
    neck="Orunmila's Torque",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},}
		
	sets.precast.FC.DT = {    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +2",
    waist="Witful Belt",
    neck="Orunmila's Torque",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+5','"Cure" potency +10%','MND+4','Mag. Acc.+1',}},
		legs="Doyen Pants",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		waist="Witful Belt",
		neck="Baetyl Pendant",
		left_ear="Loquac. Earring",
		right_ear="Mendi. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",
	})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Doyen Pants",
		head="Umuthi Hat",
		waist="Siegel Sash",})
	
	sets.precast.FC.BardSong = {
	main="Carnwenhan",
	sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
	head="Fili Calot +2",
	body="Inyanga Jubbah +2",
	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	legs="Aya. Cosciales +2",
	feet="Fili Cothurnes +2",
	neck="Baetyl Pendant",
	waist="Witful Belt",
	right_ear="Etiolation Earring",
	left_ear="Loquac. Earring",
	right_ring="Kishar Ring",
	left_ring="Prolix Ring",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
	sets.precast.FC.Gjallarhorn = set_combine(sets.precast.FC.BardSong, {range="Gjallarhorn"})
    sets.precast.FC.Marsyas = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})


	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		legs="Dashing Subligar",
	}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range="Linos",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        ear2="Ishvara Earring",
        ear1="Moonshade Earring",
        ring1="Ilabrat Ring",
        ring2="Cornelia's Ring",
        waist="Kentarch Belt +1",
        back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    sets.precast.WS.PDL = set_combine(sets.precast.WS,{
        body="Bunzi's Robe",
        neck={ name="Bard's Charm +2", augments={'Path: A',}},})
        
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = { range="Linos",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        neck="Fotia Gorget",
        left_ear="Moonshade Earring",
        right_ear="Mache Earring +1",
    body="Bihu Jstcorps. +3",
    hands="Bunzi's Gloves",
    ring1="Hetairoi Ring",
    ring2="Ilabrat Ring",
    back="Annealed Mantle",
    waist="Fotia Belt",
    legs="Lustr. Subligar +1",
    feet="Lustra. Leggings +1",
    }
    sets.precast.WS['Evisceration'].PDL = set_combine(sets.precast.WS['Evisceration'],{
        body="Bunzi's Robe",
        neck={ name="Bard's Charm +2", augments={'Path: A',}},
        })
    sets.precast.WS['Exenterator'] = {range="Linos",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Bihu Jstcorps. +3",
        legs="Lustr. Subligar +1",
    feet="Lustra. Leggings +1",
    hands="Bunzi's Gloves",
    neck="Fotia Gorget",
    left_ear="Brutal Earring",
    right_ear="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Ilabrat Ring",
    waist="Fotia Belt",
    back="Annealed Mantle",
    }
    sets.precast.WS['Exenterator'].PDL = set_combine(sets.precast.WS['Exenterator'],{
        body="Bunzi's Robe",})
    sets.precast.WS['Mordant Rime'] = {range="Linos",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Jstcorps. +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    ear1="Ishvara Earring",
    ear2="Regal Earring",
    ring1="Sroda Ring", 
    ring2="Cornelia's Ring",
    waist="Sailfi Belt +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Mordant Rime'].PDL = set_combine(sets.precast.WS['Mordant Rime'],{
    body="Bunzi's Robe",})
sets.precast.WS['Rudras Storm'] = {range="Linos",
head={ name="Nyame Helm", augments={'Path: B',}},
body="Bihu Jstcorps. +3",
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}}, 
neck={ name="Bard's Charm +2", augments={'Path: A',}},
ear2="Ishvara Earring",
ear1="Moonshade Earring",
ring1="Ilabrat Ring",
ring2="Cornelia's Ring",
waist="Kentarch Belt +1",
back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
sets.precast.WS['Rudras Storm'].PDL = set_combine(sets.precast.WS['Rudras Storm'],{
    body="Bunzi's Robe",
})

sets.precast.WS['Savage Blade'] = {range="Linos",
head={ name="Nyame Helm", augments={'Path: B',}},
body="Bihu Jstcorps. +3",
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
neck="Rep. Plat. Medal",
ear1="Moonshade Earring",
ear2="Ishvara Earring",
ring1="Sroda Ring", 
ring2="Cornelia's Ring",
waist="Sailfi Belt +1",
back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'],{
body="Bunzi's Robe",
neck={ name="Bard's Charm +2", augments={'Path: A',}},
})

sets.precast.WS['Myrkr'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
neck="Sibyl Scarf",
waist="Orpheus's Sash",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Friomisi Earring",
left_ring="Cornelia's Ring",
right_ring="Freke Ring",
back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}


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
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    range="Linos",
    head="C. Palug Crown",
    head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
    ear1="Moonshade Earring",
    ear2="Friomisi Earring",
    ring1={ name="Metamor. Ring +1", augments={'Path: A',}},
    ring2="Cornelia's Ring",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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

    
sets.precast.WS['Black Halo'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring", 
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}


sets.precast.WS['Shattersoul'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    left_ring="Rufescent Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = sets.precast.FC

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
	sets.midcast.Lullaby = {range="Marsyas"}
	sets.midcast.Lullaby.Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla"}
	sets.midcast.Madrigal = {head="Fili Calot +2"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +2"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {range="Daurdabla",
	neck="Sanctity Necklace",
    waist="Luminary Sash",
    legs="Fili Rhingrave +2",}
	sets.midcast.Mazurka = {range="Marsyas"}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {    main="Carnwenhan",
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    ear2="Odnowa Earring +1",
    ear1="Loquac. Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    waist="Witful Belt",
    back="Intarabus's Cape",}
		
	sets.midcast.SongEffect.DW = sets.midcast.SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {     range="Marsyas",
        head="Fili Calot +2",
        body="Fili Hongreline +2",
        hands="Fili Manchettes +2",    
        legs="Fili Rhingrave +2",
        feet="Fili Cothurnes +2",
        neck="Mnbw. Whistle +1",
        waist="Kobo Obi",
        left_ear="Digni. Earring",
        right_ear="Fili Earring +1",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.SongDebuff.DW = sets.midcast.SongDebuff --Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = sets.midcast.SongDebuff

	-- Song-specific recast reduction
	sets.midcast.SongRecast = sets.precast.FC.BardSong
		
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}
    sets.midcast.Gjallarhorn =  {range=info.SongHorn}
    sets.midcast.Marsyas = set_combine(sets.midcast.SongEffect, {range=info.SongMarsyas})

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})


    --dummy songs
    sets.midcast["Army's Paeon"] = sets.midcast.DaurdablaDummy
    sets.midcast["Valor Minuet"] = sets.midcast.DaurdablaDummy
    sets.midcast["Knight's Minne"] = sets.midcast.DaurdablaDummy
    sets.midcast["Sheepfoe Mambo"] = sets.midcast.DaurdablaDummy
    sets.midcast["Shining Fantasia"] = sets.midcast.DaurdablaDummy
    sets.midcast["Herb Pastoral"] = sets.midcast.DaurdablaDummy

	-- Other general spells and classes.
	sets.midcast.Cure =     {head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+5','"Cure" potency +10%','MND+4','Mag. Acc.+1',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Nodens Gorget",
    waist="Luminary Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {        sub="Ammurapi Shield",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",
	neck="Incanter's Torque",
	waist="Olympus Sash",
	left_ear="Andoaa Earring",
	right_ear="Mendi. Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},}
		
	

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +2"})
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash", back="Grapevine Cape"})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		legs="Haven Hose",
        left_ear="Earthcry Earring",      
     neck="Nodens Gorget",
     waist="Siegel Sash",
	})
		
    sets.midcast['Enfeebling Magic'] = {
        main="Arendsi Fleuret",
        sub="Ammurapi Shield",
        range="Linos",
        body={ name="Cohort Cloak +1", augments={'Path: A',}},
        hands="Inyan. Dastanas +2",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
        feet="Medium's Sabots",
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Crep. Earring",
        right_ear="Fili Earring +1",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Aurist's Cape +1",
        }
	sets.midcast['Elemental Magic'] = {
    ammo="Ghastly Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Aurist's Cape +1",
    }
    sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Fili Calot +2",
	body="Fili Hongreline +2",        
    hands="Fili Manchettes +2",
	legs="Fili Rhingrave +2", 
    feet="Fili Cothurnes +2",
    neck="Mnbw. Whistle +1",
	waist="Acuity Belt +1",
	ear1="Crep. Earring",
    ear2="Fili Earring +1",
    ring1="Metamor. Ring +1",
    ring2="Stikini Ring +1",
    back="Aurist's Cape +1",
   }

		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		head="Vanya Hood",
		body="Vanya Robe",
		legs="Aya. Cosciales +2",
		feet="Vanya Clogs",
		neck="Incanter's Torque",
		ear2="Meili Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	})

	-- Resting sets
	sets.resting = {        body="Annoint. Kalasiris",
	hands="Inyan. Dastanas +2",
	legs="Assid. Pants +1",
	neck={ name="Bathy Choker +1", augments={'Path: A',}},
	left_ear="Infused Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",}

    -- Defense sets

    sets.defense.PDT = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back="Intarabus's Cape",}

    sets.defense.Evasion = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Vengeful Ring",
        right_ring="Defending Ring",
        back="Intarabus's Cape",
    }

    sets.defense.MDT = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }
    sets.defense.Aminon = {
        head="Null Masque",
        body="Adamantite Armor",
        hands="Regal Gloves",
        legs="Fili Rhingrave +2",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Fili Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }
	sets.idle = {   
        head="Null Masque",
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear="Tuisto Earring",
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Intarabus's Cape",
    }

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.DT = {        
	head={ name="Nyame Helm", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    body="Adamantite Armor",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back="Intarabus's Cape",
    }

sets.idle.HP = {
    ammo="Staunch Tathlum +1",
	head={ name="Nyame Helm", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    body="Adamantite Armor",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}
sets.idle.MDT = sets.defense.MDT
sets.idle.Evasion = sets.defense.Evasion
sets.idle.EnemyCritRate = set_combine(sets.idle.PDT, { 
    ammo="Eluder's Sachet",
    left_ring="Warden's Ring",
    right_ring="Fortified Ring",
    back="Reiki Cloak",
})
sets.idle.Regen = set_combine(sets.idle, {
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    right_ear="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.idle.Sphere = set_combine(sets.idle, {
    body="Annoint. Kalasiris",
})
    sets.idle.Weak = {       head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back="Intarabus's Cape",    }

    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}

	sets.Kiting = {feet="Fili Cothurnes +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	sets.engaged = {range="Linos",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Ashera Harness",
	hands="Volte Mittens",
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Battlecast Gaiters",
	neck={ name="Bard's Charm +2", augments={'Path: A',}},
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	right_ear="Cessance Earring",
	left_ear="Telos Earring",
	left_ring="Moonlight Ring",
	right_ring="Chirich Ring +1",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- Sets with weapons defined.
sets.engaged.Shield = {range="Linos",
	main="Naegling",
	sub="Genmei Shield",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Ashera Harness",
	hands="Bunzi's Gloves",
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck={ name="Bard's Charm +2", augments={'Path: A',}},
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Telos Earring",
	right_ear="Fili Earring +1",
	left_ring="Moonlight Ring",
	right_ring="Chirich Ring +1",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

sets.engaged.CRIT = set_combine(sets.engaged, {
	range="Linos",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	legs={ name="Zoar Subligar +1", augments={'Path: A',}},
	feet="Aya. Gambieras +2",
	neck="Nefarious Collar +1",
	right_ring="Hetairoi Ring",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},  
  })
sets.engaged.Acc = set_combine(sets.engaged, {        range="Linos",
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
	body="Ashera Harness",
	hands="Aya. Manopolas +2",
	legs="Aya. Cosciales +2",
	feet="Aya. Gambieras +2",
	neck={ name="Bard's Charm +2", augments={'Path: A',}},
	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	left_ear="Telos Earring",
	right_ear="Cessance Earring",
	left_ring="Chirich Ring +1",
	right_ring="Chirich Ring +1",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})


    ---------------------------------------- DW-HASTE ------------------------------------------
    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%
    --DW cap all set haste capped

    sets.engaged.DW = set_combine(sets.engaged ,{
        range="Linos",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Ashera Harness",
        hands="Volte Mittens",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Battlecast Gaiters",
        neck={ name="Bard's Charm +2", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Balder Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},    
    })

    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc ,{
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Ashera Harness",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck={ name="Bard's Charm +2", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Cessance Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    })
    sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, {
    range="Linos",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Aya. Gambieras +2",
    neck="Nefarious Collar +1",
    waist="Reiki Yotai",
    left_ear="Suppanomimi",
    right_ring="Hetairoi Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},   
    })


------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.Hybrid = {
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    ring1="Moonlight Ring", --5/5
    ring2="Moonlight Ring", --5/5
    }

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
    sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)

    sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
    sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.engaged.Hybrid)





end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 168')
end

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Aeolian Edge",['Twashtar']="Rudra's Storm",['DualNaegling']='Savage Blade',['Tauret']='Evisceration',['DualTauret']='Evisceration',
['DualNaeglingCrepuscular']='Savage Blade',['Carnwenhan']="Mordant Rime",['DualCarnwenhan']="Mordant Rime",['DualTwashtarCrepuscular']="Rudra's Storm",['DualAeneas']="Aeolian Edge",['Xoanon']="Retribution"}


--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
					windower.send_command('input /ma "Ygnas" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
					windower.send_command('input /ma "Sylvie (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.send_command('input /ma "Joachim" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
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

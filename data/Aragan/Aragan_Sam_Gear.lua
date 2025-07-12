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

--[[
-- SC's
Rana > Shoha > Fudo > Kasha > Shoha > Fudo - light
Rana > Shoha > Fudo > Kasha > Rana > Fudo - dark

Kasha > Shoha > Fudo
Fudo > Kasha > Shoha > fudo
Shoha > Fudo > Kasha > Shoha > Fudo

--6step

jinpu spam

--]]

-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'CRIT', 'triple', 'SubtleBlow', 'Range' )
    state.HybridMode:options('PDT','Normal','DTLite')
    state.WeaponskillMode:options('Match', 'SubtleBlow','SC', 'Acc', 'PDL','Proc')
    state.Passive = M{['description'] = 'Passive Mode','None','SubtleBlow','SubtleBlowII','SphereRegain','Death Spikes'}
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'Evasion', 'Reraise')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('DT','Normal','Empy','Regen','Regain', 'MDT', 'HP', 'Evasion', 'EnemyCritRate')
	state.Weapons:options('Masamune','None','Dojikiri','Polearm','Amanomurakumo','TernionDagger','Club','ProcWeapon')

	gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !0 gs c set skipprocweapons false;gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
	send_command('bind !9 gs c set skipprocweapons true;gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
	send_command('bind ^8 gs c weapons Bow;gs c update')
	send_command('bind f2 gs c toggle AutoBuffMode')
	send_command('bind !6 gs c toggle SubtleBlowMode')
	send_command('bind !n gs c toggle AutoReraiseeMode')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets	
    sets.Normal = {}
    sets.weapons.Masamune = {main="Masamune", sub="Utu Grip"}
    sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna", sub="Utu Grip"}
    sets.weapons.Amanomurakumo = {main="Amanomurakumo", sub="Utu Grip"}
    sets.weapons.Polearm = {main="Shining One", sub="Utu Grip"}
    sets.weapons.TernionDagger = {main="Ternion Dagger +1"}
    sets.weapons.Club = {main="Mafic Cudgel"}
    sets.weapons.ProcWeapon = {main="Norifusa",}

	--sets.weapons.Bow = {main="Norifusa +1",sub="Utu Grip",range="Cibitshavore",ammo="Eminent Arrow"}

    -- neck JSE Necks Reinf
    sets.RP = {}
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = { 
    head="Wakido Kabuto +3",
    hands="Sakonji Kote +3",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}
	sets.precast.JA['Sekkanoki'] = {}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +3"}
	
    sets.precast.Step = {
        head="Flam. Zucchetto +2",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Sakonji Domaru +3",hands="Flam. Manopolas +2",
        waist="Olseni Belt",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"}
    sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",
        waist="Null Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        legs="Dashing Subligar"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {        neck="Orunmila's Torque",
    ear1="Etiolation Earring",
    ear2="Loquacious Earring",
    hands="Leyline Gloves",
    ring1="Prolix Ring",
}
    -- Ranged snapshot gear
    sets.precast.RA = {
        ammo=empty,
        range="Trollbane",  
        head={ name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Yemaya Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Purity Ring",
        right_ring="Ilabrat Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},    
    }
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Cornelia's Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    sets.precast.WS.SubtleBlow =  {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
        sets.precast.WS.PDL = set_combine(sets.precast.WS, {
            ammo="Crepuscular Pebble",
            head={ name="Nyame Helm", augments={'Path: B',}},
            body={ name="Nyame Mail", augments={'Path: B',}},
            hands={ name="Nyame Gauntlets", augments={'Path: B',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet="Kas. Sune-Ate +3",
            left_ring="Sroda Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        })
        sets.precast.WS.SC = set_combine(sets.precast.WS, {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        })
        sets.precast.WS.Proc =  {}

        sets.precast.WS['Namas Arrow'] = {
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        }
        sets.precast.WS['Namas Arrow'].PDL = set_combine(sets.precast.WS['Namas Arrow'], {
            feet="Kas. Sune-Ate +3",
            left_ring="Sroda Ring", 
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS['Namas Arrow'], {
        })
        
        sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS['Namas Arrow'], {
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Apex Arrow'].PDL = set_combine(sets.precast.WS['Apex Arrow'], {
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {
        })
    
        sets.precast.WS['Empyreal Arrow'] = set_combine(sets.precast.WS['Namas Arrow'], {
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Empyreal Arrow'].PDL = set_combine(sets.precast.WS['Apex Arrow'], {
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Empyreal Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {
        })
        
        sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Fudo'].PDL = set_combine(sets.precast.WS['Tachi: Fudo'], {
            ammo="Crepuscular Pebble",
            body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS['Tachi: Fudo'], {})
    
        sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            body={ name="Nyame Mail", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            ear2="Thrud Earring",
            ear1="Lugra Earring +1", 
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Kaiten'].PDL = set_combine(sets.precast.WS['Tachi: Kaiten'], {
            ammo="Crepuscular Pebble",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet="Kas. Sune-Ate +3",
            ear1="Lugra Earring +1", 
            left_ring="Niqmaddu Ring",
            right_ring="Regal Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
    
        sets.precast.WS['Tachi: Kaiten'].Acc = set_combine(sets.precast.WS['Tachi: Kaiten'], {})
    
        sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Impulse Drive'].PDL = set_combine(sets.precast.WS['Impulse Drive'], {
        ammo="Crepuscular Pebble",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS['Impulse Drive'], {
        })
    
        sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS['Impulse Drive'], {
        })
        
        sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Niqmaddu Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Shoha'].PDL = set_combine(sets.precast.WS['Tachi: Shoha'], {
            ammo="Crepuscular Pebble",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
            body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS['Tachi: Shoha'], {})
    
        sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS['Tachi: Shoha'], {
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        })
        sets.precast.WS['Stardiver'].PDL = set_combine(sets.precast.WS['Stardiver'], {
            ammo="Crepuscular Pebble",
                body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Kas. Sune-Ate +3",
        left_ring="Sroda Ring", 
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS['Stardiver'], {})
        
        sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Niqmaddu Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Rana'].PDL = set_combine(sets.precast.WS['Tachi: Rana'], {
            ammo="Crepuscular Pebble",
                body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Kas. Sune-Ate +3",
            left_ring="Sroda Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS, {
    
        })
        -- CHR Mod 60% CHR / 40% STR
        sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
            ammo="Pemphredo Tathlum",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
            body="Kasuga Domaru +2",
            hands="Flam. Manopolas +2",
            legs="Kasuga Haidate +2",
            feet="Kas. Sune-Ate +3",
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist="Null Belt",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Crep. Earring",
            left_ring="Stikini Ring +1",
            right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Ageha'].PDL = set_combine(sets.precast.WS['Tachi: Ageha'], {
            ammo="Crepuscular Pebble",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet="Kas. Sune-Ate +3",
            left_ring="Sroda Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        
        sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
    
        sets.precast.WS['Tachi: Kasha'].PDL = set_combine(sets.precast.WS['Tachi: Kasha'], {
            ammo="Crepuscular Pebble",
            body={ name="Nyame Mail", augments={'Path: B',}},
          hands={ name="Nyame Gauntlets", augments={'Path: B',}},
          legs={ name="Nyame Flanchard", augments={'Path: B',}},
          feet="Kas. Sune-Ate +3",
            left_ring="Sroda Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
    
        sets.precast.WS['Tachi: Kasha'].Acc = sets.precast.WS['Tachi: Kasha']
    
        sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        
        sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
            head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist={ name="Sailfi Belt +1", augments={'Path: A',}},
            right_ear="Thrud Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Regal Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        
        sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist="Orpheus's Sash",
            right_ear="Friomisi Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })      
        sets.precast.WS['Tachi: Jinpu'].PDL = set_combine(sets.precast.WS['Tachi: Jinpu'], {
            ammo="Crepuscular Pebble",
            head={ name="Nyame Helm", augments={'Path: B',}},
            body={ name="Nyame Mail", augments={'Path: B',}},
            hands={ name="Nyame Gauntlets", augments={'Path: B',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            feet="Kas. Sune-Ate +3",
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist="Orpheus's Sash",
            right_ear="Friomisi Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS['Tachi: Jinpu'].Acc = set_combine(sets.precast.WS['Tachi: Jinpu'], {
            neck="Fotia Gorget",
            ear1="Schere Earring",
            left_ring={ name="Beithir Ring", augments={'Path: A',}},
        })
        sets.precast.WS['Tachi: Jinpu'].SC = set_combine(sets.precast.WS['Tachi: Jinpu'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Warder's Charm +1", augments={'Path: A',}},
            waist="Orpheus's Sash",
            right_ear="Friomisi Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })

        
        sets.precast.WS["Tachi: Kagero"] = set_combine(sets.precast.WS, {
            ammo="Knobkierrie",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist="Orpheus's Sash",
            right_ear="Friomisi Earring",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            left_ring="Epaminondas's Ring",
            right_ring="Cornelia's Ring",
            back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
        })
        sets.precast.WS["Tachi: Goten"] = set_combine(sets.precast.WS["Tachi: Kagero"],{})
        sets.precast.WS["Tachi: Koki"] = set_combine(sets.precast.WS["Tachi: Kagero"],{})
    
        sets.precast.WS['Tachi: Jinpu'].Proc = set_combine(sets.precast.WS.Proc,{})

        sets.precast.WS['Aeolian Edge'] = sets.precast.WS['Tachi: Jinpu']

        sets.precast.WS['Aeolian Edge'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Koki'].Proc =  set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS["Tachi: Kagero"].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS["Tachi: Goten"].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Yukikaze'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Kasha'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Gekko'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Shoha'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Kaiten'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Fudo'].Proc = set_combine(sets.precast.WS.Proc,{})
        sets.precast.WS['Tachi: Rana'].Proc = set_combine(sets.precast.WS.Proc,{})

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
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })
    
    sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
    sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

    sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Cornelia's Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    })

    -- Extra Melee sets.  Apply these on top of melee sets.

	-- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
    sets.rollerRing = {left_ring="Roller's Ring"}


	-- passive set
	sets.passive['Death Spikes'] = {body="Tartarus Platemail",}

    sets.passive.SubtleBlow = {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
	}
    sets.passive.SubtleBlowII = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid, {  
        body="Dagon Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        left_ring="Niqmaddu Ring",
    })
    sets.passive.SphereRegain = {
        body="Makora Meikogai",
     }
    sets.midcast['Blue Magic'] = set_combine(sets.precast.WS['Tachi: Ageha'], {})
    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo="Staunch Tathlum +1",
        legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+5','Attack+3','Breath dmg. taken -2%',}},
        feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+23','Magic dmg. taken -5%','INT+9',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        left_ear="Halasz Earring",
        right_ear="Mendi. Earring",
        right_ring="Evanescence Ring",
    }
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
	
		
    -- Ranged gear
    sets.midcast.RA = {
        range="Trollbane",  
        head={ name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        back="Null Shawl",
    }
    sets.midcast.RA.Acc = sets.midcast.RA


    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Sakpata's Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Sakpata's Leggings",
    neck="Erra Pendant",
    waist="Null Belt",
    left_ear="Malignance Earring",
    right_ear="Dignitary's Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
}

sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    -- Drain spells 
    sets.midcast.Drain = {
        left_ring="Evanescence Ring",
    }
    sets.midcast['Elemental Magic'] = {
    ammo="Pemphredo Tathlum",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Malignance Earring",
    left_ring="Locus Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Argocham. Mantle",
    }
    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Incanter's Torque",
        waist="Null Belt",
        left_ear="Malignance Earring",
        right_ear="Crep. Earring",
        left_ring="Kishar Ring",
        right_ring="Stikini Ring +1",
        back="Solemnity Cape",
    }
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Sanctity Necklace",
    ring2="Paguroidea Ring",
    ear2="Infused Earring",
       body="Hizamaru Haramaki +2",}
    
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
    
	sets.DayIdle = {}
	sets.NightIdle = {}
    

    -- Defense sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear="Infused Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back="Moonlight Cape",
    }
    
    sets.defense.Reraise = set_combine(sets.defense.PDT, {
    	head="Crepuscular Helm",
    	body="Crepuscular Mail"
    })
    
    sets.defense.MDT = set_combine(sets.defense.PDT, {
        ammo="Staunch Tathlum +1",
	head={ name="Nyame Helm", augments={'Path: B',}},
	body={ name="Nyame Mail", augments={'Path: B',}},
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Sanare Earring",
        right_ear="Eabani Earring",
        left_ring="Purity Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape",
    })
    sets.defense.Evasion = set_combine(sets.defense.PDT, {
        ammo="Amar Cluster",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    })
    sets.defense.MEVA = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Eabani Earring",
        left_ring="Archon Ring",
        right_ring="Purity Ring",
        back="Moonlight Cape",
    }

        
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {        
        ammo="Staunch Tathlum +1",
        head="Wakido Kabuto +3",
        body="Sacro Breastplate",
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Infused Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }

    sets.idle.Regen = set_combine(sets.idle, { 
            neck={ name="Bathy Choker +1", augments={'Path: A',}},
            right_ear="Infused Earring",
            left_ring="Chirich Ring +1",
            right_ring="Chirich Ring +1",
    })
    sets.idle.Regain = {
        head="Wakido Kabuto +3",
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
    sets.idle.EnemyCritRate = set_combine(sets.defense.PDT, { 
        ammo="Eluder's Sachet",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        back="Reiki Cloak",
    })
    sets.idle.DT = set_combine(sets.defense.PDT, {})
    sets.idle.MDT = set_combine(sets.defense.MDT, {})
    sets.idle.Enmity = set_combine(sets.defense.Enmity, {})
    sets.idle.Evasion = set_combine(sets.defense.Evasion, {})
    sets.idle.Weak = set_combine(sets.idle, {
        head="Crepuscular Helm",
        body="Crepuscular Mail",
    })
    sets.idle.Empy = set_combine(sets.idle, {
        head="Kasuga Kabuto +2",            
        body="Kasuga Domaru +2",
        hands="Kasuga Kote +2",
        legs="Kasuga Haidate +2",
        feet="Kas. Sune-Ate +3",
    })
    sets.idle.HP =  { 
        ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",
        body="Adamantite Armor",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Eihwaz Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {range=empty,
    ammo="Aurgelmir Orb +1",
    head="Kasuga Kabuto +2",
    body="Kasuga Domaru +2",
    hands={ name="Tatena. Gote +1", augments={'Path: A',}},
    legs="Kasuga Haidate +2",
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    left_ear="Dedition Earring",
    right_ring="Chirich Ring +1",
    left_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Acc =  { range=empty,
    ammo="Amar Cluster",
    head="Kasuga Kabuto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs="Kasuga Haidate +2",
    feet="Wakido Sune. +3",
    neck="Null Loop",
    waist="Ioskeha Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Weapon skill damage +2%',}},
    left_ring="Regal Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    }

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {        
        body="Dagon Breast.",
        hands="Volte Mittens",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Ioskeha Belt +1",
        left_ear="Digni. Earring",
        right_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ring="Chirich Ring +1",
        left_ring="Niqmaddu Ring",
    })

    sets.engaged.Range = {
            head={ name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
            body={ name="Nyame Mail", augments={'Path: B',}},
    	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
            legs={ name="Nyame Flanchard", augments={'Path: B',}},
            feet={ name="Nyame Sollerets", augments={'Path: B',}},
            neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
            waist="Yemaya Belt",
            left_ear="Crep. Earring",
            right_ear="Telos Earring",
            left_ring="Purity Ring",
            right_ring="Ilabrat Ring",
            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.CRIT = set_combine(sets.engaged, {range=empty,
    ammo="Coiste Bodhar",
    head="Blistering Sallet +1",
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Thereoid Greaves",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Schere Earring",
    ring1="Begrudging Ring",
    ring2="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.engaged.STP = {range=empty,
        ammo="Aurgelmir Orb +1",
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Kasuga Domaru +2",
        hands="Wakido Kote +3",
        legs="Kasuga Haidate +2",
        feet="Kas. Sune-Ate +3",
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist="Gerdr Belt",
        left_ear="Dedition Earring",
        right_ear="Kasuga Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
    sets.engaged.triple = {range=empty,
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body={ name="Tatena. Harama. +1", augments={'Path: A',}},
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs="Kasuga Haidate +2",
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Schere Earring",
        right_ear="Balder Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Hetairoi Ring",
        back="Null Shawl",
    }
    

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
    --[[sets.engaged.Hybrid = {
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands="Mpaca's Gloves",
        legs="Kasuga Haidate +2",
        feet="Mpaca's Boots",
    }]]

    sets.engaged.Hybrid = {
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs="Kasuga Haidate +2",
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        right_ring="Defending Ring",
    }
    sets.engaged.PDT = set_combine(sets.engaged,sets.engaged.Hybrid)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc,sets.engaged.Hybrid)
    sets.engaged.STP.PDT = set_combine(sets.engaged.STP,sets.engaged.Hybrid)
    sets.engaged.CRIT.PDT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid)
    sets.engaged.SubtleBlow.PDT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid, {  
        head="Kasuga Kabuto +2",
        body="Dagon Breast.",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
        left_ring="Niqmaddu Ring",
        right_ring="Defending Ring",
    })


	sets.engaged.DTLite = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt +1",legs="Wakido Haidate +3",feet="Nyame Sollerets"}
    
 
    sets.engaged.Acc.DTLite = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt +1",legs="Wakido Haidate +3",feet="Nyame Sollerets"}

        
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
--[[Right now Adoulin sets are the same as non-Adoulin.
	sets.engaged.Adoulin = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands=gear.valorous_wsd_hands,ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.SomeAcc = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
	sets.engaged.Adoulin.Acc = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.FullAcc = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.Fodder = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.SomeAcc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}	
		sets.engaged.Adoulin.Acc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.FullAcc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Letalis Mantle",waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.Fodder.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
		
	sets.engaged.Adoulin.DTLite = sets.engaged.DTLite
    sets.engaged.Adoulin.SomeAcc.DTLite = sets.engaged.SomeAcc.DTLite
    sets.engaged.Adoulin.Acc.DTLite = sets.engaged.Acc.DTLite
    sets.engaged.Adoulin.FullAcc.DTLite = sets.engaged.FullAcc.DTLite
    sets.engaged.Adoulin.Fodder.DTLite = sets.engaged.Fodder.DTLite
    sets.engaged.Adoulin.Reraise = set_combine(sets.engaged.Adoulin, sets.Reraise)		
    sets.engaged.Adoulin.SomeAcc.Reraise = set_combine(sets.engaged.Adoulin.SomeAcc, sets.Reraise)		
    sets.engaged.Adoulin.Acc.Reraise = set_combine(sets.engaged.Adoulin.Acc, sets.Reraise)		
    sets.engaged.Adoulin.FullAcc.Reraise = set_combine(sets.engaged.Adoulin.FullAcc, sets.Reraise)		
    sets.engaged.Adoulin.Fodder.Reraise = set_combine(sets.engaged.Adoulin.Fodder, sets.Reraise)
]]--Right now Adoulin sets are the same as non-Adoulin.


	-- Buff sets

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
        neck="Nicander's Necklace",
        waist="Gishdubar Sash",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1",
    })
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {hands="Wakido Kote +3"}
	sets.buff['Third Eye'] = {head="Kasuga Kabuto +2", legs="Sakonji Haidate +3"}
    sets.buff.Sekkanoki = {hands="Kasuga Kote +2"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +3",}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
    	set_macro_page(6, 16)
    elseif player.sub_job == 'WAR' then
    	set_macro_page(3, 16)
    elseif player.sub_job == 'NIN' then
    	set_macro_page(5, 16)
    elseif player.sub_job == 'THF' then
    	set_macro_page(1, 16)
    elseif player.sub_job == 'DRK' then
    	set_macro_page(4, 16)
    else
    	set_macro_page(1, 16)
    end
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
        windower.chat.input('/lockstyleset 172') --Catchall
    end
end


autows_list = {['Masamune']='Tachi: Fudo',['Dojikiri']='Tachi: Jinpu',['Amanomurakumo']='Tachi: Kaiten',['Polearm']='Impulse Drive',['TernionDagger']='Aeolian Edge',
['Club ']='Spiral Hell',['ProcWeapon']='Tachi: Jinpu',['DualIkengaAxe']='Calamity',['ProcGreatSword']='Freezebite',['ProcScythe']='Shadow of Death',['ProcDagger2']='Cyclone',
['ProcDagger']='Energy Drain',['ProcStaff2']='Sunburst',['ProcStaff']='Earth Crusher',['ProcSword2']='Seraph Blade',['ProcSword']='Red Lotus Blade',['ProcClub']='Seraph Strike',
['ProcGreatKatana']='Tachi: Jinpu',['ProcGreatKatana2']='Tachi: Koki',['ProcKatana']='Blade: Ei',['ProcPolearm']='Raiden Thrust',['Hachimonji']='Tachi: Jinpu',
['Zanmato']='Tachi: Jinpu',['H2H']='Asuran Fists',['Loxotic ']='Judgment',['DualLoxotic']='Judgment',['DualMalevo']='Aeolian Edge',['Shining']='Impulse Drive'}


function buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
	    ["Yaegasumi"] = {gain = 'Yaegasumi is on.', lose = 'Yaegasumi wore off.', announce_gain = true, announce_lose = true},
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

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
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
-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 


Ninja katana hybrid weapon skills.

    To-Chi-To

    Chi-Teki-Chi-To

    Chi-Teki-To-Chi-To

    To-Teki-Shun-Shun

    Chi-Retsu-Ten-Hi/Metsu

    Chi-Retsu-Shun-Ten-Kamu-Shun-Shun(Heishi) 

    6 step skillchains 

Blade: jin Detonation
Blade: Yu Scission
Blade: jin Detonation
Blade: Yu Scission
Blade: jin Detonation
Blade: Yu Scission 

or

    6 step skillchains 

Blade: jin Detonation
Blade: Retsu Scission
Blade: jin Detonation
Blade: Retsu Scission
Blade: jin Detonation
Blade: Retsu Scission 

----

error spam spell issue from addon Itemizer reload it and fix
]]

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'Acc', 'STP', 'TP', 'ZANISH', 'DOUBLE','CRIT','CRITRA')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match', 'SubtleBlow', 'PDL', 'SC', 'Proc')
    state.CastingMode:options('Normal','SIRD')
    state.IdleMode:options( 'DT','Normal','Empy', 'Evasion', 'MDT', 'Regen','Regain', 'HP', 'EnemyCritRate')
    state.PhysicalDefenseMode:options('PDT', 'Evasion', 'HP', 'Enmity')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Normal','Heishi','None','Tauret','Naegling','Hachimonji','Zanmato','CLUB','Staff','H2H','ProcGreatSword','ProcScythe','ProcPolearm','ProcKatana','ProcDagger','ProcDagger2','ProcGreatKatana','ProcGreatKatana2','ProcSword','ProcSword2','ProcClub','ProcStaff','ProcStaff2','ProcCRIT','ProcCRIT2','ProcSword3')
    state.Passive:options('None', 'SubtleBlow','MDT', 'Enspell','PDL')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','Resist','SuppaBrutal','DWEarrings','DWMax','DWFull','DWFull2','DWFull32'}
	state.AutoBuffMode:options('Off','Auto','Sortie','Abyssea','Tank','Defend') --,'Off','Off','Off','Off','Off',

	gear.wsd_jse_back = {}
	gear.da_jse_back = {}    
	gear.taeon_phalanx_feet= {feet={ name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}},}
	gear.taeon_dw_feet= {name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}}

    -- swordList = S{'Naegling'}
    -- GKList = S{'Hachimonji','Zanmato +1'}
    -- daggerList = S{'Tauret'}
    -- katanaList = S{'Heishi Shorinken','Kunimitsu'}

	-- send_command('bind ^` input /ja "Innin" <me>')
	-- send_command('bind !` input /ja "Yonin" <me>')
    send_command('bind !5 gs c toggle stance')
	send_command('bind @` gs c cycle SkillchainMode')
	-- send_command('bind !0 gs c set WeaponskillMode Proc;;gs c set CastingMode Proc;gs c update')
	-- send_command('bind !9 gs c weapons Default;gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
    send_command('bind f11 gs c cycle CastingMode')

    send_command('bind f3 gs c toggle AutoShadowMode')
    send_command('bind f2 gs c toggle AutoBuffMode')
    send_command('bind ` gs c toggle abyssea;wait 0.1;gs c abyssea')
    send_command('bind ^` ept toggle')

	-- utsusemi_cancel_delay = .3
	-- utsusemi_ni_cancel_delay = .06
    -- Haste = 0
    -- DW_needed = 0
    -- DW = false
    
--     local last_check = 0
--     local was_chat_open = false
--     local nexttime = os.clock()
--     local delay = 0.9
-- windower.register_event('prerender', function()
--     local curtime = os.clock()
--     if nexttime + delay <= curtime then
--         nexttime = curtime
--         delay = 0.9
--         local chat_open = windower.ffxi.get_info().chat_open
--         if chat_open and not was_chat_open then
--             send_command('unbind `')
--             -- send_command('unbind tab')
--             was_chat_open = true
--         elseif not chat_open and was_chat_open then
--             send_command('bind ` gs c toggle abyssea;wait 0.1;gs c abyssea')
--             was_chat_open = false
--         end
--     end
-- end)


    determine_haste_group()
    update_combat_form()  
	select_default_macro_book()
end

autows_list = {['Heishi']={'Blade: Shun',1000},['Tauret']={'Aeolian Edge',1000},['Naegling']={'Savage Blade',1000},
['ProcGreatSword']={'Freezebite',1000},['ProcScythe']={'Shadow of Death',1000},['ProcDagger2']={'Cyclone',1000},
['ProcDagger']={'Energy Drain',1000},['ProcStaff2']={'Sunburst',1000},['ProcStaff']={'Earth Crusher',1000},
['ProcSword3']={'Savage Blade',1000},['ProcSword2']={'Seraph Blade',1000},['ProcSword']={'Red Lotus Blade',1000},['ProcClub']={'Seraph Strike',1000},
['ProcGreatKatana']={'Tachi: Jinpu',1000},['ProcGreatKatana2']={'Tachi: Koki',1000},['ProcKatana']={'Blade: Ei',1000},
['ProcPolearm']={'Raiden Thrust',1000},['ProcCRIT2']={'Aeolian Edge',1000},['Hachimonji']={'Tachi: Jinpu',1000},['Zanmato']={'Tachi: Jinpu',1000},
['H2H']={'Asuran Fists',1000},['CLUB']={'Judgment',1000},['DualAeolian']={'Aeolian Edge',1000},['DualRanged']={'Last Stand',1000}}

-- Define sets and vars used by this job file.
function init_gear_sets()

    -- Weapons sets
    sets.weapons.Normal = {}

    sets.weapons.Heishi = {main="Heishi Shorinken", sub="Kunimitsu"}
    sets.weapons.Tauret = {main="Tauret", sub="Kunimitsu"}
    sets.weapons.Naegling = {main="Naegling", sub="Kunimitsu"}
    sets.weapons.Hachimonji = {main="Hachimonji", sub="Alber Strap",}
    sets.weapons.Zanmato = {main="Zanmato +1",sub="Sword Strap",}
    sets.weapons.CLUB = {main="Mafic Cudgel",sub="Kunimitsu",}
    sets.weapons.H2H = {main="Karambit"}
    sets.weapons.Staff = {main="Gozuki Mezuki",sub="Niobid Strap"}

	sets.weapons.ProcDagger = {main="Qutrub Knife",sub="Trainee Sword"}
    sets.weapons.ProcDagger2 = {main="Qutrub Knife",sub="Trainee Sword"}
	sets.weapons.ProcSword = {main="Fermion Sword",sub="Trainee Sword"}
    sets.weapons.ProcSword2 = {main="Fermion Sword",sub="Trainee Sword"}
    sets.weapons.ProcSword3 = {main="Naegling",sub="Blurred Knife +1"}

	sets.weapons.ProcGreatSword = {main="Irradiance Blade", sub="Alber Strap"}
	sets.weapons.ProcScythe = {main="Maven's Scythe", sub="Alber Strap"}
	sets.weapons.ProcPolearm = {main="Sha Wujing's La. +1", sub="Alber Strap"}
	sets.weapons.ProcGreatKatana = {main="Zanmato +1",sub="Alber Strap",}
    sets.weapons.ProcGreatKatana2 = {main="Zanmato +1",sub="Alber Strap"}
	sets.weapons.ProcKatana = {main="Debahocho +1",sub="Trainee Sword"}
	sets.weapons.ProcClub = {main="Caduceus",sub="Trainee Sword"}
	sets.weapons.ProcStaff = {main="Profane Staff",sub="Alber Strap"}
    sets.weapons.ProcStaff2 = {main="Profane Staff",sub="Alber Strap"}
    sets.weapons.ProcCRIT = {main={ name="Gleti's Knife", augments={'Path: A',}},sub="Crepuscular Knife",}
    sets.weapons.ProcCRIT2 = {main="Blurred Knife +1",sub={ name="Gleti's Knife", augments={'Path: A',}},}
    sets.weapons.ProcBlurred = {main="Fermion Sword",sub="Blurred Knife +1"}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {        ammo="Iron Gobbet",
    head="Malignance Chapeau",
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands="Kurys Gloves",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back="Reiki Cloak",}

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {}
    sets.precast.JA['Futae'] = { hands="Hattori Tekko +2" }
    sets.precast.JA['Sange'] = {}
    sets.precast.JA['Innin'] = {head="Mochi. Hatsuburi +3"}
    sets.precast.JA['Yonin'] = {head="Mochi. Hatsuburi +3"}
    sets.precast.JA['Provoke'] = set_combine(sets.midcast.enmity , {
        feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    })
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = { ammo="Yamarang",   
    head="Mummu Bonnet +2",
    body="Passion Jacket",
    legs="Dashing Subligar",}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Dampening Tam",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

    sets.precast.Flourish1 = {
        head="Dampening Tam",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

    -- Fast cast sets for spells

    sets.precast.FC = {        ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Triple Atk."+4','STR+7','Accuracy+5','Attack+8',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    neck="Orunmila's Torque", 
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochi. Chainmail +3",feet="Hattori Kyahan +2"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {
    ammo=empty,
    range="Trollbane",  
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    }
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined

    -- Weaponskills 
    sets.precast.WS = {
        ammo="Yamarang",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        right_ring="Regal Ring",
        left_ring="Cornelia's Ring",
        back="Andartia's Mantle",
    }
        
    sets.precast.WS.SC = set_combine(sets.precast.WS, { 
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS.SubtleBlow =  {
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }
    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        right_ear="Hattori Earring +1", 
        right_ring="Sroda Ring", 
    })
    sets.precast.WS.Proc =  {
        --[[ammo="Pemphredo Tathlum",
        head="Malignance Chapeau", 
        body="Malignance Tabard", 
        hands="Malignance Gloves", 
        legs="Malignance Tights", 
        feet="Malignance Boots", 
        left_ear="Crep. Earring",
        right_ear="Digni. Earring",
        neck="Null Loop",
        waist="Null Belt",
        right_ring={ name="Beithir Ring", augments={'Path: A',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Null Shawl",]]
    }

    sets.precast.WS['Aeolian Edge'] = {       
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ring="Cornelia's Ring",
        right_ring="Dingir Ring",
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        back="Sacro Mantle",
    }
    sets.precast.WS['Aeolian Edge'].Proc = set_combine(sets.precast.WS['Aeolian Edge'],{})
    sets.precast.WS['Aeolian Edge'].PDL = set_combine(sets.precast.WS['Aeolian Edge'],{})
    sets.precast.WS['Aeolian Edge'].DT = set_combine(sets.precast.WS['Aeolian Edge'],{})

    sets.Kamu = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ear="Hattori Earring +1", 
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle",
    }
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].SC = set_combine(sets.precast.WS, sets.Kamu, {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},    })
    sets.precast.WS['Blade: Kamu'].PDL = set_combine(sets.precast.WS, sets.Kamu, {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        right_ear="Hattori Earring +1", 
        right_ring="Sroda Ring",     })
    
    -- BLADE: JIN
    sets.Jin = {
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Gerdr Belt",
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ear="Odr Earring",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle",
    }
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, sets.Jin)
    sets.precast.WS['Blade: Jin'].SC = set_combine(sets.precast.WS['Blade: Jin'], {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Blade: Jin'].PDL = set_combine(sets.precast.WS['Blade: Jin'], {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},   
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},    
        right_ear="Hattori Earring +1", 
        right_ring="Sroda Ring", 
    })
    
    -- BLADE: HI
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Gerdr Belt",
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ear="Odr Earring",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Sacro Mantle",
    })
    sets.precast.WS['Blade: Hi'].SC = set_combine(sets.precast.WS['Blade: Hi'], {
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Blade: Hi'].PDL = set_combine(sets.precast.WS['Blade: Hi'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},   
        right_ear="Hattori Earring +1", 
        left_ring="Cornelia's Ring",
        right_ring="Sroda Ring", 
    })
    
    -- BLADE: SHUN
    sets.Shun = {
        ammo="Coiste Bodhar",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body="Malignance Tabard",
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Hattori Earring +1", 
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle",
    }
    
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, sets.Shun)
    sets.precast.WS.PDL['Blade: Shun'] = set_combine(sets.Shun, {})
    sets.precast.WS['Blade: Shun'].PDL = set_combine(sets.Shun, {
        ammo="Crepuscular Pebble",
        head="Malignance Chapeau",
        hands="Malignance Gloves",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},   
        feet="Malignance Boots",    
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},

    })
    sets.precast.WS['Blade: Shun'].SC = set_combine(sets.Shun, {
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Exenterator'] = set_combine(sets.Shun, {})
    sets.precast.WS['Viper Bite'] = set_combine(sets.Shun, {})
    
    -- BLADE: Rin
    sets.Rin = {
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Gerdr Belt",
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ear="Odr Earring",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle",
    }
    sets.precast.WS['Blade: Rin'] = set_combine(sets.precast.WS, sets.Rin)
    sets.precast.WS['Blade: Rin'].SC = set_combine(sets.precast.WS.SC, sets.Rin)
    sets.precast.WS['Blade: Rin'].PDL = set_combine(sets.precast.WS['Blade: Rin'], {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},        
        right_ear="Hattori Earring +1", 
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    })
    
    -- BLADE: KU 
    sets.Ku = {
        ammo="Coiste Bodhar",
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Brutal Earring",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle",
    }
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, sets.Ku)
    sets.precast.WS['Blade: Ku'].SC = sets.precast.WS['Blade: Ku']
    sets.precast.WS['Blade: Ku'].PDL = set_combine(sets.precast.WS['Blade: Ku'], {
        legs={ name="Mpaca's Hose", augments={'Path: A',}},       
        right_ear="Hattori Earring +1", 
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    })
    
    sets.Ten = {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
     neck="Rep. Plat. Medal",
     waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Cornelia's Ring",
        right_ring="Regal Ring",
        back="Sacro Mantle",
    }
    
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, sets.Ten)
    sets.precast.WS['Blade: Ten'].SC = set_combine(sets.precast.WS['Blade: Ten'], {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Blade: Ten'].PDL = set_combine(sets.precast.WS['Blade: Ten'], {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        right_ear="Hattori Earring +1", 
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, { 
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Mpaca's Cap", augments={'Path: A',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Cornelia's Ring",
        right_ring="Regal Ring",
        back="Sacro Mantle",
    })
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], { 
        ammo="Crepuscular Pebble",
        right_ear="Hattori Earring +1", 
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    })
    sets.precast.WS['Savage Blade'].SC = set_combine(sets.precast.WS['Savage Blade'], { 
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })

    sets.precast.WS['Judgment'] = set_combine(sets.precast.WS['Savage Blade'],{})
    sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Savage Blade'].PDL,{})

    sets.precast.WS.Evisceration = {
        ammo="Yetshila +1",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet="Mummu Gamash. +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ear="Hattori Earring +1", 
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back="Andartia's Mantle", 
    }
    sets.precast.WS.Evisceration.PDL = set_combine(sets.precast.WS.Evisceration, {
        right_ear="Hattori Earring +1", 
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    })

    sets.precast.WS["True Strike"] = set_combine(sets.precast.WS.Evisceration, {})
    sets.precast.WS["True Strike"].PDL= set_combine(sets.precast.WS.Evisceration, {})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS['Aeolian Edge'], {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        neck="Fotia Gorget",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Cornelia's Ring",
        right_ring="Gere Ring",
    })
    sets.precast.WS['Tachi: Jinpu'].PDL = set_combine(sets.precast.WS['Tachi: Jinpu'], {
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        right_ear="Hattori Earring +1",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Tachi: Jinpu'].SC = set_combine(sets.precast.WS['Tachi: Jinpu'], {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
    })
    sets.precast.WS['Tachi: Kagero'] = set_combine(sets.precast.WS['Tachi: Jinpu'], {})
    sets.precast.WS['Tachi: Kagero'].PDL = set_combine(sets.precast.WS['Tachi: Jinpu'].PDL, {})
    sets.precast.WS['Tachi: Koki'] = set_combine(sets.precast.WS['Tachi: Jinpu'], {})
    sets.precast.WS['Tachi: Koki'].PDL = set_combine(sets.precast.WS['Tachi: Jinpu'].PDL, {})
    sets.precast.WS['Tachi: Goten'] = set_combine(sets.precast.WS['Tachi: Jinpu'], {})
    sets.precast.WS['Tachi: Goten'].PDL = set_combine(sets.precast.WS['Tachi: Jinpu'].PDL, {})
    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Sacro Mantle",
    })

    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS['Aeolian Edge'], {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Orpheus's Sash",
        left_ring="Cornelia's Ring",
        right_ring="Gere Ring",
        back="Sacro Mantle",
       })
       
    sets.precast.WS['Blade: Chi'].PDL = set_combine(sets.precast.WS['Blade: Chi'], {
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        right_ear="Hattori Earring +1",
        left_ring="Sroda Ring",
    })

    sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Blade: Teki'].PDL = set_combine(sets.precast.WS['Blade: Chi'], {
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        right_ear="Hattori Earring +1",
        left_ring="Sroda Ring",
    })
    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Teki']
    sets.precast.WS['Blade: To'].PDL = sets.precast.WS['Blade: Teki'].PDL
    
    sets.precast.WS['Blade: Yu'] = set_combine(sets.precast.WS, {       
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ring="Cornelia's Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        back="Sacro Mantle",
    })
    sets.precast.WS['Blade: Yu'].PDL = sets.precast.WS['Blade: Yu']

    sets.precast.WS['Blade: Ei'] = set_combine(sets.precast.WS, {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Archon Ring",
        right_ring="Cornelia's Ring",
        back="Sacro Mantle",
    })
       sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ear="Mache Earring +1",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back="Sacro Mantle",
    })
       sets.precast.WS['Asuran Fists'].PDL = set_combine(sets.precast.WS.PDL, {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Fotia Belt",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        right_ear="Hattori Earring +1",
        left_ring="Sroda Ring",
        right_ring="Regal Ring",
        back="Sacro Mantle",
    })
       sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS['Blade: Shun'], sets.precast.WS) 
       sets.precast.WS['Spinning Attack'].PDL= set_combine(sets.precast.WS['Blade: Shun'].PDL, sets.precast.WS) 
       sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS['Blade: Shun'], sets.precast.WS)
       sets.precast.WS['Backhand Blow'].PDL = set_combine(sets.precast.WS['Blade: Shun'].PDL, sets.precast.WS)
       sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS['Blade: Shun'], sets.precast.WS)
       sets.precast.WS['Shoulder Tackle'].PDL = set_combine(sets.precast.WS['Blade: Shun'].PDL, sets.precast.WS)
       sets.precast.WS['Combo'] = set_combine(sets.precast.WS['Blade: Shun'], sets.precast.WS) 
       sets.precast.WS['Combo'].PDL = set_combine(sets.precast.WS['Blade: Shun'].PDL, sets.precast.WS) 

       sets.precast.WS['Blade: Retsu'] = sets.precast.WS
       --sets.precast.WS['Blade: Retsu'].PDL = set_combine(sets.precast.WS.PDL) 

-- Elemental Weapon Skill --elemental_ws--

-- SANGUINE BLADE
-- 50% MND / 50% STR Darkness Elemental
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring="Cornelia's Ring",
    back="Sacro Mantle",
})

sets.precast.WS["Dark Harvest"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Shadow of Death"] = set_combine(sets.precast.WS["Sanguine Blade"], {})

sets.precast.WS["Infernal Scythe"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Steal"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS["Energy Drain"] = set_combine(sets.precast.WS["Sanguine Blade"], {})
sets.precast.WS.Cataclysm = sets.precast.WS["Sanguine Blade"]

sets.precast.WS["Burning Blade"] = set_combine(sets.precast.WS, {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ring="Cornelia's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ear="Friomisi Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    back="Sacro Mantle",
})

sets.precast.WS["Red Lotus Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Shining Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS["Burning Blade"],{})
sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS["Burning Blade"],{})
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

sets.precast.WS["Shadow of Death"].Proc = set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Cyclone"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Starburst"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Sunburst"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Earth Crusher"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Red Lotus Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Seraph Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Seraph Strike"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Energy Drain"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Blade: Ei"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Shining Blade"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Raiden Thrust"].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS['Tachi: Jinpu'].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS['Tachi: Koki'].Proc =  set_combine(sets.precast.WS.Proc,{})
sets.precast.WS["Freezebite"].Proc =  {
    ammo="Pemphredo Tathlum",
    head="Malignance Chapeau", 
    body="Malignance Tabard", 
    hands="Malignance Gloves", 
    legs="Malignance Tights", 
    feet="Malignance Boots", 
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    neck="Null Loop",
    waist="Null Belt",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}
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
sets.precast.WS['Tachi: Ageha'] = sets.precast.WS["Shell Crusher"]
sets.precast.WS["Shockwave"] = set_combine(sets.precast.WS, {})

-- Extra Melee sets.  Apply these on top of melee sets.

    sets.Knockback = {}
    sets.Resist = {
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
        feet="Ahosi Leggings",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Engraved Belt",
    }

	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    }
	sets.DWMax = {  head="Ryuo Somen +1", --9
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    feet="Hiza. Sune-Ate +2", --8
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
    }
    sets.DWFull =  {
        -- head="Ryuo Somen +1", --9
        body="Mochi. Chainmail +3", --9
        -- legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},--5
        feet=gear.taeon_dw_feet,--9
        -- feet="Hiza. Sune-Ate +2", --8
       left_ear="Suppanomimi",  --5
       right_ear="Eabani Earring", --4
       waist="Reiki Yotai", --7
    }-- 39%

    sets.DWFull2 =  {
        -- head="Ryuo Somen +1", --9
        body="Mochi. Chainmail +3", --9
        -- legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},--5
        feet=gear.taeon_dw_feet,--9
        -- feet="Hiza. Sune-Ate +2", --8
       left_ear="Suppanomimi",  --5
       right_ear="Eabani Earring", --4
       left_ring="Mummu Ring",
       right_ring="Hetairoi Ring",
       waist="Reiki Yotai", --7
    }-- 39%
    sets.DWFull32 =  {
        -- head="Ryuo Somen +1", --9
        body="Mochi. Chainmail +3", --9
        -- legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},--5
        feet=gear.taeon_dw_feet,--9
        -- feet="Hiza. Sune-Ate +2", --8
       left_ear="Suppanomimi",  --5
       right_ear="Eabani Earring", --4
       left_ring="Mummu Ring",
       right_ring="Hetairoi Ring",
       waist="Windbuffet Belt +1",
    --    waist="Reiki Yotai", --7
    }-- 32%

	-- Treasure Hunter
	--sets.TreasureHunter,
	sets.TreasureHunter = set_combine({
        legs=gear.herculean_treasure_legs,
        head="Volte Cap",
        ammo="Per. Lucky Egg", 
        --legs={ name="Herculean Trousers", augments={'"Dbl.Atk."+1','AGI+6','"Treasure Hunter"+2','Accuracy+11 Attack+11','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    })

	sets.Skillchain = {legs="Ryuo Hakama +1",}


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
        legs={ name="Mpaca's Hose", augments={'Path: A',}},

	}

    sets.passive.PDL = {
        ammo="Crepuscular Pebble",
        legs={ name="Mpaca's Hose", augments={'Path: A',}},
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        right_ear="Hattori Earring +1",
        left_ring="Sroda Ring",
	}
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.SIRD = {
        --sub="Tancho +1",
        ammo="Staunch Tathlum +1",
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Halasz Earring",
        right_ring="Evanescence Ring",
        back="Moonlight Cape",
    }

    sets.midcast.ElementalNinjutsu = {  
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body="Gyve Doublet",
    hands="Hattori Tekko +2",
    legs="Gyve Trousers",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Dingir Ring",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    back="Argocham. Mantle",}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
    sets.midcast['Elemental Magic'] = set_combine(sets.midcast.ElementalNinjutsu, {
        ammo="Pemphredo Tathlum",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
    })

	sets.MagicBurst = set_combine(sets.midcast.ElementalNinjutsu, { 
        head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
        body="Gyve Doublet",
        hands="Hattori Tekko +2",
        legs="Gyve Trousers",
        feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Mujin Band",
        back="Argocham. Mantle",
    })

    sets.midcast.NinjutsuDebuff = { 
    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck="Sanctity Necklace",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",}

    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.NinjutsuDebuff,{})
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, { 
    neck="Incanter's Torque",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",})

    sets.midcast.Utsusemi = set_combine(sets.precast.FC, {
        feet="Hattori Kyahan +2",
        back="Andartia's Mantle",
    })

    sets.midcast.Migawari = set_combine(sets.midcast.Ninjutsu, { 
    neck="Incanter's Torque",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Andartia's Mantle",
    })


    sets.midcast['Enhancing Magic'] = {
        neck="Incanter's Torque",
        waist="Olympus Sash",
        left_ear="Mendi. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
	}

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell


    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Stone Gorget",
        legs="Haven Hose",
        left_ear="Earthcry Earring",
        waist="Siegel Sash"})
        
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
        head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    })
    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    }
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	
    sets.Self_Refresh = {waist="Gishdubar Sash"}
    
    sets.midcast.Cure = {
        ammo="Pemphredo Tathlum",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Macabre Gaunt. +1", augments={'Path: A',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Taeon Boots", augments={'Phalanx +3',}},
        neck="Reti Pendant",
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Mendi. Earring",
        -- left_ring="Naji's Loop",
        right_ring="Defending Ring",
        back="Solemnity Cape",
	}

    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        neck="Erra Pendant",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Kishar Ring",
    }

    sets.midcast.RA = {
        ammo=empty,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        left_ear="Crep. Earring",
        right_ear="Telos Earring",}

    sets.midcast.RA.Acc = {
        ammo=empty,
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        left_ear="Crep. Earring",
        right_ear="Telos Earring",}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        body="Hiza. Haramaki +2",
        hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
        feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
            neck={ name="Bathy Choker +1", augments={'Path: A',}},
            left_ear="Infused Earring",
            left_ring="Chirich Ring +1",
            right_ring="Chirich Ring +1",
}

-- Idle sets

--idle - defense

sets.idle = {
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
sets.idle.DT = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Paguroidea Ring",
    back="Moonlight Cape",
    }
sets.idle.MDT = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring="Shadow Ring",
    right_ring="Defending Ring",
    right_ring="Purity Ring",
    back="Moonlight Cape",
}
sets.idle.HP = {
    head="Genmei Kabuto",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    right_ear="Tuisto Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}
sets.idle.EnemyCritRate = set_combine(sets.idle.DT, { 
    ammo="Eluder's Sachet",
    left_ring="Warden's Ring",
    right_ring="Fortified Ring",
    back="Reiki Cloak",
})
sets.idle.Regen = set_combine(sets.idle, {
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body="Hizamaru Haramaki +2",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    ear2="Infused Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})


sets.idle.Regain = {
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Regal Gloves",
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
sets.idle.Sphere = set_combine(sets.idle, {})
sets.idle.Evasion = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Eabani Earring",
    right_ear="Infused Earring",
    left_ring="Vengeful Ring",
    right_ring="Hizamaru Ring",
    back="Null Shawl",
}    
sets.idle.Empy = set_combine(sets.idle, {
    head="Hattori Zukin +2",
    body="Hattori Ningi +2",
    hands="Hattori Tekko +2",
    legs="Hattori Hakama +2",
    feet="Hattori Kyahan +2",
})



    -- Defense sets
    sets.defense.PDT = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Paguroidea Ring",
        back="Moonlight Cape",
    }
    sets.defense.Enmity = {
        head="Malignance Chapeau",
        body={ name="Emet Harness +1", augments={'Path: A',}},
        hands="Kurys Gloves",
        legs={ name="Zoar Subligar +1", augments={'Path: A',}},
        feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Trux Earring",
        right_ear="Cryptic Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back="Reiki Cloak",
    }
    sets.defense.HP = {
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        right_ear="Tuisto Earring",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Eihwaz Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.MDT = set_combine(sets.defense.PDT, {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Purity Ring",
        back="Moonlight Cape",
    })
    sets.defense.Evasion = sets.idle.Evasion

	sets.defense.MEVA = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Purity Ring",
        back="Moonlight Cape",}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    
    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
        ammo="Coiste Bodhar",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        right_ring="Gere Ring",
        left_ring="Epona's Ring",
        back="Andartia's Mantle",
    }

    sets.engaged.Acc = set_combine(sets.engaged, {
        ammo="Yamarang",
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
    })
    sets.engaged.TP = {
        ammo="Coiste Bodhar",
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body={ name="Tatena. Harama. +1", augments={'Path: A',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Ryuo Hakama +1",
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        right_ring="Gere Ring",
        left_ring="Epona's Ring",
        back="Null Shawl",
    }
    sets.engaged.STP = set_combine(sets.engaged, {
        ranged=Empty,
        ammo="Seki Shuriken",
        head="Ryuo Somen +1",
        body="Tatena. Harama. +1",
        hands="Tatena. Gote +1",
        legs="Ryuo Hakama +1",
        feet="Tatena. Sune. +1",
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        back="Null Shawl",
    })
    sets.engaged.ZANISH = set_combine(sets.engaged, {
        ranged=Empty,
        ammo="Seki Shuriken",
        head="Ryuo Somen +1",
        body="Tatena. Harama. +1",
        hands="Tatena. Gote +1",
        legs="Tatena. Haidate +1",
        feet="Ryuo Sune-Ate +1",
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Dedition Earring",
        ear2="Telos Earring",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back="Null Shawl",
        
    })
    sets.engaged.DOUBLE = set_combine(sets.engaged,{
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
        body={ name="Tatena. Harama. +1", augments={'Path: A',}},
        hands={ name="Herculean Gloves", augments={'"Triple Atk."+4',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Attack+5','"Triple Atk."+4','AGI+4','Accuracy+1',}},
        neck="Clotharius Torque",
        waist="Windbuffet Belt +1",
        left_ear="Balder Earring +1",
        right_ear="Cessance Earring",
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Attack+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    })
    sets.engaged.CRIT = {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Nefarious Collar +1",
        waist="Sailfi Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        back="Andartia's Mantle",
    }
    sets.engaged.CRITRA = {
        ranged=Empty,
        ammo="Seki Shuriken",
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Nefarious Collar +1",
        waist="Sailfi Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        back="Andartia's Mantle",
    }

------------------------------------------------------------------------------------------------
    ---------------------------------------- DW ------------------------------------------
------------------------------------------------------------------------------------------------
    -- * NIN Native DW Trait: 35% DW

    -- No Magic Haste (74% DW to cap)

    sets.engaged.DW = {
        ammo="Seki Shuriken",
        head="Ryuo Somen +1", --9
        body={ name="Tatena. Harama. +1", augments={'Path: A',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Malignance Boots",
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        right_ring="Gere Ring",
        left_ring="Epona's Ring",
        back="Andartia's Mantle",
    }
    
    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
        ammo="Seki Shuriken",
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        left_ear="Crep. Earring",
        ear2="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        waist="Olseni Belt",
    })
    sets.engaged.DW.STP = set_combine(sets.engaged.STP, {
        ammo="Seki Shuriken",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Gerdr Belt",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    })
    sets.engaged.DW.TP = set_combine(sets.engaged.TP, {
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Gerdr Belt",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Null Shawl",
    })
    sets.engaged.DW.CRIT =  {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Nefarious Collar +1",
        waist="Gerdr Belt",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        left_ring="Mummu Ring",
        right_ring="Hetairoi Ring",
        back="Andartia's Mantle",
        --[[ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet="Mummu Gamash. +2",
        neck="Nefarious Collar +1",
        waist="Gerdr Belt",
        left_ear="Brutal Earring",
        right_ear="Odr Earring",
        left_ring="Mummu Ring",
        right_ring="Hetairoi Ring",
        back="Andartia's Mantle",]]
    }
    sets.engaged.DW.CRITRA = set_combine(sets.engaged.CRITRA,{})

    sets.engaged.DW.DOUBLE = set_combine(sets.engaged.DOUBLE,{
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Reiki Yotai", --7
    })

------------------------------------------------------------------------------------------------
    ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------
sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
    head="Ryuo Somen +1", --9
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
    feet="Hiza. Sune-Ate +2", --8
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
})-- 39%
sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.Acc, {
    head="Ryuo Somen +1", --9
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    feet="Hiza. Sune-Ate +2", --8
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
})-- 39%
sets.engaged.DW.STP.LowHaste = set_combine(sets.engaged.DW.STP, {
    head="Ryuo Somen +1", --9
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    feet="Hiza. Sune-Ate +2", --8
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
})-- 39%
sets.engaged.DW.TP.LowHaste = set_combine(sets.engaged.DW.TP, {
     head="Ryuo Somen +1", --9
     body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
     legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
    feet="Hiza. Sune-Ate +2", --8
    left_ear="Suppanomimi",  --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
})-- 39%
sets.engaged.DW.CRIT.LowHaste = set_combine(sets.engaged.DW.CRIT, {
    head="Ryuo Somen +1", --9
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, --6
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},--10
   feet="Hiza. Sune-Ate +2", --8
   left_ear="Suppanomimi",  --5
   right_ear="Eabani Earring", --4
   waist="Reiki Yotai", --7
})-- 39%

--MID-HASTE

sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.Acc, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.STP.MidHaste = set_combine(sets.engaged.DW.STP, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.TP.MidHaste = set_combine(sets.engaged.DW.TP, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%
sets.engaged.DW.CRIT.MidHaste = set_combine(sets.engaged.DW.CRIT, {
    left_ear="Suppanomimi", --5
    right_ear="Eabani Earring", --4
    waist="Reiki Yotai", --7
}) -- 16%

--HIGH-HASTE

sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {
    waist="Reiki Yotai", --7
}) -- 7%
sets.engaged.DW.Acc.HighHaste = set_combine(sets.engaged.DW.Acc, {
    waist="Reiki Yotai", --7
}) -- 7%
sets.engaged.DW.STP.HighHaste = set_combine(sets.engaged.DW.STP, {
    waist="Reiki Yotai", --7
}) -- 7%
sets.engaged.DW.TP.HighHaste = set_combine(sets.engaged.DW.TP, {
    waist="Reiki Yotai", --7
}) -- 7%
sets.engaged.DW.CRIT.HighHaste = set_combine(sets.engaged.DW.CRIT, {
    waist="Reiki Yotai", --7
}) -- 7%

sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW)
sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.Acc)
sets.engaged.DW.STP.MaxHaste = set_combine(sets.engaged.DW.STP)
sets.engaged.DW.TP.MaxHaste = set_combine(sets.engaged.DW.TP)
sets.engaged.DW.CRIT.MaxHaste = set_combine(sets.engaged.DW.CRIT)

------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.Hybrid = {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",    --10/10
    hands="Malignance Gloves", --5/5
    legs="Malignance Tights", --7/7
    feet="Malignance Boots", --4/4
    --ring2="Defending Ring", --10/10
}

sets.engaged.DT = set_combine(sets.engaged, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",    --10/10
    hands="Malignance Gloves", --5/5
    legs="Malignance Tights", --7/7
    feet="Malignance Boots", --4/4
    --ring2="Defending Ring", --10/10
})
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid)
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)
sets.engaged.TP.DT = set_combine(sets.engaged.TP, sets.engaged.Hybrid)
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})




------------------------------------------------------------------------------------------------
---------------------------------------- DW-HASTE Hybrid Sets-----------------------------------
------------------------------------------------------------------------------------------------

sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)
sets.engaged.DW.TP.DT = set_combine(sets.engaged.DW.TP, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})

sets.engaged.DW.DT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.LowHaste = set_combine(sets.engaged.DW.STP.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.TP.DT.LowHaste = set_combine(sets.engaged.DW.TP.LowHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.LowHaste = set_combine(sets.engaged.DW.CRIT.LowHaste, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})
sets.engaged.DW.DT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.MidHaste = set_combine(sets.engaged.DW.STP.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.TP.DT.MidHaste = set_combine(sets.engaged.DW.TP.MidHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.MidHaste = set_combine(sets.engaged.DW.CRIT.MidHaste, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})

sets.engaged.DW.DT.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.HighHaste = set_combine(sets.engaged.DW.Acc.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.HighHaste = set_combine(sets.engaged.DW.STP.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.TP.DT.HighHaste = set_combine(sets.engaged.DW.TP.HighHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.HighHaste = set_combine(sets.engaged.DW.CRIT.HighHaste, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})

sets.engaged.DW.DT.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.STP.DT.MaxHaste = set_combine(sets.engaged.DW.STP.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.TP.DT.MaxHaste = set_combine(sets.engaged.DW.TP.MaxHaste, sets.engaged.Hybrid)
sets.engaged.DW.CRIT.DT.MaxHaste = set_combine(sets.engaged.DW.CRIT.MaxHaste, sets.engaged.Hybrid, {
    head={ name="Mpaca's Cap", augments={'Path: A',}}, --7/7
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
})

------------------------------------------------------------------------------------------------
---------------------------------------- Special Sets ------------------------------------------
------------------------------------------------------------------------------------------------




    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    
sets.buff.Migawari = {    
body="Hattori Ningi +2",
back="Andartia's Mantle",
}
-- --if get debuff slow equip set
-- sets.buff.Slow = {hands={ name="Gazu Bracelets +1", augments={'Path: A',}}, --10% haste
-- waist="Tempus Fugit +1",}  --15% haste
sets.buff.Slow = set_combine(sets.buff.Slow, {
    legs="Jokushu Haidate",
})

    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}
    
    --sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {hands="Hattori Tekko +2"}
    sets.buff.Yonin = {legs="Hattori Hakama +2",} -- Hattori Hakama +2
    sets.buff.Innin = {head="Hattori Zukin +2",} --head="Hattori Zukin +1"

end
function user_job_lockstyle() 
    if data.areas.Abyssea:contains(world.area) or state.Stylenotwingsemode.value then

    -- if (world.area:contains('Abyssea - Altepa') or world.area:contains('Abyssea - Misareaux') or world.area:contains('Abyssea - La Theine') or 
    -- world.area:contains('Abyssea - Uleguerand') or world.area:contains('Abyssea - Konschtat') or world.area:contains('Abyssea - Vunkerl')) then
        windower.chat.input('/lockstyleset 1')
        send_command('gs c update') 
        style_lock = true
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
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
        windower.chat.input('/lockstyleset 144') --Catchall
    end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(6, 5)
    elseif player.sub_job == 'RNG' then
        set_macro_page(8, 5)
    elseif player.sub_job == 'RDM' then
        set_macro_page(8, 5)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'RUN' then
        set_macro_page(8, 5)
    elseif world.area:contains("Abyssea") then
        set_macro_page(6, 5)
    else
        set_macro_page(8, 5)
    end
end


function user_job_buff_change(buff, gain)
    -- Define messages for specific buffs with flags for gain and lose announcements
    local buff_messages = {
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
    if buff_messages[buff] and player.status ~= 'Dead' then
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



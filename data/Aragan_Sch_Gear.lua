-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------
--its work with Gearinfo Addon for give more info on screen

--info.skillchain.tier1 =

--{'Transfixion','Compression','Liquefaction','Scission',
--'Reverberation','Detonation','Induration','Impaction'}

--info.skillchain.tier2 = {'Gravitation','Distortion','Fusion','Fragmentation'}

--info.skillchain.tier3 = {'Dark','Light'}

--[[


u need for auto solo skillchain and Magic Burst from gearswap :
SCH_soloSC.lua 
include('common_info.skillchain.lua')

command add macro :
SC1
/console gs c elemental skillchain1
SC2
/console gs c elemental skillchain2
SC3
/console gs c elemental skillchain3

Usage example : 

/console gs c elemental skillchain1
/console gs c elemental skillchain2
/console gs c elemental skillchain3
/console gs c elemental skillchain4
/console gs c elemental skillchain5
/console gs c elemental skillchain6

---
command add macro 
for change weather :
/console gs c elemental weather
---
command add macro 
for helix :
/console gs c elemental helix


-----

and u can use this code out gearswap from script SCH_soloSC.lua :

/console gs c soloSC 1 Fusion
=> will do 1 skillchain, ending with Fusion : Fire, Thunder. Equivalent to /console gs c soloSC 1 Fusion false false
/console gs c soloSC 3 Fragmentation
=> will do 3 skillchains, ending with Fragmentation : Stone, Water, Blizzard, Water
/console gs c soloSC max Fusion
=> will spend all stratagems to perform skillchains, ending with Fusion
/console gs c soloSC 1 Fusion true
=> will do 1 SC Fusion, and cast Fire V for magic burst
/console gs c soloSC 1 Fusion true true
=> will do 1 SC Fusion and cast Fire V for magic burst, with no information displayed in party chat

/console gs c soloSC 1 Induration true
/console gs c soloSC 1 Scission true
/console gs c soloSC 2 Fusion true
/console gs c soloSC 1 Fragmentation true

-----

and u can use solo skillchain and Magic Burst from addon schskillchain  :

# schskillchain(ssc)
addon schskillchain command :


- usage example

  Open Liquefacrion(溶解)

        //ssc fire open

  Close Liquefacrion(溶解) (settable the first letter of parameter)

        //ssc f c

  Close Liquefacrion(溶解) and Magic Burst Pyrohelix II (火門の計II)

        //ssc f c mb h2 

  Open and Close Fragmentation(分解) (Closing Spell Helix) and Magic Burst Thunder V (サンダーV)

        //ssc t2 a h mb 5

  Open and Close Fragmentation T1 and Magic Burst Thunder V

          //ssc t2 a h mb 5
  
  Perform a 6 step skillchain. (For things like Vagary and Omen)
  
		//ssc 6step
		
for macro solo skillchain and Magic Burst 
fusion
/console input //ssc f2 a mb 5
Fragmentation close with helix
/console input //ssc t2 a h mb 5
Induration
/console input //ssc b a mb 4
Scission 
/console input //ssc s a mb 5
Scission close with helix
/console input //ssc s a h mb 5
Gravitation
/console input //ssc s2 a
for more info go README.txt for addons
Distortion
/console input //ssc b2 a

]]



-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('None','Normal','Acc','DT')
    state.CastingMode:options('Normal','Seidr','magicburst','Enmity','ConserveMP','Sird','SubtleBlow', 'Proc')
    state.IdleMode:options('Normal', 'DT', 'Resist','BoostHP','BoostMB', 'Evasion', 'EnemyCritRate','vagary','Sphere')
    state.PhysicalDefenseMode:options('PDT','BoostHP', 'Evasion', 'Resist')
    state.MagicalDefenseMode:options('MDT')
	state.Weapons:options('Mpaca','Marin','None')

	gear.nuke_jse_back = {"Lugh's Cape"}

    --use //listbinds    .. to show command keys
    -- Additional local binds
    send_command('bind f7 input //Sublimator')-- addon name Sublimator
    send_command('bind ^` input /ja Immanence <me>')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind !f11 gs c set DefenseMode Magical')
    send_command('bind ^- gs c scholar light')
    send_command('bind ^= gs c scholar dark')
    send_command('bind ^[ gs c scholar power')
    send_command('bind ^] gs c scholar accuracy')
    send_command('bind ^; gs c scholar speed')
    --send_command('bind !w input /ma "Aspir II" <t>')
    send_command('bind !o input /ma "Regen V" <stpc>')
    send_command('bind ![ gs c scholar aoe')
    send_command('bind !] gs c scholar duration')
    send_command('bind !; gs c scholar cost')
    send_command('bind f5 gs c cycle HelixMode')
    send_command('bind @r gs c cycle RegenMode')
    send_command('bind !s gs c toggle StormSurge')
    send_command('bind !w gs c toggle WeaponLock')
    send_command('bind ^x gs c toggle RP')  
    send_command('bind ^numpad0 input /Myrkr')
    send_command('bind f6 gs c cycle weapons')
    send_command('bind !f6 gs c cycleback weapons')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('bind f4 gs c cycle ElementalMode')
    send_command('bind f3 input //gs c Elemental weather')
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
    send_command('bind f2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.
	send_command('bind !f2 gs c cycle RecoverMode')
    send_command('bind @f2 gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()


end

-- Define sets and vars used by this job file.
function init_gear_sets()


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    ---- WeaponSet ---- 
    --sets.normal = {}
    sets.weapons.Marin = {main="Marin Staff +1",sub="Enki Strap"}
    sets.weapons.Mpaca = {main="Mpaca's Staff",sub="Enki Strap"}


    sets.Capacity = {}
    sets.RP = {}

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"}
    sets.precast.JA['Sublimation'] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands="Regal Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    waist="Embla Sash",
    neck="Unmoving Collar +1",
    ear1="Eabani Earring",
    ear2="Etiolation Earring",
    ring1="Gelatinous Ring +1",
    ring2="Eihwaz Ring",
    back="Moonlight Cape",    
}

sets.precast.RA = {ammo=empty,
head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
left_ear="Crep. Earring",
right_ear="Telos Earring",
}

    -- Fast cast sets for spells
    sets.precast.FC = {
    --    /RDM --15
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6','INT+1',}},
    body="Pinga Tunic +1",
    hands="Acad. Bracers +3",
    legs="Pinga Pants +1",
    feet={ name="Regal Pumps +1", augments={'Path: A',}},
    neck="Baetyl Pendant",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
    }
    sets.precast.FC.Arts = {head="Peda. M.Board +3", feet="Acad. Loafers +3"}
    sets.precast.FC.Arts.EnhancingDuration = set_combine(sets.precast.FC, {
        feet="Acad. Loafers +3", waist="Siegel Sash"})

    sets.precast.FC.Grimoire = {head="Peda. M.Board +3", feet="Acad. Loafers +3"}

    sets.precast.FC.Grimoire.EnhancingDuration = set_combine(sets.precast.FC, {
       feet="Acad. Loafers +3", waist="Siegel Sash"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.EnhancingDuration = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        ear1="Mendi. Earring", --5
        ring1="Lebeche Ring", --(2)
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})
    sets.precast.Storm = set_combine(sets.precast.FC, {ring1="Stikini Ring +1"})

    sets.TreasureHunter = {ammo="Per. Lucky Egg",
    head="White rarab cap +1", 
    waist="Chaac Belt"} 
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {} --body="Seidr Cotehardie"}
	
    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo="Pemphredo Tathlum",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Rufescent Ring",
        right_ring="Cornelia's Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},}

    sets.precast.WS['Omniscience'] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Cornelia's Ring",
        right_ring="Archon Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
        })

        sets.precast.WS['Myrkr'] = {
            ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
            head="Pixie Hairpin +1",
            body={ name="Ros. Jaseran +1", augments={'Path: A',}},
            hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
            legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
            feet="Arbatel Loafers +3",
            neck="Sanctity Necklace",
            waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Evans Earring",
            left_ring="Mephitas's Ring",
            right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
        }

        sets.precast.WS['Cataclysm'] = {
            ammo="Pemphredo Tathlum",
            head="Pixie Hairpin +1",
            body="Nyame Mail",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",
            neck="Baetyl Pendant",
            waist="Orpheus's Sash",
            left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
            right_ear="Friomisi Earring",
            left_ring="Cornelia's Ring",
            right_ring="Archon Ring",
            back={ name="Aurist's Cape +1", augments={'Path: A',}},
        }
        
     sets.precast.WS['Black Halo'] = {
        ammo="Crepuscular Pebble",
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
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    sets.precast.WS['Starburst'] = sets.precast.WS['Omniscience']
    sets.precast.WS['Sunburst'] = sets.precast.WS['Omniscience']
    sets.precast.WS['Earth Crusher'] = sets.precast.WS['Omniscience']
    sets.precast.WS['Rock Crusher'] = sets.precast.WS['Omniscience']
    sets.precast.WS['Seraph Strike'] = sets.precast.WS['MyOmnisciencerkr']
    sets.precast.WS['Shining Strike'] = sets.precast.WS['Omniscience']

    sets.precast.WS['Shattersoul'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
        neck="Clotharius Torque",
        waist="Windbuffet Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Balder Earring +1",
        left_ring="Petrov Ring",
        right_ring="Hetairoi Ring",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = {}--sets.precast.FC

    sets.midcast.Cure = {
        main={ name="Musa", augments={'Path: C',}},
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+5','"Cure" potency +10%','MND+4','Mag. Acc.+1',}},
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Incanter's Torque",
        waist="Shinjutsu-no-Obi +1",
        right_ear="Mendi. Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Naji's Loop",
        back="Solemnity Cape",
        }
    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        waist="Hachirin-no-Obi",})

        		
    sets.midcast.LightWeatherCure = sets.midcast.CureWeather
    
    sets.midcast.LightDayCure = sets.midcast.CureWeather

    sets.midcast.Cure.Enmity = set_combine(sets.midcast.Cure, {
        body="Pinga Tunic +1",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs="Pinga Pants +1",
        feet="Acad. Loafers +3",
        neck="Clotharius Torque",
        waist="Shinjutsu-no-Obi +1",
        left_ear="Enervating Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
        back="Solemnity Cape",})

    sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure, {
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="Vedic Coat",
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Incanter's Torque",
        waist="Shinjutsu-no-Obi +1",
        right_ear="Mendi. Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back="Solemnity Cape",})

    sets.midcast.Cure.Sird = set_combine(sets.midcast.Cure, {
        main="Malignance Pole",
        ammo="Staunch Tathlum +1",
        head="Agwu's Cap",
        body="Rosette Jaseran +1",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Rumination Sash",
        left_ear="Halasz Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back="Moonlight Cape",
    })
    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        ring1="Stikini Ring +1",
        ring2="Metamor. Ring +1",
        waist="Shinjutsu-no-Obi +1",
        })
        
    sets.midcast.Curaga.Enmity = set_combine(sets.midcast.Cure.Enmity, {})
    sets.midcast.Curaga.ConserveMP = set_combine(sets.midcast.Cure.ConserveMP, {})
    sets.midcast.Curaga.Sird = set_combine(sets.midcast.Cure.Sird, {})
    sets.Cure_Received = {hands={ name="Agwu's Gages", augments={'Path: A',}},
    waist="Gishdubar Sash",}

    sets.midcast.StatusRemoval = {
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Debilis Medallion",
        left_ring="Haoma's Ring",
        right_ring="Menelaus's Ring",
        }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        ammo="Pemphredo Tathlum",
        body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Debilis Medallion",
        waist="Gishdubar Sash",
        left_ring="Haoma's Ring",
        right_ring="Menelaus's Ring",
        })

    sets.midcast['Enhancing Magic'] = {
        main={ name="Musa", augments={'Path: C',}},
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Telchine Cap",
        hands="Telchine Gloves",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        neck="Incanter's Torque",
        waist="Embla Sash",
        left_ear="Mendi. Earring",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
        }

    sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
        main={ name="Musa", augments={'Path: C',}},
        sub="Enki Strap",
        head="Telchine Cap",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        back={ name="Fi Follet Cape +1", augments={'Path: A',}},
        })

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main={ name="Musa", augments={'Path: C',}},
        head="Arbatel Bonnet +2",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        back="Lugh's Cape",
        })

    sets.midcast.RegenDuration = set_combine(sets.midcast['Enhancing Magic'], {
        main={ name="Musa", augments={'Path: C',}},
        head="Arbatel Bonnet +2",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        back="Lugh's Cape",
        })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head="Telchine Cap",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        })
    sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        head="Telchine Cap",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        neck="Nodens Gorget",
        waist="Embla Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        head="Telchine Cap",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        })

    sets.midcast.Storm = sets.midcast.EnhancingDuration

    sets.midcast.Stormsurge = set_combine(sets.midcast.Storm, {feet={ name="Peda. Loafers +3", augments={'Enhances "Stormsurge" effect',}},})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {left_ear="Brachyura Earring",})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
        ammo="Pemphredo Tathlum",
        head=empty,
        body="Cohort Cloak +1",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
        neck="Argute Stole +2",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring2="Kishar Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        waist="Luminary Sash",
        back="Aurist's Cape +1",
        }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        legs="Chironic Hose",
        left_ring="Stikini Ring +1",
        waist="Acuity Belt +1",
    })
	sets.midcast.Dia = sets.midcast.MndEnfeebles
	sets.midcast.Diaga = sets.midcast.MndEnfeebles
	sets.midcast['Dia II'] = sets.midcast.MndEnfeebles
	sets.midcast.Bio = sets.midcast.IntEnfeebles
	sets.midcast['Bio II'] = sets.midcast.IntEnfeebles
	
    --[[sets.midcast.MndEnfeebles = set_combine(sets.midcast.IntEnfeebles,{
        ammo="Pemphredo Tathlum",
        head=empty,
        body="Cohort Cloak +1",
        waist="Luminary Sash",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    })]]

    sets.midcast.ElementalEnfeeble = sets.midcast.Enfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak", sub="Ammurapi Shield"})

    sets.midcast['Dark Magic'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Peda. Pants +3",
        feet="Agwu's Pigaches",
        neck="Baetyl Pendant",
        waist="Fucho-no-obi",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Archon Ring",
        back="Lugh's Cape",
    }
    sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
            ammo="Pemphredo Tathlum",
            head="Arbatel Bonnet +2",
            body="Arbatel Gown +3",
            feet="Arbatel Loafers +3",
            neck="Erra Pendant",
            waist="Acuity Belt +1",
            left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
            right_ring="Kishar Ring",
    })

    sets.midcast.Kaustra = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Argute Stole +2",
        waist="Acuity Belt +1",
        left_ear="Regal Earring",
        left_ring="Archon Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back="Lugh's Cape",
    }
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Drain" and "Aspir" potency +10','CHR+5','Mag. Acc.+4',}},
        legs="Peda. Pants +3",
        feet={ name="Agwu's Pigaches", augments={'Path: A',}},
        neck="Erra Pendant",
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
    })
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        main={ name="Musa", augments={'Path: C',}},
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Peda. M.Board +3", 
        body={ name="Agwu's Robe", augments={'Path: A',}},
        hands="Acad. Bracers +3",
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Acad. Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Witful Belt",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Lugh's Cape",
    })
    sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {
        feet="Peda. Loafers +3"
    })
    -- Elemental Magic
    sets.midcast['Elemental Magic'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Agwu's Cap",
        body="Arbatel Gown +3",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Arbatel Loafers +3",
        neck="Argute Stole +2",
        waist="Acuity Belt +1",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back="Lugh's Cape",
        }

    sets.midcast['Elemental Magic'].Enmity= set_combine(sets.midcast['Elemental Magic'], {
    })
    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
        body="Seidr Cotehardie",
    })
    sets.midcast['Elemental Magic'].ConserveMP = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Pemphredo Tathlum",
        body="Seidr Cotehardie",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        waist="Shinjutsu-no-Obi +1",
    })
    sets.midcast['Elemental Magic'].magicburst = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Agwu's Cap",
        body="Arbatel Gown +3",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Arbatel Loafers +3",
        neck="Argute Stole +2",
        waist="Acuity Belt +1",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Mujin Band",
        right_ring="Freke Ring",
        back="Lugh's Cape",
    }
    sets.Proc = {
        ammo=empty,
        main=empty,
        sub=empty,
        head=empty,
        body=empty,
        hands=empty,
        legs=empty,
        feet=empty,
        neck=empty,
        waist=empty,
        left_ear=empty,
        right_ear=empty,
        left_ring=empty,
        right_ring=empty,
        back=empty,
    }
    sets.midcast['Elemental Magic'].Proc = {
        ammo=empty,
        main=empty,
        sub=empty,
        head=empty,
        body=empty,
        hands=empty,
        legs=empty,
        feet=empty,
        neck=empty,
        waist=empty,
        left_ear=empty,
        right_ear=empty,
        left_ring=empty,
        right_ring=empty,
        back=empty,
    }

    sets.midcast['magic burst'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Agwu's Robe",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Arbatel Loafers +3",
        neck="Argute Stole +2",
        waist="Acuity Belt +1",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Mujin Band",
        right_ring="Freke Ring",
        back="Lugh's Cape",
    }
    sets.midcast['magic burst'].Proc = {
        main=empty,
        sub=empty,
        head=empty,
        body=empty,
        hands=empty,
        legs=empty,
        feet=empty,
        neck=empty,
        waist=empty,
        left_ear=empty,
        right_ear=empty,
        left_ring=empty,
        right_ring=empty,
        back=empty,
        }
    sets.magic_burst = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Arbatel Gown +3",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Arbatel Loafers +3",
        neck="Argute Stole +2",
        waist="Acuity Belt +1",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back="Lugh's Cape",
        }
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        right_ring="Archon Ring",
        left_ring="Stikini Ring +1",
        waist="Shinjutsu-no-Obi +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},

        })

    sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        neck="Argute Stole +2",
        waist="Skrymir Cord",
        right_ear="Arbatel Earring +1",
        left_ring="Mallquis Ring",
    })
	sets.HelixBurst = sets.magic_burst
	
	sets.midcast.Helix.Proc = sets.precast.FC

    sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        head="Pixie Hairpin +1",
        ring2="Archon Ring",
        })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        right_ear="Arbatel Earring +1",
        })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC


    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo="Homiliary",
        head="Befouled Crown",
        body="Arbatel Gown +3",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Lugh's Cape",
   }

    sets.idle.DT = set_combine(sets.idle, {
        ammo="Homiliary",
        head="Nyame Helm",
        body="Arbatel Gown +3",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    })

    sets.idle.Resist = set_combine(sets.idle, {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Shamash Robe",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    waist="Plat. Mog. Belt",
    right_ear="Sanare Earring",
    left_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Moonlight Cape",})

    sets.idle.BoostHP = {        
        ammo="Homiliary",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Eihwaz Ring",
        back="Moonlight Cape",}
    sets.idle.BoostMB = set_combine(sets.idle, {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +3",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Arbatel Loafers +3",
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Defending Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    })
    sets.idle.EnemyCritRate = set_combine(sets.idle.DT, { 
        ammo="Eluder's Sachet",
        body={ name="Nyame Mail", augments={'Path: B',}},
        left_ear="Tuisto Earring",
        left_ring="Warden's Ring",
        right_ring="Fortified Ring",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        back="Reiki Cloak",
        })
    sets.idle.Evasion = {
        ammo="Amar Cluster",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back="Moonlight Cape",
    }
    sets.idle.vagary =  {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Sapience Orb",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Pinga Tunic +1",
    hands="Acad. Bracers +3",
    legs="Pinga Pants +1",
    feet={ name="Regal Pumps +1", augments={'Path: A',}},
    neck="Baetyl Pendant",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
sets.idle.Sphere = set_combine(sets.idle, {
    body="Annoint. Kalasiris",
})
    sets.idle.Town = set_combine(sets.idle, {
        main={ name="Musa", augments={'Path: C',}},
        left_ear="Infused Earring",
        feet="Herald's Gaiters"})
        
    sets.Adoulin = {body="Councilor's Garb",}

    sets.resting = set_combine(sets.idle, {
        main="Contemplator +1",
        ammo="Homiliary",
        head="Befouled Crown",
        body="Shamash Robe",
        legs="Assid. Pants +1",
        feet="Herald's Gaiters",
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        left_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Shamash Robe",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Paguroidea Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back="Moonlight Cape",
    }
    sets.defense.MDT = {   
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Shamash Robe",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shadow Ring",
    back="Moonlight Cape",
}

sets.defense.Resist = sets.idle.Resist
sets.defense.BoostHP = sets.idle.BoostHP
sets.defense.Evasion = sets.idle.Evasion
sets.defense.MEVA = sets.defense.MDT

sets.MoveSpeed = {feet="Herald's Gaiters"}
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi",}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
sets.engaged.None = {}
sets.engaged = {
        ammo="Homiliary",
        head="Befouled Crown",
        body="Shamash Robe",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Lugh's Cape",
    }
sets.engaged.Acc = {
        ammo="Amar Cluster",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Nyame Mail",
        hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
        legs="Nyame Flanchard",
        feet="Battlecast Gaiters",
        neck="Lissome Necklace",
        waist="Olseni Belt",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }
sets.engaged.DT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Lissome Necklace",
    waist="Cornelia's Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------



    sets.buff['Ebullience'] = {head="Arbatel Bonnet +2"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}

    sets.buff['Immanence'] = {
        head="Peda. M.Board +3", 
        feet="Acad. Loafers +3",
        body="Nyame Mail",
        hands="Arbatel Bracers +3",
        legs="Nyame Flanchard",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        back="Lugh's Cape",}

    sets.buff['Immanence'].SubtleBlow = {
        neck={ name="Bathy Choker +1", augments={'Path: A',}},
        left_ear="Digni. Earring",
        right_ear="Assuage Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",}
    sets.buff['Immanence'].Enmity = {
}
    
    sets.buff['Immanence'].Proc = {
        main=empty,
        sub=empty,
        head=empty,
        body=empty,
        hands=empty,
        legs=empty,
        feet=empty,
        neck=empty,
        waist=empty,
        left_ear=empty,
        right_ear=empty,
        left_ring=empty,
        right_ring=empty,
        back=empty,}

        sets.HPDown = {      ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +3",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Arbatel Loafers +3",
        neck="Sanctity Necklace",
        waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
        left_ear="Etiolation Earring",
        right_ear="Evans Earring",
        left_ring="Defending Ring",
        right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
    sets.HPCure = {        
        ammo="Homiliary",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Eihwaz Ring",
        back="Moonlight Cape",}
	

    sets.buff.FullSublimation = {
       --head="Acad. Mortar. +3", --4
       body="Peda. Gown +3", --5
       --ear1="Savant's Earring", --1
       waist="Embla Sash", --5
       }
       sets.buff.DTSublimation = {waist="Embla Sash"}

    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}
    

    sets.LightArts = {body="Arbatel Gown +3",}
    sets.DarkArts = {body="Arbatel Gown +3",}
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.Bookworm = {back="Bookworm's Cape",}

end
-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
        set_macro_page(4, 17)
	elseif player.sub_job == 'BLM' then
        set_macro_page(3, 17)
	elseif player.sub_job == 'WHM' then
        set_macro_page(2, 17)
	else
        set_macro_page(8, 17)
	end
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 173')
end
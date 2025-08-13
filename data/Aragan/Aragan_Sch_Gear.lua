-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

--[[ Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 


in macro job blm sch rdm nin drk geo whm pld for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C and spam mb on bosses 
/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H
/con gs c elemental aga -- for spell aja 
u can use addon automb 

--its work with Gearinfo Addon for give more info on screen

--info.skillchain.tier1 =

--{'Transfixion','Compression','Liquefaction','Scission',
--'Reverberation','Detonation','Induration','Impaction'}

--info.skillchain.tier2 = {'Gravitation','Distortion','Fusion','Fragmentation'}

--info.skillchain.tier3 = {'Dark','Light'}
]]

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
/console gs c cycle ElementalMode
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

for buf before seg ody or enter sortie just used turn autobuff to seg
]]



-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','STP', 'Acc','MaxAcc','CRIT', 'Enspell', 'SubtleBlow')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Match', 'SubtleBlow')
    state.CastingMode:options('Normal','DT','Seidr','magicburst','Enmity','ConserveMP','Sird','SubtleBlow', 'Proc','OccultAcumen')
    state.IdleMode:options('DT','Normal','Empy', 'Resist','HP','BoostMB', 'Evasion', 'EnemyCritRate','vagary','Sphere')
    state.PhysicalDefenseMode:options('PDT','HP', 'Evasion', 'Resist')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('MEVA')
    state.Passive = M{['description'] = 'Passive Mode','None','MaxAcc'}
	state.Weapons:options('Mpaca','Marin','None','Musa','Xoanon', 'Club','TernionDagger','DualDaybreak','DualMaxentius')
	state.AutoBuffMode:options('Off','seg','Auto','Fullbuff') --,'Vagary','Off','Off','Off','Off',

	gear.nuke_jse_back = {"Lugh's Cape"}

    --use //listbinds    .. to show command keys
    -- Additional local binds
    send_command('bind f7 gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
    --send_command('bind ^` input /ja Immanence <me>')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind !f11 gs c set DefenseMode Magical')
    --send_command('bind ^- gs c scholar light')
    --send_command('bind ^= gs c scholar dark')
    --send_command('bind ^[ gs c scholar power')
    --send_command('bind ^] gs c scholar accuracy')
    send_command('bind ^; gs c scholar speed')
    --send_command('bind !w input /ma "Aspir II" <t>')
    --send_command('bind !o input /ma "Regen V" <stpc>')
    --send_command('bind ![ gs c scholar aoe')
    --send_command('bind !] gs c scholar duration')
    send_command('bind !; gs c scholar cost')
    send_command('bind f7 gs c cycle HelixMode')
    send_command('bind @r gs c cycle RegenMode')
    send_command('bind @s gs c toggle StormSurge')
    send_command('bind !w gs c toggle WeaponLock')
    send_command('bind ^x gs c toggle RP')  
    send_command('bind ^numpad0 input /Myrkr')
    send_command('bind f6 gs c cycle weapons')
    send_command('bind !f6 gs c cycleback weapons')
    send_command('bind f1 gs c cycle HippoMode')
    send_command('bind ^/ gs disable all')
    send_command('bind !/ gs enable all')
    send_command('bind f4 gs c cycle ElementalMode')
    send_command('bind @f4 gs c cycleback ElementalMode')
    send_command('bind f3 gs c toggle AutoAPMode')

    
    -- send_command('bind f3 gs c Elemental weather')

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
    -- send_command('bind f2 gs c buffup;gs c input /p buffup")') --Buffup macro because buffs are love.
	send_command('bind !f2 gs c cycle RecoverMode')
    send_command('bind f2 gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
    send_command('bind @f2 gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
	--send_command('bind @f8 gs c toggle AutoNukeMode')
    send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	--send_command('bind ^backspace input /ma "Stun" <t>')
	--send_command('bind !backspace gs c scholar speed')
	--send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
    send_command('bind @f6 gs c set toggle AutoAPMode')

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
    sets.weapons.Musa = {main="Musa", sub="Giuoco Grip"}
    sets.weapons.Xoanon = {main="Xoanon", sub="Alber Strap"}
    sets.weapons.Club = {main="Maxentius",sub="Ammurapi Shield",}
    sets.weapons.TernionDagger = {main="Ternion Dagger +1",sub="Ammurapi Shield",}
	sets.weapons.DualDaybreak = {main="Daybreak", sub="Bunzi's Rod"}
	sets.weapons.DualMaxentius = {main="Maxentius", sub="Daybreak"}

    sets.Capacity = {}
    sets.RP = {}

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"}
    sets.precast.JA['Sublimation'] = {
        head="Acad. Mortar. +3", --4
        body="Peda. Gown +3", --5
        ear1="Savant's Earring", --1
        waist="Embla Sash", --5   
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
    hands="Academic's Bracers +3",
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
    --sets.precast.FC.DT = {}

    sets.precast.FC.Arts = {head="Pedagogy Mortarboard +3", feet="Academic's loafers +3"}
    sets.precast.FC.Arts.DT = {head="Pedagogy Mortarboard +3", feet="Academic's loafers +3",}

    sets.precast.FC.Arts.EnhancingDuration = set_combine(sets.precast.FC, {
        feet="Academic's loafers +3", waist="Siegel Sash"})

    sets.precast.FC.Grimoire = {head="Pedagogy Mortarboard +3", feet="Academic's loafers +3"}
    sets.precast.FC.Grimoire.DT = {head="Pedagogy Mortarboard +3", feet="Academic's loafers +3",}

    sets.precast.FC.Grimoire.EnhancingDuration = set_combine(sets.precast.FC, {
       feet="Academic's loafers +3", waist="Siegel Sash"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.EnhancingDuration = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        waist="Plat. Mog. Belt",
        ear1="Mendi. Earring", --5
    })
    sets.precast.FC.Cure.DT =  set_combine(sets.precast.FC.DT, {neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Eihwaz Ring",
    back="Moonlight Cape",
})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Curaga.DT = sets.precast.FC.Cure.DT

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak", waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield"})
    sets.precast.Storm = set_combine(sets.precast.FC, {ring1="Stikini Ring +1"})

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie",} --body="Seidr Cotehardie"}
	
    sets.OccultAcumen = {
        ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",
        legs="Perdition Slops",
        waist="Oneiros Rope",
    }
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
        
    sets.precast.WS.SubtleBlow =  {
            left_ear="Sherida Earring",
            left_ring="Chirich Ring +1",
            right_ring="Chirich Ring +1",
        }
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
            body="Acad. Gown +3",
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
	sets.midcast.Cure.DT =  {}

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        waist="Hachirin-no-Obi",})

        		
    sets.midcast.LightWeatherCure = sets.midcast.CureWeather
    
    sets.midcast.LightDayCure = sets.midcast.CureWeather
    sets.midcast.LightDayCure.DT =  {}

    sets.midcast.Cure.Enmity = set_combine(sets.midcast.Cure, {
        body="Pinga Tunic +1",
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        legs="Pinga Pants +1",
        feet="Academic's loafers +3",
        neck="Clotharius Torque",
        waist="Shinjutsu-no-Obi +1",
        left_ear="Enervating Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
        back="Solemnity Cape",})

    sets.midcast.Cure.ConserveMP = set_combine(sets.midcast.Cure, {
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        waist="Shinjutsu-no-Obi +1",
        right_ear="Mendi. Earring",
        left_ear="Calamitous Earring",
        left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
        back="Solemnity Cape",})

    sets.midcast.Cure.Sird = set_combine(sets.midcast.Cure, {
        main="Malignance Pole",
        ammo="Staunch Tathlum +1",
        head="Agwu's Cap",
        body="Rosette Jaseran +1",
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+11','Spell interruption rate down -10%','MND+8',}},
        legs="Lengo Pants",
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
        hands="Fanatic Gloves",
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

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
            legs="Shedir Seraweels",
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
        legs="Shedir Seraweels",
        feet="Telchine Pigaches",
        neck="Nodens Gorget",
        waist="Embla Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        head="Telchine Cap",
        body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
        hands="Telchine Gloves",
        legs="Shedir Seraweels",
        feet="Telchine Pigaches",
        waist="Embla Sash",
        })

    sets.midcast.Storm = sets.midcast.EnhancingDuration

    sets.midcast.Stormsurge = set_combine(sets.midcast.Storm, {feet={ name="Peda. Loafers +3", augments={'Enhances "Stormsurge" effect',}},})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
        ammo="Pemphredo Tathlum",
        head=empty,
        body="Cohort Cloak +1",
        hands="Regal Cuffs",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+7','"Mag.Atk.Bns."+10',}},
        feet="Academic's loafers +3",
        neck="Argute Stole +2",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring2="Kishar Ring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        waist="Obstin. Sash",
        back="Aurist's Cape +1",
        }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        --legs="Arbatel Pants +2",
        left_ring="Stikini Ring +1",
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
        left_ear="Hirudinea Earring",
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
    })
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        main={ name="Musa", augments={'Path: C',}},
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Pedagogy Mortarboard +3", 
        body="Acad. Gown +3",
        hands="Academic's Bracers +3",
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Academic's loafers +3",
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
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Arbatel Gown +3",
        hands="Agwu's Gages",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
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
        left_ear="Calamitous Earring",
        waist="Shinjutsu-no-Obi +1",
    })
    sets.midcast['Elemental Magic'].magicburst = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Agwu's Robe",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Arbatel Loafers +3",
        neck="Argute Stole +2",
        waist="Skrymir Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Mujin Band",
        right_ring="Freke Ring",
        back="Lugh's Cape",
    }
    
    sets.magicburst = {
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
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        left_ring="Freke Ring",
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

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        legs="Arbatel Pants +2",
        right_ring="Archon Ring",
        left_ring="Stikini Ring +1",
        waist="Shinjutsu-no-Obi +1",
        back={ name="Aurist's Cape +1", augments={'Path: A',}},

        })

    sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        hands="Arbatel Bracers +3",           
        legs="Arbatel Pants +2",
        neck="Argute Stole +2",
        waist="Skrymir Cord",
        right_ear="Arbatel Earring +1",
        left_ring="Mallquis Ring",
    })

    sets.HelixBurst = set_combine(sets.magicburst, {
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",           
        legs="Arbatel Pants +2",
        feet="Arbatel Loafers +3",
        right_ear="Arbatel Earring +1",
        left_ear="Crematio Earring",
        left_ring="Mallquis Ring",
        left_ring="Mujin Band",
    })
    sets.HelixBurst.magicburst = set_combine(sets.magicburst, {
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",           
        legs="Arbatel Pants +2",
        feet="Arbatel Loafers +3",
        right_ear="Arbatel Earring +1",
        left_ear="Crematio Earring",
        left_ring="Mallquis Ring",
        left_ring="Mujin Band",    })

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
        head="Null Masque",
        body="Arbatel Gown +3",
        hands={ name="Chironic Gloves", augments={'VIT+4','"Waltz" potency +2%','"Refresh"+2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Lugh's Cape",
   }

    sets.idle.DT = set_combine(sets.idle, {
        ammo="Staunch Tathlum +1",
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
        right_ring="Paguroidea Ring",
        back="Moonlight Cape",
    })
    sets.idle.Empy = set_combine(sets.idle, {
        head="Arbatel Bonnet +2",
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",           
        legs="Arbatel Pants +2",
        feet="Arbatel Loafers +3",

    })
    sets.idle.Resist = set_combine(sets.idle, {
    ammo="Staunch Tathlum +1",
    head="Arbatel Bonnet +2",
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",           
    legs="Arbatel Pants +2",
    feet="Arbatel Loafers +3",
    waist="Plat. Mog. Belt",
    right_ear="Sanare Earring",
    left_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Moonlight Cape",})

    sets.idle.HP = {        
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
        waist="Null Belt",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back="Null Shawl",
    }
    sets.idle.vagary =  {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Sapience Orb",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Pinga Tunic +1",
    hands="Academic's Bracers +3",
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
        ammo="Homiliary",
        head="Null Masque",
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
    head="Arbatel Bonnet +2",
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",           
    legs="Arbatel Pants +2",
    feet="Arbatel Loafers +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Sanare Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shadow Ring",
    back="Moonlight Cape",
}

sets.defense.Resist = sets.idle.Resist
sets.defense.HP = sets.idle.HP
sets.defense.Evasion = sets.idle.Evasion
sets.defense.MEVA = sets.defense.MDT

sets.MoveSpeed = {feet="Herald's Gaiters"}
sets.Kiting = {feet="Herald's Gaiters"}
sets.latent_refresh = {waist="Fucho-no-obi",}

    
-- Extra defense sets.  Apply these on top of melee or defense sets.
--Passive set

sets.Passive.MaxAcc = {
    ammo="Amar Cluster",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Arbatel Gown +3",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Arbatel Pants +2",
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
sets.engaged.None = {}
sets.engaged = {
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
    back="Null Shawl",
}
sets.engaged.STP = {
    ammo="Crepuscular Pebble",
    head="Null Masque",
    body="Bunzi's Robe",
    hands="Gazu Bracelets +1",
    legs="Bunzi's Pants",
    feet="Battlecast Gaiters",
    neck="Null Loop",
    waist="Yemaya Belt",
    ear1="Dedition Earring",
    ear2="Crep. Earring",
    ring1="Chirich Ring +1",
    ring2="Chirich Ring +1",
    back="Null Shawl",
}
sets.engaged.Acc = {
    ammo="Amar Cluster",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Nyame Mail",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Nyame Flanchard",
    feet="Battlecast Gaiters",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
sets.engaged.MaxAcc = {
    ammo="Amar Cluster",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Arbatel Gown +3",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Arbatel Pants +2",
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
sets.engaged.CRIT = set_combine(sets.engaged, {
    neck="Nefarious Collar +1",
})

sets.engaged.Enspell = set_combine(sets.engaged, {
    head="Umuthi Hat",
    waist="Orpheus's Sash",
})

sets.engaged.SubtleBlow = set_combine(sets.engaged, {
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})

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
    back="Null Shawl",
}



------------------------------------------------------------------------------------------------
  ---------------------------------------- DW-HASTE ------------------------------------------
------------------------------------------------------------------------------------------------
    -- * DNC Subjob DW Trait: +15%
    -- * NIN Subjob DW Trait: +25%

    sets.engaged.DW = set_combine(sets.engaged, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })

    sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })
    sets.engaged.DW.STP = set_combine(sets.engaged.STP, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })
     sets.engaged.DW.CRIT = set_combine(sets.engaged.CRIT, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })
     sets.engaged.DW.Enspell = set_combine(sets.engaged.Enspell, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })
     sets.engaged.DW.SubtleBlow = set_combine(sets.engaged.SubtleBlow, {
        left_ear="Suppanomimi",  --5
        right_ear="Eabani Earring", --4
        waist="Patentia Sash",  -- 5% Dual Wield
     })




------------------------------------------------------------------------------------------------
---------------------------------------- Hybrid Sets -------------------------------------------
------------------------------------------------------------------------------------------------

-- dt -50%

sets.engaged.Hybrid = {
    ammo="Crepuscular Pebble",
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    neck="Null Loop",
    right_ring="Defending Ring",
}

sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid,{})
sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.Hybrid,{
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid,{})
sets.engaged.CRIT.DT = set_combine(sets.engaged.CRIT, sets.engaged.Hybrid,{  
    neck="Nefarious Collar +1",
})
sets.engaged.SubtleBlow.DT = set_combine(sets.engaged.SubtleBlow, sets.engaged.Hybrid,{  
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
})
sets.engaged.Enspell.DT = set_combine(sets.engaged.Enspell, sets.engaged.Hybrid,{  
	head="Umuthi Hat",
    waist="Orpheus's Sash",
})


-- DW dt -50%

sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.Hybrid)
sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.Hybrid)
sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.Hybrid)
sets.engaged.DW.CRIT.DT = set_combine(sets.engaged.DW.CRIT, sets.Hybrid,{  
   neck="Nefarious Collar +1",})
sets.engaged.DW.Enspell.DT = set_combine(sets.engaged.DW.Enspell, sets.engaged.Hybrid,{  
   head="Umuthi Hat",
   waist="Orpheus's Sash",})    
sets.engaged.DW.SubtleBlow.DT = set_combine(sets.engaged.DW.SubtleBlow, sets.Hybrid,{  
   neck={ name="Bathy Choker +1", augments={'Path: A',}},
   left_ear="Digni. Earring",
   left_ring="Chirich Ring +1",
   right_ring="Chirich Ring +1",
})


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------



    sets.buff['Ebullience'] = {head="Arbatel Bonnet +2",body="Agwu's Robe",right_ring="Mujin Band"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +2"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +2"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}

    sets.buff['Immanence'] = {
        head="Pedagogy Mortarboard +3", 
        feet="Academic's loafers +3",
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
    sets.buff['Immanence'].Enmity = {}
    
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
       head="Acad. Mortar. +3", --4
       body="Peda. Gown +3", --5
       ear1="Savant's Earring", --1
       waist="Embla Sash", --5
    }
    sets.buff.DTSublimation = {waist="Embla Sash"}

    sets.buff.Doom = {    neck="Nicander's Necklace",
    waist="Gishdubar Sash",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring +1",}
    
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3" --body="Acad. Gown +1",
    sets.LightArts = {body="Arbatel Gown +3",}
    sets.DarkArts = {}--body="Acad. Gown +3",
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.Bookworm = {back="Bookworm's Cape",}

end
-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
        set_macro_page(4, 15)
	elseif player.sub_job == 'BLM' then
        set_macro_page(3, 15)
	elseif player.sub_job == 'WHM' then
        set_macro_page(2, 15)
	else
        set_macro_page(8, 15)
	end
end
function user_job_lockstyle()
	windower.chat.input('/lockstyleset 173')
end

autows_list = {['Marin']='Myrkr',['Mpaca']='Myrkr',
['Xoanon']="Cataclysm",['TernionDagger']='Aeolian Edge',['Club']='Black Halo',}


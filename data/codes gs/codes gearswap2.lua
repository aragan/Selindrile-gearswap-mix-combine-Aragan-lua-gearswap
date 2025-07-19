Code

sets.raise = {}

and
Code

function job_post_midcast(spell, action, spellMap, eventArgs)
	RaiseSpells = S{'Raise','Raise II','Raise III','Arise','Reraise','Reraise II','Reraise III','Reraise IV'}
	if RaiseSpells:contains(spell.english) then
		equip(sets.raise)
	end
end



rdm macros buff all pt

/ma "haste II" <p0> <wait8>
/ma "haste II" <p1> <wait8>
/ma "haste II" <p2> <wait8>
/ma "haste II" <p3> <wait8>
/ma "haste II" <p4> <wait8>
/ma "haste II" <p5> <wait8>




require('pack')
require('lists')
require('logger')
require('sets')

files = require('files')
extdata = require('extdata')
packets = require('packets')



----------

code auto switch dt idle


function job_customize_idle_set(idleSet)

    if (player.in_combat or being_
    
    cked) and (state.IdleMode.current:contains('Normal')) then
            idleSet = set_combine(idleSet, sets.idle.PDT)
		
    end
    return idleSet
end

---

warp ring not change

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

    -- Warp ring rule, for any buff being lost
    if S{'Warp', 'Vocation', 'Capacity'}:contains(player.equipment.ring2) then
        if not buffactive['Dedication'] then
            disable('ring2')
        end
    else
        enable('ring2')
    end
end

----------------

    -- If HP drops under 45% then equip Re-raise head/body
    if player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
            or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR' then
        if new_hpp < 45 then
            equip(sets.misc.Twilight)
        end
    end

    react cose for ou
        ["Unfaltering Bravado"]={
            ["complete_reaction"]="", 
            ["ready_reaction"]="input /p RUN FROM CONAL TO RIGHT OR LEFT FAST <call7>"
        },

--code rp neck jSE

function user_setup()

    state.RP = M(false, "Reinforcement Points Mode")    
--command ctrl+-
    send_command('bind !- gs c toggle RP')  

end

    sets.RP = {neck="Abyssal Beads +2"}


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end         
end

Code
1
	
state.Sacro = M(false, 'Sacro Mantle')


Create a post precast check to equip mantle if toggle is true:
Code
1
2
3
4
5
6
7
8
	
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Sacro.value == true then
            equip({back="Sacro Mantle"})
            state.Sacro:reset()
        end
    end
end


Then set up your macro like this:
Code
1
2
	
/console gs c set Sacro true
/ws "Rudra's Storm" <t>


Or you can use a keybind:
Code
1
	
send_command('bind ^YOURK
------------

                send_command('gs c update')
-----------------

    if buff == 'Copy Image' or 'Copy Image (1)' or 'Copy Image (2)' or 'Copy Image (3)' or 'Copy Image (4+)' then
        if lose then
            send_command('@input /ma "Utsusemi: Ni" <me>')
        else
            send_command('@input /ma "Utsusemi: Ichi" <me>')
            send_command('@input /ma "Utsusemi: Ni" <me>')
            handle_equipping_gear(player.status)
        end
    end
============

test 

        send_command('cancel Copy Image|Copy Image (2)|Copy Image (3)')
===========

    if player.sub_job == 'WAR' then
==========
    if buff == 'Copy Image' or 'Copy Image (1)' or 'Copy Image (2)' or 'Copy Image (3)' or 'Copy Image (4+)' then
        if false then
            send_command('@input /ma "Utsusemi: Ni" <me>')
        else
            send_command('@input /ma "Utsusemi: Ichi" <me>')
            send_command('@input /ma "Utsusemi: Ni" <me>')
            handle_equipping_gear(player.status)
        end
    end

=============

-- CODE AUTO RERAISE --Aragan (Asura)  [Author Primary] THIS CODE
sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
 
windower.register_event('hpp change',function(new_hpp,old_hpp)
    if new_hpp < 8 then
        equip(sets.Reraise)
    end
)

function define_rune_info()
    rune_info = {
        ["Ignis"]   = {damage="Fire", resistance="Ice"},
        ["Gelus"]   = {damage="Ice", resistance="Wind"},
        ["Flabra"]  = {damage="Wind", resistance="Earth"},
        ["Tellus"]  = {damage="Earth", resistance="Lightning"},
        ["Sulpor"]  = {damage="Lightning", resistance="Water"},
        ["Unda"]    = {damage="Water", resistance="Fire"},
        ["Lux"]     = {damage="Light", resistance="Darkness"},
        ["Tenebrae"]= {damage="Darkness", resistance="Light"},
    }
end



--code lockstyle engage

-- auto remedy for silence

function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Remedy" <me>')

--code ody v25

if buff == "Max HP Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end

if buff == "Defense Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end
if buff == "Magic Def. Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end
if buff == "Magic Evasion Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end
if buff == "Evasion Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end
if buff == "Attack Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end
if buff == "Accuracy Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        end
end

    if buff == "Defense Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Attack Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Evasion Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Magic Evasion Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Magic Def. Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Accuracy Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "Max HP Down" then
            send_command('@input /item "panacea" <me>')
        end
    end

    if buff == "VIT Down" then
        if gain then
            send_command('@input /item "panacea" <me>')
        elseif buff == "INT Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "MND Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "VIT Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "STR Down" then
            send_command('@input /item "panacea" <me>')
        elseif buff == "AGI Down" then
            send_command('@input /item "panacea" <me>')
        end
    end
    if buff == "curse" then
        if gain then  
        send_command('input /item "Holy Water" <me>')
        end
    end

So in the mapping file i put this:

Panacea = S{
    'Emporox\'s Gift',-- Just to test it.
    'Bind',
    'Bio',
    'Dia',
    'Accuracy Down',
    'Attack Down',
    'Evasion Down',
    'Defense Down',
    'Magic Evasion Down',
    'Magic Def. Down',
    'Magic Acc. Down',
    'Magic Atk. Down',
    'Max HP Down',
    'Max MP Down',
    'slow',
    'weight'}



    elseif str == 'medicines' then
        if check_buffs('paralysis') then
            send_command('input /item "Remedy" <me>')
        elseif check_buffs('doom') then
            equip(sets.misc.holywater)
            send_command('input /item "Holy Water" <me>')
        elseif check_buffs('curse') then
            send_command('input /item "Holy Water" <me>')
        elseif check_buffs(
                'blindness',
                'disease',
                'poison',
                'silence') then
            send_command('input /item "Remedy" <me>')
        --Not all Eraseable debuffs are listed below, add to list as needed
        elseif not S(buffactive):intersection(Panacea):empty() then --- SECTION I NEED HELP ON
            send_command('input /item "Panacea" <me>')
        else
            add_to_chat(8,string.char(0x81,0x9A)..' No medicines used, '
                ..'update list if needed '..string.char(0x81,0x9A))
        end
    end


-- 'Out of Range' distance; WS will auto-cancel

function user_setup()

        -- 'Out of Range' distance; WS will auto-cancel
        target_distance = 6

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

        if spell.type == "WeaponSkill" and spell.name ~= 'Mistral Axe' and spell.name ~= 'Bora Axe' and spell.target.distance > target_distance then
                cancel_spell()
                add_to_chat(123, spell.name..' Canceled: [Out of /eq]')
                return
        end


----- 

function job_pretarget(spell, action, spellMap, eventArgs)

    if spell.target.distance > 8 and player.status == 'Engaged' then
       eventArgs.cancel = true
       add_to_chat(122,"Outside WS Range! /Canceling")
    end


---- Replace Moonshade Earring if we're at cap TP 3000

function job_precast(spell, action, spellMap, eventArgs)
    -- Replace Moonshade Earring if we're at cap TP
    if spell.type == 'Weaponskill' and player.tp == 3000 then
        equip({right_ear="Ishvara Earring"})
    end


function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == "Engaged" then
        if buffactive.Berserk and not state.Buff.Retaliation then
            equip(sets.buff.Berserk)
        end
        get_combat_weapon()
    --elseif newStatus == 'Idle' then
    --    determine_idle_group()
    end
end
 

-- buff == buff gained or lost

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
    if buff == "Charm" then
        if gain then  			
           send_command('input /p Charmd, please Sleep me.')		
        else	
           send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
        end
    end
    if buff == "doom" then
        if gain then
            equip(sets.Doom)
            send_command('@input /p Doomed, please Cursna.')
            send_command('@input /item "Holy Water" <me>')	
            disable('ring1','ring2','waist','neck')
        else
            enable('ring1','ring2','waist','neck')
            send_command('input /p Doom removed.')
            handle_equipping_gear(player.status)
        end
    end
    if buff == "weakness" then
        if gain then
            equip(sets.Reraise)
            disable('body','head')
            else
            enable('body','head')
        end
        return meleeSet
    end
    if buff == "Sleep" then
        if gain then    
            equip(sets.Sleep)
            disable('neck')
            send_command('input /p ZZZzzz, please cure.')		
        else
            enable('neck')
            send_command('input /p '..player.name..' is no longer Sleep!')
            handle_equipping_gear(player.status)    
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
        if buff == "Charm" then
            if gain then  			
               send_command('input /p Charmd, please Sleep me.')		
            else	
               send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
            end
        end
        if buff == "curse" then
            if gain then  
            send_command('input /item "Holy Water" <me>')
        end
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

---auto change kitting gear when move

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
            send_command('gs c update')

        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
            send_command('gs c update')

        end
    end
end


-- dw code

if dw == true then
    if S{'NIN'}:contains(player.sub_job) then
        if DW_needed <= 11 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 11 and DW_needed <= 26 then
            classes.CustomMeleeGroups:append('HighHaste')
        elseif DW_needed > 26 and DW_needed <= 31 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 31 and DW_needed <= 42 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 42 then
            classes.CustomMeleeGroups:append('')
        end
    elseif S{'DNC'}:contains(player.sub_job) then
        if DW_needed <= 21 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 21 and DW_needed <= 36 then
            classes.CustomMeleeGroups:append('HighHaste')
        elseif DW_needed > 36 and DW_needed <= 41 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 41 and DW_needed <= 52 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 52 then
            classes.CustomMeleeGroups:append('')
        end
    end
end

------------------

--weapon set code

function user_setup()
    
	state.CombatWeapon= M('Tizona','TizonaAcc','Savage','Chant','Nuke')



function init_gear_sets()

---weapon sets---
sets.weapons = {}
sets.weapons.Tizona = {main= "Tizona", sub ='Thibron'}
sets.weapons.TizonaAcc = {main="Tizona", sub='Tanmogayi +1'}
sets.weapons.Savage = {main= "Naegling", sub ='Thibron'}
sets.weapons.Chant  = {main= "Tanmogayi +1", sub ='Tizona'}
sets.weapons.Nuke =   {main = "Maxentius", sub = 'Kaja rod'}

function customize_idle_set(idleSet)

	if state.CombatWeapon.value == 'Tizona' then
	idleSet = set_combine(idleSet, sets.weapons.Tizona)
	end
	if state.CombatWeapon.value == 'TizonaAcc' then
	idleSet = set_combine(idleSet, sets.weapons.TizonaAcc)
	end
	if state.CombatWeapon.value == 'Savage' then
	idleSet = set_combine(idleSet, sets.weapons.Savage)
	end
	if state.CombatWeapon.value == 'Chant' then
	idleSet = set_combine(idleSet, sets.weapons.Chant)
	end
	if state.CombatWeapon.value == 'Nuke' then
	idleSet = set_combine(idleSet, sets.weapons.Nuke)
	end

function customize_melee_set(meleeSet)

	if state.CombatWeapon.value == 'Tizona' then
	meleeSet = set_combine(meleeSet, sets.weapons.Tizona)
	end
	if state.CombatWeapon.value == 'TizonaAcc' then
	meleeSet = set_combine(meleeSet, sets.weapons.TizonaAcc)
	end
	if state.CombatWeapon.value == 'Savage' then
	meleeSet = set_combine(meleeSet, sets.weapons.Savage)
	end
	if state.CombatWeapon.value == 'Chant' then
	meleeSet = set_combine(meleeSet, sets.weapons.Chant)
	end
	if state.CombatWeapon.value == 'Nuke' then
	meleeSet = set_combine(meleeSet, sets.weapons.Nuke)
	end
    return meleeSet
end

react cose for ou
        ["Unfaltering Bravado"]={
            ["complete_reaction"]="", 
            ["ready_reaction"]="input /p RUN FROM CONAL TO RIGHT OR LEFT FAST <call7>"
        },

--code rp neck jSE

function user_setup()

    state.RP = M(false, "Reinforcement Points Mode")    
--command ctrl+-
    send_command('bind !- gs c toggle RP')  

end

    sets.RP = {neck="Abyssal Beads +2"}


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)

    if state.RP.current == 'on' then
        equip(sets.RP)
        disable('neck')
    else
        enable('neck')
    end         
end








Code
1
	
state.Sacro = M(false, 'Sacro Mantle')


Create a post precast check to equip mantle if toggle is true:
Code
1
2
3
4
5
6
7
8
	
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Sacro.value == true then
            equip({back="Sacro Mantle"})
            state.Sacro:reset()
        end
    end
end


Then set up your macro like this:
Code
1
2
	
/console gs c set Sacro true
/ws "Rudra's Storm" <t>


Or you can use a keybind:
Code
1
	
send_command('bind ^YOURK












------------

                send_command('gs c update')
-----------------

    if buff == 'Copy Image' or 'Copy Image (1)' or 'Copy Image (2)' or 'Copy Image (3)' or 'Copy Image (4+)' then
        if lose then
            send_command('@input /ma "Utsusemi: Ni" <me>')
        else
            send_command('@input /ma "Utsusemi: Ichi" <me>')
            send_command('@input /ma "Utsusemi: Ni" <me>')
            handle_equipping_gear(player.status)
        end
    end
============

test 

        send_command('cancel Copy Image|Copy Image (2)|Copy Image (3)')
===========

    if player.sub_job == 'WAR' then
==========
    if buff == 'Copy Image' or 'Copy Image (1)' or 'Copy Image (2)' or 'Copy Image (3)' or 'Copy Image (4+)' then
        if false then
            send_command('@input /ma "Utsusemi: Ni" <me>')
        else
            send_command('@input /ma "Utsusemi: Ichi" <me>')
            send_command('@input /ma "Utsusemi: Ni" <me>')
            handle_equipping_gear(player.status)
        end
    end

=============

-- CODE AUTO RERAISE --Aragan (Asura)  [Author Primary] THIS CODE
sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
 
windower.register_event('hpp change',function(new_hpp,old_hpp)
    if new_hpp < 8 then
        equip(sets.Reraise)
    end
)

unction define_rune_info()
    rune_info = {
        ["Ignis"]   = {damage="Fire", resistance="Ice"},
        ["Gelus"]   = {damage="Ice", resistance="Wind"},
        ["Flabra"]  = {damage="Wind", resistance="Earth"},
        ["Tellus"]  = {damage="Earth", resistance="Lightning"},
        ["Sulpor"]  = {damage="Lightning", resistance="Water"},
        ["Unda"]    = {damage="Water", resistance="Fire"},
        ["Lux"]     = {damage="Light", resistance="Darkness"},
        ["Tenebrae"]= {damage="Darkness", resistance="Light"},
    }
end



--code lockstyle engage

--------------------
code auto sc for gs
automatically detect a skillchain

target_id = target_the_action_was_performed_on
skillchain_element = determine_skillchain_element_from_action_message
skillchains[target_id] = skillchain_element

With this in midcast:

if (spell.element == skillchains[ffxi.windower.get_mob_by_target("<t>").id]) then
   equip(sets.MB)

------------------

if spell.target.distance > 8 and player.status == 'Engaged' then
    eventArgs.cancel = true
    add_to_chat(122,"Outside WS Range! /Canceling")
end

--------------------

--weaponset change 

function user_setup()

	state.CombatWeapon= M('Tizona','TizonaAcc','Savage','Chant','Nuke')
end

	send_command('bind f6 gs c cycle CombatWeapon')

function init_gear_sets()

---weapon sets---
sets.weapons = {}
sets.weapons.Tizona = {main= "Tizona", sub ='Thibron'}
sets.weapons.TizonaAcc = {main="Tizona", sub='Tanmogayi +1'}
sets.weapons.Savage = {main= "Naegling", sub ='Thibron'}
sets.weapons.Chant  = {main= "Tanmogayi +1", sub ='Tizona'}
sets.weapons.Nuke =   {main = "Maxentius", sub = 'Kaja rod'}


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
	if state.CombatWeapon.value == 'Tizona' then
	meleeSet = set_combine(meleeSet, sets.weapons.Tizona)
	end
	if state.CombatWeapon.value == 'TizonaAcc' then
	meleeSet = set_combine(meleeSet, sets.weapons.TizonaAcc)
	end
	if state.CombatWeapon.value == 'Savage' then
	meleeSet = set_combine(meleeSet, sets.weapons.Savage)
	end
	if state.CombatWeapon.value == 'Chant' then
	meleeSet = set_combine(meleeSet, sets.weapons.Chant)
	end
	if state.CombatWeapon.value == 'Nuke' then
	meleeSet = set_combine(meleeSet, sets.weapons.Nuke)
	end
    return meleeSet
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CP.current == 'on' then
         equip(sets.CP)
         disable('back')
     else
         enable('back')
     end
	if state.CombatWeapon.value == 'Tizona' then
	idleSet = set_combine(idleSet, sets.weapons.Tizona)
	end
	if state.CombatWeapon.value == 'TizonaAcc' then
	idleSet = set_combine(idleSet, sets.weapons.TizonaAcc)
	end
	if state.CombatWeapon.value == 'Savage' then
	idleSet = set_combine(idleSet, sets.weapons.Savage)
	end
	if state.CombatWeapon.value == 'Chant' then
	idleSet = set_combine(idleSet, sets.weapons.Chant)
	end
	if state.CombatWeapon.value == 'Nuke' then
	idleSet = set_combine(idleSet, sets.weapons.Nuke)
	end
    return idleSet
end



--brd code gs carol etude Threnody cycle


function user_setup()

    state.Carol = M{['description']='Carol',
        'Fire Carol', 'Fire Carol II', 'Ice Carol', 'Ice Carol II', 'Wind Carol', 'Wind Carol II',
        'Earth Carol', 'Earth Carol II', 'Lightning Carol', 'Lightning Carol II', 'Water Carol', 'Water Carol II',
        'Light Carol', 'Light Carol II', 'Dark Carol', 'Dark Carol II',
        }

    state.Threnody = M{['description']='Threnody',
        'Fire Threnody II', 'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II',
        'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II', 'Dark Threnody II',
        }

    state.Etude = M{['description']='Etude', 'Sinewy Etude', 'Herculean Etude', 'Learned Etude', 'Sage Etude',
        'Quick Etude', 'Swift Etude', 'Vivacious Etude', 'Vital Etude', 'Dextrous Etude', 'Uncanny Etude',
        'Spirited Etude', 'Logical Etude', 'Enchanting Etude', 'Bewitching Etude'}
    --add command in macro to use spell /console gs c etude /console gs c carol /console gs c threnody
    send_command('bind f2 gs c cycle Etude')
    send_command('bind f3 gs c cycle Carol')
    send_command('bind f4 gs c cycle Threnody')

end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'etude' then
        send_command('@input /ma "'..state.Etude.value..'" <stpc>')
    elseif cmdParams[1]:lower() == 'carol' then
        send_command('@input /ma "'..state.Carol.value..'" <stpc>')
    elseif cmdParams[1]:lower() == 'threnody' then
        send_command('@input /ma "'..state.Threnody.value..'" <stnpc>')
    end

    --gearinfo(cmdParams, eventArgs)
 
end

-- ws def down code

	-- < this mean low  
	if spell.type == 'WeaponSkill' and not spell.interrupted then
		if (spell.english == "Shell Crusher" or spell.english == "Armor Break") then
			if player.tp == 3000 then  
				send_command('timers c "Defense Down ['..spell.target.name..'] " 540 down')
				send_command('@input /p  >>> "Defense Down on ['..spell.target.name..']. 9 min. ')
			elseif player.tp < 2001 then  
				send_command('timers c "Defense Down ['..spell.target.name..']" 360 down')
				send_command('@input /p  >>> "Defense Down on ['..spell.target.name..']. 6 min. ')
			elseif player.tp < 1001 then  
				send_command('timers c "Defense Down  ['..spell.target.name..']" 180 down')
				send_command('@input /p  >>> "Defense Down on ['..spell.target.name..']. 3 min. ')


			end
		end
	end


    ```
    attack2 = 4000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value

function job_precast(spell, action, spellMap, eventArgs)

	local player = windower.ffxi.get_player()
    local attack = player.attack
    local defense = player.defense

    print("Attack: " .. attack)
    print("Defense: " .. defense)
	-- Determine which WS sets to use based on your attack in your TP set (or idle set if WSing unengaged).
	attack = player.attack
	if attack > attack2 then
        active_ws = sets.precast.WS.PDL[spell.english]
    else
        active_ws = sets.precast.WS[spell.english]
    end
end



    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, sets.Shun)
    sets.precast.WS.PDL['Blade: Shun'] = set_combine(sets.Shun, {})


----------------
attack2 = 3500 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this val


function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Warcry' then
        if buffactive['Warcry'] then
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: Warcry its up [active]')
        end
    end
	attack = player.attack
	if attack > attack2 then
		windower.send_command('input //gs c set WeaponskillMode PDL')
    else
		windower.send_command('input //gs c set WeaponskillMode Match')
    end
	

end


function job_post_precast(spell)
    attack = player.attack
    if attack > attack2 then
		equip(sets.precast.WS.PDL)
    else
		equip(sets.precast.WS)
    end
end

-------

WeaponskillMode:set('Match') 
windower.send_command('gs c set WeaponskillMode Match')

attack = player.attack
if spell.type == 'WeaponSkill' then
    if attack > attack2 then
        equip(sets.precast.WS[spell.name].PDL)
        windower.send_command('gs c set WeaponskillMode PDL')
    else
        equip(sets.precast.WS[spell.name])
        windower.send_command('gs c set WeaponskillMode Match')
    end
end
----------------------


function precast(spell)
    
    -- Changes the code logic for efficient Empyrean farming in Abyssea. Set to "false" to disable.
    in_abyssea = world.zone:contains("Abyssea") -- See https://docs.windower.net/addons/gearswap/reference/
    -- in_abyssea = false


    -- Determine which WS sets to use based on your attack in your TP set (or idle set if WSing unengaged).
    attack = player.attack
    if attack > attack2 then
        active_ws = sets.WeaponSkill.HighAtk
    else
        active_ws = sets.WeaponSkill.MidAtk
    end


    self = windower.ffxi.get_mob_by_target("me")

    target = windower.ffxi.get_mob_by_target("t") or windower.ffxi.get_mob_by_target("st") or self
    distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
    weather_intensity = gearswap.res.weather[world.weather_id].intensity

    -- Cancel weapon skill if enemy is further than 7 yalms away to prevent losing TP. This value should be larger for "large" model enemies such as Fafnir.
    if active_ws[spell.name] then
        if distance > 7 then
            send_command("@input /echo Target too far away.")
            cancel_spell()
        end
    equip(active_ws[spell.name])

    elseif Utsu:contains(spell.name) then
        equip(set_combine(sets.precast.FastCast, sets.precast.Utsusemi))

    elseif spell.name == "Provoke" or spell.name == "Animated Flourish" or spell.name == "Flash" then
        equip(set_combine(sets.Enmity))

    elseif spell.type=="WeaponSkill" then
        if distance > 7 then
            send_command("@input /echo Target too far away.")
            cancel_spell()
        end
        equip(active_ws["Blade: Ten"]) -- Default to Blade: Ten weapon skill sets if no set is defined for selected WS.

    elseif spell.name == "Mijin Gakure" then
        equip({main="Nagi"})

    elseif spell.name:contains("Step") or spell.name:contains("step") or spell.name:contains("Jump") then
        equip(sets.Melee.HighAccuracy)
        
    elseif spell.name == "Violent Flourish" then
        equip(sets.midcast.MagicAccuracy)

    elseif spell.name == "Spectral Jig" and buffactive["Sneak"] then
        -- If using Spectral Jig, automatically remove Sneak so the spell does not fail.
        windower.ffxi.cancel_buff(71)

    elseif spell.name == "Holy Water" then
        equip(set_combine(sets.status.Idle.DT, sets.HolyWater))

    else
        equip(sets.precast.FastCast)

    end

    if proc_ws:contains(spell.name) and in_abyssea then
        equip(sets.midcast.MagicAccuracy)
    end

    if in_abyssea then
        equip(sets.Treasure)
    end

    if (world.zone:contains("Abyssea")) or (world.zone:contains("Henge")) and spell.name == "Aeolian Edge" then
        equip(sets.Treasure)
    end

--------------------- kales code shield
    
    state.ShieldMode:options('Normal','Aegis','Ochain','Duban')
    function user_job_state_change(field, newVal, oldVal)
        if field == 'ShieldMode' then
            if newVal == 'Normal' then
                internal_enable_set("Shield")
            else
                internal_disable_set(sets.shield[newVal], "Shield")
            end
        end
    end

    --add the shield disable tier to the mappings
    
    disable_priority = T{
        "User",
        "Showset",
        "Crafting",
        "Doom",
        "Sleep",
        "UseItem",
        "OneHour",
        "Shield",
        "Weapons",
        "ShowTP",
        "Ability",
        "TreasureHunter",
    }:reverse()

-- blm lua
function job_post_precast(spell)

if spell.skill == 'Elemental Magic' and player.sub_job == 'SCH' and (not buffactive['Ebullience'] and state.AutoBuffMode.value ~= 'Off' and (state.Buff['SJ Restriction'])) then 
    local abil_recasts = windower.ffxi.get_ability_recasts()
    windower.chat.input('/ja "Ebullience" <me>')
    tickdelay = os.clock() + 1
    return true
end
and get_current_stratagem_count() > 0


function user_job_precast(spell, spellMap, eventArgs)

    if spell.skill == 'Elemental Magic' and player.sub_job == 'SCH' and not (buffactive['Ebullience'] or state.AutoBuffMode.value == 'Off' or state.Buff['SJ Restriction']) then 
        eventArgs.cancel = true
        windower.chat.input('/ja "Ebullience" <me>')
        windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
        add_tick_delay(1.1)
        return
    end


--TEST TO BUFF
    if not buffactive['Ebullience'] and abil_recasts[365] < latency then
		windower.chat.input('/ja "Ebullience" <me>')
		tickdelay = os.clock() + 1.1
		return true
	end


    ------------

                --send_command('@wait 1.0;cancel souleater')

local abil_recasts = windower.ffxi.get_ability_recasts()

if player.target.type == 'SELF' and spell.skill == 'Blue Magic' and unbridled_spells:contains(spell.english) and not (state.Buff['Unbridled Learning'] or state.Buff['Unbridled Wisdom']) or buffactive.Diffusion and abil_recasts[184] < latency then
    cast_delay(1.1)
    windower.chat.input('/ja "Diffusion" <me>')

    if not midaction() then
        job_update()
    end

    	-- Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[data.elements.storm_of[state.ElementalMode.value]] and not state.Buff.Klimaform and spell_recasts[287] < spell_latency then
			windower.chat.input('/ma "Klimaform" <me>')
		elseif player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..' II"')
		else
			windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
		end
		return



        
		for i in pairs(buff_spell_lists[buffup]) do
			if not buffactive[buff_spell_lists[buffup][i].Buff] and silent_can_use(buff_spell_lists[buffup][i].SpellID) then
				needsbuff = true

                if not data.npcs.trusts:contains(party[i].name) then

                    if state.NotifyBuffs.value and NotifyBuffs:contains(buff) then

                        if state.Buff then
                            for buff,present in pairs(state.Buff) do
                                if mote_vars.res_buffs:contains(buff) then
                                    state.Buff[buff] = buffactive[buff] or false
                                end
                            end
                        end

    data.elements.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",
                        ['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm",}
                  

		
                        if player.sub_job == 'SCH' and state.AutoBuffMode.value == 'Defend' then

	
                            if not buffactive[data.elements.storm_of[state.ElementalMode.value]] then
                                windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
                                tickdelay = os.clock() + 1.1
                                return true
                            else
                                return false
                            end
                        end

                        local party = windower.ffxi.get_party()
                        if party.p5 == nil then

                                -- Check if we're solo
    if party.count == 1 then
        return false
    end

    -- If we're in an alliance, can't be a Trust party.
    if alliance[2].count > 0 or alliance[3].count > 0 then
        return false
    end

	if state.Stance.value ~= 'None' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()


		if state.Stance.value == 'Ebullience' and not buffactive['Ebullience'] and  being_attacked and buffactive["Dark Arts"] and get_current_stratagem_count() > 0 then
			windower.chat.input('/ja "Ebullience" <me>')
			tickdelay = os.clock() + 1.1
			add_to_chat(204, '~~~Current Stratagem Charges Available: ['..get_current_stratagem_count()..']~~~')
			return true
		else
			return false
		end

    elseif (spell.english:startswith('Monomi') or (spell.english == 'Sneak' and spell.target.type == 'SELF')) and buffactive['Sneak'] then


        or buffactive['Sneak'] or buffactive['Invisible']

        	
    if command == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Light' then
			if spell_recasts[29] < spell_latency and actual_cost(get_spell_table_by_name('Banish II')) < player.mp then
				windower.chat.input('/ma "Banish II" '..target..'')
			elseif spell_recasts[28] < spell_latency and actual_cost(get_spell_table_by_name('Banish')) < player.mp then
				windower.chat.input('/ma "Banish" '..target..'')
			else
				add_to_chat(123,'Abort: Banishes on cooldown or not enough MP.')
			end

            if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then


                local spellCost = actual_cost(spell)
	
                if spell.action_type == 'Magic' and player.mp < spellCost then
                    if stepdown(spell, eventArgs) then 
                        return true
                    else
                        add_to_chat(123,'Abort: '..spell.english..' costs more MP. ('..player.mp..'/'..spellCost..')')
                        cancel_spell()
                        eventArgs.cancel = true
                        return true
                    end

                    
		if (player.in_combat or being_attacked and not moving) then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if not buffactive['Majesty'] and abil_recasts[150] < latency then
				windower.chat.input('/ja "Majesty" <me>')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end

        if spellMap == 'Cure' and not buffactive['Majesty'] then
            send_command('@wait 1;input /ja "Majesty" <me>')
        end

---

if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
	if not arts_active() and (buffup ~= '' or (not data.areas.cities:contains(world.area) and ((state.AutoArts.value and player.in_combat) or state.AutoBuffMode.value ~= 'Off'))) then
        windower.chat.input:schedule(6,'/ma "Luminohelix" <t>')

        local abil_recasts = windower.ffxi.get_ability_recasts()

        if party.count ~= 1 and (spell.english == 'Regen' or spell.english == 'Phalanx'or spell.english == 'Stoneskin') and  get_current_stratagem_count() > 1 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
            cast_delay(2.2)
            windower.chat.input('/ja "Accession" <me>')
            windower.chat.input:schedule(1.1,'/ja "Perpetuance" <me>')
            tickdelay = get_current_stratagem_count()
            return true 
        end
            add_to_chat(204, 'Stratagem Charges Available: ['..get_current_stratagem_count()..']~~~')
            send_command('@input /echo <recast=Stratagems>')
            send_command('@input /p <recast=Stratagems>')
    
            windower.chat.input:schedule(1.5,'/ma "'..spell.english..'" '..spell.target.raw..'')
            tickdelay = os.clock() + 4.5
			if not (player.status == 'Event' or (os.clock() < (next_cast + 1)) or pet_midaction() or (os.clock() < (petWillAct + 2))) then

                function check_midaction(spell, spellMap, eventArgs)
                    if os.clock() < next_cast and not state.RngHelper.value then
                        if eventArgs and not (spell.type:startswith('BloodPact') and state.Buff["Astral Conduit"]) then
                            eventArgs.cancel = true
                            if delayed_cast == '' and state.MiniQueue.value then
                                windower.send_command:schedule((next_cast - os.clock()),'gs c delayedcast')
                            end
                            delayed_cast = spell.english
                            delayed_target = spell.target.id
                        end
                        return true
                    else
                        return false
                    end

                    
			if not state.Uninterruptible.value then delayed_cast = '' end
		elseif wasmoving then
			if not (player.status == 'Event' or (os.clock() < (next_cast + 1)) or pet_midaction() or (os.clock() < (petWillAct + 2))) then
				send_command('gs c forceequip')
			end
		end
        next_cast = os.clock() + 3.35 - latency

        and not (delayed_cast ~= '' or check_midaction() or

        function default_precast(spell, spellMap, eventArgs)
            if eventArgs.cancel then
                cancel_spell()
                return
            else
                equip(get_precast_set(spell, spellMap))
            end
            
            cancel_conflicting_buffs(spell, spellMap, eventArgs)
            
            if spell.action_type == 'Magic' then
                next_cast = os.clock() + (spell.cast_time/4) + 3.35 - latency
            elseif spell.type == 'WeaponSkill' then
                next_cast = os.clock() + 2.5 - latency
            elseif spell.action_type == 'Ability' then
                next_cast = os.clock() + .95 - latency
            elseif spell.action_type == 'Item' then
                next_cast = os.clock() + 1.35 - latency
            elseif spell.action_type == 'Ranged Attack' then
                next_cast = os.clock() + 1.05 - latency
            end
            
            if tickdelay < next_cast then tickdelay = next_cast end
        end

    elseif spell.action_type == 'Magic' then
        local spell_recasts = windower.ffxi.get_spell_recasts()
        if (spell_recasts[spell.recast_id] > spell_latency) then
            if stepdown(spell, eventArgs) then 
                return true
            else
                add_to_chat(123,'Abort: ['..spell.english..'] waiting on recast. ('..seconds_to_clock(spell_recasts[spell.recast_id]/60)..')')
                eventArgs.cancel = true
                return true
            end
        else
            return false
        end
    else
        return false
    end


    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    function update_active_stratagems()
        state.Buff['Accession'] = buffactive['Accession'] or false
        state.Buff['Ebullience'] = buffactive['Ebullience'] or false
        state.Buff['Rapture'] = buffactive['Rapture'] or false
        state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false

		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')

        elseif state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
            if stratagem == 'cost' then
                windower.chat.input('/ja "Penury" <me>')
            elseif stratagem == 'speed' then
                windower.chat.input('/ja "Celerity" <me>')

                function user_job_precast(spell, spellMap, eventArgs)

                    if spell.skill == 'Elemental Magic' and player.sub_job == 'SCH' and not (buffactive['Ebullience'] or state.AutoBuffMode.value == 'Off' or state.Buff['SJ Restriction']) then 
                        eventArgs.cancel = true
                        windower.chat.input('/ja "Ebullience" <me>')
                        windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
                        add_tick_delay(1.1)
                        return
                    end


                    
function job_filter_pretarget(spell, spellMap, eventArgs)

	local abil_recasts = windower.ffxi.get_ability_recasts()

	if party.count ~= 1 and (spell.english == 'Regen V' or spell.english == 'Phalanx'or spell.english == 'Stoneskin') and  get_current_stratagem_count() > 1 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
		cast_delay(2.5)
		windower.chat.input('/ja "Accession" <me>')
		windower.chat.input:schedule(1.1,'/ja "Perpetuance" <me>')
	elseif party.count ~= 1 and (spell.english == 'Regen V' or spell.english == 'Phalanx'or spell.english == 'Stoneskin') and  get_current_stratagem_count() < 2 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
		eventArgs.cancel = true

	else
		return false
	end
end

--------work good
local abil_recasts = windower.ffxi.get_ability_recasts()

if party.count ~= 1 and (spell.english == 'Regen V' or spell.english == 'Phalanx'or spell.english == 'Stoneskin') and  get_current_stratagem_count() > 1 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
    cast_delay(2.1)
    windower.chat.input('/ja "Accession" <me>')
    windower.chat.input:schedule(1.1,'/ja "Perpetuance" <me>')
    windower.send_command:schedule((next_cast - os.clock()),'gs c delayedcast')

elseif party.count ~= 1 and (spell.english == 'Regen V' or spell.english == 'Phalanx'or spell.english == 'Stoneskin') and  get_current_stratagem_count() < 2 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
    eventArgs.cancel = true
    windower.send_command:schedule((next_cast - os.clock()),'gs c delayedcast')


else
    return false
end

if party.count ~= 1 and player.target.type == 'PLAYER' and  player.target.in_party) and spell.english == 'Haste' and get_current_stratagem_count() > 0 then
    cast_delay(1.1)
    windower.chat.input('/ja "Perpetuance" <me>')

else 
    eventArgs.cancel = true
    windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
    add_tick_delay(1.1)
end
if player.target.type == 'SELF'

function stepdown(spell, eventArgs)
	if spell_stepdown[spell.english] then
		eventArgs.cancel = true
		windower.chat.input('/ma "'..spell_stepdown[spell.english]..'" '..spell.target.raw..'')
		return true
	else
		return false
	end
end


if (player.main_job == 'DNC' or player.sub_job == 'DNC') then

    if weaponSet == nil then
	elseif weaponSet:lower() == 'default' then
		if not data.jobs.dual_wield_jobs:contains(player.main_job) and (player.sub_job == 'DNC' or player.sub_job == 'NIN') and state.Weapons:contains(default_dual_weapons) and sets.weapons[default_dual_weapons] then
			state.Weapons:set(default_dual_weapons)
		elseif default_weapons and state.Weapons:contains(default_weapons) and sets.weapons[default_weapons] then
			state.Weapons:set(default_weapons)
		else
			state.Weapons:reset()
		end

        local song_buff_names = S{'Requiem','Lullaby','Elegy','Paeon','Ballad','Minne','Madrigal','Prelude','Mambo','Aubade','Pastoral','Hum','Fantasia','Operetta','Capriccio','Serenade','Round','Gavotte','Fugue','Rhapsody','Aria','March','Etude','Carol','Threnody','Hymnus','Mazurka','Sirvente','Dirge','Scherzo','Nocturne'}
local songs_and_rolls_and_favors = gearswap.res.buffs:filter(function(buff)
    return buff.en:endswith(' Roll') or buff.en ~= 'Avatar\'s Favor' and buff.en:endswith(' Favor') or song_buff_names[buff.en]
end):keyset()

elseif party.count ~= 1 and spell.english == 'Haste' and  get_current_stratagem_count() > 0 then --(data.areas.cities:contains(world.area) or data.areas.adoulin:contains(world.area)) and
    cast_delay(1.1)
    windower.chat.input('/ja "Perpetuance" <me>')
    windower.send_command:schedule((next_cast - os.clock()),'gs c delayedcast')
    tickdelay = os.clock() + 1.1

else
    return false
end

if update_active_stratagems():contains(spel.english) then
send_command('@input /p <t> <recast=Stratagems>')
end
(world.area:contains("San d'Oria")

state.Buff['Ebullience'] = buffactive['Ebullience'] or false
state.Buff['Tabula Rasa'] = buffactive['Tabula Rasa'] or false
and not state.Buff.Immanence and not buffactive['Immanence'] 

if state.TabulaRasaMode.value and spell.skill == 'Elemental Magic' and buffactive['Tabula Rasa'] and not buffactive['Immanence'] and buffactive['Ebullience'] then
    cast_delay(1.1)
    windower.chat.input('/ja "Ebullience" <me>')
    tickdelay = os.clock() + 1.1
end

if state.Buff['Mana Wall'] and ((state.IdleMode.value:contains('DT') or state.IdleMode.value:contains('Tank')) and (player.in_combat or being_attacked))then
    equip(sets.buff['Mana Wall'])
end

if state.ManaWallMode.value and being_attacked and player.hpp < 95 then 
    windower.chat.input('/ja "Mana Wall" <me>')
end

local abil_recasts = windower.ffxi.get_ability_recasts()

if abil_recasts[35] < latency and not buffactive['amnesia'] then


    
windower.register_event('incoming text',function(org)     

	--abyssea stagger --red pros
	if string.find(org, "staggers") then
		windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
		send_command('input //gs c Weapons ProcGreatKatana;gs c set WeaponskillMode Match;gc c OffenseMode CRIT')
	end
    The fiend appears vulnerable to wind elemental weapon skills!
if world.area:contains("Abyssea") then

if string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcGreatKatana;')
    if spell.english == 'Tachi: Jinpu' then
        send_command('input //gs c Weapons ProcDagger2;')
    elseif spell.english == 'Cyclone' then
        send_command('input //gs c Weapons ProcGreatKatana;')
    end
elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcPolearm;')
elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcSword;')
elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcStaff;')
elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcGreatSword;')
elseif string.find(org, "The fiend appears vulnerable to Dark elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcScythe;')
    if spell.english == 'Shadow of Death' then
        send_command('input //gs c Weapons ProcDagger;')
    elseif spell.english == 'Energy Drain' then
        send_command('input //gs c Weapons ProcKatana;')
    elseif spell.english == 'Blade: Ei' then
        send_command('input //gs c Weapons ProcScythe;')
    end
elseif string.find(org, "The fiend appears vulnerable to Light elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcSword2;')
    if spell.english == 'Seraph Blade' then
        send_command('input //gs c Weapons ProcClub;')
    elseif spell.english == 'Seraph Strike' then
        send_command('input //gs c Weapons ProcStaff2;')
    elseif spell.english == 'Sunburst' then
        send_command('input //gs c Weapons ProcSword2;')
    end
end


			
elseif spell.type == 'WeaponSkill' then
    local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
    if available_ws:contains("Tachi: Jinpu") then
    if state.WeaponskillMode.value ~= 'Proc' and data.weaponskills.elemental:contains(spell.english) then    
proc
        if not midaction() then
            job_update()
        end
	--handle_equipping_gear(player.status)  
;gs c update')
     --send_command('@input /console gs enable all')
        autows_list = {['Heishi']='Blade: Shun',['Tauret']='Aeolian Edge',['Naegling']='Savage Blade',
        ['ProcGreatSword']='Freezebite',['ProcScythe']='Shadow of Death',['ProcDagger2']='Cyclone',
        ['ProcDagger']='Energy Drain',['ProcStaff2']='Sunburst',['ProcStaff']='Earth Crusher',
        ['ProcSword2']='Seraph Blade',['ProcSword']='Red Lotus Blade',['ProcClub']='Seraph Strike',
        ['ProcGreatKatana']='Tachi: Jinpu',['ProcGreatKatana2']='Tachi: Koki',['ProcKatana']='Blade: Ei',
        ['ProcPolearm']='Raiden Thrust',['Hachimonji']='Tachi: Jinpu',['Zanmato']='Tachi: Jinpu',
        ['H2H']='Asuran Fists',['CLUB']='Judgment',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}
        

	--Sortie 	--Vagary
	if string.find(org, "Flaming Kick") or string.find(org, "Demonfire") then
		windower.send_command('input //gs c set ElementalMode water')
	end
	if string.find(org, "Flashflood") or string.find(org, "Torrential Pain") then
		windower.send_command('input //gs c set ElementalMode Lightning')
	end
	if string.find(org, "Icy Grasp") or string.find(org, "Frozen Blood") then
		windower.send_command('input //gs c set ElementalMode Fire')
	end
	if string.find(org, "Eroding Flesh") or string.find(org, "Ensepulcher") then
		windower.send_command('input //gs c set ElementalMode Wind')
	end
	if string.find(org, "Fulminous Smash") or string.find(org, "Ceaseless Surge") then
		windower.send_command('input //gs c set ElementalMode Earth')
	end
	if string.find(org, "Blast of Reticence") then
		windower.send_command('input //gs c set ElementalMode Ice')
	end
end)





send_command('bind @` gs c cycle SkillchainMode')
send_command('bind !0 gs c set WeaponskillMode Proc;;gs c set CastingMode Proc;gs c update')
send_command('bind !9 gs c weapons Default;gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
send_command('bind f11 gs c cycle CastingMode')


function check_song()
    if state.AutoSongMode.value then
        if not buffactive.march then
            windower.chat.input('/ma "Honor March" <me>')
            add_tick_delay()
            return true
        elseif not buffactive.minuet then
            windower.chat.input('/ma "Valor Minuet V" <me>')
            add_tick_delay()
            return true
        elseif not buffactive.madrigal then
            windower.send_command('gs c set ExtraSongsMode FullLength;input /ma "Blade Madrigal" <me>')
            add_tick_delay()
            return true
        else
            return false
        end
    else
        return false
    end
end
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Proc' then
        --send_command('@input /console gs enable all')
        --send_command('@input /console gs disable all')
		send_command('gs c weapons Default;gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
	elseif stateField == 'unProc' then
        --send_command('@input /console gs enable all')
        --equip(sets.unProc)
	end
end
then break end
if spellMap == 'Lullaby' then 
    send_command('input /p >> Sleep on mob , Lullaby aoe Used  '.. auto_translate(spell.name) ''..spell.target.name..' <<')		
end
end
--send_command('@input /ja "Pianissimo" <me>; wait 1.1; input /ma "'..spell.name..'" '..spell.target.name)

if spellMap == 'Lullaby' then 
    send_command('input /p >> Sleep on mob , Lullaby aoe Used  "'..spell.name..'" '..spell.target.name..' <<')		
end

windower.register_event('incoming text',function(org,spell)     

	--abyssea stagger --red pros
	if string.find(org, "The fiend is frozen in its tracks.") then
		windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
		send_command('input //gs c Weapons Tauret;gs c set WeaponskillMode Match;gc c OffenseMode CRIT;gs enable all')
	end

    if available_ws == 'Tachi: Jinpu' then
        send_command('input //gs c Weapons ProcDagger2;')
    elseif spell.english == 'Cyclone' then
        send_command('input //gs c Weapons ProcGreatKatana;')
    end
    if not midaction() then
        job_update()
    end

	if string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcGreatKatana;')

		if available_ws == 'Tachi: Jinpu' then
			send_command('input //gs c Weapons ProcDagger2;')
		elseif spell.english == 'Cyclone' then
			send_command('input //gs c Weapons ProcGreatKatana;')
		end
		if not midaction() then
            job_update()
		end
	elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcPolearm;')
	elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcSword;')
	elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcStaff;')
	elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcGreatSword;')
	elseif string.find(org, "The fiend appears vulnerable to dark elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcScythe;')
		if spell.english == 'Shadow of Death' then
			send_command('input //gs c Weapons ProcDagger;')
		elseif spell.english == 'Energy Drain' then
			send_command('input //gs c Weapons ProcKatana;')
		elseif spell.english == 'Blade: Ei' then
			send_command('input //gs c Weapons ProcScythe;')
		end
		if not midaction() then
            job_update()
		end
	elseif string.find(org, "The fiend appears vulnerable to light elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcSword2;')
		if spell.english == 'Seraph Blade' then
			send_command('input //gs c Weapons ProcClub;')
		elseif spell.english == 'Seraph Strike' then
			send_command('input //gs c Weapons ProcStaff2;')
		elseif spell.english == 'Sunburst' then
			send_command('input //gs c Weapons ProcSword2;')
		end
        if not midaction() then
            job_update()
		end
	end
	handle_equipping_gear(player.status) 
end)


item_bags = {'Satchel','Inventory','Sack','Case'}
function user_aftercast(spell, spellMap, eventArgs)
    if spell.action_type == 'Item' then
        local remaining = -1
        
        for i, bag in ipairs(item_bags) do
            if player[bag][spell.english] then
                remaining = remaining + player[bag][spell.english]['count']
            end
        end
        
        if remaining > 0 then
            add_to_chat(217, 'Used Item ['..spell.english..'] Remaining In Inventory: ['..tostring(remaining)..']')
        else
            add_to_chat(123, spell.english..' used. None remaining!')
        end
    end
end

if string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcGreatKatana;')
elseif state.WeaponskillMode.value == 'Proc'  then    
    if string.find(org, "Tachi: Jinpu")  then
        send_command('gs c Weapons ProcDagger2;')
    elseif string.find(org, "Cyclone")  then
        send_command('gs c Weapons ProcGreatKatana;')
    elseif string.find(org, "Shadow of Death")  then
            send_command('gs c Weapons ProcDagger;gs c update;')
    elseif string.find(org, "Energy Drain")  then
            send_command('gs c Weapons ProcKatana;')
    elseif string.find(org, "Blade: Ei")  then
        send_command('gs c Weapons ProcScythe;')
    elseif string.find(org, "'Seraph Blade")  then
            send_command('gs c Weapons ProcClub;gs c update;')
    elseif string.find(org, "Seraph Strike")  then
            send_command('gs c Weapons ProcStaff2;')
    elseif string.find(org, "Sunburst")  then
            send_command('gs c Weapons ProcSword2;')
    end
elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcPolearm;')
elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcSword;')
elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcStaff;')
elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcGreatSword;')
elseif string.find(org, "The fiend appears vulnerable to dark elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcScythe;')
elseif state.WeaponskillMode.value == 'Proc'  then    
    if string.find(org, "Shadow of Death")  then
        send_command('gs c Weapons ProcDagger;gs c update;')
    elseif string.find(org, "Energy Drain")  then
        send_command('gs c Weapons ProcKatana;')
    elseif string.find(org, "Blade: Ei")  then
        send_command('gs c Weapons ProcScythe;')
    end
    if not midaction() then
        job_update()
    end
elseif string.find(org, "The fiend appears vulnerable to light elemental weapon skills!")  then
    send_command('input //gs c Weapons ProcSword2;')
elseif state.WeaponskillMode.value == 'Proc'  then    
    if string.find(org, "'Seraph Blade")  then
        send_command('gs c Weapons ProcClub;gs c update;')
    elseif string.find(org, "Seraph Strike")  then
        send_command('gs c Weapons ProcStaff2;')
    elseif string.find(org, "Sunburst")  then
        send_command('gs c Weapons ProcSword2;')
    end
    if not midaction() then
        job_update()
    end
end


windower.register_event('incoming text',function(org,spell)     

	--abyssea stagger --red pros
	if string.find(org, "The fiend is frozen in its tracks.") then
		windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
		send_command('input //gs c Weapons Tauret;gs c set WeaponskillMode Match;gc c OffenseMode CRIT;gs enable all')
	end

	if string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
		send_command('gs c Weapons ProcGreatKatana;')
	elseif state.WeaponskillMode.value == 'Proc' and world.area:contains('Abyssea') then    
		if string.find(org, "Tachi: Jinpu")  then
			send_command('gs c Weapons ProcDagger2;')
		elseif string.find(org, "Cyclone")  then
			send_command('gs c Weapons ProcGreatKatana;')
		elseif string.find(org, "Shadow of Death")  then
				send_command('gs c Weapons ProcDagger;gs c update;')
		elseif string.find(org, "Energy Drain")  then
				send_command('gs c Weapons ProcKatana;')
		elseif string.find(org, "Blade: Ei")  then
			send_command('gs c Weapons ProcScythe;')
		elseif string.find(org, "'Seraph Blade")  then
				send_command('gs c Weapons ProcClub;gs c update;')
		elseif string.find(org, "Seraph Strike")  then
				send_command('gs c Weapons ProcStaff2;')
		elseif string.find(org, "Sunburst")  then
				send_command('gs c Weapons ProcSword2;')
		end
	elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
		send_command('gs c Weapons ProcPolearm;')
	elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
		send_command('gs c Weapons ProcSword;')
	elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
		send_command('gs c Weapons ProcStaff;')
	elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
		send_command('gs c Weapons ProcGreatSword;')
	elseif string.find(org, "The fiend appears vulnerable to dark elemental weapon skills!")  then
		send_command('gs c Weapons ProcScythe;')
		if not midaction() then
            job_update()
		end
	elseif string.find(org, "The fiend appears vulnerable to light elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcSword2;')
        if not midaction() then
            job_update()
		end
	end

    
	elseif string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
		send_command('gs c Weapons ProcGreatKatana;')
		send_command('/p RED Proc: Wind - Cyclone(DGR), Tachi: Jinpu(GKT);')

	elseif state.WeaponskillMode.value == 'Proc' and world.area:contains('Abyssea') then    
		if string.find(org, "Tachi: Jinpu")  then
			send_command('gs c Weapons ProcDagger2;')
		elseif string.find(org, "Cyclone")  then
			send_command('gs c Weapons ProcGreatKatana;')
		elseif string.find(org, "Shadow of Death")  then
				send_command('gs c Weapons ProcDagger;gs c update;')
		elseif string.find(org, "Energy Drain")  then
				send_command('gs c Weapons ProcKatana;')
		elseif string.find(org, "Blade: Ei")  then
			send_command('gs c Weapons ProcScythe;')
		elseif string.find(org, "Seraph Blade")  then
				send_command('gs c Weapons ProcClub;gs c update;')
		elseif string.find(org, "Seraph Strike")  then
				send_command('gs c Weapons ProcStaff2;')
		elseif string.find(org, "Sunburst")  then
				send_command('gs c Weapons ProcGreatKatana2;')
		elseif string.find(org, "Tachi: Koki")  then
				send_command('gs c Weapons ProcSword2;')
		end
	elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
		send_command('gs c Weapons ProcPolearm;')
		send_command('/p RED Proc: Lightning - Raiden Thrust(PLM);')
		send_command('/echo RED Proc: Lightning - Raiden Thrust(PLM);')

	elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
		send_command('gs c Weapons ProcSword;')
		send_command('/p RED Proc: Fire - Red Lotus Blade(SWD);')
		send_command('/echo RED Proc: Fire - Red Lotus Blade(SWD);')

	elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
		send_command('gs c Weapons ProcStaff;')
		send_command('/p RED Proc: Earth - Earth Crusher(STF);')
		send_command('/echo RED Proc: Earth - Earth Crusher(STF);')

	elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
		send_command('gs c Weapons ProcGreatSword;')
		send_command('/p RED Proc: Ice - Freezebite(GSD);')
		send_command('/echo RED Proc: Ice - Freezebite(GSD);')

	elseif string.find(org, "The fiend appears vulnerable to dark elemental weapon skills!")  then
		send_command('gs c Weapons ProcScythe;')
		send_command('/p RED Proc: Dark - Energy Drain(DGR), Shadow of Death(SCY), Blade: Ei(KTN);')
		send_command('/echo RED Proc: Dark - Energy Drain(DGR), Shadow of Death(SCY), Blade: Ei(KTN);')

		if not midaction() then
            job_update()
		end
	elseif string.find(org, "The fiend appears vulnerable to light elemental weapon skills!")  then
		send_command('input //gs c Weapons ProcSword2;')
		send_command('/p RED Proc: Light - Seraph Blade(SWD), Tachi: Koki(GKT), Seraph Strike(CLB), Sunburst(STF);')

        if not midaction() then
            job_update()
		end
	end

    proc_target_id = ''
abyssea_elemental_ws_proc_weapons_map = {['fire']='ProcSword',['ice']='ProcGreatSword',['wind']='ProcDagger',['earth']='ProcStaff',['lightning']='ProcPolearm',['light']='ProcClub',['darkness']='ProcScythe'}


windower.raw_register_event('incoming text',function(original)
    if world.area:contains('Abyssea') and state.WeaponSets.value:contains('Proc') or state.Weapons.value:contains('Proc') then
        if original:find("The fiend is frozen in its tracks.") then
            proc_target_id == ''
            send_command('gs c weapons initialize')
        elseif original:startswith("The fiend appears vulnerable to") and original: endswith:("elemental weapon skills!") then
            if proc_target_id ~= player.target.id then
                proc_target_id == player.target.id
                
                local element = string.match(original, "The fiend appears vulnerable to (%S+)")
                
                send_command('gs c set weaponset Proc;gs c set weapons '..abyssea_elemental_ws_proc_map[element])
            end

end)

windower.raw_register_event('incoming chunk', function(id, data, modified, injected, blocked))
    if id == 0x29 then

    local message_id = data:unpack('H',0x19)%32768

    -- Remove mobs that die from our tagged mobs list.
    if message_id == 6 or message_id == 20 then
        if proc_target_id == target_id then
            proc_target_id = ''
        end
    end
end)

as i said, there's already an example 
if proc_target_id ~= player.target.id then


    ---- final update code complet work fine

    
windower.register_event('incoming text',function(org,spell)     

	--abyssea stagger --red pros
	if string.find(org, "The fiend is frozen in its tracks.") then
		windower.send_command('/p Stagger! <call14>!')  -- code add by (Aragan@Asura)
		send_command('gs c Weapons Tauret;gs c set WeaponskillMode Match;gc c OffenseMode CRIT;gs enable all')
	end

	if state.WeaponskillMode.value == 'Proc' and world.area:contains('Abyssea') then    
		if string.find(org, "The fiend appears vulnerable to wind elemental weapon skills!")  then
			send_command('gs c Weapons ProcGreatKatana;') 
			send_command('/p RED Proc: Wind - Cyclone(DGR), Tachi: Jinpu(GKT);') 
		
		elseif string.find(org, "The fiend appears vulnerable to lightning elemental weapon skills!")  then
			send_command('gs c Weapons ProcPolearm;')
			send_command('/p RED Proc: Lightning - Raiden Thrust(PLM);')
			send_command('/echo RED Proc: Lightning - Raiden Thrust(PLM);')
		
	    elseif string.find(org, "The fiend appears vulnerable to fire elemental weapon skills!")  then
			send_command('gs c Weapons ProcSword;')
			send_command('/p RED Proc: Fire - Red Lotus Blade(SWD);')
			send_command('/echo RED Proc: Fire - Red Lotus Blade(SWD);')
		
	    elseif string.find(org, "The fiend appears vulnerable to earth elemental weapon skills!")  then
			send_command('gs c Weapons ProcStaff;')
			send_command('/p RED Proc: Earth - Earth Crusher(STF);')
			send_command('/echo RED Proc: Earth - Earth Crusher(STF);')
		
	    elseif string.find(org, "The fiend appears vulnerable to ice elemental weapon skills!")  then
			send_command('gs c Weapons ProcGreatSword;')
			send_command('/p RED Proc: Ice - Freezebite(GSD);')
			send_command('/echo RED Proc: Ice - Freezebite(GSD);')
		
	    elseif string.find(org, "The fiend appears vulnerable to dark elemental weapon skills!")  then
			send_command('gs c Weapons ProcScythe;')
			send_command('/p RED Proc: Dark - Energy Drain(DGR), Shadow of Death(SCY), Blade: Ei(KTN);')
			send_command('/echo RED Proc: Dark - Energy Drain(DGR), Shadow of Death(SCY), Blade: Ei(KTN);')
	    elseif string.find(org, "The fiend appears vulnerable to light elemental weapon skills!")  then
			send_command('gs c Weapons ProcSword2;')
			send_command('/p RED Proc: Light - Seraph Blade(SWD), Tachi: Koki(GKT), Seraph Strike(CLB), Sunburst(STF);')
			send_command('/echo RED Proc: Light - Seraph Blade(SWD), Tachi: Koki(GKT), Seraph Strike(CLB), Sunburst(STF);')
	    elseif string.find(org, "Tachi: Jinpu")  then
			send_command('gs c Weapons ProcDagger2;')
	    elseif string.find(org, "Cyclone")  then
			send_command('gs c Weapons ProcGreatKatana;')
	    elseif string.find(org, "Shadow of Death")  then
				send_command('gs c Weapons ProcDagger;gs c update;')
	    elseif string.find(org, "Energy Drain")  then
				send_command('gs c Weapons ProcKatana;')
	    elseif string.find(org, "Blade: Ei")  then
			send_command('gs c Weapons ProcScythe;')
	    elseif string.find(org, "Seraph Blade")  then
				send_command('gs c Weapons ProcClub;gs c update;')
	    elseif string.find(org, "Seraph Strike")  then
				send_command('gs c Weapons ProcStaff2;')
	    elseif string.find(org, "Sunburst")  then
				send_command('gs c Weapons ProcGreatKatana2;')
	    elseif string.find(org, "Tachi: Koki")  then
				send_command('gs c Weapons ProcSword2;')
		end
	end

    --codr more trust options 

    state.AutoTrustMode:options('Off','Auto','Sleeper') --,'Vagary','Off','Off','Off','Off',
	state.AutoTrustMode 		  = M{['description'] = 'Auto Trust Mode','Off','Auto'}

    
function check_trust()
	if not moving and not state.AutoTrustMode.value == 'OFF' and not data.areas.cities:contains(world.area) and (buffactive['Reive Mark'] or buffactive['Elvorseal'] or not player.in_combat) then
		local party = windower.ffxi.get_party()
		if party.p5 == nil then
			local spell_recasts = windower.ffxi.get_spell_recasts()
            if state.AutoTrustMode.value == 'Auto' then

                if spell_recasts[999] < spell_latency and not have_trust("Monberaux") then
                    windower.chat.input('/ma "Monberaux" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
                    windower.chat.input('/ma "Sylvie (UC)" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
                    windower.chat.input('/ma "Koru-Moru" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
                    windower.chat.input('/ma "Joachim" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                    windower.chat.input('/ma "Qultada" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                elseif spell_recasts[1013] < spell_latency and not have_trust("Lilisette II") then
                    windower.chat.input('/ma "Lilisette" <me>')
                    tickdelay = os.clock() + 4.5
                    return true
                else
                    return false
                end
            end
           if state.AutoTrustMode.correct == 'Sleeper' then

            if spell_recasts[998] < spell_latency and not have_trust("Ygnas") then
                windower.chat.input('/ma "Ygnas" <me>')
                tickdelay = os.clock() + 4.5
                return true
            elseif spell_recasts[981] < spell_latency and not have_trust("Sylvie (UC)") then
                windower.chat.input('/ma "Sylvie (UC)" <me>')
                tickdelay = os.clock() + 4.5
                return true
            elseif spell_recasts[1018] < spell_latency and not have_trust("Koru-Moru") then
                windower.chat.input('/ma "Koru-Moru" <me>')
                tickdelay = os.clock() + 4.5
                return true
            elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
                windower.chat.input('/ma "Joachim" <me>')
                tickdelay = os.clock() + 4.5
                return true
            elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                windower.chat.input('/ma "Qultada" <me>')
                tickdelay = os.clock() + 4.5
                return true
            elseif spell_recasts[1013] < spell_latency and not have_trust("Lilisette II") then
                windower.chat.input('/ma "Lilisette" <me>')
                tickdelay = os.clock() + 4.5
                return true
            else
                return false
            end
        end
    else
        return false
    end

	
	return false
end

ry['Demon\'s Medal'] then send_command('put "Demon\'s Medal" sack all') moveditem = true end

proc
Weaponskil            job_update()
		tickdelay = os.clock() + 1
				tickdelay = os.clock() + 1.1
				return true
Copper Voucher	


You find a Volte Tights on the


windower.raw_register_event('incoming text',function(org)
    
	if string.find(org, "You find a Volte Tights") then
		windower.send_command('/echo Aragan ITS DROP LOT IT ! <call14>!')  -- code add by (Aragan@Asura)
        windower.send_command('input /t Aragan ITS DROP LOT IT ! <call14> ' )
	end
end)

windower.raw_register_event('incoming text',function(org)

	--abyssea stagger --red pros
	if string.find(org, "The fiend is frozen in its tracks.") then
		windower.send_command('/p Stagger! <call14>!')  -- code add by (Aragan@Asura)
	end
end 
)

local abil_recasts = windower.ffxi.get_ability_recasts()

if (player.in_combat or being_attacked) then
    windower.chat.input('/ja "Sentinel" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and  moving or not moving and player.hpp > 25 and abil_recasts[254] < latency then
    windower.chat.input('/ja "Invincible" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif player.sub_job == 'WAR' then
    windower.chat.input('/ja "Defender" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and not buffactive.Rampart and player.hpp > 42 and moving or not moving and abil_recasts[77] < latency then
    windower.chat.input('/ja "Rampart" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and not buffactive.Palisade and player.hpp > 42 and not moving and abil_recasts[42] < latency then
    windower.chat.input('/ja "Palisade" <me>')
    tickdelay = os.clock() + 1.1
    return true
end


local abil_recasts = windower.ffxi.get_ability_recasts()

if player.hpp < 89 then
    windower.chat.input('/ja "Sentinel" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and  moving or not moving and player.hpp < 25 and abil_recasts[254] < latency then
    windower.chat.input('/ja "Invincible" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif player.sub_job == 'WAR' and not buffactive.Defender and (player.in_combat or being_attacked) and player.hpp < 25 and moving or not moving and not buffactive.Defender and abil_recasts[3] < latency then
    windower.chat.input('/ja "Defender" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and not buffactive.Rampart and player.hpp < 42 and moving or not moving and abil_recasts[77] < latency then
    windower.chat.input('/ja "Rampart" <me>')
    tickdelay = os.clock() + 1.1
    return true
elseif (player.in_combat or being_attacked) and not buffactive.Palisade and player.hpp < 42 and not moving and abil_recasts[42] < latency then
    windower.chat.input('/ja "Palisade" <me>')
    tickdelay = os.clock() + 1.1
    return true
end

if lastincombat == true and not player.in_combat then
    being_attacked = false
    if player.status == 'Idle' and not midaction() and not (pet_midaction() or ((petWillAct + 2) > os.clock())) then
        handle_equipping_gear(player.status)
    end

    
function user_status_change(newStatus, oldStatus, eventArgs)
    local abil_recasts = windower.ffxi.get_ability_recasts()
 
     if (player.in_combat or being_attacked) and not buffactive.Sentinel and player.hpp < 25 and abil_recasts[75] < latency then
         windower.chat.input('/ja "Sentinel" <me>')
         tickdelay = os.clock() + 1.1
         return true
 
     --[[elseif not buffactive.Invincible and (player.in_combat or being_attacked) and  player.hpp < 25 and abil_recasts[254] < latency then
         windower.chat.input('/ja "Invincible" <me>')
         tickdelay = os.clock() + 1.1
         return true
  ]]
     elseif player.sub_job == 'WAR' and not buffactive.Defender and (player.in_combat or being_attacked) and player.hpp < 25 and abil_recasts[3] < latency then
         windower.chat.input('/ja "Defender" <me>')
         tickdelay = os.clock() + 1.1
         return true
 
     elseif (player.in_combat or being_attacked) and not buffactive.Rampart and player.hpp < 42 and abil_recasts[77] < latency then
         windower.chat.input('/ja "Rampart" <me>')
         tickdelay = os.clock() + 1.1
         return true
 
     elseif (player.in_combat or being_attacked) and not buffactive.Palisade and player.hpp < 42 and abil_recasts[42] < latency then
         windower.chat.input('/ja "Palisade" <me>')
         tickdelay = os.clock() + 1.1
         return true
 
     end
     if not midaction() then
         job_update()
     end
 
 end


 
function user_status_change(newStatus, oldStatus, eventArgs)
    local abil_recasts = windower.ffxi.get_ability_recasts()
 
   if not buffactive.Invincible and (player.in_combat or being_attacked) and  player.hpp < 25 and abil_recasts[254] < latency then
         windower.chat.input('/ja "Invincible" <me>')
         tickdelay = os.clock() + 1.1
         return true
 end

 if not spell.interrupted then

 if spell.type == 'Scholar' then
    windower.send_command:schedule(1,'gs c showcharge')
elseif spell.action_type == 'Magic' then

    if spell.interrupted and spell.action_type == 'Magic'   then
		state.CastingMode:set('SIRD')

		--[[send_command('gs c set state.CastingMode.value SIRD')

		return true
	else
		return false 
	]]

    end


    if spell.target.type == 'SELF' and spellMap then
        if spellMap:contains('Cure') then
            if curecheat then
                if sets.HPCure then
                    equip(sets.HPCure)
                end
                curecheat = false
            elseif sets.Self_Healing then
                if sets.Self_Healing.SIRD and state.CastingMode.value:contains('SIRD') and (player.in_combat or being_attacked) then
                    equip(sets.Self_Healing.SIRD)
                else

                    
if being_attacked and player.hpp < 75 and spell_recasts[4] < spell_latency then 
    windower.chat.input('/ma "Cure IV" <me>')
end

function job_filter_aftercast(spell, spellMap, eventArgs)
	if spellMap == 'Cure' and spell.interrupted then
		state.CastingMode:set('SIRD')
		--send_command('gs c set state.CastingMode.value SIRD')
		send_command('gs c update')
		tickdelay = os.clock() + 1.1
    end
end
send_command('/ja "Vivacious Pulse" <ma>')
windower.chat.input('/ja "Vivacious Pulse" <me>')
tickdelay = os.clock() + 1.1
if spell.english == 'Vivacious Pulse' then
    equip(sets.precast.JA['Vivacious Pulse'][state.RuneElement.value])
    return
end


function user_status_change(newStatus, oldStatus, eventArgs)
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()


 
	 if not buffactive['Elemental Sforzo'] and (player.in_combat or being_attacked) and  player.hpp < 25 and abil_recasts[0] < latency then
		 windower.chat.input('/ja "Elemental Sforzo" <me>')
		 tickdelay = os.clock() + 1.1
		 return true
 
	 elseif player.sub_job == 'WAR' and not buffactive.Defender and (player.in_combat or being_attacked) and player.hpp < 25 and abil_recasts[3] < latency then
		 windower.chat.input('/ja "Defender" <me>')
		 tickdelay = os.clock() + 1.1
		 return true
	elseif player.sub_job == 'PLD' and (player.in_combat or being_attacked) and not buffactive.Sentinel and player.hpp < 25 and abil_recasts[75] < latency then
		windower.chat.input('/ja "Sentinel" <me>')
		tickdelay = os.clock() + 1.1
		return true
	 elseif player.sub_job == 'PLD' and (player.in_combat or being_attacked) and not buffactive['Holy Circle'] and player.hpp < 42 and abil_recasts[74] < latency then
		 windower.chat.input('/ja "Holy Circle" <me>')
		 tickdelay = os.clock() + 1.1
		 return true

	 end
	 if state.AutoCureMode.value then
		 if being_attacked and player.hpp < 85 and abil_recasts[242] < latency then 
			windower.chat.input('/ja "Vivacious Pulse" <me>')
			tickdelay = os.clock() + 1.1

		elseif player.sub_job == 'SCH' and being_attacked and player.hpp < 85 and spell_recasts[4] < spell_latency then 
			windower.chat.input('/ma "Cure IV" <me>')
			tickdelay = os.clock() + 1.1
		 end
	 end
	 if not midaction() then
		 job_update()
	 end
 
 end

Aita uses Vivisection
 The Porxie uses Beclouding Dust.Aragan receives the effect of Flash.
 The Banneret Commander starts casting Cure IV.
 windower.register_event('incoming text',function(org)     

	--[[
tel what proc need
The fiend appears vulnerable to ice elemental magic!
proc done
attack staggers the fiend!
]]
	--abyssea stagger
	if string.find(org, "Aita uses Vivisection") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Aita uses Vivisection <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end
	if string.find(org, "Degei uses Vivisection") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Degei uses Vivisection <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end
	if string.find(org, "Triboulex uses Setting the Stage") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Triboulex uses Setting the Stage <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end
	if string.find(org, "Skomora uses Setting the Stage") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Skomora uses Setting the Stage <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end
	if string.find(org, "Leshonn uses Tearing Gust ") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Leshonn uses Tearing Gust  <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end
	if string.find(org, "Gartell uses Tearing Gust ") then
		windower.chat.input('/ja "Elemental Sforzo" <me>')
		windower.send_command('input /p Gartell uses Tearing Gust  <call14>!')  -- code add by (Aragan@Asura)
		windower.chat.input('/ja "Liement" <me>')
	end


    windower.register_event('incoming text',function(org)     

        --[[
    tel what proc need
    The fiend appears vulnerable to ice elemental magic!
    proc done
    attack staggers the fiend!
    ]]
        if string.find(org, "Aita uses Vivisection") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Aita uses Vivisection <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        if string.find(org, "Degei uses Vivisection") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Degei uses Vivisection <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        if string.find(org, "Triboulex uses Setting the Stage") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Triboulex uses Setting the Stage <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        if string.find(org, "Skomora uses Setting the Stage") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Skomora uses Setting the Stage <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        if string.find(org, "Leshonn uses Tearing Gust ") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Leshonn uses Tearing Gust  <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        if string.find(org, "Gartell uses Tearing Gust ") then
            windower.chat.input('/ja "Elemental Sforzo" <me>')
            windower.send_command('input /p Gartell uses Tearing Gust  <call14>!')  -- code add by (Aragan@Asura)
            windower.chat.input('/ja "Liement" <me>')
        end
        
    
        --Sortie 	--Vagary
        if string.find(org, "Flaming Kick") or string.find(org, "Demonfire") then
            windower.send_command('input //gs c set ElementalMode water')
            windower.send_command('input /ma water <bt>')
            windower.send_command('input /p Flaming Kick >> ITS WEAK WATER PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
    
        end
        if string.find(org, "Flashflood") or string.find(org, "Torrential Pain") then
            windower.send_command('input //gs c set ElementalMode Lightning')
            windower.send_command('input /ma thunder <bt>')
            windower.send_command('input /p Flashflood >> ITS WEAK THUNDER PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
        end
        if string.find(org, "Icy Grasp") or string.find(org, "Frozen Blood") then
            windower.send_command('input //gs c set ElementalMode Fire')
            windower.send_command('input /ma fire <bt>')
            windower.send_command('input /p Flashflood >> ITS WEAK FIRE PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
        end
        if string.find(org, "Eroding Flesh") or string.find(org, "Ensepulcher") then
            windower.send_command('input //gs c set ElementalMode Wind')
            windower.send_command('input /ma wind <bt>')
            windower.send_command('input /p Flashflood >> ITS WEAK WIND PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
        end
        if string.find(org, "Fulminous Smash") or string.find(org, "Ceaseless Surge") then
            windower.send_command('input //gs c set ElementalMode Earth')
            windower.send_command('input /ma Stone <bt>')
            windower.send_command('input /p Flashflood >> ITS WEAK STONE PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
        end
        if string.find(org, "Blast of Reticence") then
            windower.send_command('input //gs c set ElementalMode Ice')
            windower.send_command('input /ma Blizzard <bt>')
            windower.send_command('input /p Flashflood >> ITS WEAK ICE PROC <call14>!')  -- code add by (Aragan@Asura)
            tickdelay = os.clock() + 1.1
            return true
    
        end
    end)

    state.MagicalDefenseMode:set('MDT')

    if player.max_hp - player.hp < 200 and abil_recasts[217] < latency then
        windower.send_command('input /ma Curing Waltz <me>')
    end
    missingHP = player.max_hp - player.hp
elseif missingHP < 200 then
    if abil_recasts[217] < latency then
        newWaltz = 'Curing Waltz'
        waltzID = 190
    elseif abil_recasts[186] < latency then
        newWaltz = 'Curing Waltz II'
        waltzID = 191
    end

    
	if state.AutoCureMode.value then
		--[[if player.tp > 350 and player.max_hp - player.hp > 600 and abil_recasts[186] < latency then
			windower.send_command('input /ja Curing Waltz II <me>')
			]]
	    if player.tp > 500 and player.max_hp - player.hp > 1000 and abil_recasts[187] < latency then
			windower.send_command('input /ja Curing Waltz III <me>')
		end
        local remedy_buffs = S{3,4,8}	-- Paralysis, Disease,poison
        local spell_recasts = windower.ffxi.get_spell_recasts()

        local Healingbuffs = S{3,4,8}	-- Paralysis, Disease,poison

    if Healingbuffs:contains(buff_id) and buffactive and  player.tp > 200 and abil_recasts[215] < latency then
        windower.send_command('input /ja Healing Waltz <me>')
    end
    if remedy_buffs:contains(buff_id) and active and player.main_job ~= 'WHM' and (os.time()-attempt) > 4 then
        if haveBuff(buff_id) and haveMeds(4155) then
            windower.add_to_chat(6,"[AutoItem] Using Remedy.")
            windower.send_command('input /item "Remedy" <me>')
            attempt = os.time()


            local effective_tp = player.tp
            if state.DefenseMode.value == 'None' and uses_waltz_legs then
                effective_tp = player.tp + 50
            end
            
            if effective_tp < 200 then
                add_to_chat(123, 'Abort: Insufficient TP ['..tostring(player.tp)..'] to waltz.')
                eventArgs.cancel = true
                return true
            end
   -- Don't modify anything for Healing Waltz or Divine Waltzes
   if spell.english == "Healing Waltz" or spell.english == "Divine Waltz" or spell.english == "Divine Waltz II" then
    return false
end
windower.ffxi.get_items()
buffs

windower.ffxi.get_buffs()
local Healingbuffs = S{3,4,8,9,13,134,135,192,194,129,133,134,136,138,139,140,141,144,145,146,147,148,149,167,564}	-- Paralysis, Disease,poison,Curse,Dia,Bio,Requiem,Elegy
buffactive[spell.english]



if state.AutoMedicineMode.value == true then
    if buff == "Defense Down" then
        if gain then  			
            send_command('input /item "Panacea" <me>')
        end
    elseif buff == "Magic Def. Down" then
        if gain then  			
            send_command('@input /item "panacea" <me>')
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
    elseif buff == "poison" or buff == "slow" or buff == "Rasp" 
    or buff == "Dia" or buff == "Defense Down"  or buff == "Magic Def. Down" or buff == "Max HP Down" 
    or buff == "Evasion Down" or buff == "Magic Evasion Downn"  or buff == "Bio" or buff == "Bind" 
    or buff == "weight" or buff == "Attack Down"  or buff == "Accuracy Down" or buff == "VIT Down" 
    or buff == "INT Down" or buff == "MND Down"  or buff == "STR Down" or buff == "AGI Down" 
    then
        if gain then  
            send_command('input /item "remedy" <me>')
        end
    end
    if player.tp > 200 and abil_recasts[215] < latency and (buff == "poison" or buff == "Slow" or buff == "Rasp" 
        or buff == "Dia" or buff == "Defense Down"  or buff == "Magic Def. Down" or buff == "Max HP Down" 
        or buff == "Evasion Down" or buff == "Magic Evasion Downn"  or buff == "Bio" or buff == "Bind" 
        or buff == "weight" or buff == "Attack Down"  or buff == "Accuracy Down" or buff == "VIT Down" 
        or buff == "INT Down" or buff == "MND Down"  or buff == "STR Down" or buff == "AGI Down") then		
    	if gain then  
	       windower.send_command('input /ja Healing Waltz <me>')
		end
	end
    local abil_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()

    if player.tp > 200 and (buff == "poison" or buff == "slow" or buff == "Rasp" 
        or buff == "Dia" or buff == "Defense Down"  or buff == "Magic Def. Down" or buff == "Max HP Down" 
        or buff == "Evasion Down" or buff == "Magic Evasion Downn"  or buff == "Bio" or buff == "Bind" 
        or buff == "weight" or buff == "Attack Down"  or buff == "Accuracy Down" or buff == "VIT Down" 
        or buff == "INT Down" or buff == "MND Down"  or buff == "STR Down" or buff == "AGI Down") then		
    	if gain then  
	       windower.send_command('input /ja Healing Waltz <me>')
		end
        return
	end
end

if player.tp > 200 and (buffactive['poison'] == "poison" or buffactive['slow'] or buffactive['Rasp'] 
or buffactive['Dia'] or buffactive['Defense Down'] or buffactive['Magic Def. Down'] or buffactive['Max HP Down']
or buffactive['Evasion Down'] == "Evasion Down" or buffactive['Magic Evasion Down'] or buffactive['Bio'] or buffactive['Bind']
or buffactive['weight'] or buffactive['Attack Down'] or buffactive['Accuracy Down'] or buffactive['VIT Down']
or buffactive['INT Down'] or buffactive['MND Down'] or buffactive['STR Down'] or buffactive['AGI Down']) then		
   windower.send_command('input /ja Healing Waltz <me>')
   tickdelay = os.clock() + 1.1


elseif command:contains('heal') then
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local tierlist = {['tier1']='White Wind',['tier2']='Magic Fruit',['tier3']='Restoral'}
    
    windower.chat.input('/ma "'..tierlist[command]..'" <me>')
    	-- Healing spells
blue_magic_maps.Healing = S{
    'Exuviation','Healing Breeze','Magic Fruit','Plenilune Embrace',
    'Pollen','Restoral','White Wind','Wild Carrot'
}
elseif command:contains('heal') or command == 'heal' then
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local tierkey = {'tier1','tier2','tier3'}
    local tierlist = {['tier1']='White Wind',['tier2']='Magic Fruit',['tier3']='Restoral'}
    if command == 'heal' then
        for i in ipairs(tierkey) do
            if player.mp then
                windower.chat.input('/ma "'..tierlist[tierkey[i]]..'" '..target..'')
                return
            end
        end
    
    end
    state.AutoCureMode = M(true, 'Auto Cure Mode')
    state.NeverDieMode = M(true, 'Never Die Mode')
    if state.NeverDieMode.value or state.AutoCureMode.value

    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']

        --local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
        if not midaction() then
            job_update()
        end
    end

    function job_pretarget(spell, action, spellMap, eventArgs)

        if spell.type == 'Step' then
            local allRecasts = windower.ffxi.get_ability_recasts()
            local prestoCooldown = allRecasts[236]
            local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
    
            --local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
            
            if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
                cast_delay(1.1)
                send_command('@input /ja "Presto" <me>')
                tickdelay = os.clock() + 1.1
    
            end
            if not midaction() then
                job_update()
            end
        end
    end

    if player.sub_job == 'SCH' then

        if not buffactive[data.elements.storm_of[state.ElementalMode.value]] and actual_cost(get_spell_table_by_name(data.elements.storm_of[state.ElementalMode.value])) < player.mp then
            windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
            tickdelay = os.clock() + 1.1
            return true
        else
            return false
        end
    end

    
function check_nuke()
	if state.AutoNukeMode.value and player.target.type == "MONSTER" then
		local spell = res.spells:with('name',autonuke)
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.id] < spell_latency then
			windower.chat.input('/ma '..autonuke..' <t>')
			tickdelay = os.clock() + 1.5
			return true
		else
			return false
		end
	else
		return false
	end
end


function face_target()
	local target = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().target_index or 0)
	local self_vector = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index or 0)
	if target then  -- Please note if you target yourself you will face Due East
		local angle = (math.atan2((target.y - self_vector.y), (target.x - self_vector.x))*180/math.pi)*-1
		windower.ffxi.turn((angle):radian())
	else
		windower.add_to_chat(123,"Error: You're not targeting anything to face")
	end

if target.name == "Ironshell" then
    windower.chat.input('gs c set RuneElement wind') 
    return
end

function user_job_target_change(target)  
	
	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if target.name == "Ironshell" then
			windower.chat.input('gs c set RuneElement Lux') 
			
		end
	end
end

function check_doomed()
	if buffactive.doom and state.AutoRemoveDoomMode.value then 
	
		if (buffactive.mute or buffactive.Omerta or buffactive.silence) or not (silent_can_use(20) and windower.ffxi.get_spell_recasts()[20] < spell_latency) then
			if state.AutoHolyWaterMode.value and not buffactive.muddle then
				if player.inventory['Hallowed Water'] then
					windower.chat.input('/item "Hallowed Water" <me>')
					add_to_chat(123,'You are doomed, using Hallowed Water.')
					tickdelay = os.clock() + 1.5
					return true
				elseif player.inventory['Holy Water'] or player.satchel['Holy Water'] then
					windower.chat.input('/item "Holy Water" <me>')
					add_to_chat(123,'You are doomed, using Holy Water.')
					tickdelay = os.clock() + 1.5
					return true
				elseif buffactive.silence then
						if player.inventory['Echo Drops'] or player.satchel['Echo Drops'] then
							windower.chat.input('/item "Echo Drops" <me>')
						elseif player.inventory["Remedy"] then
							windower.chat.input('/item "Remedy" <me>')
						end
						tickdelay = os.clock() + 1.5
						return true
				end
			end
		else
			windower.chat.input('/ma "Cursna" <me>')
			tickdelay = os.clock() + 1.5
			return true
		end
	else
		return false
	end
	return false
end

function user_job_target_change(target)  
	
	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if target.name == "Ironshell" then
			windower.chat.input('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;') 
		elseif target.name == "Aminon" then
			windower.chat.input('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;') 
			
		end
	end
end

function user_job_target_change(target)  
	
	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if target.name == "Ironshell" then
			windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
		elseif target.name == "Aminon" then
			windower.chat.input('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        elseif target.name == "Ghatjot" then
			windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        end

	end
end

if string.find(org, "Chokehold") then
    windower.send_command('input //gs c set ElementalMode Ice')
    windower.send_command('input /ma Blizzard <bt>')
    windower.send_command('input /p Chokehold >> ITS WEAK ICE PROC <call14>!')  -- code add by (Aragan@Asura)
    tickdelay = os.clock() + 1.1
    return true

end
hanges to Wind hands after.

Element: Wind Wind: Chokehold,

Thunder: Zap, 

Wind hand: 70% Ice, 
Thunder hand: 70% Earth
Wind and Thunder hands:  only Ice damage will be effective.


function user_job_target_change(target)  
	
	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if target.name == "Ironshell" or target.name == "Ghast" then
			windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
			--windower.send_command('input /p ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands:  only Ice damage will be effective.')  -- code add by (Aragan@Asura)
			windower.send_command('input /echo ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands:  only Ice damage will be effective.')  -- code add by (Aragan@Asura)

		elseif target.name == "Aminon" then
			windower.chat.input('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        elseif target.name == "Ghatjot" or target.name == "Dhartok" then
			windower.chat.input('gs c set RuneElement Tellus;gs c set ElementalMode Earth;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
		elseif target.name == "Skomora" or target.name == "Triboulex" then
			windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
		end
	end
end

'..auto_translate('Rayke')..'
windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
send_command('@input /p  >>> Rayke on ['..spell.target.name..']. Second left: '..rayke_duration..'')

elseif command == 'barelement' then
    windower.chat.input('/ma "'..data.elements.BarElement_of[state.ElementalMode.value]..'" <me>')
    return

    if not buffactive[data.elements.BarElement_of[state.ElementalMode.value]] and (state.ElementalMode.value ~= 'Light' or state.ElementalMode.value ~= 'Dark') then
        windower.chat.input('/ma "'..data.elements.BarElement_of[state.ElementalMode.value]..'" <me>')
        tickdelay = os.clock() + 1.1
        return true
    else
        return false
    end
-----work
    if (state.ElementalMode.value ~= 'Light' or state.ElementalMode.value ~= 'Dark') and not buffactive[data.elements.BarElement_of[state.ElementalMode.value]] and  spell_recasts[66] < spell_latency then
        windower.chat.input('/ma "'..data.elements.Bar2Element_of[state.ElementalMode.value]..'" <me>')
        tickdelay = os.clock() + 1.1
    end
    
    data.elements.BarElement_of = {['Light']='Barfire', ['Dark']='Barblizzard',['Fire']='Barfire',['Earth']='Barstone',['Water']='Barwater',['Wind']='Baraero',['Ice']='Barblizzard',['Lightning']='Barthunder'}

    data.elements.Bar2Element_of = {['Light']='Barfira', ['Dark']='Barblizzara',['Fire']='Barfira',['Earth']='Barstonra',['Water']='Barwatera',['Wind']='Baraera',['Ice']='Barblizzara',['Lightning']='Barthundra',}

----work    
    
local barspell = data.elements.Bar2Element_of[state.ElementalMode.value]

if not buffactive[data.elements.BarElement_of[state.ElementalMode.value]] and (state.ElementalMode.value ~= 'Light' or state.ElementalMode.value ~= 'Dark') then
    windower.chat.input('/ma "'..barspell..'" <me>')
    tickdelay = os.clock() + 1.1
    return true
else
    return false
end

data.elements.BarElement_of = {['Light']='Barfire', ['Dark']='Barblizzard',['Fire']='Barfire',['Earth']='Barstone',['Water']='Barwater',['Wind']='Baraero',['Ice']='Barblizzard',['Lightning']='Barthunder'}

data.elements.Bar2Element_of = {['Light']='Barfira', ['Dark']='Barblizzara',['Fire']='Barfira',['Earth']='Barstonra',['Water']='Barwatera',['Wind']='Baraera',['Ice']='Barblizzara',['Lightning']='Barthundra',}

data.boostspell = {['Boost-AGI']='BoostStat',['Boost-CHR']='BoostStat',['Boost-DEX']='BoostStat',['Boost-INT']='BoostStat',['Boost-MND']='BoostStat',['STR Boost']='Boost-STR',['Boost-VIT']='BoostStat',
	['Gain-AGI']='BoostStat',['Gain-CHR']='BoostStat',['Gain-DEX']='BoostStat',['Gain-INT']='BoostStat',['Gain-MND']='BoostStat',['Gain-STR']='BoostStat',['Gain-VIT']='BoostStat',}

data.elements.barstatus = {['Baramnesia']='Baramnesia',['Baramnesra']='BarStatus',['Barvirus']='BarStatus',['Barvira']='BarStatus',['Barparalyze']='BarStatus',['Barparalyzra']='BarStatus',
['Barsilence']='BarStatus',['Barsilencera']='BarStatus',['Barpetrify']='BarStatus',['Barpetra']='BarStatus',['Barpoison']='BarStatus',['Barpoisonra']='BarStatus',
['Barblind']='BarStatus',['Barblindra']='BarStatus',['Barsleep']='BarStatus',['Barsleepra']='BarStatus',}
----



start_time = os.time()
local debuff_data = 
{
	[23]  = { name = 'Dia', duration = 60, overwrites = { } },
	[24]  = { name = 'Dia II', duration = 120, overwrites = { 23, 33, 230 } },
	[25]  = { name = 'Dia III', duration = 90, overwrites = { 23, 24, 230, 231, 33 } },
	[33]  = { name = 'Diaga', duration = 60, overwrites = { } },
	[56]  = { name = 'Slow', duration = 120, overwrites = { } },
	[58]  = { name = 'Paralyze', duration = 120, overwrites = { } },
	[59]  = { name = 'Silence', duration = 120, overwrites = { } },
	[79]  = { name = 'Slow II', duration = 120, overwrites = { 56 } },
	[80]  = { name = 'Paralyze II', duration = 120, overwrites = { 58 } },
	[98]  = { name = 'Repose', duration = 90, overwrites = { 253 } },
	[220] = { name = 'Poison', duration = 90, overwrites = { } },
	[221] = { name = 'Poison II', duration = 120, overwrites = { 220, 225 } },
	[225] = { name = 'Poisonga', duration = 90, overwrites = { } },
	[230] = { name = 'Bio', duration = 60, overwrites = { 23, 33 } },
	[231] = { name = 'Bio II', duration = 120, overwrites = { 23, 24, 33 ,230 } },
	[232] = { name = 'Bio III', duration = 30, overwrites = { 23, 24, 33, 230, 231 } },
	[235] = { name = 'Burn', duration = 60, overwrites = { 236 } },	 --
	[236] = { name = 'Frost', duration = 60, overwrites = { 237 } }, --
	[237] = { name = 'Choke', duration = 60, overwrites = { 238 } }, -- These 6 spells I'm unsure of duration.  
	[238] = { name = 'Rasp', duration = 60, overwrites = { 239 } },	 -- They will be 60s until I confirm.
	[239] = { name = 'Shock', duration = 60, overwrites = { 240 } }, --
	[240] = { name = 'Drown', duration = 60, overwrites = { 235 } }, --
	[253] = { name = 'Sleep', duration = 60, overwrites = { } },
	[254] = { name = 'Blind', duration = 180, overwrites = { } },
	[255] = { name = 'Break', duration = 30, overwrites = { } },
	[259] = { name = 'Sleep II', duration = 120, overwrites = { 253, 273, 363, 576, 584, 598, 678 } },
	[273] = { name = 'Sleepga', duration = 90, overwrites = { } },
	[274] = { name = 'Sleepga II', duration = 120, overwrites = { 253, 273, 363, 576, 584, 598, 678 } },
	[276] = { name = 'Blind II', duration = 180, overwrites = { 254 } },
	[278] = { name = 'Geohelix', duration = 274, overwrites = { } },	    --
	[279] = { name = 'Hydrohelix', duration = 274, overwrites = { } },	--
	[280] = { name = 'Anemohelix', duration = 274, overwrites = { } },	--
	[281] = { name = 'Pyrohelix', duration = 274, overwrites = { } },	    -- Helix duration varies based on Job Points, Dark Arts, and Cape used.
	[282] = { name = 'Cryohelix', duration = 274, overwrites = { } },	    -- This is my duration under Dark Arts, Cape, and no Tabula Rasa.
	[283] = { name = 'Ionohelix', duration = 274, overwrites = { } },	    --
	[284] = { name = 'Noctohelix', duration = 274, overwrites = { } },	--
	[285] = { name = 'Luminohelix', duration = 274, overwrites = { } },   --
	[286] = { name = 'Addle', duration = 120, overwrites = { } },
	[319] = { name = 'Aisha: Ichi', duration = 120, overwrites = { } }, -- Don't know debuff duration
	[341] = { name = 'Jubaku: Ichi', duration = 90, overwrites = { } },
	[344] = { name = 'Hojo: Ichi', duration = 90, overwrites = { } },
	[345] = { name = 'Hojo: Ni', duration = 90, overwrites = { 344 } },
	[347] = { name = 'Kurayami: Ichi', duration = 90, overwrites = { } },
	[348] = { name = 'Kurayami: Ni', duration = 90, overwrites = { 347 } },
	[363] = { name = 'Sleepga', duration = 90, overwrites = { } },
	[364] = { name = 'Sleepga II', duration = 120, overwrites = { 253, 273, 363, 576, 584, 598, 678 } },
--	[156] = { name = 'Feint', duration = 30, overwrites = {} },
	[372] = { name = 'Gambit', duration = 92, overwrites = {} },
	[375] = { name = 'Rayke', duration = 47, overwrites = {} },
	[365] = { name = 'Breakga', duration = 30, overwrites = { } },
	[508] = { name = 'Yurin: Ichi', duration = 90, overwrites = { } },
--  [561] = { name = 'Frightful Roar', duration = 180, overwrites = { } },
    [572] = { name = 'Sound Blast', duration = 180, overwrites = { } },
    [576] = { name = 'Yawn', duration = 90, overwrites = { } },
	[584] = { name = 'Sheep Song', duration = 60, overwrites = { } },
    [598] = { name = 'Soporific', duration = 90, overwrites = { } },
--  [659] = { name = 'Demoralizing Roar', duration = 30, overwrites = { } },
--  [660] = { name = 'Cimicine Discharge', duration = 90, overwrites = { } },
    [678] = { name = 'Dream Flower', duration = 90, overwrites = { } },
	[703] = { name = 'Embalming Earth', duration = 180, overwrites = { } },
	[705] = { name = 'Foul Waters', duration = 180, overwrites = { 235, 719 } },
    [716] = { name = 'Nectarous Deluge', duration = 30, overwrites = { } },
    [719] = { name = 'Searing Tempest', duration = 60, overwrites = { } },
    [722] = { name = 'Entomb', duration = 60, overwrites = { } },
    [723] = { name = 'Saurian Slide', duration = 60, overwrites = { } },
--  [724] = { name = 'Palling Salvo', duration = 90, overwrites = { 23, 33, 230 } },
    [726] = { name = 'Scouring Spate', duration = 180, overwrites = { } },
    [727] = { name = 'Silent Storm', duration = 300, overwrites = { } },
    [728] = { name = 'Tenebral Crush', duration = 90, overwrites = { } },
    [740] = { name = 'Tourbillion', duration = 60, overwrites = { } },
    [752] = { name = 'Cesspool', duration = 60, overwrites = { } },
    [753] = { name = 'Tearing Gust', duration = 60, overwrites = { } },
	[841] = { name = 'Distract', duration = 120, overwrites = { } },
	[842] = { name = 'Distract II', duration = 120, overwrites = { 841 } },
	[843] = { name = 'Frazzle', duration = 120, overwrites = { } },
	[844] = { name = 'Frazzle II', duration = 120, overwrites = { 843 } },
 	[882] = { name = 'Distract III', duration = 120, overwrites = { 841, 842 } },
 	[883] = { name = 'Frazzle III', duration = 120, overwrites = { 843, 844 } },
	[884] = { name = 'Addle II', duration = 120, overwrites = { 286 } },
	[885] = { name = 'Geohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },		--
	[886] = { name = 'Hydrohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },	--
	[887] = { name = 'Anemohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },	--
	[888] = { name = 'Pyrohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },	 	-- Helix duration varies based on Job Points, Dark Arts, and Cape used.
	[889] = { name = 'Cryohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },		-- This is my duration under Dark Arts, Cape, and no Tabula Rasa.
	[890] = { name = 'Ionohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } },	 	--
	[891] = { name = 'Noctohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } }, 	--
	[892] = { name = 'Luminohelix II', duration = 274, overwrites = { 278, 279, 280, 281, 282, 283, 284, 285 } } 	--
--  [502] = { name = 'Kaustra', duration = 0, overwrites = { } },
--  [000] = { name = 'Spooky Holder', duration = 0, overwrites = { } },
}, { 'name', 'duration', 'overwrites' };
local tracked_mobs= 
{


    if spell.skill == 'Enfeebling Magic' then
        if spell.type == "WhiteMagic" and (buffactive["Light Arts"] or buffactive["Addendum: White"]) then
            equip(sets.LightArts)
        elseif spell.type == "BlackMagic" and (buffactive["Dark Arts"] or buffactive["Addendum: Black"]) then
            equip(sets.DarkArts)
        end

        buffactive[spellMap.BarElement]

        if state.AutoBaraMode.Value == true then
            if not buffactive[data.elements.barstatus] then
				
		    windower.chat.input('gs c barstatus')
		    -- windower.chat.input('gs c boostspell')
		    end
	    end


        local barspell = data.elements.BarElement_of[data.elements.strong_to[state.ElementalMode.value]]

        if not buffactive[barspell] and (state.ElementalMode.value ~= 'Light' or state.ElementalMode.value ~= 'Dark') then
            windower.chat.input('/ma "'..barspell..'" <me>')
            add_tick_delay(1.1)
            return true
        else
            return false
        end
        local barspell = data.elements.Bar2Element_of[state.ElementalMode.value]

		if not buffactive[data.elements.BarElement_of[state.ElementalMode.value]] and (state.ElementalMode.value ~= 'Light' or state.ElementalMode.value ~= 'Dark') then
			windower.chat.input('/ma "'..barspell..'" <me>')
			tickdelay = os.clock() + 1.1
			return true
		else
			return false
		end


        local bar_status_spells = {
            -- Fire
            ["Baramnesia"] = { spell_name = "Baramnesra", status = "Amnesia", element = "Fire" },
            ["Barvirus"] = { spell_name = "Barvira", status = "Plague", element = "Fire" },
        
            -- Ice
            ["Barparalyze"] = { spell_name = "Barparalyzra", status = "Paralysis", element = "Ice" },
        
            -- Wind
            ["Barsilence"] = { spell_name = "Barsilencera", status = "Silence", element = "Wind" },
        
            -- Earth
            ["Barpetrify"] = { spell_name = "Barpetra", status = "Petrification", element = "Earth" },
        
            -- Water
            ["Barpoison"] = { spell_name = "Barpoisonra", status = "Poison", element = "Water" },
        
            -- Dark
            ["Barblind"] = { spell_name = "Barblindra", status = "Blind", element = "Dark" },
            ["Barsleep"] = { spell_name = "Barsleepra", status = "Sleep", element = "Dark" },
        }
        
        function job_precast(spell)
            for buff_name, spell_info in pairs(bar_status_spells) do
                if buffactive[buff_name] and spell.name == spell_info.spell_name then
                    cancel_spell()
                    return
                end
            end
        end

            -- Fire
    ["Baramnesia"] = { spell_name = "Baramnesra", status = "Amnesia", element = "Fire" },
    ["Barvirus"] = { spell_name = "Barvira", status = "Plague", element = "Fire" },

    -- Ice
    ["Barparalyze"] = { spell_name = "Barparalyzra", status = "Paralysis", element = "Ice" },

    -- Wind
    ["Barsilence"] = { spell_name = "Barsilencera", status = "Silence", element = "Wind" },

    -- Earth
    ["Barpetrify"] = { spell_name = "Barpetra", status = "Petrification", element = "Earth" },

    -- Water
    ["Barpoison"] = { spell_name = "Barpoisonra", status = "Poison", element = "Water" },

    -- Dark
    ["Barblind"] = { spell_name = "Barblindra", status = "Blind", element = "Dark" },
    ["Barsleep"] = { spell_name = "Barsleepra", status = "Sleep", element = "Dark" },
}
	
if spell_info[spell.name] and buffactive[spell_info[spell.name]] then
    cancel_spell()
end

local bar_status_spells = {
    ["Baramnesia"] = "Baramnesra",
}
if state.AutoBaraMode.value and state.AutoBuffMode.value  then

    windower.chat.input('gs c barstatus')
       
    -- windower.chat.input('gs c boostspell')
    

end


state.AutoBarStatus           = M{['description'] = 'Auto BarStatus','Barparalyze','Barsilence','etc'}
state.AutoBoostStatus           = M{['description'] = 'Auto BoostStat','Boost-STR','Boost-DEX','etc'}

if state.AutoBoostStat.value ~= 'Off' then
    local buff_name = string.sub(state.AutoBoostStat.value, -3).." Boost"
  
    if not buffactive[buff_name] then
      windower.chat.input("/ma "..state.AutoBoostStat.value.." <me>")
    end
end


print( if spell.skill == 'Elemental Magic' then
    local ele = tostring(spell.element):append('ga')
    --local ele2 = string.sub(ele,1,-2)
    if table.find(degrade_array[ele],spell.name) then
        spell_index = table.find(degrade_array[ele],spell.name)
        if spell_index > 1 then
            newSpell = degrade_array[ele][spell_index - 1]
            add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
            send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
            eventArgs.cancel = true
        end
    else 
        spell_index = table.find(degrade_array[spell.element],spell.name)
        if spell_index > 1 then
            newSpell = degrade_array[spell.element][spell_index - 1]
            add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
            send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
            eventArgs.cancel = true
        end
    end)

    if (player.in_combat or being_attacked) and (spellMap == 'Cure' or spell.skill == 'Enhancing Magic') and spell.interrupted then
		state.CastingMode:set('SIRD')
		--send_command('gs c set state.CastingMode.value SIRD')
		send_command('gs c update')
		tickdelay = os.clock() + 1.1
	elseif not data.areas.cities:contains(world.area) and not (player.in_combat or being_attacked) then
		state.CastingMode:set('Duration')
		send_command('gs c update')
		tickdelay = os.clock() + 1.1
    end

    (spell.type:endswith('Magic') or spell.type == "Ninjutsu")

    spellMap == 'ElementalNinjutsu'

    function job_filter_aftercast(spell, spellMap, eventArgs)

        if (player.in_combat or being_attacked) and (spellMap == 'Cure' or spell.skill == 'Enhancing Magic') and spell.interrupted then
            state.CastingMode:set('SIRD')
            --send_command('gs c set state.CastingMode.value SIRD')
            send_command('gs c update')
            tickdelay = os.clock() + 1.1
        elseif not data.areas.cities:contains(world.area) and not (player.in_combat or being_attacked) then
            state.CastingMode:set('Duration')
            send_command('gs c update')
            tickdelay = os.clock() + 1.1
        end
    end


    function get_domain_set(main_job)
        local job_type = domain_job[main_job]
        return domain_set[job_type]
    end

    but to use it you'd need to use function job_auto_change_target in your script to modify eventArgs
        [4:46 PM]
        eventArgs.SelectNPCTargets = true


        function job_auto_change_target(spell, action, spellMap, eventArgs)
            eventArgs.SelectNPCTargets = true
        end

        Here's a refactored version of the `auto_change_target` function with some improvements for readability and maintainability:

            ```
            function auto_change_target(spell, spellMap)
                -- Don't adjust targeting for explicitly named targets or specific targets
                if not spell.target.raw:startswith('<') or 
                   spell.target.raw == '<lastst>' or 
                   spell.target.raw == '<me>' then
                    return
                end
            
                local eventArgs = {
                    handled = false,
                    PCTargetMode = state.PCTargetMode.value,
                    SelectNPCTargets = state.SelectNPCTargets.value
                }
            
                -- Allow job-specific handling
                if job_auto_change_target then
                    job_auto_change_target(spell, action, spellMap, eventArgs)
                end
            
                if eventArgs.handled then
                    return
                end
            
                local pcTargetMode = eventArgs.PCTargetMode
                local selectNPCTargets = eventArgs.SelectNPCTargets
                local validPlayers = S{'Self', 'Player', 'Party', 'Ally', 'NPC'}
                local intersection = spell.targets * validPlayers
                local canUseOnPlayer = not intersection:empty()
                local newTarget
            
                -- Determine new target based on spell type and settings
                if canUseOnPlayer and pcTargetMode ~= 'default' and spell.target.raw == '<t>' then
                    if pcTargetMode == 'stal' then
                        newTarget = spell.targets.Ally and '<stal>' or '<stpt>'
                    elseif pcTargetMode == 'stpt' then
                        newTarget = (spell.targets.Ally or spell.targets.Party) and '<stpt>'
                    elseif pcTargetMode == 'stpc' then
                        newTarget = (spell.targets.Player or spell.targets.Party or 
                                     spell.targets.Ally or spell.targets.NPC) and '<stpc>'
                    end
                elseif spell.targets and spell.targets.Enemy and selectNPCTargets then
                    newTarget = '<stnpc>'
                end
            
                -- Change target if necessary
                if newTarget and newTarget ~= spell.target.raw then
                    change_target(newTarget)
                end
            end
            ```
            
            Changes
            1. *Simplified conditions*: Combined conditions for explicitly named targets and specific targets.
            2. *Improved readability*: Reformatted code for better readability.
            3. *Consistent logic*: Ensured consistent logic for determining new targets.
            
            Windower Integration
            To use this function with Windower, ensure you have the necessary setup:
            
            1. *GearSwap configuration*: Configure GearSwap to use this function.
            2. *Job-specific logic*: Implement job-specific logic in the `job_auto_change_target` function.
            
            With these changes, the function should work smoothly with Windower.

--
                default_pretarget(spell, spellMap)
                
                
                inside job_pretarget


                using change_target won't do that. (which is what auto_change_target does).
                    You'd have to cancel the action and send a new one with the new target to get the blue arrow (edited)
                    [6:30 PM]
                    Right @Byrth ?


                    if --[[whatever condition you want but for testing I'll do]] spell.english == 'Savage Blade' and spell.target.raw == '<t>' then
    eventArgs.cancel = true
    send_command('%s "%s" %s':format(spell.prefix, spell.name, '<stnpc>'))
    return
end


if id == 0x028 then
    local action = packets.parse('incoming', original)
    local actor = windower.ffxi.get_mob_by_id(action['Actor'])
    if not actor or not actor.in_party or not actor.in_alliance then
        return
    end

    --Absorb-TP only
    if action['Category'] == 4 and action['Param'] == 275 then
        local data = {}
        data.name = actor.name
        data.time = os.time()
        
        if action['Target 1 Action 1 Message'] == 454 then
            data.amount = action['Target 1 Action 1 Param']
        else
            data.amount = resisted --Resist
        end
        
        local target = action['Target 1 ID']
        if not absorbs[target] then
            absorbs[target] = L{}
        end
        
        --Replace previous
        for i = 1, absorbs[target]:length() do
            if absorbs[target][i].name == data.name then
                absorbs[target]:remove(i)
                break
            end
        end
        
        absorbs[target]:append(data)
        last_absorb = data.time
    end


    box:append("Absorb-TP Watch - " .. last_target.name)
    for data in absorbs[last_target.id]:it() do
        box:appendline(box_line(data.name, data.amount, now - data.time))
    end
    box:show()


    Code

sets.raise = {}

and
Code

function job_post_midcast(spell, action, spellMap, eventArgs)
	RaiseSpells = S{'Raise','Raise II','Raise III','Arise','Reraise','Reraise II','Reraise III','Reraise IV'}
	if RaiseSpells:contains(spell.english) then
		equip(sets.raise)
	end
end



rdm macros buff all pt

/ma "haste II" <p0> <wait8>
/ma "haste II" <p1> <wait8>
/ma "haste II" <p2> <wait8>
/ma "haste II" <p3> <wait8>
/ma "haste II" <p4> <wait8>
/ma "haste II" <p5> <wait8>




require('pack')
require('lists')
require('logger')
require('sets')

files = require('files')
extdata = require('extdata')
packets = require('packets')



----------

code auto switch dt idle


function job_customize_idle_set(idleSet)

    if (player.in_combat or being_attacked) and (state.IdleMode.current:contains('Normal')) then
            idleSet = set_combine(idleSet, sets.idle.PDT)
		
    end
    return idleSet
end

---

warp ring not change

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

    -- Warp ring rule, for any buff being lost
    if S{'Warp', 'Vocation', 'Capacity'}:contains(player.equipment.ring2) then
        if not buffactive['Dedication'] then
            disable('ring2')
        end
    else
        enable('ring2')
    end
end

----------------

    -- If HP drops under 45% then equip Re-raise head/body
    if player.main_job == 'BST' or player.main_job == 'DRG' or player.main_job == 'DRK'
            or player.main_job == 'PLD' or player.main_job == 'SAM' or player.main_job == 'WAR' then
        if new < 45 then
            equip(sets.misc.Twilight)
        end
    end

    CorsairRoll -> PhantomRoll
    CorsairShot -> QuickDraw
    Scholar -> Stratagem
    Monster -> Ready

    print(spell.english)


    --- Added ranged attack to DNC

    function job_midcast(spell, action, spellMap, eventArgs)



        --Probably overkill but better safe than sorry.
    
    
        if spell.action_type == 'Ranged Attack' then
    
    
                disable('ammo')
    
    
                add_to_chat(123,"Locking Ammo slot for RA!")
    
    
                return
    
    
            end
    
    
    end		
    

    
    
        if spell.action_type == 'Ranged Attack' then
    
    
            enable('ammo')
    
    
            add_to_chat(123,"Re-enabling Ammo slot after RA!")
    
    
            return
    
    
        end		
    
    end



    if spell.name == "Holy Water" then
        equip(sets.precast.Item['Holy Water'])
    end

    attack = player.attack

    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == 'SubtleBlow' then
            equip(sets.precast.WS[spell.name].PDL.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
        else
            equip(sets.precast.WS[spell.name])
        end
    end


elseif state.WeaponskillMode.value == 'SubtleBlow' and attack < attack2 then
        equip(sets.precast.WS.SubtleBlow)


    
	attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)
	if spell.type == 'WeaponSkill' then
		if attack > attack2 then
			equip(sets.precast.WS[spell.name].PDL)
		elseif state.WeaponskillMode.value == 'SubtleBlow' then
			equip(sets.precast.WS[spell.name].PDL.SubtleBlow)
		elseif state.WeaponskillMode.value == 'Proc' then
			equip(sets.precast.WS[spell.name].Proc)
		else
			equip(sets.precast.WS[spell.name])
		end
	end

    attack2 = 5000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value	

    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == 'SubtleBlow' and attack > attack2 then
            equip(sets.precast.WS.SubtleBlow)
		elseif state.WeaponskillMode.value == 'SubtleBlow' and attack < attack2 then
			equip(sets.precast.WS.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
        else
            equip(sets.precast.WS[spell.name])
        end
    end

    if state.WeaponskillMode.value == 'SubtleBlow' and attack > attack2 then
        equip(sets.precast.WS[spell.name].PDL.SubtleBlow)


        
function job_post_precast(spell)

	attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)

    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == 'SubtleBlow' and (attack > attack2 or attack < attack2) then
            equip(sets.precast.WS.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
        else
            equip(sets.precast.WS[spell.name])
        end
    end
	if spell.type == 'WeaponSkill' and player.main_job == 'WAR' then
		if buffactive['Mighty Strikes'] then
			equip(sets.WSMighty)
		end
	end
end


if spell.type == 'WeaponSkill' then
    if state.WeaponskillMode.value == 'SubtleBlow' and attack < attack2 then
        equip(sets.precast.WS.SubtleBlow)
    elseif state.WeaponskillMode.value == 'SubtleBlow' and attack > attack2 then
        equip(sets.precast.WS[spell.name].PDL.SubtleBlow)
    elseif state.WeaponskillMode.value == 'Proc' then
        equip(sets.precast.WS[spell.name].Proc)
    elseif attack > attack2 then
        equip(sets.precast.WS[spell.name].PDL)
    else
        equip(sets.precast.WS[spell.name])
    end
end

if spell.type == 'WeaponSkill' then
    if state.WeaponskillMode.value == 'SubtleBlow' and attack < attack2 then
        equip(sets.precast.WS.SubtleBlow)
    elseif state.WeaponskillMode.value == 'SubtleBlow' and not data.weaponskills.elemental:contains(spell.name) and attack > attack2 then
        equip(sets.precast.WS[spell.english].PDL.SubtleBlow)
    elseif state.WeaponskillMode.value == 'Proc' then
        equip(sets.precast.WS[spell.name].Proc)
    elseif attack > attack2 then
        equip(sets.precast.WS[spell.name].PDL)
    else
        equip(sets.precast.WS[spell.name])
    end
end


elseif not data.areas.cities:contains(world.area) and not

not data.weaponskills.elemental:contains(spell.name)




-- used it in global for all job
    attack2 = 5000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value	


function job_post_precast(spell)
   if spell.type == 'WeaponSkill' and state.WeaponskillMode.value == 'SubtleBlow' then
	    equip(sets.precast.WS.SubtleBlow)
    end
	attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)

    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == 'SubtleBlow' and (attack > attack2 or attack < attack2) then
            equip(sets.precast.WS.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
        else
            equip(sets.precast.WS[spell.name])
        end
    end


end


---pdl

now with this code, is automatic if the attack up 5,000 or any limit or value you specifyadd and if attack low that 5000 its auto return normal weaponskillmode

--its auto change weaponskillmode for PDL if attack up 5k and return to normal if low 5k
-- used it in global for all job

	
attack2 = 5000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value



	
function job_post_precast(spell)
   if spell.type == 'WeaponSkill' and state.WeaponskillMode.value == 'SubtleBlow' then
        equip(sets.precast.WS.SubtleBlow)
    end
    attack = player.attack -- auto equip to PDL ws set - code add by kastra,modi.(Aragan@Asura)
 
    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode.value == 'SubtleBlow' and (attack > attack2 or attack < attack2) then
            equip(sets.precast.WS.SubtleBlow)
        elseif state.WeaponskillMode.value == 'Proc' then
            equip(sets.precast.WS[spell.name].Proc)
        elseif attack > attack2 then
            equip(sets.precast.WS[spell.name].PDL)
        else
            equip(sets.precast.WS[spell.name])
        end
    end
 
 
end


u need make add in all weaponskill normal and PDL like this code savage blade

	
sets.precast.WS['Savage Blade']
 
 
sets.precast.WS['Savage Blade'].PDL 



if u want used for sepcial job u can add in job.lua gear like any number need and work alone not with value global


	
function job_setup()
    attack2 = 4000 



if u want add subtle below mode in weaponskill add this code combine all weaponskill and equip togather in job.lua gear
Code

	
sets.precast.WS.SubtleBlow =  {
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
}

--add 1 ws for autows in 2000tp ? and other all ws 1k tp 

autows_list = {['Tizbron']={'Expiacion',2000},['Tizalmace']={'Expiacion',2000},
['Almace']={'Chant Du Cygne',1000}}



----- AUTOMB



-- Auto toggle Magic burst set.
MB_Window = 0
time_start = 0
AEBurst = false

if player and player.index and windower.ffxi.get_mob_by_index(player.index) then

    windower.raw_register_event('action', function(act)
        for _, target in pairs(act.targets) do
            local battle_target = windower.ffxi.get_mob_by_target("t")
            if battle_target ~= nil and target.id == battle_target.id then
                for _, action in pairs(target.actions) do
                    if action.add_effect_message > 287 and action.add_effect_message < 302 then
                        --last_skillchain = skillchains[action.add_effect_message]
                        MB_Window = 11
                        MB_Time = os.time()
                    end
                end
            end
        end
    end)

    windower.raw_register_event('prerender', function()
        --Items we want to check every second
        if os.time() > time_start then
            time_start = os.time()
            if MB_Window > 0 then
                MB_Window = 11 - (os.time() - MB_Time)
                if state.AutoEquipBurst.value then
                    AEBurst = true
                end
            else
                AEBurst = false
            end
        end
    end)
end

Author Drakefs and modi Aragan 

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and (state.MagicBurst.value or AEBurst) then
        if state.CastingMode.value == 'ConserveMP' then
            equip(sets.magicburst.ConserveMP)
        elseif state.CastingMode.value == 'Spaekona' then
                equip(sets.magicburst.Spaekona)
        elseif state.CastingMode.value == 'SIRD' then
                equip(sets.magicburst.SIRD)
        else
            equip(sets.magicburst)
        end

    end

---priority code
    sets.mws = {
        main={name="Crocea Mors", priority=2}, 
        sub={name="Daybreak", priority=1}
        }
sets.macc = {
        main={name="Daybreak", priority=1}, 
        sub={name="Ammurapi Shield", priority=2}
        }


        -- Function to allow for automatic adjustment of the spell target type based on preferences.  
function auto_change_target(spell, spellMap)  
    -- Don't adjust targetting for explicitly named targets  
    if not spell.target.raw:startswith('<') then  
        --return  
    end  
  
    -- Do not modify target for spells where we get <lastst> or <me>.  
    if spell.target.raw == ('<lastst>') or spell.target.raw == ('<me>') then  
        --return  
    end  
      
    -- init a new eventArgs with current values  
    local eventArgs = {handled = false, PCTargetMode = state.PCTargetMode.value, SelectNPCTargets = state.SelectNPCTargets.value}  
  
    -- Allow the job to do custom handling, or override the default values.  
    -- They can completely handle it, or set one of the secondary eventArgs vars to selectively  
    -- override the default state vars.  
    if job_auto_change_target then  
        job_auto_change_target(spell, action, spellMap, eventArgs)  
    end  
      
    -- If the job handled it, we're done.  
    if eventArgs.handled then  
        return  
    end  
      
    local pcTargetMode = eventArgs.PCTargetMode  
    local selectNPCTargets = eventArgs.SelectNPCTargets  
  
      
    local validPlayers = S{'Self', 'Player', 'Party', 'Ally', 'NPC'}  
  
    local intersection = spell.targets * validPlayers  
    local canUseOnPlayer = not intersection:empty()  
      
    local newTarget  
      
    -- For spells that we can cast on players:  
    if canUseOnPlayer and pcTargetMode ~= 'default' then  
        -- Do not adjust targetting for player-targettable spells where the target was <t>  
        if spell.target.raw ~= ('<t>') then  
            if pcTargetMode == 'stal' then  
                -- Use <stal> if possible, otherwise fall back to <stpt>.  
                if spell.targets.Ally then  
                    newTarget = '<stal>'  
                elseif spell.targets.Party then  
                    newTarget = '<stpt>'  
                end  
            elseif pcTargetMode == 'stpt' then  
                -- Even ally-possible spells are limited to the current party.  
                if spell.targets.Ally or spell.targets.Party then  
                    newTarget = '<stpt>'  
                end  
            elseif pcTargetMode == 'stpc' then  
                -- If it's anything other than a self-only spell, can change to <stpc>.  
                if spell.targets.Player or spell.targets.Party or spell.targets.Ally or spell.targets.NPC then  
                    newTarget = '<stpc>'  
                end  
            end  
        end  
    -- For spells that can be used on enemies:  
    elseif spell.targets and spell.targets.Enemy and selectNPCTargets then  
        -- Note: this means macros should be written for <t>, and it will change to <stnpc>  
        -- if the flag is set.  It won't change <stnpc> back to <t>.  
        newTarget = '<stnpc>'  
    end  
      
    -- If a new target was selected and is different from the original, call the change function.  
    if newTarget and newTarget ~= spell.target.raw then  
        change_target(newTarget)  
    end  
end  
  
How fox this work and windower called can


Pdl with dia

texts = require('texts')

local hud = texts.new()
hud:pos(1200, 50)
hud:size(12)
hud:font('Arial')
hud:stroke_width(2)
hud:bg_alpha(128)
hud:visible(true)

windower.register_event('prerender', function()
    -- تحديث Player Stats
    if player and player.stats then
        local attack = player.stats.attack or 0
        local defense = player.stats.defense or 0
        local accuracy = player.stats.accuracy or 0
        local evasion = player.stats.evasion or 0

        -- تحقق من العدو الحالي
        local target = windower.ffxi.get_mob_by_target('t')
        local has_dia = false
        local has_def_down = false

        if target and target.buffs then
            for i, buff_id in ipairs(target.buffs) do
                if buff_id == 134 then -- Dia ID
                    has_dia = true
                elseif buff_id == 149 then -- Defense Down ID
                    has_def_down = true
                end
            end
        end

        -- تحديث HUD
        hud:text(string.format(
            'Attack : %d\nDefense: %d\nAccuracy: %d\nEvasion : %d\nDia: %s\nDefDown: %s',
            attack, defense, accuracy, evasion,
            has_dia and 'YES' or 'NO',
            has_def_down and 'YES' or 'NO'
        ))

        -- تحقق من الشرط لتغيير WeaponSkillMode
        if attack >= 3000 and (has_dia or has_def_down) then
            if state.WeaponskillMode.value ~= 'PDL' then
                state.WeaponskillMode:set('PDL')
                windower.add_to_chat(123, 'Auto WS Mode: PDL (Target Debuffed + ATK >= 3000)')
            end
        else
            if state.WeaponskillMode.value ~= 'Normal' then
                state.WeaponskillMode:set('Normal')
                windower.add_to_chat(123, 'Auto WS Mode: Normal')
            end
        end
    end
end)

function user_unload()
    hud:hide()
end


elseif player.main_job == 'NIN' and not state.Buff['SJ Restriction'] and (player.in_combat or being_attacked) and player.hpp > 75 then
    --windower.chat.input('//gs c set AutoShadowMode true')
    --send_command('input //gs c set AutoShadowMode true') --Turns addon on.
    state.AutoShadowMode:set('true')

    tickdelay = os.clock() + 1.1

	if state.NeverDieMode.value or state.AutoCureMode.value then 
		--[[if player.tp > 350 and player.max_hp - player.hp > 600 and abil_recasts[186] < latency then
			windower.send_command('input /ja Curing Waltz II <me>')
			]]
	    if player.sub_job == 'DNC' and not state.Buff['SJ Restriction'] and player.tp > 500 and player.max_hp - player.hp > 1000 and abil_recasts[187] < latency then
			windower.send_command('input /ja Curing Waltz III <me>')
			tickdelay = os.clock() + 1.1
		elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] and not buffactive.Defender and (player.in_combat or being_attacked) and player.hpp < 25 then
			windower.chat.input('/ja "Defender" <me>')
			tickdelay = os.clock() + 1.1
		elseif (player.sub_job == 'SCH' or player.sub_job == 'RDM' or player.sub_job == 'pld' or player.sub_job == 'WHM')
		    and not state.Buff['SJ Restriction'] and player.hpp < 25 and being_attacked and spell_recasts[4] < spell_latency then 
			windower.chat.input('/ma "Cure IV" <me>')
			tickdelay = os.clock() + 1.1
		elseif player.main_job == 'NIN' and (player.in_combat or being_attacked) and player.hpp > 75 then
			state.AutoShadowMode:set('true')
			send_command('gs c update')

			tickdelay = os.clock() + 1.1

		end
	end

end

--for non change warp ring if equip 
But for arbtirarily using any item, //gs c useitem slot Item Name
So, for example //gs c useitem head Reraise Hairpin +1


if player.main_job == 'SAM' and windower.ffxi.get_ability_recasts()[133] < latency then
    windower.chat.input('/ja "Third Eye" <me>')


    function check_cleanup()
        if state.AutoCleanupMode.value then
            if player.inventory['Bead Pouch'] then
                send_command('input /item "Bead Pouch" <me>')
                tickdelay = os.clock() + 2.4
                return true
            elseif player.inventory['Silt Pouch'] then
                send_command('input /item "Silt Pouch" <me>')
                tickdelay = os.clock() + 2.4
                return true
            end


        elseif player.inventory['Vile Elixir +1'] then
            send_command('input /item "Vile Elixir +1" <me>')
            tickdelay = os.clock() + 2.4
            return true
        elseif player.inventory['Vile Elixir'] then
            send_command('input /item "Vile Elixir" <me>')
            tickdelay = os.clock() + 2.4
            return true
        end

        windower.raw_register_event('prerender',function()
            if buffactive['Hasso'] then
                windower.send_command('@input /item "remedy" <me>')
                --add_to_chat(123, 'Hasso detected! Using Remedy...')
            end
        end)

        if buffactive['Hasso'] then
            windower.chat.input:schedule(3,'/item "remedy" <me>')
            add_to_chat(123, 'Hasso detected! Using Remedy...')
            tickdelay = os.clock() + 2.4
    
        end

        if state.AutoMedicineMode.value == true then
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
            elseif buff == "Magic Evasion Down" then
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
            elseif buff == "poison" then
                if gain then  
                    send_command('input /item "remedy" <me>')
                end
            end
            if not midaction() then
                job_update()
            end
        end
    
    end


elseif buffactive['poison'] then
    send_command('input /item "remedy" <me>')
    tickdelay = os.clock() + 2.4
    add_to_chat(123, 'poison detected! Using Remedy...')
elseif buffactive['Hasso'] then
    send_command('input /item "remedy" <me>')
    tickdelay = os.clock() + 2.4
    add_to_chat(123, 'Hasso detected! Using Remedy...')


    if gain then
        if buff == "Hasso" then
            send_command('input /item "remedy" <me>')
            tickdelay = os.clock() + 2.4
            add_to_chat(123, 'Hasso detected! Using Remedy...')
        elseif buff == "poison" then
            send_command('input /item "remedy" <me>')
            tickdelay = os.clock() + 2.4
            add_to_chat(123, 'poison detected! Using Remedy...')	
        end
    end

    ---

    local debuffs = S{'Sleep', 'Stun', 'Petrification'}
if debuffs:contains('Sleep') then
    windower.add_to_chat(123, 'Sleep is in the debuff list.')
end

local haste_buffs = S{'Haste', 'Haste II', 'March'}
local my_buffs = S{'Haste', 'Refresh'}

if haste_buffs:intersection(buffactive):length() > 0 then
    windower.add_to_chat(123, 'You have haste buff!')
end

if my_buffs:subset(buffactive) then
    windower.add_to_chat(123, 'You have both Haste and Refresh!')
end

if my_buffs:contains('Refresh') then
    windower.add_to_chat(123, 'Refresh is in your buff list.')
end

if my_buffs:equals(haste_buffs) then
    windower.add_to_chat(123, 'These two buff sets are the same.')
end

if my_buffs:empty() then
    windower.add_to_chat(123, 'Your buff list is empty!')
end

local haste_buffs = S{'Haste', 'March'}
if haste_buffs:intersection(buffactive):length() > 0 then
    windower.add_to_chat(123, 'At least one haste buff is active.')
end

local remedy_flag = false

windower.register_event('buff change', function(name, gain, buff_id)
    if name == 'Paralysis' then
        if gain and not remedy_flag then
            windower.send_command('input /item "Remedy" <me>')
            remedy_flag = true
        elseif not gain then
            remedy_flag = false -- Reset when debuff gone
        end
    end
end)


-- Mode للتحكم: يمكن تشغيله أو إيقافه داخل اللعبة
state.AutoRemedy = M(false, 'Auto Remedy')

local remedy_flag = false -- Flag يمنع التكرار في نفس Debuff الحالي

function buff_change(buff, gain)
    if state.AutoRemedy.value then
        if buff == 'Paralysis' then
            if gain and not remedy_flag then
                -- حصل Debuff جديد لأول مرة = استخدم Remedy
                windower.send_command('input /item "Remedy" <me>')
                remedy_flag = true
                add_to_chat(123, '🔔 AutoRemedy: استخدم Remedy ضد Paralysis.')
            elseif not gain then
                -- Debuff زال = استعد للسماح باستعمال Remedy مرة أخرى لو أصابك مرة ثانية
                remedy_flag = false
                add_to_chat(123, '✅ AutoRemedy: Paralysis زال - جاهز لاستخدام Remedy مرة أخرى لو حدث.')
            end
        end
    end
end
windower.register_event('gain buff', function(buff_id)
    print("Gained Buff ID: "..buff_id)
end)


---------------

--SubtleBlowMode  made by Author Aragan 
--auto switch gear for capped subtlebelow if buff Auspice active

state.SubtleBlowMode = M(false, 'SubtleBlow Mode') 

send_command('bind !6 gs c toggle SubtleBlowMode')

function job_customize_melee_set(meleeSet)

    if state.SubtleBlowMode.value then
        if buffactive['Auspice'] then
            meleeSet = set_combine(meleeSet, sets.passive.SubtleBlow)
        else
            meleeSet = set_combine(meleeSet, sets.passive.SubtleBlowII)
        end
    end
    return meleeSet
end

-------

-- Mode Settings
local target_mode = {
    enabled = true,        -- تفعيل / تعطيل النظام
    target_type = 't',     -- 't' = Target العادي | 'stnpc' = الـ NPC
}
--//targetmode on
--//targetmode off
--//targetmode t
--//targetmode stnpc
--//targetmode "Saage Blade"
-- أوامر الشات للتحكم
windower.register_event('addon command', function(cmd, arg)
    cmd = cmd and cmd:lower() or nil
    arg = arg and arg:lower() or nil

    if cmd == 'targetmode' then
        if arg == 'on' then
            target_mode.enabled = true
            windower.add_to_chat(123, 'Target Mode: ON')
        elseif arg == 'off' then
            target_mode.enabled = false
            windower.add_to_chat(123, 'Target Mode: OFF')
        elseif arg == 'stnpc' then
            target_mode.target_type = 'stnpc'
            windower.add_to_chat(123, 'Target Type: STNPC')
        elseif arg == 't' then
            target_mode.target_type = 't'
            windower.add_to_chat(123, 'Target Type: T')
        else
            windower.add_to_chat(123, 'Usage: //targetmode [on|off|stnpc|t]')
        end
    end
end)

-- عند تغيير الهدف
windower.register_event('target change', function(new_target_index)
    if target_mode.enabled then
        if target_mode.target_type == 'stnpc' then
            windower.send_command('input /lastws <stnpc>')
            windower.add_to_chat(200, 'Using last WS on STNPC.')
        elseif target_mode.target_type == 't' then
            windower.send_command('input /lastws <t>')
            windower.add_to_chat(200, 'Using last WS on T.')
        end
    else
        windower.add_to_chat(123, 'Target Mode is OFF.')
    end
end)

if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
	state.Weapons:options('DualGastra','DualArma','DualFoma','DualAnni','DualYoichi','DualFailNot','DualSavage','DualAeolian','DualKCSavage','DualKCTrueFlight','None')
else
	state.Weapons:options('Gastraphetes','Armageddon','Fomalhaut','Annihilator','Yoichinoyumi','FailNot','Naegling','Tauret','None')
end

state.AutoZergMode:reset()

autows="Judgment"
autowstp=1250



if spell.type == 'WeaponSkill' and not spell.interrupted then
    if spell.english == 'Armor Break' then
        windower.chat.input('/p '..str_using..' '..auto_translate('Armor Break').. ' -<t>-')
        windower.send_command('gs c autows tp 1000; gs c autows ' ..__autows)	
        update_melee_groups()
    end


    
	if command == 'nuke' or command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		if command == 'nuke' then
			local tiers = {'Holy II','Holy','Banish II','Banish'}
			for k in ipairs(tiers) do
				if spell_recasts[get_spell_table_by_name(tiers[k]).id] < spell_latency and actual_cost(get_spell_table_by_name(tiers[k])) < player.mp then
					windower.chat.input('/ma "'..tiers[k]..'" '..target..'')
					return
				end
			end
		else
			local tiers = {' II',''}
			for k in ipairs(tiers) do
				if spell_recasts[get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
					windower.chat.input('/ma "'..data.elements.nuke_of[state.ElementalMode.value]..''..tiers[k]..'" '..target..'')
					return
				end
			end
		end


    ---------

    state.AutoAbsorttpaspirSpam = M(false,'Auto Absort tp aspir Spam Mode')
    
    send_command('bind ^4 gs c toggle AutoAbsorttpaspirSpam')  

function job_tick()
	if job_status_change() then return true end

    if state.AutoAbsorttpaspirSpam.value and player.in_combat and player.target.type == "MONSTER" and not moving then
		if check_tp_mp_lower() then return true end
			tickdelay = os.clock() + 1.5
		return true
	end
	return false
end

function check_tp_mp_lower()
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if spell_recasts[275] < spell_latency and silent_can_use(275) then
		windower.chat.input('/ma "Absorb-TP" <t>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_recasts[247] < spell_latency and silent_can_use(247) then
		windower.chat.input('/ma "Aspir" <t>')
		tickdelay = os.clock() + 2
		return true
	else
		return false
	end
end

if state.NotifyBuffs.value and NotifyBuffs:contains(buff) and not (player.status =='Dead' or player.status == 'Engaged dead') then

    
function notify_buffs(buff, gain)
	if state.NotifyBuffs.value and NotifyBuffs:contains(buff) and player.status ~= 'Dead'then
		if gain then
			windower.chat.input('/p '..buff:ucfirst()..' on me!')
		else
			windower.chat.input('/p '..buff:ucfirst()..' is off now.')
		end
		tickdelay = os.clock() + 1
	end
end


    sets.rollerRing = {left_ring="Roller's Ring"}

    function job_customize_idle_set(idleSet)

        if buffactive['Tactician\'s Roll'] then 
            idleSet = set_combine(idleSet, sets.rollerRing)
        end
        return idleSet
    end

--     check_tp_mp_lower
-- job_status_change
-- job_tick
-- user_state_change
-- othertargetws
-- Utility

--array code

state.Auto = M(true, 'Auto Nuke')
state.Element = M{['description']='Element','Fire','Blizzard','Aero','Stone','Thunder','Water'}

no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
          "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

degrade_array = {
    ['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V'},
    ['Ice'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V'},
    ['Wind'] = {'Aero','Aero II','Aero III','Aero IV','Aero V'},
    ['Earth'] = {'Stone','Stone II','Stone III','Stone IV','Stone V'},
    ['Lightning'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V'},
    ['Water'] = {'Water', 'Water II','Water III', 'Water IV','Water V'},
    ['Aspirs'] = {'Aspir','Aspir II','Aspir III'},
    }

lockstyleset = 18


function job_precast(spell, action, spellMap, eventArgs)
    if spell.name:startswith('Aspir') then
        refine_various_spells(spell, action, spellMap, eventArgs)
    elseif state.Auto.value == true then
        if spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' and spellMap ~= 'GeoNuke' then
            refine_various_spells(spell, action, spellMap, eventArgs)
        end
    end
end
function refine_various_spells(spell, action, spellMap, eventArgs)

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if spell.skill == 'Elemental Magic' and spellMap ~= 'GeoElem' then
            spell_index = table.find(degrade_array[spell.element],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array[spell.element][spell_index - 1]
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        elseif spell.name:startswith('Aspir') then
            spell_index = table.find(degrade_array['Aspirs'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aspirs'][spell_index - 1]
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        end
    end
end
windower.chat.input('input /ma "Advancing March" <me>;wait 5;input /ma "Victory March" <me>')
tickdelay = os.clock() + 2
return true
elseif not buffactive.minuet then
windower.chat.input('/wait 5;input /ma "Valor Minuet V" <me>;input //gs c set ExtraSongsMode Dummy;wait 5;input /ma "Valor Minuet IV" <me>;input //gs c set ExtraSongsMode Cheer;wait 8;input /ma "Valor Minuet IV" <me>')
tickdelay = os.clock() + 2
return true

---singer 

elseif ta == '<me>' and settings.clarion and not JA_WS_lock and not buffs['Clarion Call'] and recasts[254] <= 0 then
    cast.JA('input /ja \"Clarion Call\" <me>')
elseif ta == '<me>' and settings.soul_voice and not JA_WS_lock and not buffs['Soul Voice'] and recasts[0] <= 0 then
    cast.JA('input /ja \"Soul Voice \" <me>')

    local buttons = {'active','actions','nitro', 'pianissimo','clarion','soul_voice','debuffing','party','p1','p2','p3','p4','p5'}


    if not settings.active then return str end
    str = str..colorize(3, '\n Nitro:[%s]':format(settings.nitro and 'On' or 'Off'))
    str = str..colorize(4, '\n Pianissimo:[%s]':format(settings.pianissimo and 'On' or 'Off'))
    str = str..colorize(5, '\n Clarion:[%s]':format(settings.clarion and 'On' or 'Off'))
    str = str..colorize(6, '\n Soul_Voice:[%s]':format(settings.soul_voice and 'On' or 'Off'))
    str = str..colorize(7, '\n Debuffing:[%s]':format(settings.debuffing and 'On' or 'Off'))
    str = str..colorize(8, '\n AoE: [%s]':format(settings.aoe.party and 'On' or 'Off'))

    if settings.aoe.party then
        for x = 1, 5 do
            local slot = 'p' .. x
            local member = party[slot]
            member = member and member.name or ''
            str = str..colorize(x + 8,'\n <%s> [%s] %s':format(slot, settings.aoe[slot] and 'On' or 'Off', member))
        end
    end

    short_commands = {
        -- ['n'] = 'nightingale',
        -- ['t'] = 'troubadour',
        ['n'] = 'nitro',
        ['p'] = 'pianissimo',
        ['c'] = 'clarion',
        ['s'] = 'soul_voice',
        ['play'] = 'playlist',
    }

    
function check_offensive_ja()

	if player.in_combat then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if state.AutoEffusionMode.value and player.status == 'Engaged' then	
			local rune_count = 0
			if state.RuneElement.value and buffactive[state.RuneElement.value] then
				rune_count = buffactive[state.RuneElement.value]
			end
			
			if abil_recasts[119] < latency and rune_count > 2 then
				windower.send_command('/ja "Rayke" <t>')
				tickdelay = os.clock() + 1.1
				return true
			elseif abil_recasts[116] < latency and rune_count > 2 then
				windower.send_command('/ja "Gambit" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		end
	end
	return false
end		


--- run rayke code 


function check_offensive_ja()
	--add_to_chat(123, '>> Checking Rayke logic...')

    if player.in_combat and player.status == 'Engaged' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        local rayke_cd = abil_recasts[375] or 999

        add_to_chat(123, 'Rayke Recast: '..rayke_cd)

        if state.AutoEffusionMode.value and rayke_cd < latency then
            local target = windower.ffxi.get_mob_by_target('t')
            if target then
                add_to_chat(123, 'Casting Rayke on '..target.name)
                windower.send_command('/ja "Rayke" <t>')
                tickdelay = os.clock() + 1.1
                return true
            else
                add_to_chat(123, 'No target found for Rayke.')
            end
        end
    end
	if player.in_combat then
		if state.AutoEffusionMode.value and player.status == 'Engaged' then	
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local rune_count = 0
            if state.RuneElement.value and buffactive[state.RuneElement.value] then
				rune_count = buffactive[state.RuneElement.value]
			end
			if abil_recasts[119] < latency and rune_count > 2 then
				windower.send_command('input /ja "Rayke" <t>')
				tickdelay = os.clock() + 1.1
				return true
			elseif abil_recasts[116] < latency and rune_count > 2 then
				windower.send_command('input/ja "Gambit" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		end
	end
	return false
end		
    
--- work 


function check_offensive_ja()
	--add_to_chat(123, '>> Checking Rayke/Gambit logic...')


        local abil_recasts = windower.ffxi.get_ability_recasts()
        local rayke_cd = abil_recasts[375] or 999
        local gambit_cd = abil_recasts[372] or 999


	if player.in_combat then
		if state.AutoEffusionMode.value and player.status == 'Engaged' then	
			local abil_recasts = windower.ffxi.get_ability_recasts()
			local rune_count = 0
            if state.RuneElement.value and buffactive[state.RuneElement.value] then
				rune_count = buffactive[state.RuneElement.value]
			end
			if abil_recasts[119] < latency and rune_count > 2 then
				windower.send_command('input /ja "Rayke" <t>')
				tickdelay = os.clock() + 1.1
				return true
			elseif abil_recasts[116] < latency and rune_count > 2 then
				windower.send_command('input/ja "Gambit" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		end
	end
	return false
end		

function check_offensive_ja()
	if player.in_combat then
		if state.AutoEffusionMode.value and player.status == 'Engaged' then	

			local abil_recasts = windower.ffxi.get_ability_recasts()
			local rayke_id = 119
			local gambit_id = 116
			local rayke_cd = abil_recasts[rayke_id] or 999
			local gambit_cd = abil_recasts[gambit_id] or 999
		
			local rune = state.RuneElement and state.RuneElement.value or nil
			local rune_count = (rune and buffactive[rune]) or 0
		
		
			if rune_count < 3 then
				return false
			end
		
			if rayke_cd == 0 then
				windower.send_command('input /ja "Rayke" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		
			if gambit_cd == 0 then
				windower.send_command('input /ja "Gambit" <t>')
				tickdelay = os.clock() + 1.1
				return true
			end
		
			return false
		end
	end

end



if not state.CraftingMode.value then
    if player.inventory['Goldsmith\'s Ring'] then send_command('put "Goldsmith\'s Ring" satchel') moveditem = true end
    if player.inventory['Goldsmith\'s Smock'] then send_command('put "Goldsmith\'s Smock" satchel')  moveditem = true end
    if player.inventory['Goldsmith\'s Belt'] then send_command('put "Goldsmith\'s Belt" satchel')  moveditem = true end
    if player.inventory['Goldsmith\'s Torque'] then send_command('put "Goldsmith\'s Torque" satchel') moveditem = true end
    if player.inventory['Shaded Specs.'] then send_command('put "Shaded Specs." satchel')  moveditem = true end

else 

    if player.satchel['Goldsmith\'s Ring'] then send_command('get "Goldsmith\'s Ring" satchel;wait 2;gs c update') end
    if player.satchel['Goldsmith\'s Smock'] then send_command('get "Goldsmith\'s Smock" satchel') end
    if player.satchel['Goldsmith\'s Belt'] then send_command('get "Goldsmith\'s Belt" satchel') end
    if player.satchel['Goldsmith\'s Torque'] then send_command('get "Goldsmith\'s Torque" satchel') end
    if player.satchel['Shaded Specs.'] then send_command('get "Shaded Specs." satchel') end
    

elseif state.AdjustTargets.value and not spell.targets.Enemy and spell.target.type == 'MONSTER' then
    cancel_spell()
    eventArgs.cancel = true
    if spell.targets.Ally then
        windower.chat.input('/ma "'..spell.name..'" <stal>')
    elseif spell.targets.Party or spell.type == 'BardSong' or spell.english:startswith('Indi') then
        windower.chat.input('/ma "'..spell.name..'" <stpt>')
    elseif spell.targets.Self then
        windower.chat.input('/ma "'..spell.name..'" <me>')
    end
    return true



    if in_combat == true and target and target ~= 0 then 							--Things to do when engaged: JA, WS, etc
        local angle = (math.atan2((target.y - self_vector.y), (target.x - self_vector.x))*180/math.pi)*-1
        windower.ffxi.turn((angle):radian())			--Face the mob
    if party_size == 1 then		--If soloing
        if party_member == 1 and recasts[5] and recasts[5] == 0 and windower.ffxi.get_mob_by_target('t').hpp >= 90  and math.sqrt(windower.ffxi.get_mob_by_target('t').distance) <= 13  and voke == 'on' then	--Voke
            useJA('Provoke', '<t>')
        end

        if runtomob == 'on' then
            if math.sqrt(windower.ffxi.get_mob_by_target('t').distance) <= 20 and math.sqrt(windower.ffxi.get_mob_by_target('t').distance) >= 4 and player.status == 1 then
                windower.ffxi.run(true)
            else
                windower.ffxi.run(false)
            end
        end





		if spellMap == 'Lullaby' then 
			send_command('input /p >> '.. auto_translate('Sleep')..'   aoe   '.. auto_translate(spell.name) ..' on >> '..spell.target.name..' <<')		
		end
		if string.find(spell.english,'Lullaby') then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
		elseif string.find(spell.english,'Lullaby II') then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 120 down spells/00220.png') --with maceto ja 4.40min
		end



        if state.AutoLoggerMode.value and not spell.interrupted then
            local msg = nil
    
            if spell.type == 'WeaponSkill' then
                msg = player.name .. ' used WS: ' .. auto_translate(spell.name) .. ' on ' .. spell.target.name
            elseif spell.type == 'Magic' then
                msg =   ' casted: ' .. auto_translate(spell.name) .. ' on ' .. spell.target.name
            elseif spell.type == 'JobAbility' then
                msg =  ' used JA: ' .. spell.name .. ' on ' .. spell.target.name
            elseif spell.type == 'PetCommand' then
                msg = player.name .. ' used Pet: ' .. spell.name .. ' on ' .. spell.target.name
            elseif spell.type == 'Item' then
                msg = player.name .. ' used Item: ' .. spell.name .. ' on ' .. spell.target.name
            end
    
            if msg then
                send_command('input /p  ' .. msg)
            end
        end

        function precast(spell)
            if state.AutoLoggerMode.value and not spell.interrupted then
                if spell.action_type == 'Magic' or spell.type == 'WeaponSkill' or spell.type == 'JobAbility' then
                    windower.chat.input('/p used: '..spell.name..' on -> '..(spell.target.name or '<t>'))
                end
            end
        end
        [11:40 PM]
        if state.AutoLoggerMode.value and not spell.interrupted then
            windower.chat.input('/p [' .. player.name .. '] ➤ ' .. spell.name .. ' → <t>')
        end
        [11:40 PM]
        if state.AutoLoggerMode.value and not spell.interrupted then
            windower.chat.input('/p [' .. player.name .. '] استخدم: ' .. spell.name .. ' على <t>')
        end


        state.NeverDieMode = M(true, 'Never Die Mode')
        state.AutoinfoNMMode.value
        state.AutoinfoNMMode = M(true, 'Auto info NM Mode')

        
function user_job_target_change(target)  
	local already_announced_by_name = already_announced_by_name or {}

	local target = windower.ffxi.get_mob_by_target('t')
	local sub = windower.ffxi.get_mob_by_target('st')

    if state.AutoinfoNMMode.value and target ~= nil and sub == nil then


        if (target.name == "Ironshell" or target.name == "Gartell") and not already_announced_by_name[target.name] then
			already_announced_by_name[target.name] = true

			windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(target.name)..' ['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
			windower.send_command('input /echo ['..target.name..'] RUN Thunder hand USE Tellus / Wind hand USE Gelus .. Wind hand: 70% Ice, Thunder hand: 70% Earth. Only Ice damage effective.')
		end
	end
end


windower.send_command('gs c autows Tachi: Ageha')
elseif player.main_job == 'DRK' then
    windower.send_command('gs c autows Armor Break;gs c weapons Lycurgos;gs c toggle AutoWSMode') -- gs c toggle AutoWSMode
elseif player.main_job == 'WAR' then
    windower.send_command('gs c autows Armor Break;')
end
else


    
windower.register_event('incoming text',function(org)     
if state.DefenseDownMode.Value ~= 'None' then
	--abyssea stagger --red pros
	if string.find(org, "Armor Break") then
		-- windower.send_command('input /p Stagger! <call14>!')  -- code add by (Aragan@Asura)
		send_command('input //gs c Weapons Normal;gs c cycle DefenseDownMode;')
	end
end)

    -- جدول لحفظ الأهداف الذين تم عليهم WS
dd_info = dd_info or {}
dd_info.tagged_mobs = {}

-- حدد هنا WS المطلوبة حسب الوظيفة
local defense_ws = {
    ['SAM'] = 'Tachi: Ageha',
    ['DRK'] = 'Armor Break',
    ['WAR'] = 'Armor Break',
}

-- تسجيل WS عندما يتم تنفيذها على العدو
windower.register_event('action', function(act)
    local player = windower.ffxi.get_player()
    if not player then return end

    if act.category == 3 then -- Weapon Skill
        local actor = act.actor_id
        local ws_target = act.targets and act.targets[1]
        local ws_id = act.param

        local ws_name = res.weapon_skills[ws_id] and res.weapon_skills[ws_id].en
        if not ws_name then return end

        if actor == player.id then
            local expected_ws = defense_ws[player.main_job]
            if expected_ws and ws_name == expected_ws then
                local tid = ws_target and ws_target.id
                if tid then
                    if _settings.debug_mode then
                        add_to_chat(262, '[DD] WS landed: '..ws_name..' on '..tid..'. Switching weapon...')
                    end

                    -- ضع هنا تغيير السلاح بعد نجاح WS
                    windower.send_command('gs c weapons Default')
                    dd_info.tagged_mobs[tid] = true
                end
            end
        end
    end
end)

if player.status == 'Engaged' and state.DefenseDownMode.value ~= 'None' then
    if not dd_info.tagged_mobs[player.target.id] then
        if _settings.debug_mode then add_to_chat(123,'Prepping defense down on '..tostring(player.target.id)..'.') end
        if player.main_job == 'SAM' then
            windower.send_command('gs c autows Tachi: Ageha')
        elseif player.main_job == 'DRK' then
            windower.send_command('gs c weapons Lycurgos;gs c autows Armor Break;gs c toggle AutoWSMode') -- gs c toggle AutoWSMode
        elseif player.main_job == 'WAR' then
            windower.send_command('gs c autows Armor Break;')
        end



        function job_buff_change(buff, gain)

            -- Warp ring rule, for any buff being lost
            if S{'Warp'}:contains(player.equipment.ring2) and being_attacked then
                windower.send_command('input /p Never Die Again < < Hollaaaa ;')
            end
        end



        local last_check = 0
local already_warned = false

windower.register_event('prerender', function()
    if os.clock() - last_check < 1 then return end
    last_check = os.clock()

    local player = windower.ffxi.get_player()
    if not player or not player.equipment or not player.index then return end

    local ring2 = player.equipment.ring2
    if not ring2 then return end

    -- نحصل على اسم الخاتم الموجود في ring2
    local ring_item = windower.ffxi.get_items().equipment.ring2
    local ring2_name = res.items[ring_item and ring_item.id or 0] and res.items[ring_item.id].en:lower() or ''

    local mobs = windower.ffxi.get_mob_array()
    local being_attacked = false



    if being_attacked and ring2_name:contains('warp') then
            windower.send_command('input /p Never Die Again << Hollaaaa ;')


    end
end)

if player.equipment.ring2 == "Warp Ring" then
    windower.send_command('input /p Never Die Again << Hollaaaa ;')
end

if (player.equipment.main == "Liberator"





local last_alert_time = 0

windower.register_event('prerender', function()
    local player = windower.ffxi.get_player()
    if not player or not player.equipment then return end

    -- تحقّق من مرور 15 ثانية على الأقل
    local now = os.time()
    if now - last_alert_time < 15 then return end

    -- تحقق من وجود Warp Ring
    if player.equipment.ring2 == "Warp Ring" then
        windower.send_command('input /p Never Die Again << Warping Hollaaaa ;')
        last_alert_time = now
    end
end)





	-- New implementation of tick.
	windower.raw_register_event('prerender', function()
		if not (os.clock() > tickdelay) then return end
        if player.equipment.ring2 == "Warp Ring" then
            windower.send_command('input /p Never Die Again << Warping Hollaaaa ;')
        end
		tickdelay = os.clock() + .5
		
	end)
	
    -- Load up all the gear sets.
    init_gear_sets()
	
	-- Load generic items into sets and determine settings after checking what is owned as needed.
	include('Sel-GlobalItems')
end

-- Function to perform actions on new targets.
function target_change(new)

	if state.RngHelper.value then
		send_command('gs rh clear')
	end

	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (target ~= nil) and (sub == nil) then
		if state.AutoCleanupMode.value and math.sqrt(target.distance) < 7 then
			if target.name == "Runje Desaali" and bayld_items then 
				for i in pairs(bayld_items) do
					if player.inventory[bayld_items[i]] then
						windower.chat.input('/item "'..bayld_items[i]..'" <t>')
						windower.chat.input:schedule(2,'/targetnpc')
						return
					end
				end
			elseif target.name == "Sturdy Pyxis" and player.inventory['Forbidden Key'] then
				windower.chat.input('/item "Forbidden Key" <t>') return
			end
		end
	end
	
	if user_job_target_change then
		if user_job_target_change(target) then return end
	end
	
	if user_target_change then
		if user_job_target_change(target) then return end
	end
end

-- Function to reset things after zoning.
function zone_change(new_id,old_id)
	if user_zone_change then
		user_zone_change(new_id,old_id)
	end
	
	if job_zone_change then
		job_zone_change(new_id,old_id)
	end
	
	if user_job_zone_change then
		user_job_zone_change(new_id,old_id)
	end
	
	default_zone_change(new_id,old_id)
end
	
function default_zone_change(new_id,old_id)
	tickdelay = os.clock() + 10
	state.AutoBuffMode:reset()
	state.AutoSubMode:reset()
	state.AutoTrustMode:reset()
	state.AutoTankMode:reset()
	state.AutoRuneMode:reset()
	state.AutoFoodMode:reset()
	state.AutoWSMode:reset()
	state.AutoNukeMode:reset()
	if state.CraftingMode.value ~= 'None' then
		enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
		state.CraftingMode:reset()
	end
	send_command('gs rh disable')
	state.RngHelper:reset()
	useItem = false
	useItemName = ''
	useItemSlot = ''
	lastincombat = false
	being_attacked = false
	
	if world.area:contains('Abyssea') or data.areas.proc:contains(world.area) then
		state.SkipProcWeapons:set('False')
	else
		state.SkipProcWeapons:reset()
	end
	
	if state.DisplayMode.value then update_job_states()	end
end



function Warping()
	windower.send_command('input /p Never Die Again << Hollaaaa ;')
	tickdelay = os.clock() + 1
end

local last_check = 0

windower.register_event('prerender', function()
    if os.clock() - last_check < 5 then return end
    last_check = os.clock()	
	if player.equipment.ring2 == "Warp Ring" then
		Warping()
		tickdelay = os.clock() + 1
	end
end)

already_announced_roll = false

function job_precast(spell, spellMap, eventArgs)
    if (buffactive['Clarion Call'] or buffactive['Soul Voice '] or buffactive['Troubadour'] or buffactive['Nightingale']) and  not already_announced_roll then
        send_command('@input /p ROLL starting Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Ready')		
        already_announced_roll = true
    end
    if party.count ~= 1 and player.target.type == 'PLAYER' and
        state.Buff['Nightingale'] = buffactive['Nightingale'] or false
	
    if party.count ~= 1 and player.target.type == 'PLAYER' and (buff == "Clarion Call" or buff == "Soul Voice" or buff == "Troubadour" or buff == "Nightingale") then
        if gain then
            send_command('@input /p SINGING starting not go far') -- Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Read		
        end

        if party.count ~= 1 and player.target.type == 'PLAYER' and buff == "Tenuto" then
            if gain then
                send_command('@input /p SINGING starting not go far') -- Rostam max aug."Phantom Roll" +8 max Duration gear Equipped Read		
            end
        end


        function job_buff_change(buff, gain)
            update_melee_groups()
        
            local party = windower.ffxi.get_party()
        
            -- يتحقق إذا كنت في حفلة مع أحد آخر (غيرك)
            local in_party = (party.party1_count or 0) > 1
        
            if in_party and (buffactive['Clarion Call'] or buffactive['Soul Voice '] or buffactive['Troubadour'] or buffactive['Nightingale']) then
                send_command('@input /p -- SINGING starting not go far --')
            end
        end

        if player.equipment.feet == "Hippo. Socks +1" then
            windower.send_command('input /p >> Hippo feet equiped for pull mobs << ;')
        -- tickdelay = os.clock() + 1
        end   


        notified_hippo = false  -- هذا خارج الدالة، في بداية الملف أو في مكان مناسب

function check_hippo_feet()
    if player.equipment.feet == "Hippo. Socks +1" and not notified_hippo then
        windower.send_command('input /p >> Hippo feet equiped for pull mobs << ;')
        notified_hippo = true
    -- elseif player.equipment.feet ~= "Hippo. Socks +1" then
    --     notified_hippo = false  -- يعيد السماح إذا قمت بنزعها، يمكن إزالة هذا السطر إذا تريدها مرة فقط حتى تغيير الزون
    end
end

local res = require('resources')
local already_said = false
local current_zone = windower.ffxi.get_info().zone

-- نراقب تغيّر الزون لإعادة التفعيل
windower.register_event('zone change', function()
    already_said = false
    current_zone = windower.ffxi.get_info().zone
end)

-- التحقق كل ثانية
local last_check = 0
windower.register_event('prerender', function()
    if os.clock() - last_check < 1 then return end
    last_check = os.clock()

    if already_said then return end

    local player = windower.ffxi.get_player()
    if not player then return end

    local items = windower.ffxi.get_items()
    if not items or not items.equipment or not items.equipment.ring2 then return end

    local ring_id = items.equipment.ring2
    local ring_item = res.items[ring_id]
    local ring_name = ring_item and ring_item.en:lower() or ''

    if not ring_name:find('warp') then return end

    local mobs = windower.ffxi.get_mob_array()
    for _, mob in pairs(mobs) do
        if mob.is_npc and mob.valid_target and mob.claim_id ~= 0 and mob.target_index == player.index then
            windower.send_command('input /p Never Die Again << Hollaaaa ;')
            already_said = true
            break
        end
    end
end)


-- rdm
function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and not data.areas.cities:contains(world.area) then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for i in pairs(buff_spell_lists[state.AutoBuffMode.Value]) do
			if not buffactive[buff_spell_lists[state.AutoBuffMode.Value][i].Buff] and (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Always' or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Combat' and (player.in_combat or being_attacked)) or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Engaged' and player.status == 'Engaged') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'Idle' and player.status == 'Idle') or (buff_spell_lists[state.AutoBuffMode.Value][i].When == 'OutOfCombat' and not (player.in_combat or being_attacked))) and spell_recasts[buff_spell_lists[state.AutoBuffMode.Value][i].SpellID] < spell_latency and silent_can_use(buff_spell_lists[state.AutoBuffMode.Value][i].SpellID) then
				windower.chat.input('/ma "'..buff_spell_lists[state.AutoBuffMode.Value][i].Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
		if player.sub_job == 'SCH' and not state.Buff['SJ Restriction'] then
			--not buffactive[data.elements.BarElement_of[state.ElementalMode.value]] or buffactive[data.elements.BarElement_of[state.ElementalMode.value]]
			if not buffactive[data.elements.storm_of[state.ElementalMode.value]] and actual_cost(get_spell_table_by_name(data.elements.storm_of[state.ElementalMode.value])) < player.mp then
				windower.chat.input('/ma "'..data.elements.storm_of[state.ElementalMode.value]..'"')
				tickdelay = os.clock() + 1.1
				return true
			else
				return false
			end
		end
		if not buffactive[state.BarStatus.value] then
			windower.chat.input("/ma "..state.BarStatus.value.." <me>")
			tickdelay = os.clock() + 1.1

		end
		if not buffactive[state.EnSpell.value] then
		    windower.chat.input('/ma "En'..data.elements.enspell_of[state.ElementalMode.value]..'" <me>')
			tickdelay = os.clock() + 1.1

		end
		local buff_name = string.sub(state.GainSpell.value, -3).." Boost"

		if not buffactive[buff_name] then
		  windower.chat.input("/ma "..state.GainSpell.value.." <me>")
		  tickdelay = os.clock() + 1.1
		  return true
	    else
		  return false
	    end
		

		local barspell = data.elements.BarElement_of[state.ElementalMode.value]

	else
		return false
	end
end


if state.AutoBuffMode.value == 'Shiniryu' and player.hpp < 60 and (player.in_combat or being_attacked) then 
    windower.send_command('gs c smartcure')
-- handle_smartcure()
    tickdelay = os.clock() + 1.1
end

if (state.AutoBuffMode.Value == 'Sortie' or state.AutoBuffMode.Value == 'Aminon') and (target ~= nil) and (sub == nil) then
    if target.name == "Leshonn" or target.name == "Gartell" then --test Ironshell Ghast
        --windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        windower.send_command('gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(''..target.name..'')..'['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands: only Ice damage will be effective.')  -- code add by (Aragan)
        windower.send_command('input /echo ['..target.name..'] RUN Thunder hand USE Tellus / Wind hand USE Gelus .. Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands:  only Ice damage will be effective.')  -- code add by (Aragan)
    elseif target.name == "Aminon" then
        windower.send_command('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
    elseif target.name == "Ghatjot" or target.name == "Dhartok" then
        wwindower.send_command('gs c set RuneElement Tellus;gs c set ElementalMode Earth;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
    elseif target.name == "Skomora" or target.name == "Triboulex" then
        windower.send_command('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
    end
end
windower.send_command('exec /trustshinryu.txt;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			

function user_job_target_change(target)  

if target.name == "Clipper" or target.name == "Gartell" then --test Ironshell Ghast

send_command('exec trustshinryu.txt; input /macro book 1; input /macro set 22;gs c set AutoWSRestore true;gs c set OffenseMode STP;gs c set Passive Enspell')
end

set_macro_page(22, 1)

function user_job_target_change(target)  
	
	local target = windower.ffxi.get_mob_by_target('t')
	local sub= windower.ffxi.get_mob_by_target('st')
	if (state.AutoBuffMode.Value == 'Sortie' or state.AutoBuffMode.Value == 'Aminon') and (target ~= nil) and (sub == nil) then
		if target.name == "Clipper" or target.name == "Gartell" then --test Ironshell Ghast
			--windower.chat.input('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
			windower.send_command('gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
			windower.chat.input('/p >>> '..auto_translate('Rayke')..''..auto_translate(''..target.name..'')..'['..target.name..'] Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands: only Ice damage will be effective.')  -- code add by (Aragan)
			windower.send_command('input /echo ['..target.name..'] RUN Thunder hand USE Tellus / Wind hand USE Gelus .. Wind hand: 70% Ice, Thunder hand: 70% EarthWind and Thunder hands:  only Ice damage will be effective.')  -- code add by (Aragan)
		elseif target.name == "Aminon" then
			windower.send_command('gs c set RuneElement Lux;gs c set ElementalMode Light;gs c set AutoBuffMode Aminon;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
        elseif target.name == "Ghatjot" or target.name == "Dhartok" then
			wwindower.send_command('gs c set RuneElement Tellus;gs c set ElementalMode Earth;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
		elseif target.name == "Skomora" or target.name == "Triboulex" then
			windower.send_command('gs c set RuneElement Ignis;gs c set ElementalMode Fire;gs c set AutoBuffMode Sortie;gs c set AutoDefenseMode true;gs c set AutoTankMode true;gs c set DefenseMode Magical;gs c set AutoRuneMode true') 			
		end
	end
end



--[[

Shinryu is no longer silenced.
Shinryu is no longer paralyzed.
Shinryu is no longer poisoned.
Shinryu's slow effect wears off.
Shinryu's Magic Evasion Down effect wears off.
Shinryu's addle effect wears off.
Shinryu's Bio effect wears off.
Shinryu's Evasion Down effect wears off.


if state.AutoBuffMode.Value == 'Shinryu' then
	if string.find(org, "Shinryu is no longer silenced.") then
		windower.send_command('/ma "Silence" <bt>')
	elseif string.find(org, "Shinryu's slow effect wears off.") then
		windower.send_command('/ma "Slow" <bt>')
	elseif string.find(org, "Shinryu is no longer paralyzed.") then
		windower.send_command('/ma "Paralyze II" <bt>')
	elseif string.find(org, "Shinryu's addle effect wears off.") then
		windower.send_command('/ma "Addle II" <bt>')
	elseif string.find(org, "Shinryu's Evasion Down effect wears off.") then
		windower.send_command('/ma "Distract III" <bt>')
	elseif string.find(org, "Shinryu's Magic Evasion Down effect wears off.") then
		windower.send_command('/ma "Frazzle III " <bt>')
	elseif string.find(org, "Shinryu's slow effect wears off.") then
		windower.send_command('/ma "Slow" <bt>')
	elseif string.find(org, "Shinryu's slow effect wears off.") then
		windower.send_command('/ma "Slow" <bt>')

		state.TreasureMode:set('Fulltime')


]] 
if state.AutoBuffMode.Value == 'Shinryu' and new == 'Engaged' then
        state.WeaponLock:set(true)
end
function job_state_change(stateField, newValue, oldValue)
	if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
	check_weaponset()
end

local target = windower.ffxi.get_mob_by_target('t')

if state.AutoBuffMode.Value == 'Shinryu' then
if target and target.is_npc and target.hpp <= 1 and not low_hp_nm_triggered then
    low_hp_nm_triggered = true
    state.TreasureMode:set('Fulltime')
    add_to_chat(123, 'NM HP ≤ 1% - Equipped low HP set.')
end
end
windower.register_event('prerender', function()
    local target = windower.ffxi.get_mob_by_target('t')
    if target and target.is_npc and target.hpp <= 1 and not low_hp_nm_triggered then
        low_hp_nm_triggered = true

        -- نفذ الأمر أو البس السيت
        equip(sets.lowhp)  -- تأكد أن عندك set اسمه 'lowhp'
        add_to_chat(123, 'NM HP ≤ 1% - Equipped low HP set.')
    end

    -- إعادة التفعيل إذا لم يعد مستهدف
    if (not target or target.hpp > 1) and low_hp_nm_triggered then
        low_hp_nm_triggered = false
    end
end)
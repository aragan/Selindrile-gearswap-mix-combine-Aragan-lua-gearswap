windower.register_event('action',function (act)
    local actor = act.actor_id
    local category = act.category
    local player = windower.ffxi.get_player()
  
    if actor == player.id and category == 1 then
        local total_hits = act.targets[1].action_count
        local avg_damage = 0;
        local avg_hits = 0;
 
        for i = 1, i <= total_hits do
            if act.targets[1].actions[i].reaction == 8 then
                avg_damage = avg_damage + act.targets[1].actions[i].param
                avg_hits = avg_hits + 1
            end
        end
        avg_damage = avg_damage / avg_hits
 
        -- use avg_damage and avg_hits to calculate whatever you want.
    end
end)


-----------


windower.register_event('action',function (act)
    local actor     = act.actor_id
    local category  = act.category
    local param     = act.param
    local player    = windower.ffxi.get_player()
    local damage    = act.targets[1].actions[1].param
    local hits      = act.targets[1].action_count
 
 
    if ((actor == (player.id or player.index))) then
        if category == 1 then      
             
            if hits == 1 then
                if damage > 575 then
                add_to_chat(167,'pDIF : [2.25]')
                elseif damage < 575 and damage > 510 then
                add_to_chat(167,'pDIF : [2.00]')
                elseif damage < 510  then
                add_to_chat(167,'pDIF under [1.75]')
                end
            elseif hits == 2 then
                if damage > 575*2 then
                add_to_chat(167,'pDIF : [2.25] divided by 2 hits')
                elseif damage < 575*2 and damage > 510*2 then
                add_to_chat(167,'pDIF : [2.00]')
                elseif damage < 510*2  then
                add_to_chat(167,'pDIF under [1.75]')
                end
            elseif hits == 3 then
                if damage > 575*3 then
                add_to_chat(167,'pDIF : [2.25] divided by 3 hits')
                elseif damage < 575*3 and damage > 510*3 then
                add_to_chat(167,'pDIF : [2.00]')
                elseif damage < 510*3  then
                add_to_chat(167,'pDIF under [1.75]')
                end
            elseif hits == 4 then
                if damage > 575*4 then
                add_to_chat(167,'pDIF : [2.25] divided by 4 hits')
                elseif damage < 575*4 and damage > 510*4 then
                add_to_chat(167,'pDIF : [2.00]')
                elseif damage < 510*4  then
                add_to_chat(167,'pDIF under [1.75]')
                end
            end
        end
    end
end)
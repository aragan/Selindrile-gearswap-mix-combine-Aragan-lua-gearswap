-- Wrap your sets in THIS function!
function GetGlobalItems()
    --Gearsets your character will use among multiple jobs.
    sets.Sheltered = {ring2="Sheltered Ring"}
    sets.Capacity = {back="Mecisto. Mantle"}
 
    sets.buff.Doom = {
        waist="Gishdubar Sash",
        ring1="Saida Ring",
        --ring2="Eshmun's Ring"
    }
    sets.midcast.Pet.Cure = {}
    sets.midcast.Pet = {}
    sets.midcast.Pet[] = {}
    sets.midcast.Pet[] = {}
    sets.TreasureHunter = {head="Volte Cap",waist="Chaac Belt"}
 
    sets.precast.Item['Hallowed Water'] = {
 
    }
 
    sets.precast.Item['Holy Water'] = {
 
    }
 
    --Augmented items that you'll use among multiple jobs.
 
    -- Taeon
    gear.TaeonHeadSnapshot = {
        name="Taeon Chapeau", 
        augments={'Mag. Evasion+16','"Snapshot"+5','"Snapshot"+5',}
    }
 
    -- Herculean Gear
    gear.HercHelmTreasureHunter = {
        name="Herculean Helm", 
        augments={'Accuracy+16','STR+7','"Treasure Hunter"+2','Accuracy+3 Attack+3','Mag. Acc.+13 "Mag.Atk.Bns."+13',}
    }   
     
    -- More gear sets.... however many you've got!
end
 
-- Call this AFTER the function like so or else it 
-- will NOT load when you switch jobs like normal
GetGlobalItems()
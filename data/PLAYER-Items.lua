-- Wrap your sets in THIS function!
function GetGlobalItems()
    --Gearsets your character will use among multiple jobs.
    sets.Sheltered = {ring2="Sheltered Ring"}
    sets.Capacity = {}--back="Mecisto. Mantle"
 
    sets.buff.Doom = {
        neck="Nicander's Necklace",
        waist="Gishdubar Sash",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1",
    }
    sets.midcast.Pet.Cure = {}
    sets.midcast.Pet = {}
    sets.midcast.Pet[] = {}
    sets.midcast.Pet[] = {}
    sets.TreasureHunter = {ammo="Per. Lucky Egg",head="Volte Cap",waist="Chaac Belt"}
 
    sets.precast.Item['Hallowed Water'] = {
        neck="Nicander's Necklace",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1",}
 
    sets.precast.Item['Holy Water'] = {
        neck="Nicander's Necklace",
        left_ring="Purity Ring",
        right_ring="Blenmot's Ring +1",}
 
    --Augmented items that you'll use among multiple jobs.
 
    -- Taeon
    gear.TaeonHeadSnapshot = {
        name="Taeon Chapeau", 
        augments={'Mag. Evasion+16','"Snapshot"+5','"Snapshot"+5',}
    }
    gear.taeon_phalanx_feet= {name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}}
    gear.taeon_dw_feet= {name="Taeon Boots", augments={'Accuracy+20','"Dual Wield"+5','Phalanx +2',}}
    
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
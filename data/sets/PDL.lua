head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},

head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},


  sets.exported={
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Heathen's Earring",
    left_ring="Cornelia's Ring",
    right_ring="Sroda Ring",
      }

      body={ name="Bunzi's Robe", augments={'Path: A',}},
      body={ name="Bunzi's Robe", augments={'Path: A',}},
      hands={ name="Bunzi's Gloves", augments={'Path: A',}},
      legs={ name="Bunzi's Pants", augments={'Path: A',}},
      feet={ name="Bunzi's Sabots", augments={'Path: A',}},

      sets.exported={
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        right_ear="Heathen's Earring",
        left_ring="Cornelia's Ring",
        right_ring="Sroda Ring",
    }
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    
ammo="Crepuscular Pebble",
left_ring="Sroda Ring", 

hands="Sakpata's Gauntlets",

head="Malignance Chapeau",
body="Malignance Tabard",
hands="Malignance Gloves",
legs="Malignance Tights",
feet="Malignance Boots",

right_ear="Heathen's Earring",


head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
neck={ name="Warder's Charm +1", augments={'Path: A',}},

head={ name="Sakpata's Helm", augments={'Path: A',}},
body={ name="Sakpata's Plate", augments={'Path: A',}},
hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
feet={ name="Sakpata's Leggings", augments={'Path: A',}},


left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
left_ear="Schere Earring",

head="Skulker's Bonnet +2",


head={ name="Gleti's Mask", augments={'Path: A',}},
body={ name="Gleti's Cuirass", augments={'Path: A',}},
hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
legs={ name="Gleti's Breeches", augments={'Path: A',}},
feet={ name="Gleti's Boots", augments={'Path: A',}},

head="Ikenga's Hat",
body="Ikenga's Vest",
hands="Ikenga's Gloves",
legs="Ikenga's Trousers",

skilchain set
head={ name="Nyame Helm", augments={'Path: B',}},
body={ name="Nyame Mail", augments={'Path: B',}},
hands={ name="Nyame Gauntlets", augments={'Path: B',}},
legs={ name="Nyame Flanchard", augments={'Path: B',}},
feet={ name="Nyame Sollerets", augments={'Path: B',}},
neck={ name="Warder's Charm +1", augments={'Path: A',}},


left_ear="Schere Earring",
right_ear="Boii Earring +1",

neck="Fotia Gorget",
waist="Fotia Belt",

NEW EQUIP
ammo="Homiliary",
ammo="Oshasha's Treatise",
neck="Elite Royal Collar",
neck="Rep. Plat. Medal",
neck="Sibyl Scarf",

head={ name="Gleti's Mask", augments={'Path: A',}},
body={ name="Gleti's Cuirass", augments={'Path: A',}},
hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
legs={ name="Gleti's Breeches", augments={'Path: A',}},
feet={ name="Gleti's Boots", augments={'Path: A',}},

left_ear="Sherida Earring",
right_ear="Brutal Earring",
left_ring="Hetairoi Ring",
right_ring="Petrov Ring",


sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
    ammo="Crepuscular Pebble",
    hands="Malignance Gloves",
    left_ear="Ishvara Earring",
    left_ring="Sroda Ring", 
})
sets.precast.WS['Requiescat'].PDL = set_combine(sets.precast.WS['Requiescat'], {
    ammo="Crepuscular Pebble",
    hands="Sakpata's Gauntlets",
    left_ring="Sroda Ring", 
})
sets.precast.WS.PDL = set_combine(sets.precast.WS, {
    ammo="Crepuscular Pebble",
    left_ring="Sroda Ring", 
})
sets.precast.WS.SC = set_combine(sets.precast.WS, {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
})

sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS['Judgment'], {
    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    right_ear="Peltast's Earring",
    left_ring="Sroda Ring", 
})
ammo="Crepuscular Pebble",
head={ name="Gleti's Mask", augments={'Path: A',}},
body={ name="Gleti's Cuirass", augments={'Path: A',}},
hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
legs={ name="Gleti's Breeches", augments={'Path: A',}},
feet={ name="Gleti's Boots", augments={'Path: A',}},
left_ring="Sroda Ring", 


--new equip 

ammo="Homiliary",
ammo="Oshasha's Treatise",
neck="Elite Royal Collar",
neck="Rep. Plat. Medal",
neck="Sibyl Scarf",


--null equip

head="Null Masque",
neck="Null Loop",
waist="Null Belt",
back="Null Shawl",


--mpaca set 

head={ name="Mpaca's Cap", augments={'Path: A',}},
body="Mpaca's Doublet",
hands="Mpaca's Gloves",
legs={ name="Mpaca's Hose", augments={'Path: A',}},
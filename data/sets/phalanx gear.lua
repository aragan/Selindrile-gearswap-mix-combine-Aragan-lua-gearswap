sets.exported={


    sets.Phalanx_Received = {
        head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
        body={ name="Taeon Tabard", augments={'Phalanx +3',}},	
    	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}
    head={ name="Taeon Chapeau", augments={'Phalanx +2',}},
    body={ name="Taeon Tabard", augments={'Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Phalanx +2',}},

    sets.Phalanx_Received = {
		body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
		feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	}

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Fu. Bandeau +3",
	body={ name="Herculean Vest", augments={'Phys. dmg. taken -1%','Accuracy+11 Attack+11','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
	hands={ name="Herculean Gloves", augments={'Accuracy+11','Pet: Phys. dmg. taken -5%','Phalanx +4',}},
	feet={ name="Herculean Boots", augments={'Accuracy+8','Pet: Attack+28 Pet: Rng.Atk.+28','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	})

}
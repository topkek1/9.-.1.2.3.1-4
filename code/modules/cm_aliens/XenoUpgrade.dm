/mob/living/carbon/Xenomorph/verb/Upgrade()
	set name = "Upgrade"
	set desc = "Upgrades you, at the cost of never being able to evolve.  Requires full plasma"
	set category = "Alien"

	if(upgrade == -2)
		src << "Sorry, your class can't upgrade."
		return

	if(upgrade == 3)
		src << "You are at your max upgrade and your power level is already over 9000, what more do you want?"
		return

	if(health<maxHealth)
		src << "You must be fully healed to upgrade"
		return

	if(storedplasma<maxplasma)
		src << "An upgrade requires ALL your plasma"
		return

	if(jobban_isbanned(src,"Alien"))
		src << "\red You are jobbanned from Aliens and cannot evolve. How did you even become an alien?"
		return

	if(handcuffed || legcuffed)
		src << "\red The restraints are too restricting to allow you to Upgrade."
		return

	if(jellyMax) //Does the caste have a jelly timer? Then check it
		if(jellyGrow < jellyMax)
			src << "You require more jelly growth..."
			return

	//FIRST UPGRADE
	if(upgrade == 0)
		var/up = alert(src, "If you upgrade, you will never be able to evolve, are you sure?",,"Yes","No")
		if(up == "No")
			return
		name = "Mature [caste] ([nicknumber])"
		real_name = name
		src.mind.name  = real_name
		src << "\green You feel a bit stronger..."
		upgrade = 1
		jellyGrow = 0
		switch(caste)
			if("Runner")
				melee_damage_lower = 15
				melee_damage_upper = 25
				health = 140
				maxHealth = 140
				storedplasma = 0
				plasma_gain = 20
				maxplasma = 200
				jellyMax = 400
				caste_desc = "A fast, four-legged terror, but weak in sustained combat.  It looks a little more dangerous..."
				speed = -1.5
				armor_deflection = 5
				attack_delay = -4
				tacklemin = 2
				tacklemax = 4
				tackle_chance = 50
			if("Hunter")
				melee_damage_lower = 25
				melee_damage_upper = 35
				health = 225
				maxHealth = 225
				storedplasma = 0
				plasma_gain = 30
				maxplasma = 250
				jellyMax = 800
				caste_desc = "A fast, powerful front line combatant.  It looks a little more dangerous..."
				speed = -1.4
				armor_deflection = 25
				attack_delay = -2
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 60
			if("Ravager")
				melee_damage_lower = 50
				melee_damage_upper = 70
				health = 280
				maxHealth = 280
				storedplasma = 0
				plasma_gain = 90
				maxplasma = 320
				jellyMax = 1600
				caste_desc = "A brutal, devastating front-line attacker.  It looks a little more dangerous..."
				speed = -1.2
				armor_deflection = 60
				tacklemin = 4
				tacklemax = 8
				tackle_chance = 85
			if("Crusher")
				melee_damage_lower = 20
				melee_damage_upper = 35
				tacklemin = 4
				tacklemax = 7
				tackle_chance = 95
				health = 450
				maxHealth = 450
				storedplasma = 0
				plasma_gain = 125
				maxplasma = 900
				jellyMax = 1600
				caste_desc = "A huge tanky xenomorph.  It looks a little more dangerous..."
				speed = 0.5
				armor_deflection = 75
			if("Sentinel")
				melee_damage_lower = 15
				melee_damage_upper = 25
				health = 200
				maxHealth = 200
				storedplasma = 0
				plasma_gain = 60
				maxplasma = 400
				jellyMax = 400
				spit_delay = 25
				caste_desc = "A ranged combat alien.  It looks a little more dangerous..."
				armor_deflection = 20
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 60
				speed = -0.6
				spit_type = 0
			if("Spitter")
				melee_damage_lower = 20
				melee_damage_upper = 30
				health = 225
				maxHealth = 225
				storedplasma = 0
				plasma_gain = 95
				maxplasma = 700
				jellyMax = 800
				spit_delay = 20
				caste_desc = "A ranged damage dealer.  It looks a little more dangerous..."
				armor_deflection = 20
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 60
				speed = 0
				spit_type = 0
			if("Boiler")
				melee_damage_lower = 20
				melee_damage_upper = 25
				health = 250
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 115
				maxplasma = 1100
				jellyMax = 1600
				spit_delay = 30
				caste_desc = "Some sort of abomination...  It looks a little more dangerous..."
				armor_deflection = 30
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 65
				speed = 1.0
			if("Praetorian")
				melee_damage_lower = 20
				melee_damage_upper = 30
				health = 325
				maxHealth = 325
				storedplasma = 0
				plasma_gain = 100
				maxplasma = 1100
				jellyMax = 1600
				spit_delay = 15
				caste_desc = "A giant ranged monster...   It looks a little more dangerous..."
				armor_deflection = 50
				tacklemin = 5
				tacklemax = 8
				tackle_chance = 75
				speed = 1.6
				spit_type = 0
			if("Hivelord")
				melee_damage_lower = 15
				melee_damage_upper = 20
				health = 325
				maxHealth = 325
				storedplasma = 0
				maxplasma = 1100
				plasma_gain = 100
				jellyMax = 1600
				caste_desc = "A builder of REALLY BIG hives.   It looks a little more dangerous..."
				armor_deflection = 10
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 60
				speed = 1.4
			if("Carrier")
				src << "\green Throw a hugger to get your hugger upgrades."
				melee_damage_lower = 25
				melee_damage_upper = 35
				health = 400
				maxHealth = 400
				storedplasma = 0
				maxplasma = 550
				plasma_gain = 20
				jellyMax = 1600
				caste_desc = "A portable Love transport.  It looks a little more dangerous..."
				armor_deflection = 10
				tacklemin = 3
				tacklemax = 4
				tackle_chance = 60
				speed = -0.4
			if("Queen")
				name = "Elite [caste]"
				real_name = name
				src.mind.name  = real_name
				melee_damage_lower = 50
				melee_damage_upper = 75
				health = 900
				maxHealth = 900
				storedplasma = 0
				maxplasma = 1600
				plasma_gain = 100
				jellyMax = 1600
				caste_desc = "The biggest and baddest xeno. The Queen controls the hive and plants eggs and royal jelly."
				armor_deflection = 100
				tacklemin = 5
				tacklemax = 7
				tackle_chance = 85
				speed = 0.9

		return


	//SECOND UPGRADE
	if(upgrade == 1)
		name = "Elite [caste] ([nicknumber])"
		real_name = name
		src.mind.name  = real_name
		src << "\green You feel a whole lot stronger..."
		upgrade = 2
		jellyGrow = 0
		switch(caste)
			if("Runner")
				melee_damage_lower = 20
				melee_damage_upper = 30
				health = 160
				maxHealth = 160
				storedplasma = 0
				plasma_gain = 20
				maxplasma = 200
				jellyMax = 800
				caste_desc = "A fast, four-legged terror, but weak in sustained combat.  It looks pretty strong..."
				speed = -1.6
				armor_deflection = 10
				attack_delay = -4
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 60
			if("Hunter")
				melee_damage_lower = 35
				melee_damage_upper = 50
				health = 200
				maxHealth = 200
				storedplasma = 0
				plasma_gain = 25
				maxplasma = 275
				jellyMax = 1600
				caste_desc = "A fast, powerful front line combatant.  It looks pretty strong..."
				speed = -1.5
				armor_deflection = 30
				attack_delay = -3
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 65
			if("Ravager")
				melee_damage_lower = 60
				melee_damage_upper = 80
				health = 300
				maxHealth = 300
				storedplasma = 0
				plasma_gain = 100
				maxplasma = 330
				jellyMax = 3200
				caste_desc = "A brutal, devastating front-line attacker.  It looks pretty strong..."
				speed = -1.3
				armor_deflection = 65
				tacklemin = 5
				tacklemax = 9
				tackle_chance = 90
			if("Crusher")
				melee_damage_lower = 35
				melee_damage_upper = 45
				tacklemin = 5
				tacklemax = 9
				tackle_chance = 95
				health = 500
				maxHealth = 500
				storedplasma = 0
				plasma_gain = 150
				maxplasma = 1000
				jellyMax = 3200
				caste_desc = "A huge tanky xenomorph.  It looks pretty strong..."
				speed = 0.1
				armor_deflection = 100
			if("Sentinel")
				melee_damage_lower = 20
				melee_damage_upper = 30
				health = 225
				maxHealth = 225
				storedplasma = 0
				plasma_gain = 75
				maxplasma = 500
				jellyMax = 800
				spit_delay = 20
				caste_desc = "A ranged combat alien.  It looks pretty strong..."
				armor_deflection = 20
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 60
				speed = -0.6
				spit_type = 0
			if("Spitter")
				melee_damage_lower = 25
				melee_damage_upper = 35
				health = 250
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 100
				maxplasma = 800
				jellyMax = 1600
				spit_delay = 15
				caste_desc = "A ranged damage dealer.  It looks pretty strong..."
				armor_deflection = 25
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 70
				speed = -0.1
				spit_type = 0
			if("Boiler")
				melee_damage_lower = 30
				melee_damage_upper = 35
				health = 275
				maxHealth = 275
				storedplasma = 0
				plasma_gain = 150
				maxplasma = 1150
				jellyMax = 3200
				spit_delay = 20
				caste_desc = "Some sort of abomination...  It looks pretty strong..."
				armor_deflection = 35
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 70
				speed = 0.9
			if("Praetorian")
				melee_damage_lower = 30
				melee_damage_upper = 35
				health = 350
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 110
				maxplasma = 1150
				jellyMax = 3200
				spit_delay = 10
				caste_desc = "A giant ranged monster...   It looks pretty strong..."
				armor_deflection = 55
				tacklemin = 6
				tacklemax = 9
				tackle_chance = 80
				speed = 1.5
				spit_type = 0
			if("Hivelord")
				melee_damage_lower = 15
				melee_damage_upper = 20
				health = 350
				maxHealth = 350
				storedplasma = 0
				maxplasma = 1150
				plasma_gain = 110
				jellyMax = 3200
				caste_desc = "A builder of REALLY BIG hives.   It looks pretty strong..."
				armor_deflection = 15
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 70
				speed = 1.3
			if("Carrier")
				src << "\green Throw a hugger to get your hugger upgrades."
				melee_damage_lower = 30
				melee_damage_upper = 40
				health = 425
				maxHealth = 425
				storedplasma = 0
				maxplasma = 350
				plasma_gain = 30
				jellyMax = 3200
				caste_desc = "A portable Love transport.  It looks pretty strong..."
				armor_deflection = 20
				tacklemin = 4
				tacklemax = 5
				tackle_chance = 70
				speed = -0.4
			if("Queen")
				name = "Elite Empress"
				real_name = name
				src.mind.name  = real_name
				melee_damage_lower = 100
				melee_damage_upper = 150
				health = 1000
				maxHealth = 1000
				storedplasma = 0
				maxplasma = 1700
				plasma_gain = 150
				jellyMax = 3200
				caste_desc = "The biggest and baddest xeno. The Empress controls multiple hives and planets..."
				armor_deflection = 125
				tacklemin = 6
				tacklemax = 9
				tackle_chance = 90
				speed = 0.8

		return


	//Final UPGRADE
	if(upgrade == 2)
		name = "Ancient [caste] ([nicknumber])"
		real_name = name
		src.mind.name  = real_name
		upgrade = 3
		jelly = 0
		jellyGrow = 0
		jellyMax = 0
		switch(caste)
			if("Runner")
				src << "\green You are the fastest assassin of all time.  Your speed is unmatched."
				melee_damage_lower = 25
				melee_damage_upper = 35
				health = 140
				maxHealth = 140
				storedplasma = 0
				plasma_gain = 2
				maxplasma = 210
				caste_desc = "Not what you want to run into in a dark alley...  It looks fucking deadly..."
				speed = -2
				armor_deflection = 10
				attack_delay = -4
				tacklemin = 3
				tacklemax = 5
				tackle_chance = 70
			if("Hunter")
				src << "\green You are the epitome of the hunter.  Few can stand against you in open combat."
				melee_damage_lower = 50
				melee_damage_upper = 60
				health = 250
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 20
				maxplasma = 300
				caste_desc = "A completly unmatched hunter.  No, not even the Yautja can match you."
				speed = -1.5
				armor_deflection = 40
				attack_delay = -3
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 65
			if("Ravager")
				src << "\green You are death incarnate.  All will tremble before you..."
				melee_damage_lower = 80
				melee_damage_upper = 100
				health = 350
				maxHealth = 350
				storedplasma = 0
				plasma_gain = 15
				maxplasma = 200
				caste_desc = "As I walk through the valley of the shadow of death..."
				speed = -1.1
				armor_deflection = 70
				tacklemin = 6
				tacklemax = 10
				tackle_chance = 95
			if("Crusher")
				src << "\green You are the physical manifestation of a Tank.  Almost nothing can harm you."
				melee_damage_lower = 35
				melee_damage_upper = 45
				tacklemin = 5
				tacklemax = 9
				tackle_chance = 95
				health = 350
				maxHealth = 350
				storedplasma = 0
				plasma_gain = 30
				maxplasma = 400
				caste_desc = "It always has the right of way..."
				speed = -0.1
				armor_deflection = 85
			if("Sentinel")
				src << "\green You are the stun master.  Your stunning is legendary and causes massive quantities of salt."
				melee_damage_lower = 25
				melee_damage_upper = 35
				health = 200
				maxHealth = 200
				storedplasma = 0
				plasma_gain = 20
				maxplasma = 600
				spit_delay = 10
				caste_desc = "Neurotoxin Factory, don't let it get you."
				armor_deflection = 20
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 60
				speed = -0.6
				spit_type = 0
			if("Spitter")
				src << "\green You are a master of ranged stuns and damage.  Go fourth and generate salt."
				melee_damage_lower = 35
				melee_damage_upper = 45
				health = 250
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 50
				maxplasma = 900
				spit_delay = 5
				caste_desc = "A ranged destruction machine."
				armor_deflection = 35
				tacklemin = 5
				tacklemax = 7
				tackle_chance = 75
				speed = -0.2
				spit_type = 0
			if("Boiler")
				src << "\green You are the master of ranged artillery.  Bring death from above."
				melee_damage_lower = 35
				melee_damage_upper = 45
				health = 250
				maxHealth = 250
				storedplasma = 0
				plasma_gain = 50
				maxplasma = 1000
				spit_delay = 10
				caste_desc = "A devestating piece of alien artillary."
				armor_deflection = 40
				tacklemin = 4
				tacklemax = 6
				tackle_chance = 80
				speed = 0.8
			if("Praetorian")
				src << "\green You are the strongest range fighter around.  Your spit is devestating and you can fire nearly a constant stream."
				melee_damage_lower = 40
				melee_damage_upper = 50
				health = 270
				maxHealth = 270
				storedplasma = 0
				plasma_gain = 50
				maxplasma = 1000
				spit_delay = 0
				caste_desc = "Its mouth looks like a minigun..."
				armor_deflection = 60
				tacklemin = 7
				tacklemax = 10
				tackle_chance = 85
				speed = 1.3
				spit_type = 0
			if("Hivelord")
				src <<"\green You are the builder of walls.  Ensure that the marines are the ones who pay for them."
				melee_damage_lower = 20
				melee_damage_upper = 30
				health = 300
				maxHealth = 300
				storedplasma = 0
				maxplasma = 1200
				plasma_gain = 70
				caste_desc = "An extreme construction machine.  It seems to be building walls..."
				armor_deflection = 20
				tacklemin = 5
				tacklemax = 7
				tackle_chance = 80
				speed = 1.2
			if("Carrier")
				src <<"\green You are the master of huggers.  Throw them like baseballs at the marines!"
				src << "\green Throw a hugger to get your hugger upgrades."
				melee_damage_lower = 35
				melee_damage_upper = 45
				health = 250
				maxHealth = 250
				storedplasma = 0
				maxplasma = 600
				plasma_gain = 15
				caste_desc = "It's literally crawling with 10 huggers."
				armor_deflection = 20
				tacklemin = 5
				tacklemax = 6
				tackle_chance = 75
				speed = -0.3
			if("Queen")
				name = "Ancient Empress"
				real_name = name
				src.mind.name  = real_name
				src << "\green You are the Alpha and the Omega...  The beginning and the end..."
				melee_damage_lower = 150
				melee_damage_upper = 225
				health = 1500
				maxHealth = 1500
				storedplasma = 0
				maxplasma = 2000
				plasma_gain = 200
				caste_desc = "The most perfect Xeno form imaginable."
				armor_deflection = 150
				tacklemin = 7
				tacklemax = 10
				tackle_chance = 95
				speed = 0.7

	return








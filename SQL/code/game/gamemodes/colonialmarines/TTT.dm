/datum/game_mode/TTT
	name = "Trouble In Terrosit Town"
	config_tag = "TTT"
	required_players = 1 //Need at least one player, but really we need 2.
	var
		list/terroists[]
		list/marines[]
		terrosits_score=0
		marines_score=0
		elitemode=0// Elite Mode is a config setting to spawn players as commandoes instead of regular jobs.
	proc
		picksides(mob/living/carbon/human/m)
			var/team=0  //MUST BE ZERO AT DEFAULT
			team=rand(1,2)//1 is Marines, 2 is Terroists
			if(team==1)
				marines += m.ckey
			if(team==2)
				terroists += m.ckey



/datum/game_mode/TTT/post_setup()
	var/mob/M
	for(M in mob_list)
		if(M.client && istype(M,/mob/living/carbon/human))//Make sure they're humans
			picksides(M)

	if(config) config.remove_gun_restrictions = 1 //This will allow anyone to use cool guns.

	spawn(10)
		world << "<B>The current game mode is - Trouble in Terroist Town!</B>"
		world << sound('sound/effects/siren.ogg')

	spawn(1000)
		loop_package()
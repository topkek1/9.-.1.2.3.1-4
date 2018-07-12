//-------------------------------------------------------

/obj/item/weapon/gun/rifle
	reload_sound = 'sound/weapons/rifle_reload.ogg'
	cocked_sound = 'sound/weapons/rifle_cocked.ogg'
	origin_tech = "combat=4;materials=3"
	slot_flags = SLOT_BACK
	w_class = 4
	force = 15
	burst_amount = 2
	burst_delay = 2
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK

	New()
		..()
		load_into_chamber()

//-------------------------------------------------------
//M41A PULSE RIFLE AMMUNITION

/obj/item/ammo_magazine/rifle
	name = "\improper M41A magazine (10x24mm)"
	desc = "A 10mm assault rifle magazine."
	caliber = "10×24mm"
	icon_state = "m309a"
	icon_empty = "m309a0"
	default_ammo = "rifle bullet"
	max_rounds = 40 //Should be 40.
	gun_type = /obj/item/weapon/gun/rifle/m41a

/obj/item/ammo_magazine/rifle/extended
	name = "\improper M41A extended magazine (10x24mm)"
	desc = "A 10mm assault extended rifle magazine."
	max_rounds = 60
	bonus_overlay = "m41a_exmag"

/obj/item/ammo_magazine/rifle/incendiary
	name = "\improper M41A incendiary magazine (10x24mm)"
	desc = "A 10mm assault rifle magazine."
	default_ammo = "incendiary rifle bullet"

/obj/item/ammo_magazine/rifle/ap
	name = "\improper M41A AP magazine (10x24mm)"
	desc = "A 10mm armor piercing magazine."
	default_ammo = "armor-piercing rifle bullet"

/obj/item/ammo_magazine/rifle/ap/elite
	max_rounds = 40

/obj/item/ammo_magazine/rifle/marksman
	name = "\improper M41A marksman magazine (10x24mm)"
	desc = "A 10mm marksman rifle magazine."
	default_ammo = "marksman rifle bullet"

/obj/item/ammo_magazine/rifle/a19hv
	name = "\improper A19 High Velocity Rounds (10x26mm)"
	desc = "A A19 High Velocity Round magazine"
	caliber = "10×26mm"
	icon_state = "a19hv"
	icon_empty = "a19hv-0"
	default_ammo = "A19 High Velocity Round"
	max_rounds = 15
	gun_type = /obj/item/weapon/gun/rifle/m4ra

//-------------------------------------------------------
//M41A PULSE RIFLE

/obj/item/weapon/gun/rifle/m41a
	name = "\improper M41A pulse rifle MK2"
	desc = "The standard issue rifle of the Colonial Marines. Commonly carried by most combat personnel. Uses 10mm special ammunition."
	icon_state = "m41a_kermit"
	icon_empty = "m41a_kermit0" // It ain't easy being green
	icon_wielded = "m41a_kermit-w"
	item_state = "m41a_kermit"
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	mag_type = /obj/item/ammo_magazine/rifle
	fire_delay = 4
	burst_amount = 3
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 24, "under_y" = 13)
		var/obj/item/attachable/grenade/G = new(src)
		G.Attach(src)
		update_attachables()
		if(ticker && istype(ticker.mode,/datum/game_mode/ice_colony)) //Snow camo
			if(icon_state == "m41a") //Only change this one
				icon_state = "s_m41a"
				icon_empty = "s_m41a0"
				icon_wielded = "s_m41a-w"
				item_state = "s_m41a"
//--------------------------------------------------------
//M4RA BATTLE RIFLE

/obj/item/weapon/gun/rifle/m4ra
	name = "\improper M4RA battle rifle"
	desc = "Mid to long range rifle constructed in a bullpup configuration; useful for reconnaissance due to both mid and long range combat capabilities. Uses A19 HV Rounds"
	icon_state = "m4ra"
	icon_empty = "m4ra0"
	icon_wielded = "m41a_mk1-w"
	item_state = "m41a_mk1"
	fire_sound = 'sound/weapons/m41a_2.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/a19hv
	fire_delay = 10
	burst_amount = 1
	burst_delay = 7
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

//-------------------------------------------------------
//M41A TRUE AND ORIGINAL

/obj/item/ammo_magazine/rifle/m41aMK1
	name = "\improper M41aMK1 magazine (10x24mm)"
	desc = "A semi-rectangular box of rounds for the original M41A Pulse Rifle."
	max_rounds = 95
	gun_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/item/weapon/gun/rifle/m41aMK1
	name = "\improper M41A pulse rifle"
	desc = "An older design of the Pulse Rifle commonly used by Colonial Marines. Uses 10mm special ammunition."
	icon_state = "m41a_mk1"
	icon_empty = "m41a_mk10"
	icon_wielded = "m41a_mk1-w"
	item_state = "m41a_mk1"
	fire_sound = 'sound/weapons/m41a_2.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/m41aMK1
	burst_amount = 4
	accuracy = 5
	damage = 5
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 24, "under_y" = 13)

//-------------------------------------------------------
//M41A MARKSMAN VARIANT

/obj/item/weapon/gun/rifle/m41a/scoped
	name = "\improper M41A/M marksman rifle"
	desc = "An advanced prototype pulse rifle based on the tried and true M41A Pulse Rifle MK2. Uses any standard M41 magazine and is equipped with rail scope."
	icon_state = "m41b"
	icon_empty = "m41b0"
	item_state = "m41a"
	origin_tech = "combat=5;materials=4"
	mag_type = /obj/item/ammo_magazine/rifle/marksman
	force = 16
	fire_delay = 5
	recoil = 1
	burst_amount = 1
	accuracy = 10

	New()
		..()
		var/obj/item/attachable/scope/S = new(src)
		S.Attach(src)
		var/obj/item/attachable/stock/rifle/Q = new(src)
		Q.Attach(src)
		var/obj/item/attachable/G = under //We'll need this in a sec.
		G.Detach(src) //This will null the attachment slot.
		cdel(G) //So without a temp variable, this wouldn't work.
		update_attachables()

//-------------------------------------------------------
//P9 SHARP RIFLE
/obj/item/ammo_magazine/rifle/sharpammo
	name = "\improper S.H.A.R.P. Magazine"
	desc = "A box of S.H.A.R.P. rifle harpoons. Use 'em wisely"
	icon_state = "sharpammo"
	icon_empty = "sharpammo-0"
	caliber = "harpoon"
	max_rounds = 10
	default_ammo = "SHARP Harpoon"
	gun_type = /obj/item/weapon/gun/rifle/sharprifle

/obj/item/weapon/gun/rifle/sharprifle
	name = "\improper P9 S.H.A.R.P. Rifle"
	desc = "Prototype sonic-harpoon artillery remote projectile (SHARP) rifle; fires time-delayed explosive tipped darts that embed themselves into enemies or terrain."
	icon_state = "sharprifle"
	icon_empty = "sharprifle0"
	item_state = "sharprifle"
	icon_wielded = "sharprifle-w"
	origin_tech = "combat=5;materials=4"
	fire_sound = 'sound/weapons/plasmacaster_fire.ogg' //plasmacaster sound because fuck what other sound would it be?
	mag_type = /obj/item/ammo_magazine/rifle/sharpammo
	accuracy = 100
	fire_delay = 60
	burst_amount = 1
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

//-------------------------------------------------------
//NSG 23 Assault Rifle

/obj/item/weapon/gun/rifle/nsg23ar
	name = "\improper NSG 23 Assault Rifle"
	desc = "Top of the line in assault rifles."
	icon_state = "NSG23"
	icon_empty = "NSG230"
	icon_wielded = "m41a_mk1-w"
	item_state = "m41a_mk1"
	fire_sound = 'sound/weapons/heavyrifle.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/nsg762
	fire_delay = 5
	burst_amount = 5
	burst_delay = 2
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

/obj/item/ammo_magazine/rifle/nsg762
	name = "\improper NSG 23 Magazine (7.62x39mm)"
	desc = "A magazine for the NSG 23 AR, chambered in 7.62x39"
	caliber = "7.62x39mm"
	icon_state = "nsg"
	icon_empty = "nsg0"
	default_ammo = "7.62x39mm NSG"
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/rifle/nsg23ar

//-------------------------------------------------------
//XM99A Phased Plasma Pulse Rifle

/obj/item/weapon/gun/rifle/xm99a
	name = "\improper XM99A Phased Plasma Pulse Rifle"
	desc = "Long-range prototype rifle that fires super-heated blasts of plasma; highly effective at long range."
	icon_state = "XM99A"
	icon_empty = "XM99A0"
	icon_wielded = "rsplmg-w"
	item_state = "rsplmg"
	fire_sound = 'sound/weapons/plasmacaster_fire.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/xm99a
	fire_delay = 20
	burst_amount = 1
	burst_delay = 1000
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER

/obj/item/ammo_magazine/rifle/xm99a
	name = "\improper XM99A Plasma Canister"
	desc = "A charged canister that is chambered for the prototype XM99A"
	caliber = "Plasma"
	icon_state = "xm99ammo"
	icon_empty = "xm99ammo"
	default_ammo = "XM99A Plasma"
	max_rounds = 4
	gun_type = /obj/item/weapon/gun/rifle/xm99a

//-------------------------------------------------------
//M41A PMC VARIANT

/obj/item/weapon/gun/rifle/m41a/elite
	name = "\improper M41A/2 battle rifle"
	desc = "A reinforced and remachined version of the tried and tested M41A Pulse Rifle MK2. Given only to elite units."
	icon_state = "pmc_m41a"
	icon_empty = "pmc_m41a0"
	item_state = "pmc_m41a"
	icon_wielded = "pmc_m41a-w"
	origin_tech = "combat=7;materials=5"
	mag_type = /obj/item/ammo_magazine/rifle/ap/elite
	fire_delay = 7
	burst_amount = 3
	accuracy = 35
	damage = 15
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER | GUN_WY_RESTRICTED


//-------------------------------------------------------
//MAR-40 AK CLONE //AK47 and FN FAL together as one.

/obj/item/ammo_magazine/rifle/mar40
	name = "\improper MAR magazine (7.62x39mm)"
	desc = "A 12mm magazine for the MAR series of firearms."
	caliber = " 7.62×39mm"
	icon_state = "5.56"
	icon_empty = "5.56"
	default_ammo = "heavy rifle bullet"
	max_rounds = 40
	gun_type = /obj/item/weapon/gun/rifle/mar40

/obj/item/ammo_magazine/rifle/mar40/extended
	name = "\improper MAR extended magazine (7.62x39mm)"
	desc = "A 12mm MAR magazine."
	max_rounds = 60
	bonus_overlay = "mar40_mag"

/obj/item/weapon/gun/rifle/mar40
	name = "\improper MAR-40 battle rifle"
	desc = "A cheap, reliable assault rifle chambered in 12mm. Commonly found in the hands of criminals or mercenaries, or in the hands of the UPP or Iron Bears."
	icon_state = "rsprifle"
	icon_empty = "rsprifle0"
	icon_wielded = "mar40-w"
	item_state = "mar40"
	origin_tech = "combat=4;materials=2;syndicate=4"
	fire_sound = 'sound/weapons/heavyrifle.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/mar40
	eject_casings = 1
	accuracy = -12
	burst_amount = 4
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_ON_MERCS | GUN_ON_RUSSIANS

	New()
		..()
		attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 17,"rail_x" = 13, "rail_y" = 19, "under_x" = 24, "under_y" = 13)

/obj/item/weapon/gun/rifle/mar40/carbine
	name = "\improper MAR-30 battle carbine"
	desc = "A cheap, reliable assault rifle chambered in 12mm. Commonly found in the hands of criminals or mercenaries. This is the carbine variant."
	icon_state = "shortrsprifle"
	icon_empty = "shortrsprifle0"
	icon_wielded = "shortrsprifle-w"
	fire_sound = 'sound/weapons/gunshot_ak47.ogg' //Change
	item_state = "mar40short"
	accuracy = -16
	fire_delay = 5

//-------------------------------------------------------
//M41AE2 HEAVY PULSE RIFLE

/obj/item/ammo_magazine/rifle/lmg
	name = "\improper M41AE2 ammo box (10x24mm)"
	desc = "A semi-rectangular box of rounds for the M41AE2 Heavy Pulse Rifle."
	icon_state = "a762"
	icon_empty = "a762-0"
	max_rounds = 100 //Should be a 300 box.
	gun_type = /obj/item/weapon/gun/rifle/lmg

/obj/item/weapon/gun/rifle/lmg
	name = "\improper M41AE2 heavy pulse rifle"
	desc = "A large weapon capable of laying down supressing fire. Currently undergoing field testing among USCM scout platoons and in mercenary companies. Like it's smaller brother, the M41A MK2, the M41AE2 is chambered in 10mm."
	icon_state = "rsplmg"
	icon_empty = "rsplmg0"
	item_state = "rsplmg"
	icon_wielded = "rsplmg-w"
	origin_tech = "combat=5;materials=4"
	fire_sound = 'sound/weapons/gunshot_rifle.ogg' //Change
	mag_type = /obj/item/ammo_magazine/rifle/lmg
	accuracy = -25
	fire_delay = 4
	burst_amount = 4
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_AMMO_COUNTER | GUN_ON_MERCS

	New()
		..()
		attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 10, "rail_y" = 24, "under_x" = 24, "under_y" = 12)

//-------------------------------------------------------


//-------------------------------------------------------
//M16A1 Rifle, only for surplus needs

/obj/item/ammo_magazine/rifle/m16a
	name = "\improper M16A1 magazine (5.56x45mm)"
	desc = "5.56x45mm surplus ammo, chambered for the glorious M16A1"
	caliber = " 5.56×45mm"
	icon_state = "556m"
	icon_empty = "556m-0"
	default_ammo = "Surplus 5.56mm"
	max_rounds = 20
	gun_type = /obj/item/weapon/gun/rifle/m16a1

/obj/item/weapon/gun/rifle/m16a1
	name = "\improper M16A1 assault rifle"
	desc = "'Gooks inside the wire - gooks inside the wire!' That's right, marine. They've boarded the Sulaco, and now this ancient rifle from the days of Vietnam is in your hands. Chambered in 5.56x45mm, with a select-fire between burst and semi-automatic, this rifle used to be a hell of a force to be reckoned with - so go! Give 'em hell, trooper."
	icon_state = "m16a"
	icon_empty = "m16a0"
	icon_wielded = "mar40-w"
	item_state = "mar40"
	fire_sound = 'sound/weapons/heavyrifle.ogg'
	mag_type = /obj/item/ammo_magazine/rifle/m16a
	eject_casings = 1
	burst_amount = 3
	flags = FPRINT | CONDUCT | TWOHANDED
	gun_features = GUN_AUTO_EJECTOR | GUN_CAN_POINTBLANK | GUN_ON_MERCS
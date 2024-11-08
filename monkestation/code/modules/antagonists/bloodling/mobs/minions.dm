/mob/living/basic/bloodling/minion
	name = "minion"
	desc = "A mass of code in a vague sprite. Report if you see this."

	icon = 'monkestation/code/modules/antagonists/bloodling/sprites/bloodling_sprites.dmi'
	biomass = 0
	biomass_max = 200
	damage_coeff = list(BRUTE = 1, BURN = 1.25, TOX = 1, CLONE = 1, STAMINA = 1, OXY = 1)
	initial_powers = list(
		/datum/action/cooldown/mob_cooldown/bloodling/absorb,
		/datum/action/cooldown/mob_cooldown/bloodling/devour,
		/datum/action/cooldown/spell/aoe/repulse/bloodling,
		/datum/action/cooldown/mob_cooldown/bloodling/transfer_biomass,
		/datum/action/cooldown/bloodling_hivespeak,
	)

/mob/living/basic/bloodling/minion/harvester
	name = "harvester"
	desc = "A mass of flesh with two large scything talons."

	icon_state = "harvester"
	icon_living = "harvester"
	icon_dead = "harvester_dead"
	health = 100
	maxHealth = 100
	melee_damage_lower = 15
	melee_damage_upper = 15
	speed = 0.5
	wound_bonus = -40
	bare_wound_bonus = 5
	sharpness = SHARP_EDGED

/mob/living/basic/bloodling/minion/harvester/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/basic/bloodling/minion/wall
	name = "wall of flesh"
	desc = "A blobby mass of flesh of large size."

	icon_state = "tank"
	icon_living = "tank"
	icon_dead = "tank_dead"
	health = 200
	maxHealth = 200
	melee_damage_lower = 10
	melee_damage_upper = 10
	speed = 2.5

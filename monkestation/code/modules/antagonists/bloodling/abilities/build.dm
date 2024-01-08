/datum/action/cooldown/bloodling/build
	name = "Mold Flesh"
	desc = "Use your biomass to forge creatures or structures."
	button_icon_state = "alien_resin"
	biomass_cost = 30
	/// A list of all structures we can make.
	var/static/list/structures = list(
		"resin wall" = /obj/structure/alien/resin/wall,
		"resin membrane" = /obj/structure/alien/resin/membrane,
		"resin nest" = /obj/structure/bed/nest,
	)

// Snowflake to check for what we build
/datum/action/cooldown/bloodling/build/proc/check_for_duplicate()
	for(var/blocker_name in structures)
		var/obj/structure/blocker_type = structures[blocker_name]
		if(locate(blocker_type) in owner.loc)
			to_chat(owner, span_warning("There is already a resin structure there!"))
			return FALSE

	return TRUE

/datum/action/cooldown/bloodling/build/Activate(atom/target)
	var/choice = tgui_input_list(owner, "Select a shape to mold", "Flesh Construction", structures)
	if(isnull(choice) || QDELETED(src) || QDELETED(owner) || !check_for_duplicate() || !IsAvailable(feedback = TRUE))
		return FALSE

	var/obj/structure/choice_path = structures[choice]
	if(!ispath(choice_path))
		return FALSE

	owner.visible_message(
		span_notice("[owner] vomits up a thick purple substance and begins to shape it."),
		span_notice("You shape a [choice] out of resin."),
	)

	new choice_path(owner.loc)
	return TRUE

namespace eval webadmin::page {
	
	set ValidHookNames {
		beforeCreate beforeUpdate beforeDelete
		afterCreate afterUpdate afterDelete
	}

}

#
#	Container for all the page settings
#
oo::class create webadmin::pageSettings {

	oo::property id
	oo::property title
	oo::property description
	oo::property model
	oo::property hooks
	oo::property form
	oo::property index
	oo::property globalActions
	oo::property localActions

	oo::property availableHooks

	constructor {} {
		set id {}
		set title {}
		set description {}
		set model {}
		set hooks {}
		set form {}
		set globalActions {}
		set localActions {}
		lappend availableHooks
	}
}

#
#	The web admin page class definition
#
oo::class create webadmin::page {

	superclass webadmin::interpreter

	oo::property settings

	#
	#	Initialize data-members
	#
	constructor {anId instructions} {
		next {title description model hooks index actions form}

		set settings [webadmin::pageSettings new]
		$settings id= $anId
		my interp $instructions
	}

	#
	#	Store the title
	method title {aTitle} {
		$settings title= $aTitle
	}

	#
	#	Store the description
	method description {aDescription} {
		$settings description= $aDescription
	}


	#
	# Store the model name
	method model {aModelName} {
		$settings model= $aModelName
	}

	#
	#	Store the actions
	method actions {instructions} {
		if {[dict exists $instructions local]} then {
			$settings localActions= [webadmin::actionList new]
			[$settings localActions] interp [dict get $instructions local]
		}

		if {[dict exists $instructions global]} then {
			$settings globalActions= [webadmin::actionList new]
			[$settings globalActions] interp [dict get $instructions global]
		}

	}

	#
	#	The index describes which headers are to be shown in the overview table
	method index {instructions} {
		set index [webadmin::index new]
		$index interp $instructions
	}

	#
	#	Parse the hooks, and add as them as methods to this instance
	method hooks {hooks} {

		lappend availableHooks

		# iterate over each hook and make them methods!
		foreach {hookName hookCode} $hooks {
			if {![my _validHookName $hookName]} then {
				return -code error "Not a valid hookname: '$hookName', expecting one of these: [join $webadmin::page::ValidHookNames ", "]"
			}

			lappend availableHooks $hookName
			oo::objdefine [self] method $hookName {} $hookCode
		}

		$settings availableHooks= $availableHooks

	}

	#
	#	Interpret the form
	#
	method form {instructions} {
		$settings form= [webadmin::form new]
		[$settings form] interp $instructions
	}

	#
	#	Return true when this is a valid hook name
	#
	method _validHookName {name} {
		return [expr { [lsearch $webadmin::page::ValidHookNames $name] != -1}]
	}

}

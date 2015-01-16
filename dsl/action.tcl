oo::class create webadmin::actionList {

	superclass webadmin::interpreter

	oo::property actions

	#
	#	Initialize data-members
	#
	constructor {} {
		next {action}

		lappend actions
	}

	#
	#
	#
	method action {label code} {
		lappend actions [webadmin::action new $label $code]
	}

}

oo::class create webadmin::action {

	oo::property label
	oo::property code

	#
	#	Initialize data-members
	#
	constructor {aLabel aCode} {
		set label $aLabel
		set code $aCode
	}
}
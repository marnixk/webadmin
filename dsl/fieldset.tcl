
#
#	Web admin fieldset class
#
oo::class create webadmin::fieldset {
	superclass webadmin::interpreter

	oo::property label
	oo::property fields

	constructor {aLabel} {
		next {field multiple compound}
		set label $aLabel
		lappend fields
	}

	# 
	#	Add a new field
	#
	method field {settings} {
		set newField [webadmin::field new $settings]
		lappend fields $newField
	}

	#
	#	Add a compound block
	#
	method multiple {settings} {
		set newField [webadmin::multiple new $settings]
		lappend fields $newField
	}


	method compound {settings} {
		set newField [webadmin::compoundField new $settings]
		lappend fields $newField
	}

}
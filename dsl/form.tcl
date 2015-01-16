
#
#	Web admin form class
#
oo::class create webadmin::form {
	superclass webadmin::interpreter

	oo::property fieldsets

	constructor {} {
		next {fieldset}
		lappend fieldsets
	}

	method fieldset {name settings} {
		set newFieldset [webadmin::fieldset new $name]
		lappend fieldsets $newFieldset
		$newFieldset interp $settings
	}

}


#
#	Interpreter class allows for nice DSL type languages
#
oo::class create webadmin::interpreter {

	variable exposed

	constructor {aExposed} {
		set exposed $aExposed
	}

	#
	#	Interpret a piece of code as if it were local
	#
	method interp {code} {
	
		foreach addExposure $exposed {
			interp alias {} $addExposure {} [self] $addExposure
		}		

 		if 1 $code

 		foreach removeExposure $exposed {
			interp alias {} $removeExposure {} 
		}

	}
}



namespace eval webadmin::parse {

	#
	#	Move settings into their objects
	#
	proc settings {obj settings mandatory {optional {}}} {

		# assign the mandatory fields in the settings dictionary to their properties
		foreach field $mandatory {

			# throw an error if one is missing
			if {![dict exists $settings $field]} then {
				return -code error "'$field' is required in definition for [info object class $obj]"
			}

			$obj $field= [dict get $settings $field]
		}


		# assign the optional fields in the settings dictionary to their properties
		foreach field $optional {

				# throw an error if one is missing
			if {![dict exists $settings $field]} then {
				continue
			}

			$obj $field= [dict get $settings $field]
		}

	}

}
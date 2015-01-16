oo::class create webadmin::index {
	superclass webadmin::interpreter

	oo::property headers

	#
	#	Initialize data-members, make interpreter superclass know
	#	that 'header' is a name we're interested in.
	#
	constructor {} {
		next {header}
		lappend headers
	}

	#
	#	Clean up after ourselves
	#
	destructor {
		foreach header $headers {
			$header destroy
		}
	}

	#
	#	Called to specify a header 
	#
	method header {name args} {
		set settings $args

		set indexHeader [webadmin::indexHeader new $name]

		# both set? error.
		if {[dict exists $settings -property] && \
			[dict exists $settings -code]} then {
				return -code error "Cannot specify both -property and -code for header '$name'"
		}	

		# none set? error.
		if {![dict exists $settings -property] && \
			![dict exists $settings -code]} then {
				return -code error "Must specify either -property or -code for header '$name'"
		}	


		lappend headers $indexHeader
	}

}


oo::class create webadmin::indexHeader {

	oo::property label
	oo::property property
	oo::property code

	#
	#	Initialize data-members
	#
	constructor {aLabel} {
		set label $aLabel

		set property {}
		set code {}
	}

	#
	#	@return 'code', 'property' or 'empty'
	#
	method type {} {
		if {$property == {}} then {
			return "code"
		}

		if {$code == {}} then {
			return "property"
		}

		return "empty"
	}	
}
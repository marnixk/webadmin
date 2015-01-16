
#
#	The web admin compound class definition
#
#	A compound is a sub block of data. It doesn't live on
#	its own, but can be part of other admin pages. 
#
oo::class create webadmin::compound {

	oo::property id
	oo::property model
	oo::property form

	#
	#	Initialize data-members
	#
	constructor {aId settings} {
		set id $aId
		webadmin::parse::settings [self] $settings {model}
		my _parseForm $settings
	}

	#
	#	Interpret the form
	#
	method _parseForm {settings} {
		if {![dict exists $settings form]} then {
			return -code error "No 'form' section found in webadmin::compound definition"
		}

		set form [webadmin::form new]
		$form interp [dict get $settings form]
	}

}

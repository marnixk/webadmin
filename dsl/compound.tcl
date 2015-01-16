#
#	Compound field definition
#
oo::class create webadmin::compoundField {

	oo::property id
	oo::property property
	oo::property label
	oo::property hint

	#
	#	Initialize data-members
	#
	constructor {settings} {
		set hint ""

		webadmin::parse::settings [self] $settings {id property label} {hint}
	}


}


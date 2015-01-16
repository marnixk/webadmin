
#
#	Web admin field class
#
oo::class create webadmin::field {

	oo::property type
	oo::property property
	oo::property label
	oo::property hint
	oo::property defaultValue

	#
	#	Initialize data-members
	#
	constructor {settings} {
		set hint ""
		set defaultValue ""

		webadmin::parse::settings [self] $settings {
			type 
			property 
			label
		} {
			hint 
			defaultValue
		}
	}

}

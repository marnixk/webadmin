
#
#	Multiple field implementation
#
oo::class create webadmin::multiple {
	superclass webadmin::interpreter

	oo::property compound
	oo::property minimum
	oo::property maximum

	constructor {settings} {
		set minimum 1
		set maximum infinite

		webadmin::parse::settings [self] $settings {compound} {minimum maximum}
	}
}


#
#	Simple name compound
#
webadmin::compound new "name_compound" {

	model Name
	form {
		fieldset "Name" {
			field {
				type textfield
				property name
				label "Name"
			}
		}
	}

}

#
#	Simple address compound
#
webadmin::compound new "address_compound" {

	model Address

	form {
		fieldset "Address" {
			field {
				type textfield
				property city
				label "City"
			}
		}
	}
}

#
#	Person information
#
webadmin::page new "person" {

	title "Person"
	description "Contains a list of all the people"
	model Person

	hooks {}

	index {
		header "Full name" -property fullName
		header "City" -code [-> {data} {return [$data address city]}]
	}

	actions {

		local {
			action "Publish" [-> {data} { 
				return "/admin/person/publish/$data"
			}]
		}

		global {
			action "Take offline" [-> {} { puts "Everything is taken offline"}] 
			action "Put online" [-> {} { puts "Everything is back online!"}]
		}
	}

	form {

		fieldset "Personal information" {

			field {
				type textfield
				property "fullName" 
				label "Full name" 
				hint "Enter your full name here"
			}

			compound {
				id "address_compound"
				property "address"
				label "Address"
				hint "A collection of fields for your address information"
			}

			# a multiple field that captures at least one alternative name	
			multiple {
				minimum 1
				maximum 5
				compound "address_compound"
			}
		}

	}

}


webadmin::page new "meager" {

	title "Meager"
	description "Contains a list of all the people"
	model Person

	hooks {
		beforeCreate {
			puts "So much creating going on!"
		}
	}

	index { 

	}

	form {

		fieldset "Personal information" {

			field {
				type textfield
				property "fullName" 
				label "Full name" 
				hint "Enter your full name here"
			}

			# a multiple field that captures at least one alternative name	
			multiple {
				minimum 1
				maximum 5
				compound Name
			}
		}

	}
}

oo::class create webadmin::DashboardHandler {

	superclass Http::Handler

	method start {request response} {

		set title "Dashboard"
		set adminPages [info class instances webadmin::page]

		$response puts [html::render {
			source "../templates/pages/dashboard.mu.tcl"	
		}]

	}

}
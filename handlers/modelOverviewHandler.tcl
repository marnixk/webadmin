oo::class create webadmin::ModelOverviewHandler {
	superclass Http::Handler

	method start {request response} {

		set title "Record overview"
		$response puts [html::render {
			source "../templates/pages/overview.mu.tcl"
		}]
	}
}
<html> {

	html::source "../shared/_head.mu.tcl"

	<body> {

		<div> class= "container" {

			<div> class= "row" {

				html::source "../shared/_header.mu.tcl"

				<h1> ' "Dashboard"

				foreach page $adminPages {
					set page [$page settings]
					<div> class= "well well-lg" {

						<a> href= "/admin/[$page id]/index.html" ' [$page title] 
						<br/>

						<p> {
							<small> ' [$page description]
						}

					}
				}

				html::source "../shared/_footer.mu.tcl"

			}


		}

	}
}
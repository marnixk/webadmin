lappend auto_path "../../../packages/"

package require TclOO
package require Thread
package require tclcommon
package require httpserver

source "../adminInterpret.tcl"
source "../adminPage.tcl"
source "../adminCompound.tcl"

source "../dsl/form.tcl"
source "../dsl/fieldset.tcl"
source "../dsl/field.tcl"
source "../dsl/multiple.tcl"
source "../dsl/compound.tcl"
source "../dsl/index.tcl"
source "../dsl/action.tcl"

source "../handlers/dashboardHandler.tcl"
source "../handlers/modelOverviewHandler.tcl"

source "testModel.tcl"
source "testAdminDefinition.tcl"


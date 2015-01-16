package provide webadmin 1.0

package require TclOO
package require tclcommon

set pkg_path [file dirname [info script]]

source "$pkg_path/adminInterpret.tcl"
source "$pkg_path/adminPage.tcl"
source "$pkg_path/adminCompound.tcl"

source "$pkg_path/dsl/form.tcl"
source "$pkg_path/dsl/fieldset.tcl"
source "$pkg_path/dsl/field.tcl"
source "$pkg_path/dsl/multiple.tcl"
source "$pkg_path/dsl/compound.tcl"

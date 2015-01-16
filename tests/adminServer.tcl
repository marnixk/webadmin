#!/usr/bin/tclsh

source "loadSources.tcl"

set allAdminPages [info class instances webadmin::page]


#
#	Start server thread
#
set serverThreadId [thread::create {

	source "loadSources.tcl"

	DI::prepareInstances
	
	set server [DI::get Http::Server]
	set mounts [DI::get Http::HandlerMounts]

	$mounts add "^/admin/dashboard.html$" [webadmin::DashboardHandler new]
	$mounts add "^/admin/(\[a-zA-Z0-9\]+)/index.html$" [webadmin::ModelOverviewHandler new]

	# start server
	$server start 8000
}]

# keep running it so that we can play around with it
vwait forever
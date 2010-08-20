<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="squadwar">
	UPDATE SWSectors
	SET SectorSquad=#winner#,
		SectorTime=#time#
	WHERE SWSectors_ID=#sector#
</cfquery>

<cfquery datasource="squadwar">
	INSERT INTO match_history(
		SWCode
		,SWSquad1
		,SWSquad2
		,SWSector_ID
		,match_victor
		,match_loser
		,match_time
		,League_ID
		,special)
	VALUES (
		'#code#'
		,#first#
		,#second#
		,'#sector#'
		,#winner#
		,#loser#
		,#time#
		,#league#
		,1)
</cfquery>

<cfquery datasource="squadwar">
	DELETE
	FROM SWMatches
	WHERE SWCode='#code#'
</cfquery>

<cflocation url="pendingmatches.cfm">

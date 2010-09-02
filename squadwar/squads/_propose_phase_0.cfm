<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfif NOT isdefined("session.squadid")><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource='#currentdatasource#' name="check_valid_phase0_squad">
	SELECT *
	FROM SWMatches
	WHERE (SWCode = '#swcode#') AND (SWSquad1 = #session.squadid#)
</cfquery>

<cfif NOT check_valid_phase0_squad.recordcount GT 0><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource='#currentdatasource#' name="check_match_info">
	SELECT *
	FROM SWMatches_Info
	WHERE SWCode = '#form.swcode#'
</cfquery>

<cfif check_match_info.recordcount IS 0>
	<cfquery datasource='#currentdatasource#'>
		INSERT
		INTO SWMatches_Info(swcode)
		VALUES('form.swcode')
	</cfquery>
</cfif>

<cfquery datasource='#currentdatasource#'>
	UPDATE SWMatches_Info
	SET
		match_time1 = #CreateODBCDateTime(CreateDAteTime(DatePart("yyyy",DateAdd('d',form.date1,Now())),DatePart("m",DateAdd('d',form.date1,Now())),DatePart("d",DateAdd('d',form.date1,Now())),form.hour1,form.minute1,0))#
		,match_time2 = #CreateODBCDateTime(CreateDAteTime(DatePart("yyyy",DateAdd('d',form.date2,Now())),DatePart("m",DateAdd('d',form.date2,Now())),DatePart("d",DateAdd('d',form.date2,Now())),form.hour2,form.minute2,0))#
		,squad_last_proposed = #session.squadid#
		,status_last_changed = #Now()#
		,status_last_changed = #CreateODBCDateTime(Now())#
	WHERE swcode = '#form.swcode#'
</cfquery>

<cflocation url="squad_pending_matches.cfm">


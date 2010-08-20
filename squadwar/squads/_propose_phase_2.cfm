<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfif NOT isdefined("session.squadid")><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource='#currentdatasource#' name="check_valid_phase0_squad">
	SELECT *
	FROM SWMatches
	WHERE (SWCode = '#swcode#') AND (SWSquad2 = #session.squadid#)
</cfquery>

<cfif NOT check_valid_phase0_squad.recordcount GT 0><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource='#currentdatasource#'>
	UPDATE SWMatches_Info
	SET
		mission = '#form.mission#'
		,pilots = '#form.pilots#'
		,ai = '#form.ai#'
		,proposed_final_time = #CreateODBCDateTime(CreateDateTime(ListGetAt(form.proposed_final_time,1),ListGetAt(form.proposed_final_time,2),ListGetAt(form.proposed_final_time,3),ListGetAt(form.proposed_final_time,4),ListGetAt(form.proposed_final_time,5),0))#
		,proposed_alternate_time = #CreateODBCDateTime(CreateDateTime(ListGetAt(form.date1,1),ListGetAt(form.date1,2),ListGetAt(form.date1,3),form.hour1,form.minute1,0))#
		,squad_last_proposed = #session.squadid#
		,status_last_changed = #CreateODBCDateTime(Now())#
	WHERE swcode = '#form.swcode#'
</cfquery>

<cfquery datasource="#currentdatasource#" name="get_email_squad">
	SELECT *
	FROM SWSquad_Info
	WHERE SquadID = #check_valid_phase0_squad.swsquad1#
</cfquery>
						
<cfmail to="#get_email_squad.squad_email#" from="squadwar@pxo.net" subject="SquadWar:Challenge Update" server="v-exchange.volition.net">
										
There has been an update regarding match #form.swcode#.

This phase was completed on #DateFormat(Now(),"mmmm d, yyyy")# at #TimeFormat(Now(),"h:mm tt")# CST (Central Standard Time).  You have 48 hours to complete this phase.

You may now pick the final match time.		
				
</cfmail>	

<cflocation url="squad_pending_matches.cfm">


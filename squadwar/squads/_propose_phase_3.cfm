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

<cfquery datasource='#currentdatasource#'>
	UPDATE SWMatches_Info
	SET
		final_match_time = #CreateODBCDateTime(CreateDateTime(ListGetAt(form.final_time,1),ListGetAt(form.final_time,2),ListGetAt(form.final_time,3),ListGetAt(form.final_time,4),ListGetAt(form.final_time,5),0))#
		,squad_last_proposed = #session.squadid#
		,status_last_changed = #CreateODBCDateTime(Now())#
	WHERE swcode = '#form.swcode#'
</cfquery>

<cfquery datasource="#currentdatasource#" name="get_email_squad">
	SELECT *
	FROM SWSquad_Info
	WHERE SquadID = #check_valid_phase0_squad.swsquad2#
</cfquery>
						
<cfmail to="#get_email_squad.squad_email#" from="squadwar@pxo.net" subject="SquadWar:Challenge Update" server="v-exchange.volition.net">
										
There has been an update regarding match #form.swcode#.

This phase was completed on #DateFormat(Now(),"mmmm d, yyyy")# at #TimeFormat(Now(),"h:mm tt")# CST (Central Standard Time). Your opponent has picked the final match time.		

Please visit the scheduling page available on your Squad Management page.  You can reach your Squad Management page by clicking on the link in the menu on the left side of the page called "Admin Squad".  You can reach the scheduling page by clicking on the link titled "View pending matches for this squad and schedule matches" available on the Squad Management page.
				
</cfmail>		


<cflocation url="squad_pending_matches.cfm">


<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfif NOT isdefined("session.squadid")><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource='#currentdatasource#' name="check_valid_phase4_squad">
	SELECT *
	FROM SWMatches
	WHERE (SWCode = '#form.swcode#') AND ((SWSquad1 = #session.squadid#) OR (SWSquad2 = #session.squadid#))
</cfquery>

<cfif NOT check_valid_phase4_squad.recordcount GT 0><cflocation url="http://www.squadwar.com"></cfif>

<cfquery datasource="#currentdatasource#" name="check_noshow">
	SELECT *
	FROM SWMatches_Info LEFT JOIN SWMatches ON SWMatches_Info.SWcode = SWMatches.SWCode
	WHERE SWMatches.SWcode = '#form.swcode#'
</cfquery>

<cfquery datasource='#currentdatasource#'>
	UPDATE SWMatches_Info
	SET
		<cfif (check_noshow.swsquad1 IS session.squadid)>swsquad1_reports_noshow = 1,swsquad1_noshow_datetime = #Now()#</cfif>
		<cfif (check_noshow.swsquad2 IS session.squadid)>swsquad2_reports_noshow = 1,swsquad2_noshow_datetime = #Now()#</cfif>
	WHERE swcode = '#form.swcode#'
</cfquery>

<!---
<cfquery datasource="#currentdatasource#" name="get_email_squad">
	SELECT *
	FROM SWSquad_Info
	WHERE SquadID = #check_valid_phase0_squad.swsquad2#
</cfquery>
						
<cfmail to="#get_email_squad.squad_email#" from="squadwar@pxo.net" subject="SquadWar:Challenge Update" server="v-exchange.volition.net">
										
There has been an update regarding match #form.swcode#.

Your opponent has picked the final match time.		

Please visit the scheduling page available on your Squad Management page.  You can reach your Squad Management page by clicking on the link in the menu on the left side of the page called "Admin Squad".  You can reach the scheduling page by clicking on the link titled "View pending matches for this squad and schedule matches" available on the Squad Management page.
				
</cfmail>		
--->

<cflocation url="squad_pending_matches.cfm">


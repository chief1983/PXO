<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfquery datasource="squadwar" name="get_pending_matches">
	SELECT SWMatches.SWCode, SWMatches.SWSquad1, SWMatches.SWSquad2, SWMatches.SWSector_ID, SWMatches.League_ID
		,SWMatches_Info.match_time1 ,SWMatches_Info.match_time2 ,SWMatches_Info.proposed_final_time 
		,SWMatches_Info.proposed_alternate_time ,SWMatches_Info.squad_last_proposed
		,SWMatches_Info.final_match_time ,SWMatches_Info.time_created 
		,SWMatches_Info.dispute
		,SWMatches_Info.status_last_changed
	FROM SWMatches LEFT JOIN SWMatches_Info ON SWMatches_Info.SWCode = SWMatches.SWCode
	WHERE SWMatches.SWCode = '#id#'
	ORDER BY SWMatches_Info.time_created
</cfquery>

<table width="" border=1 cellspacing=0>
	<tr>
		<td>SWCode</td>
		<td>time_created</td>
		<td>SWSquad1</td>
		<td>SWSquad2</td>
		<td>SWSector_ID</td>
		<td>League_ID</td>
		<td>match_time1</td>
		<td>match_time2</td>
		<td>proposed_final_time</td>
		<td>proposed_alternate_time</td>
		<td>squad_last_proposed</td>
		<td>final_match_time</td>
		
		<td>dispute</td>
		<td>status_last_changed</td>
		<td>phase</td>
	</tr>
<cfloop query="get_pending_matches">



	<cfoutput>
		<tr>
			<td>#SWCode#&nbsp;</td>
			<td>#time_created#&nbsp;</td>
			<td>#SWSquad1#&nbsp;</td>
			<td>#SWSquad2#&nbsp;</td>
			<td>#SWSector_ID#&nbsp;</td>
			<td>#League_ID#&nbsp;</td>
			<td>#match_time1#&nbsp;</td>
			<td>#match_time2#&nbsp;</td>
			<td>#proposed_final_time#&nbsp;</td>
			<td>#proposed_alternate_time#&nbsp;</td>
			<td>#squad_last_proposed#&nbsp;</td>
			<td>#final_match_time#&nbsp;</td>
			
			<td>#dispute#&nbsp;</td>
			<td>#status_last_changed#&nbsp;</td>	
			<td>
				<cfset current_phase=1>
				<cfif get_pending_matches.match_time2 IS NOT ''><cfset current_phase=2></cfif>
				<cfif get_pending_matches.match_time2 IS NOT ''><cfset current_phase=2></cfif>
				<cfif get_pending_matches.proposed_final_time IS NOT ''><cfset current_phase=3></cfif>
				<cfif get_pending_matches.proposed_alternate_time IS NOT ''><cfset current_phase=3></cfif>
				<cfif get_pending_matches.final_match_time IS NOT ''><cfset current_phase=4></cfif>																										
				<cfif current_phase LT 4>
					<cfif current_phase IS 1> Created
					<cfelseif current_phase IS 2> Phase 2
					<cfelseif current_phase IS 3> Phase 3
					</cfif>
					
				<cfelse>
					#DateFormat(get_pending_matches.final_match_time,"mmmm d, yyyy")# #TimeFormat(get_pending_matches.final_match_time,"h:mm tt")#
				</cfif>			
			</td>	
		</tr>	
	</cfoutput>
</cfloop>
</table>

<table border=0>
<cfloop query="get_pending_matches">
	<cfoutput>
	<tr>
		<td>#time_created#</td>
		<td>#SWCode#</td>
		<td>
				<cfset current_phase=1>
				<cfif get_pending_matches.match_time2 IS NOT ''><cfset current_phase=2></cfif>
				<cfif get_pending_matches.match_time2 IS NOT ''><cfset current_phase=2></cfif>
				<cfif get_pending_matches.proposed_final_time IS NOT ''><cfset current_phase=3></cfif>
				<cfif get_pending_matches.proposed_alternate_time IS NOT ''><cfset current_phase=3></cfif>
				<cfif get_pending_matches.final_match_time IS NOT ''><cfset current_phase=4></cfif>																										
				<cfif current_phase LT 4>
					<cfif current_phase IS 1> Created
					<cfelseif current_phase IS 2> Phase 2
					<cfelseif current_phase IS 3> Phase 3
					</cfif>
					
				<cfelse>
					Phase 4
					#DateFormat(get_pending_matches.final_match_time,"mmmm d, yyyy")# #TimeFormat(get_pending_matches.final_match_time,"h:mm tt")#
				</cfif>			
				
				<cfset overdue=0>
				<cfset pastdue=0>
				<cfif (current_phase IS 1) AND (status_last_changed LT DateAdd('d',-1,Now()))><cfset overdue=1></cfif>
				<cfif (current_phase GTE 4) AND (get_pending_matches.final_match_time LT DateAdd('d',-2,Now()))><cfset overdue=1><cfset pastdue=1></cfif>
				<cfif status_last_changed IS NOT ''>
					<cfif (current_phase LT 4) AND (status_last_changed LT DateAdd('d',-2,Now()))><cfset overdue=1></cfif>
				hooo
				<cfelse>
				whee!
					<cfif DateCompare(time_created,DateAdd('d',-2,Now())) LTE 0><cfset overdue=1></cfif>
				</cfif>
			</td>
			<td>
				<cfif overdue>
					<cfif pastdue>pastdue<cfelse>overdue</cfif>
				</cfif>
			</td>
	</tr>
		

	</cfoutput>
</cfloop>
</table>	

<cfset winner=''>
<cfset loser=''>
	<p>
<cfif overdue>
<cfloop query="get_pending_matches">	
	<cfif current_phase IS 1>
		This match has only been created.<br>
		This match should be forfeit in favor of the defender.<br>
		<cfset winner=swsquad2>
		<cfset loser=swsquad1>
	<cfelseif current_phase IS 2>
		This match is in phase 2.<br>
		This match should be forfeit in favor of the challenger.<br>
		<cfset winner=swsquad1>
		<cfset loser=swsquad2>
	<cfelseif current_phase IS 3>
		This match is in phase 3.<br>
		This match should be forfeit in favor of the defender.<br>
		<cfset winner=swsquad2>
		<cfset loser=swsquad1>
	<cfelseif current_phase IS 4>
		This match is in phase 4.<br>
		Either team has 48 hours to report a no-show or request a reschedule.<br>
		<cfif pastdue>
			<cfset winner=swsquad1>
			<cfset loser=swsquad2>
		</cfif>
	</cfif>

	
	<cfif winner IS NOT ''>
		<p>
		This match requires an update.
		
	</cfif>
	<hr>
</cfloop>
</cfif>
		

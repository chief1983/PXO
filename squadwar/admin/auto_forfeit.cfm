<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="squadwar" name="get_pending_matches">
	SELECT SWMatches.SWCode, SWMatches.SWSquad1, SWMatches.SWSquad2, SWMatches.SWSector_ID, SWMatches.League_ID
		,SWMatches_INFO.match_time1 ,SWMatches_INFO.match_time2 ,SWMatches_INFO.proposed_final_time 
		,SWMatches_INFO.proposed_alternate_time ,SWMatches_INFO.squad_last_proposed
		,SWMatches_INFO.final_match_time ,SWMatches_INFO.time_created 
		,SWMatches_INFO.dispute
		,SWMatches_INFO.status_last_changed		
		,SWMatches_INFO.swsquad1_reports_noshow 		
		,SWMatches_INFO.swsquad2_reports_noshow 
		,SWMatches_INFO.swsquad1_protest 
		,SWMatches_INFO.swsquad2_protest
		,SWMatches_INFO.mail_sent
	FROM SWMatches LEFT JOIN SWMatches_INFO ON SWmatches_Info.swcode = swmatches.Swcode
	ORDER BY SWMatches_INFO.time_created
</cfquery>
<!---
<table width="" border=1 cellspacing=0>
	<tr>
		<td>SWcode</td>
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
			<td>#SWcode#&nbsp;</td>
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
--->
<table border=0>
<cfloop query="get_pending_matches">
	<cfoutput>
	<tr>
		<td>#SWcode#</td>
		<td>#time_created#</td>	
		<td>#status_last_changed#</td>	
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
				<cfif (current_phase IS 1) AND (DateDiff('h',time_created,Now()) GT 24)><cfset overdue=1></cfif>
				<cfif (current_phase GTE 4) AND (DateDiff('h',final_match_time,Now()) GT 48)><cfset overdue=1><cfset pastdue=1></cfif>
				<cfif status_last_changed IS NOT ''>
					<cfif (current_phase LT 4) AND (current_phase GT 1) AND (DateDiff('h',status_last_changed,Now()) GT 48)><cfset overdue=1></cfif>
				hooo
				<cfelse>
				whee!
					<cfif DateDiff('h',time_created,Now()) GT 48><cfset overdue=1></cfif>
				</cfif>
		</td>
		<td>
				<cfif overdue>
					<a href="overdue.cfm?id=#SWcode#"><cfif pastdue>pastdue<cfelse>overdue</cfif></a>
				</cfif>
		</td>
	</cfoutput>
		<td>
			<cfset winner=''>
			<cfset loser=''>
				<p>
			<cfif overdue>
			
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
				
				<cfset ignore=0>
				<cfif swsquad1_protest OR swsquad2_protest><cfset ignore=1></cfif>
				<!--- swsquad1_reports_noshow OR swsquad2_reports_noshow OR --->
				<cfif winner IS NOT '' AND NOT ignore>
					<p>
					This match requires an update.
					
					<cfif current_phase LT 4>
					<cfoutput>
					database interaction<br>
					SWSquad1: #swsquad1#<br>
					SWSquad2: #swsquad2#<br>
					
					<cfquery datasource="squadwar" name="match_winner">
						SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
						WHERE SWSquads.SquadID = #winner#
					</cfquery>
					<cfquery datasource="squadwar" name="match_loser">
						SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
						WHERE SWSquads.SquadID = #loser#
					</cfquery>								
					winner: #winner# - #match_winner.squadname# - #match_winner.squad_email#<br>
					loser: #loser# - #match_loser.squadname# - #match_loser.squad_email#<br>
					#SWCode# #SWSquad1# #SWSquad2# #SWSector_ID# #winner# #loser# #DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())# #league_ID# 1<br>
					

					<cfquery datasource="squadwar">
						INSERT INTO 
							match_history(SWCode, SWSquad1, SWSquad2, SWSector_ID, match_victor, match_loser, match_time, league_ID, special)
							values('#SWCode#',#SWSquad1#,#SWSquad2#,'#SWSector_ID#',#winner#,#loser#,#DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())#,#league_ID#,1)
					</cfquery>
					<!---
					<cfquery datasource="squadwar" name="check_sector">
						SELECT *
						FROM SWSectors
						WHERE SWSectors_ID = #get_pending_matches.SWSector_ID#
					</cfquery>
					--->
						<cfquery datasource="squadwar" name="update_sectors">
							UPDATE
							SWSectors
							SET SectorSquad = #winner#
								,SectorTime = #DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())#
							WHERE SWSectors_ID = #get_pending_matches.SWSector_ID#
						</cfquery>
					
					<cfquery datasource="squadwar">
						DELETE
						FROM SWMatches
						WHERE SWCode = '#get_pending_matches.SWCode#'
					</cfquery>
										

					</cfoutput>									
					<!--- email to winner --->
			
<cfmail to="#match_winner.squad_email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system has updated match #SWcode#.

The match was stuck in phase #current_phase#.  Therefore, your squad was awarded the forfeit for this match versus #match_loser.SquadName#.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail> 

					<!--- email to loser --->
			
<cfmail to="#match_loser.squadname#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system has updated match #SWcode#.

The match was stuck in phase #current_phase# for longer than the allowed time.  Therefore, your squad forfeits this match versus #match_winner.SquadName#.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail>		
					<cfelse>
					<!--- PHASE 4 --->
					<cfset winner=''>
					<cfset loser=''>
					<cfif pastdue>
					<cfif NOT mail_sent>
						<cfif swsquad1_reports_noshow AND swsquad2_reports_noshow>
							<!--- don't update but send mail --->
							<cfquery datasource="squadwar" name="swsquad1_email">
								SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
								FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
								WHERE SWSquads.SquadID = #swsquad1#
							</cfquery>
							<cfquery datasource="squadwar" name="swsquad2_email">
								SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
								FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
								WHERE SWSquads.SquadID = #swsquad2#
							</cfquery>								
							
<cfmail to="#swsquad1_email.squad_email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system is reporting the status of match #SWcode#.

The match did not occur in the scheduled time and both squads reported a no-show.  You will be contacted by an administrator regarding the status of this match.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail> 

					<!--- email to loser --->
			
<cfmail to="#swsquad2_email.squadname#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system is reporting the status of match #SWcode#.

The match did not occur in the scheduled time and both squads reported a no-show.  You will be contacted by an administrator regarding the status of this match.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail>								
								
							<cfquery datasource="squadwar" name="set_mail_sent">
								UPDATE
								SWMatches_Info
								SET mail_sent = 1
								WHERE SWCode = '#get_pending_matches.SWCode#'
							</cfquery>									
						<cfelseif swsquad1_reports_noshow>
							<cfset winner=swsquad1>
							<cfset loser=swsquad2>
						<cfelseif swsquad2_reports_noshow>
							<cfset winner=swsquad2>
							<cfset loser=swsquad1>						
						<cfelse>
							<cfquery datasource="squadwar">
								DELETE
								FROM SWMatches
								WHERE SWCode = '#get_pending_matches.SWCode#'
							</cfquery>
							<cfquery datasource="squadwar">
								DELETE
								FROM SWMatches_Info
								WHERE SWCode = '#get_pending_matches.SWCode#'
							</cfquery>							
						</cfif>
						
						<cfif winner IS NOT ''>
							<cfquery datasource="squadwar" name="match_winner">
								SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
								FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
								WHERE SWSquads.SquadID = #winner#
							</cfquery>
							<cfquery datasource="squadwar" name="match_loser">
								SELECT SWSquads.SquadName, SWSquad_Info.squad_email 
								FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
								WHERE SWSquads.SquadID = #loser#
							</cfquery>		
							<cfquery datasource="squadwar">
								INSERT INTO 
									match_history(SWCode, SWSquad1, SWSquad2, SWSector_ID, match_victor, match_loser, match_time, league_ID, special)
									values('#SWCode#',#SWSquad1#,#SWSquad2#,'#SWSector_ID#',#winner#,#loser#,#DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())#,#league_ID#,1)
							</cfquery>
							<!---
							<cfquery datasource="squadwar" name="check_sector">
								SELECT *
								FROM SWSectors
								WHERE SWSectors_ID = #SWSector_ID#
							</cfquery>--->
							<cfquery datasource="squadwar" name="update_sectors">
								UPDATE
								SWSectors
								SET SectorSquad = #winner#,
									SectorTime = #DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())#
								WHERE SWSectors_ID = #get_pending_matches.SWSector_ID#
							</cfquery>
							<cfquery datasource="squadwar">
								DELETE
								FROM SWMatches
								WHERE SWCode = '#SWCode#'
							</cfquery>			
<cfmail to="#match_winner.squad_email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system has updated match #SWcode#.

The match was overdue and only your squad reported a no-show.  Therefore, your squad was awarded the forfeit for this match versus #match_loser.SquadName#.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail> 

					<!--- email to loser --->
			
<cfmail to="#match_loser.squadname#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="#SWcode# - Auto-Forfeit System Notification">
The Auto-Forfeit system has updated match #SWcode#.

The match was overdue and your squad did not report a no-show.  Therefore, your squad forfeits this match versus #match_winner.SquadName#.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Nathan Camarillo 
- SquadWar Administrator
- squadwar@pxo.net

Message delivered via the auto-forfeit system.

**Please leave all correspondence intact in your reply**
</cfmail>																			
						</cfif>
												
					</cfif>
					
					
					</cfif>
					</cfif>
				</cfif>
				<hr>
			</cfif>		
		</td>
	</tr>
		

</cfloop>
</table>

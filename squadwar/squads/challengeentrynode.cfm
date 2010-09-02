<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Challenge an Entry Node">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
<cfset session.challenging=1>				
	<br>	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>			
	 			<div class="title"><cfoutput>PXO Account #session.login#</cfoutput></div>
	 			<table>
	 				<tr>
	 					<td align="right"><div class="copy">Full Name:</div></td>
	 					<td><div class="copy"><cfoutput>#session.firstname# #session.lastname#</cfoutput></div></td>
	 				</tr>
	 				<tr>
	 					<td align="right"><div class="copy">PXO Account Email:</div></td>
	 					<td><div class="copy"><cfoutput>#session.email#</cfoutput></div></td>
	 				</tr>			
	 				<tr>
	 					<td align="right"><div class="copy">PXO Tracker ID:</div></td>
	 					<td><div class="copy"><cfoutput>#session.trackerid#</cfoutput></div></td>
	 				</tr>											
	 				<tr>
	 					<td align="right"><div class="copy">FreeSpace 2 Pilots:</div></td>
	 					<td><div class="copy"><cfoutput>#session.totalfs2pilots#</cfoutput></div></td>
	 				</tr>						
	 			</table>
	 		</td></tr></table>			
	 	</center>				
	 			
	<hr noshade color="#2E5537">				
	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>	

				<cfif leagueid IS 1>
					<center>
						<cfinclude template='#relativepath#leagues/1/map.cfm'>
					</center>
				<cfelseif leagueid IS 2>
					<center>
						<cfinclude template='#relativepath#leagues/2/map.cfm'>
					</center>				
				<cfelseif leagueid IS 3>
					<center>
						<cfinclude template='#relativepath#leagues/3/map.cfm'>
					</center>						
				<cfelseif leagueid IS 4>
					<center>
						<cfinclude template='#relativepath#leagues/4/map.cfm'>
					</center>					
				<cfelseif leagueid IS 5>
					<center>
						<cfinclude template='#relativepath#leagues/5/map.cfm'>
					</center>		
				<cfelseif leagueid IS 6>
					<center>
						<cfinclude template='#relativepath#leagues/6/map.cfm'>
					</center>												
				</cfif>		
				

				
				<cfset league_proceed=1>
				<cfquery datasource="#currentdatasource#" name="check_league">
					SELECT *
					FROM SWLeagues
					WHERE League_ID = #leagueid#
				</cfquery>				
				<cfif check_league.archived>
					<div class="title" align="center">This league is over.</div>	
					<cfset league_proceed=0>			
				</cfif>
			
	<cfif league_proceed>
				<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
					SELECT *
					FROM SWSectors
					WHERE (Entry_Node=1) AND (SectorSquad <> 0) AND (league_ID = #leagueid#)
					ORDER BY SWSectors_ID
				</cfquery>
				
				

				<cfset entrynodemessage=0>
				<cfset canchallenge=0>
				<cfif check_entry_nodes.recordcount GT 0>
					<cfloop query="check_entry_nodes">
							<cfquery datasource="#currentdatasource#" name="quick_check_entry_nodes_challenge">
								SELECT *
								FROM SWMatches
								WHERE (SWSector_ID = #check_entry_nodes.SWSectors_ID#) AND (league_ID = #leagueid#)
							</cfquery>	

							<cfquery datasource="#currentdatasource#" name="get_sector_last_challenged">
								SELECT *
								FROM match_history
								WHERE (swsquad1 = #session.squadid#) AND (league_ID = #leagueid#)
								ORDER BY match_time DESC
							</cfquery>

							<cfif get_sector_last_challenged.recordcount GT 0>
								<cfif (quick_check_entry_nodes_challenge.recordcount IS 0) AND (check_entry_nodes.SWSectors_ID IS NOT get_sector_last_challenged.SWSector_ID)>
									<cfset canchallenge=1>
									<cfset entrynodemessage=0>
									<cfbreak>
								<cfelse>
									<cfset entrynodemessage=1>
								</cfif>
							<cfelse>
								<cfif (quick_check_entry_nodes_challenge.recordcount IS 0)>
									<cfset canchallenge=1>
									<cfset entrynodemessage=0>
									<cfbreak>
								</cfif>							
							</cfif>
					</cfloop>
				</cfif>	
				
				<cfif canchallenge>
					<cfform action="_challengeentrynode.cfm">
					<div class="copy">
						Choose the entry node you wish to challenge from the dropdown box:<p>
						<select name="challenge_sector">
							<cfoutput query="check_entry_nodes">
								<cfquery datasource="#currentdatasource#" name="check_entry_nodes_challenge">
									SELECT *
									FROM SWMatches
									WHERE (SWSector_ID = #check_entry_nodes.SWSectors_ID#) AND (league_ID = #leagueid#)
								</cfquery>
								<cfif check_entry_nodes_challenge.recordcount IS 0>
									<cfquery datasource="#currentdatasource#" name="get_sector_squad">
										SELECT SquadName
										FROM SWSquads
										WHERE SquadID = #check_entry_nodes.SectorSquad#
									</cfquery>
									

									<option value="#check_entry_nodes.SWSectors_ID#,#check_entry_nodes.SectorSquad#">Versus #get_sector_squad.SquadName# for Sector #check_entry_nodes.SWSectors_ID# - #check_entry_nodes.SectorName# 
								</cfif>
							</cfoutput>	
						</select>	
						<input type="hidden" name=leagueid value="<cfoutput>#leagueid#</cfoutput>"><p>
						<input type="submit" value="Click to Challenge This Entry Node">
					</div>
					</cfform>
				<cfelse>
				<div class="copy">
					<cfif (NOT canchallenge) AND (entrynodemessage)>You cannot challenge the same entry node twice in a row.</cfif><br>
					All <cfif (NOT canchallenge) AND (entrynodemessage)>other </cfif>entry nodes have been challenged.
				</div>
				</cfif>

	</cfif>
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

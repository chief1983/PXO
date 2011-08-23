<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist a Pilot">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
				
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

				<cfquery name="get_squad" datasource="#currentdatasource#">
					SELECT *
					FROM SWSquads 
					WHERE (squadid=#session.squadid#) 
				</cfquery>
			
				<div class="title">Squad <cfoutput query="get_squad">#SquadName#</cfoutput> Challenge Mode</div>
				<p>

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
						<cfquery datasource="#currentdatasource#" name="get_league_max">
							SELECT SWLeagues.challenged_max
							FROM SWLeagues
							WHERE SWLeagues.League_ID = #leagueid#
						</cfquery>
						
						<cfset CHALLENGED_MAX=get_league_max.challenged_max>
						
						<cfif isdefined("session.squadid")>
							<cfquery name="get_squad" datasource="#currentdatasource#">
								SELECT *
								FROM SWSquads 
								WHERE (squadid=#session.squadid#)  AND (squadpassword='#session.squadpassword#')
							</cfquery>
						</cfif>
						<cfset valid_login=0>
						<cfif isdefined("session.squadpassword")>
							<cfif get_squad.squadpassword IS session.squadpassword>
								<cfset valid_login=1>
							</cfif>
						</cfif>
						<cfif valid_login>
							
						<!--- START CODE FOR CHALLENGE GENERATION --->
						<cfset current_team=8>
						<!---
						<b>Team <cfoutput>#current_team#</cfoutput>'s sectors</b><p>
						--->
						<cfquery datasource="#currentdatasource#" name="challenge_test">
							SELECT	SWSectors_Graph.SWSectors_ID, SWSectors_Graph.path_1, SWSectors_Graph.path_2, SWSectors_Graph.path_3, SWSectors_Graph.path_4, SWSectors_Graph.path_5
									 ,SWSectors.SectorName, SWSectors.Entry_Node
									 ,SWSquads.SquadName  
							FROM	(SWSectors INNER JOIN SWSectors_Graph ON (SWSectors_Graph.SWSectors_ID = SWSectors.SWSectors_ID)) LEFT OUTER JOIN SWSquads ON SWSectors.SectorSquad = SWSquads.SquadID
							WHERE	(SWSectors.SectorSquad = #session.squadid#) AND (SWSectors.League_ID=#leagueid#)
							ORDER BY SWSectors_Graph.SWSectors_ID	
						</cfquery>
						<cfset dontchecklist=''>
						
						<cfoutput query="challenge_test">
							<cfset dontchecklist = ListAppend(dontchecklist,challenge_test.SWSectors_ID)>
							<!--- <b>#challenge_test.SWSectors_ID#</b> -<cfif challenge_test.Entry_Node IS 1><b>E</b></cfif> #challenge_test.SectorName#- (<cfif challenge_test.path_1 IS NOT 0>#challenge_test.path_1#</cfif><cfif challenge_test.path_2 IS NOT 0>,#challenge_test.path_2#</cfif><cfif challenge_test.path_3 IS NOT 0>,#challenge_test.path_3#</cfif><cfif challenge_test.path_4 IS NOT 0>,#challenge_test.path_4#</cfif><cfif challenge_test.path_5 IS NOT 0>,#challenge_test.path_5#</cfif>) - #challenge_test.SquadName#<br> --->
						</cfoutput>
						 
						
						<cfset test_sectors_array_to_check = ArrayNew(1)>
						
						<cfset test_sectors_list_to_check = ''>
						
						<cfloop query="challenge_test">
							<cfif challenge_test.path_1 IS NOT 0><cfset success=ArrayAppend(test_sectors_array_to_check,challenge_test.path_1)></cfif>	
							<cfif challenge_test.path_2 IS NOT 0><cfset success=ArrayAppend(test_sectors_array_to_check,challenge_test.path_2)></cfif>	
							<cfif challenge_test.path_3 IS NOT 0><cfset success=ArrayAppend(test_sectors_array_to_check,challenge_test.path_3)></cfif>	
							<cfif challenge_test.path_4 IS NOT 0><cfset success=ArrayAppend(test_sectors_array_to_check,challenge_test.path_4)></cfif>	
							<cfif challenge_test.path_5 IS NOT 0><cfset success=ArrayAppend(test_sectors_array_to_check,challenge_test.path_5)></cfif>	
						</cfloop>
						
						<cfloop query="challenge_test">
							<cfif challenge_test.path_1 IS NOT 0><cfif NOT ListContainsNoCase(test_sectors_list_to_check,challenge_test.path_1)><cfset test_sectors_list_to_check = ListAppend(test_sectors_list_to_check,challenge_test.path_1)></cfif></cfif>	
							<cfif challenge_test.path_2 IS NOT 0><cfif NOT ListContainsNoCase(test_sectors_list_to_check,challenge_test.path_2)><cfset test_sectors_list_to_check = ListAppend(test_sectors_list_to_check,challenge_test.path_2)></cfif></cfif>	
							<cfif challenge_test.path_3 IS NOT 0><cfif NOT ListContainsNoCase(test_sectors_list_to_check,challenge_test.path_3)><cfset test_sectors_list_to_check = ListAppend(test_sectors_list_to_check,challenge_test.path_3)></cfif></cfif>	
							<cfif challenge_test.path_4 IS NOT 0><cfif NOT ListContainsNoCase(test_sectors_list_to_check,challenge_test.path_4)><cfset test_sectors_list_to_check = ListAppend(test_sectors_list_to_check,challenge_test.path_4)></cfif></cfif>	
							<cfif challenge_test.path_5 IS NOT 0><cfif NOT ListContainsNoCase(test_sectors_list_to_check,challenge_test.path_5)><cfset test_sectors_list_to_check = ListAppend(test_sectors_list_to_check,challenge_test.path_5)></cfif></cfif>	
						</cfloop>
						
						
						<!---
						<p>
						array prior to delete: <cfoutput>#test_sectors_list_to_check#</cfoutput><p> --->
						<cfset pos=0>
						<cfloop query="challenge_test">
							<cfif ListFindNoCase(test_sectors_list_to_check,challenge_test.SWSectors_ID)><cfset test_sectors_list_to_check=ListDeleteAt(test_sectors_list_to_check,ListFindNoCase(test_sectors_list_to_check,challenge_test.SWSectors_ID))></cfif>
						</cfloop>
						<CFSET testList=ArrayToList(test_sectors_array_to_check, ",")>

						
						<!---
						<b>Adjacent Owned Non-Entry Sectors:</b><p>--->
						<cfset final_sectors_owned_can_challenge=''>
						<cfquery datasource="#currentdatasource#" name="adjacent_test_owned">
							SELECT	SWSectors_Graph.SWSectors_ID, SWSectors_Graph.path_1, SWSectors_Graph.path_2, SWSectors_Graph.path_3, SWSectors_Graph.path_4, SWSectors_Graph.path_5
									 ,SWSectors.SectorName, SWSectors.Entry_Node
									 ,SWSquads.SquadName  
							FROM	(SWSectors INNER JOIN SWSectors_Graph ON (SWSectors_Graph.SWSectors_ID = SWSectors.SWSectors_ID)) LEFT OUTER JOIN SWSquads ON SWSectors.SectorSquad = SWSquads.SquadID
							WHERE	((SWSectors.SWSectors_ID IN (#test_sectors_list_to_check#)) AND (SWSectors.SectorSquad <> 0) AND (SWSectors.Entry_Node = 0) AND (SWSectors.League_ID = #leagueid#))
							ORDER BY SWSectors_Graph.SWSectors_ID	
						</cfquery>
						
						<!--- <ul> --->
						<cfoutput query="adjacent_test_owned">
							<cfset final_sectors_owned_can_challenge = ListAppend(final_sectors_owned_can_challenge,adjacent_test_owned.SWSectors_ID)>
						<!---	<li><b>#adjacent_test_owned.SWSectors_ID#</b> -<cfif adjacent_test_owned.Entry_Node IS 1><b>E</b></cfif> #adjacent_test_owned.SectorName#- (<cfif adjacent_test_owned.path_1 IS NOT 0>#adjacent_test_owned.path_1#</cfif><cfif adjacent_test_owned.path_2 IS NOT 0>,#adjacent_test_owned.path_2#</cfif><cfif adjacent_test_owned.path_3 IS NOT 0>,#adjacent_test_owned.path_3#</cfif><cfif adjacent_test_owned.path_4 IS NOT 0>,#adjacent_test_owned.path_4#</cfif><cfif adjacent_test_owned.path_5 IS NOT 0>,#adjacent_test_owned.path_5#</cfif>) - #adjacent_test_owned.SquadName#
						--->
						</cfoutput>
						<!---
						</ul>
						<p>
						--->
						
						<!---
						<b>Adjacent Unowned Non-Entry Sectors:</b><p>
						--->
						<cfquery datasource="#currentdatasource#" name="adjacent_test_unowned">
							SELECT	SWSectors_Graph.SWSectors_ID, SWSectors_Graph.path_1, SWSectors_Graph.path_2, SWSectors_Graph.path_3, SWSectors_Graph.path_4, SWSectors_Graph.path_5
									 ,SWSectors.SectorName, SWSectors.Entry_Node
									 ,SWSquads.SquadName  
							FROM	(SWSectors INNER JOIN SWSectors_Graph ON (SWSectors_Graph.SWSectors_ID = SWSectors.SWSectors_ID)) LEFT OUTER JOIN SWSquads ON SWSectors.SectorSquad = SWSquads.SquadID
							WHERE	((SWSectors.SWSectors_ID IN (#test_sectors_list_to_check#)) AND (SWSectors.SectorSquad = 0) AND (SWSectors.Entry_Node = 0) AND (SWSectors.League_ID = #leagueid#)) 
							ORDER BY SWSectors_Graph.SWSectors_ID	
						</cfquery>
						
						<!--- <ul> --->
						<cfoutput query="adjacent_test_unowned">
							<cfset dontchecklist = ListAppend(dontchecklist,adjacent_test_unowned.SWSectors_ID)>
						<!--- 	<li><b>#adjacent_test_unowned.SWSectors_ID#</b> -<cfif adjacent_test_unowned.Entry_Node IS 1><b>E</b></cfif> #adjacent_test_unowned.SectorName#- (<cfif adjacent_test_unowned.path_1 IS NOT 0>#adjacent_test_unowned.path_1#</cfif><cfif adjacent_test_unowned.path_2 IS NOT 0>,#adjacent_test_unowned.path_2#</cfif><cfif adjacent_test_unowned.path_3 IS NOT 0>,#adjacent_test_unowned.path_3#</cfif><cfif adjacent_test_unowned.path_4 IS NOT 0>,#adjacent_test_unowned.path_4#</cfif><cfif adjacent_test_unowned.path_5 IS NOT 0>,#adjacent_test_unowned.path_5#</cfif>) - #adjacent_test_unowned.SquadName#
						--->
						</cfoutput>
						<!---
						</ul>
						<p>
						--->
						
						<!---
						<b>Dont check:</b> <cfoutput>#dontchecklist#</cfoutput><p>
						--->
						<cfset dontchecklist=''>
						<cfset final_sectors_unowned_can_challenge=''>
						<cfset test_sectors_list_adjacent_to_no_check=''>
						<cfloop query="adjacent_test_unowned">
						<!---
							<cfoutput><b>Sector:</b> #adjacent_test_unowned.SWSectors_ID# (#adjacent_test_unowned.path_1#,#adjacent_test_unowned.path_2#,#adjacent_test_unowned.path_3#,#adjacent_test_unowned.path_4#,#adjacent_test_unowned.path_5#)</cfoutput><br>
						--->
							<cfif adjacent_test_unowned.path_1 IS NOT 0>
								<cfif NOT ListContainsNoCase(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_1)>
									<!--- <cfoutput>checking: #adjacent_test_unowned.path_1#</cfoutput><br> --->
									<cfquery datasource="#currentdatasource#" name="test_this_link">
										SELECT SWSectors.SWSectors_ID FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#current_team#)) AND (SWSectors.SWSectors_ID = #adjacent_test_unowned.path_1#)
									</cfquery> 
									<!---
									result:---> <cfif test_this_link.recordcount IS 0><!--- 0 ---><cfset test_sectors_list_adjacent_to_no_check = ListAppend(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_1)><cfelse><!---1---><cfif NOT ListContainsNoCase(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)><cfset final_sectors_unowned_can_challenge = ListAppend(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)></cfif></cfif><!---<br>--->
									
								</cfif>
							</cfif>	
							<cfif adjacent_test_unowned.path_2 IS NOT 0>
								<cfif NOT ListContainsNoCase(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_2)>
								<!---
									<cfoutput>checking: #adjacent_test_unowned.path_2#</cfoutput><br>
								--->
									<cfquery datasource="#currentdatasource#" name="test_this_link">
										SELECT SWSectors.SWSectors_ID FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#current_team#)) AND (SWSectors.SWSectors_ID = #adjacent_test_unowned.path_2#)
									</cfquery> 
								<!---
									result: ---><cfif test_this_link.recordcount IS 0><!---0---><cfset test_sectors_list_adjacent_to_no_check = ListAppend(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_2)><cfelse><!---1---><cfif NOT ListContainsNoCase(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)><cfset final_sectors_unowned_can_challenge = ListAppend(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)></cfif></cfif><!--- <br> --->
									
								</cfif>
							</cfif>	
							<cfif adjacent_test_unowned.path_3 IS NOT 0>	
								<cfif NOT ListContainsNoCase(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_3)>	
									<!--- <cfoutput>checking: #adjacent_test_unowned.path_3#</cfoutput><br> --->
									<cfquery datasource="#currentdatasource#" name="test_this_link">
										SELECT SWSectors.SWSectors_ID FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#current_team#)) AND (SWSectors.SWSectors_ID = #adjacent_test_unowned.path_3#)
									</cfquery> 
									<!--- result: ---> <cfif test_this_link.recordcount IS 0><!--- 0 ---><cfset test_sectors_list_adjacent_to_no_check = ListAppend(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_3)><cfelse><!---1---><cfif NOT ListContainsNoCase(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)><cfset final_sectors_unowned_can_challenge = ListAppend(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)></cfif></cfif><!--- <br> --->
									
								</cfif>
							</cfif>	
							<cfif adjacent_test_unowned.path_4 IS NOT 0>
								<cfif NOT ListContainsNoCase(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_4)>
									<!--- <cfoutput>checking: #adjacent_test_unowned.path_4#</cfoutput><br> --->
									<cfquery datasource="#currentdatasource#" name="test_this_link">
										SELECT SWSectors.SWSectors_ID FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#current_team#)) AND (SWSectors.SWSectors_ID = #adjacent_test_unowned.path_4#)
									</cfquery> 
									<!--- result: ---> <cfif test_this_link.recordcount IS 0><!--- 0 ---><cfset test_sectors_list_adjacent_to_no_check = ListAppend(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_4)><cfelse><!--- 1 ---><cfif NOT ListContainsNoCase(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)><cfset final_sectors_unowned_can_challenge = ListAppend(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)></cfif></cfif><!--- <br>	--->
									
								</cfif>
							</cfif>	
							<cfif adjacent_test_unowned.path_5 IS NOT 0>
								<cfif NOT ListContainsNoCase(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_5)>	
									<!--- <cfoutput>checking: #adjacent_test_unowned.path_5#</cfoutput><br> --->
									<cfquery datasource="#currentdatasource#" name="test_this_link">
										SELECT SWSectors.SWSectors_ID FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#current_team#)) AND (SWSectors.SWSectors_ID = #adjacent_test_unowned.path_5#)
									</cfquery> 
									<!--- result: ---> <cfif test_this_link.recordcount IS 0><!---0---><cfset test_sectors_list_adjacent_to_no_check = ListAppend(test_sectors_list_adjacent_to_no_check,adjacent_test_unowned.path_5)><cfelse><!--- 1---><cfif NOT ListContainsNoCase(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)><cfset final_sectors_unowned_can_challenge = ListAppend(final_sectors_unowned_can_challenge,adjacent_test_unowned.SWSectors_ID)></cfif></cfif><!--- <br>	--->
									
								</cfif>
							</cfif>	
						</cfloop>

						<cfset final_sectors_can_challenge = final_sectors_owned_can_challenge>
						<cfif (final_sectors_owned_can_challenge IS NOT '') AND (final_sectors_unowned_can_challenge IS NOT '')>
							<cfset final_sectors_can_challenge = final_sectors_can_challenge & ','>
						</cfif>
						<cfset final_sectors_can_challenge = final_sectors_can_challenge & final_sectors_unowned_can_challenge>
						<!---
						final list of sectors can challenge:<cfoutput>#final_sectors_can_challenge#</cfoutput><p>
						--->
						<cfif (final_sectors_can_challenge IS NOT '')>
							<cfquery datasource="#currentdatasource#" name="final_challenge">
								SELECT	SWSectors_Graph.SWSectors_ID, SWSectors_Graph.path_1, SWSectors_Graph.path_2, SWSectors_Graph.path_3, SWSectors_Graph.path_4, SWSectors_Graph.path_5
										 ,SWSectors.SectorName, SWSectors.Entry_Node
										 ,SWSquads.SquadName ,SWSquads.SquadID  
								FROM	(SWSectors INNER JOIN SWSectors_Graph ON (SWSectors_Graph.SWSectors_ID = SWSectors.SWSectors_ID)) LEFT OUTER JOIN SWSquads ON SWSectors.SectorSquad = SWSquads.SquadID
								WHERE	((SWSectors.SWSectors_ID IN (#final_sectors_can_challenge#)) AND (SWSectors.League_ID = #leagueid#))
								ORDER BY SWSectors_Graph.SWSectors_ID	
							</cfquery>
							<cfset canchallenge=1>
						<cfelse>
							<cfquery datasource="#currentdatasource#" name="final_challenge">
								SELECT	SWSectors_Graph.SWSectors_ID, SWSectors_Graph.path_1, SWSectors_Graph.path_2, SWSectors_Graph.path_3, SWSectors_Graph.path_4, SWSectors_Graph.path_5
										 ,SWSectors.SectorName, SWSectors.Entry_Node
										 ,SWSquads.SquadName ,SWSquads.SquadID  
								FROM	(SWSectors INNER JOIN SWSectors_Graph ON (SWSectors_Graph.SWSectors_ID = SWSectors.SWSectors_ID)) LEFT OUTER JOIN SWSquads ON SWSectors.SectorSquad = SWSquads.SquadID
								WHERE	1 = 0
							</cfquery>
							<cfset canchallenge=0>
						</cfif>
						
						<!--- GET MATCHES --->
						
						<cfquery name="count_challenger" datasource="#currentdatasource#">
							SELECT SWMatches.SWCode, SWMatches.SWSector_ID
							FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
							WHERE (SWMatches.SWSquad1 = #session.squadid#) AND (SWSectors.League_ID = #leagueid#)
						</cfquery>

						
						<cfset canchallenge=1>
						<cfset canchallengeunclaimed=1>
						<cfset canchallengeowned=1>
						<cfif count_challenger.recordcount IS NOT 0>
							<cfloop query="count_challenger">
								<cfquery name="check_sector" datasource="#currentdatasource#">
									SELECT SWSectors_ID, SectorName, SectorSquad
									FROM SWSectors
									WHERE (SWSectors_ID = #count_challenger.SWSector_ID#) AND (SWSectors.League_ID=#leagueid#)
								</cfquery>
								 <!--- <cfoutput>#check_sector.recordcount#,#check_sector.SectorSquad#</cfoutput><p>  --->
								<cfif (check_sector.sectorsquad IS 0) OR (check_sector.sectorsquad IS '')><cfset canchallengeunclaimed=0><cfelse><cfset canchallengeowned=0></cfif>
							</cfloop>
						</cfif>
						
						
						<!-- show challenge status --->
						
						
						<cfset optionstring=''>
						<cfset ownedstring=''>
						<cfset unownedstring=''>
						<cfset validchallenge=0>									
						<cfif canchallenge>
						<!--- <cfform action="_challengeack.cfm"> --->
						<div class="title">Map Status:</div><p>
						<!--- <select name="challenge_sector"> --->
						<div class="copy">
							<cfoutput query="final_challenge">
								<cfif SquadID IS NOT '' AND canchallengeowned>
									<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
										SELECT SWMatches.*
										FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
										WHERE ((SWMatches.swsquad2)=#final_challenge.SquadID#) AND (SWSectors.League_ID = #leagueid#)
									</cfquery>	
										<cfif (get_currentpath_matchcount.recordcount LT CHALLENGED_MAX)>
										
											<cfquery datasource="#currentdatasource#" name="check_for_already_challenged">
												SELECT *
												FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
												WHERE (SWSector_ID = #final_challenge.SWSectors_ID#) AND (SWSectors.League_ID = #leagueid#)
											</cfquery>								
											
											<cfif check_for_already_challenged.recordcount IS 0>
												<cfset optionstring= optionstring & '<option value="#final_challenge.SWSectors_ID#,#final_challenge.SquadID#">#final_challenge.SquadName# for #final_challenge.SectorName# - #final_challenge.SWSectors_ID#'>
												<cfif ownedstring IS NOT ''><cfset ownedstring=ownedstring&','></cfif>
												<cfset ownedstring=ownedstring&final_challenge.SWSectors_ID>
												<cfset validchallenge=1>
											</cfif>
											
										<cfelse>
											You cannot challenge #fetch_squadnames.SquadName# for Claimed sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>
										</cfif>
						
										
								
								</cfif>
								<cfif SquadID IS '' AND canchallengeunclaimed>
								
									<cfquery datasource="#currentdatasource#" name="check_for_already_challenged">
										SELECT *
										FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
										WHERE (SWSector_ID = #final_challenge.SWSectors_ID#) AND (SWSectors.League_ID = #leagueid#)
									</cfquery>
						
								<cfif check_for_already_challenged.recordcount IS NOT 0>
									You cannot challenge for Sector: #final_challenge.SWSectors_ID# - #final_challenge.sectorname# because it has currently been challenged.<br>
								<cfelse>
									<cfquery datasource="#currentdatasource#" name="final_challenge_graph">
										SELECT *
										FROM SWSectors_graph
										WHERE SWSectors_graph.SWSectors_ID = #final_challenge.SWSectors_ID#
									</cfquery>
						
									<cfquery datasource="#currentdatasource#" name="canchallengeunclaimed_adjacent_test_unowned">
										SELECT *
										,(SELECT SWSectors.SectorSquad FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#session.squadid#)) AND (SWSectors.SWSectors_ID = #final_challenge_graph.path_1#)) AS owner_path_1
										,(SELECT SWSectors.SectorSquad FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#session.squadid#)) AND (SWSectors.SWSectors_ID = #final_challenge_graph.path_2#)) AS owner_path_2
										,(SELECT SWSectors.SectorSquad FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#session.squadid#)) AND (SWSectors.SWSectors_ID = #final_challenge_graph.path_3#)) AS owner_path_3
										,(SELECT SWSectors.SectorSquad FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#session.squadid#)) AND (SWSectors.SWSectors_ID = #final_challenge_graph.path_4#)) AS owner_path_4
										,(SELECT SWSectors.SectorSquad FROM SWSectors WHERE (SWSectors.SectorSquad NOT IN (0,#session.squadid#)) AND (SWSectors.SWSectors_ID = #final_challenge_graph.path_5#)) AS owner_path_5
										FROM SWSectors
										WHERE (SWSectors_ID = #final_challenge.SWSectors_ID#) AND (SWSectors.League_ID = #leagueid#)
									</cfquery>
									<cfloop query="canchallengeunclaimed_adjacent_test_unowned">
										<cfif (owner_path_1 IS NOT '') OR (owner_path_2 IS NOT '') OR (owner_path_3 IS NOT '') OR (owner_path_4 IS NOT '') OR (owner_path_5 IS NOT '')>
											<cfset previousused=0>
											<cfquery datasource="#currentdatasource#" name="fetch_squadnames">
												SELECT *
												FROM SWSquads 
												WHERE <cfif owner_path_1 IS NOT ''>(SquadID = #owner_path_1#)<cfset previousused=1></cfif>
													  <cfif owner_path_2 IS NOT ''><cfif previousused>OR<cfset previousused=0></cfif>(SquadID = #owner_path_2#)<cfset previousused=1></cfif>
													  <cfif owner_path_3 IS NOT ''> <cfif previousused>OR<cfset previousused=0></cfif>(SquadID = #owner_path_3#)<cfset previousused=1></cfif>
													  <cfif owner_path_4 IS NOT ''><cfif previousused>OR<cfset previousused=0></cfif>(SquadID = #owner_path_4#)<cfset previousused=1></cfif>
													  <cfif owner_path_5 IS NOT ''><cfif previousused>OR<cfset previousused=0></cfif>(SquadID = #owner_path_5#)<cfset previousused=1></cfif>
											</cfquery>
										</cfif>
										<cfset pathcheck=0>
										<cfif owner_path_1 IS NOT ''>
												<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
													SELECT SWMatches.*
													FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
													WHERE ((SWMatches.swsquad2)=#canchallengeunclaimed_adjacent_test_unowned.owner_path_1#) AND (SWSectors.League_ID = #leagueid#)
												</cfquery>	
												<cfif get_currentpath_matchcount.recordcount LT CHALLENGED_MAX>
														<cfset optionstring= optionstring & '<option value="#canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID#,#canchallengeunclaimed_adjacent_test_unowned.owner_path_1#">Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# vs. '>
															<cfloop query="fetch_squadnames"><cfif fetch_squadnames.SquadID IS canchallengeunclaimed_adjacent_test_unowned.owner_path_1><cfset optionstring= optionstring & '#fetch_squadnames.SquadName#'></cfif></cfloop> 
													<cfif unownedstring IS NOT ''><cfset unownedstring=unownedstring&','></cfif>
													<cfset unownedstring=unownedstring&canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID>															
													<cfset pathcheck=1>
													<cfset validchallenge=1>
												<cfelse>
													You cannot challenge #fetch_squadnames.SquadName# for Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>							
												</cfif>
										</cfif>
										<cfif owner_path_2 IS NOT ''>
												<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
													SELECT SWMatches.*
													FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
													WHERE ((SWMatches.swsquad2)=#canchallengeunclaimed_adjacent_test_unowned.owner_path_2#) AND (SWSectors.League_ID = #leagueid#)
												</cfquery>	
												<cfif get_currentpath_matchcount.recordcount LT CHALLENGED_MAX>
													<cfset optionstring= optionstring & '<option value="#canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID#,#canchallengeunclaimed_adjacent_test_unowned.owner_path_2#">Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# - '>
														<cfloop query="fetch_squadnames"><cfif fetch_squadnames.SquadID IS canchallengeunclaimed_adjacent_test_unowned.owner_path_2><cfset optionstring= optionstring & '#fetch_squadnames.SquadName#'></cfif></cfloop>
													<cfif unownedstring IS NOT ''><cfset unownedstring=unownedstring&','></cfif>
													<cfset unownedstring=unownedstring&canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID>															
													<cfset pathcheck=1>
													<cfset validchallenge=1>
												<cfelse>
													You cannot challenge #fetch_squadnames.SquadName# for Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>									
												</cfif>
										</cfif>
										<cfif owner_path_3 IS NOT ''>
												<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
													SELECT SWMatches.*
													FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
													WHERE ((SWMatches.swsquad2)=#canchallengeunclaimed_adjacent_test_unowned.owner_path_3#) AND (SWSectors.League_ID = #leagueid#)
												</cfquery>	
												<cfif get_currentpath_matchcount.recordcount LT CHALLENGED_MAX>				
													<cfset optionstring= optionstring & '<option value="#canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID#,#canchallengeunclaimed_adjacent_test_unowned.owner_path_3#">Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# - '>
														<cfloop query="fetch_squadnames"><cfif fetch_squadnames.SquadID IS canchallengeunclaimed_adjacent_test_unowned.owner_path_3><cfset optionstring= optionstring & '#fetch_squadnames.SquadName#'></cfif></cfloop>
													<cfif unownedstring IS NOT ''><cfset unownedstring=unownedstring&','></cfif>
													<cfset unownedstring=unownedstring&canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID>															
													<cfset pathcheck=1>
													<cfset validchallenge=1>
												<cfelse>
													You cannot challenge #fetch_squadnames.SquadName# for Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>								
												</cfif>
										</cfif>
										<cfif owner_path_4 IS NOT ''>
												<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
													SELECT SWMatches.*
													FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
													WHERE ((SWMatches.swsquad2)=#canchallengeunclaimed_adjacent_test_unowned.owner_path_4#) AND (SWSectors.League_ID = #leagueid#)
												</cfquery>	
												<cfif get_currentpath_matchcount.recordcount LT CHALLENGED_MAX>							
													<cfset optionstring= optionstring & '<option value="#canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID#,#canchallengeunclaimed_adjacent_test_unowned.owner_path_4#">Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# - '>
														<cfloop query="fetch_squadnames"><cfif fetch_squadnames.SquadID IS canchallengeunclaimed_adjacent_test_unowned.owner_path_4><cfset optionstring= optionstring & '#fetch_squadnames.SquadName#'></cfif></cfloop>
													<cfif unownedstring IS NOT ''><cfset unownedstring=unownedstring&','></cfif>
													<cfset unownedstring=unownedstring&canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID>															
													<cfset pathcheck=1>
													<cfset validchallenge=1>
												<cfelse>
													You cannot challenge #fetch_squadnames.SquadName# for Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>							
												</cfif>							
										</cfif>				
										<cfif owner_path_5 IS NOT ''>
												<cfquery name="get_currentpath_matchcount" datasource="#currentdatasource#">
													SELECT SWMatches.*
													FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
													WHERE ((SWMatches.swsquad2)=#canchallengeunclaimed_adjacent_test_unowned.owner_path_5#) AND (SWSectors.League_ID = #leagueid#)
												</cfquery>	
												<cfif get_currentpath_matchcount.recordcount LT CHALLENGED_MAX>					
													<cfset optionstring= optionstring & '<option value="#canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID#,#canchallengeunclaimed_adjacent_test_unowned.owner_path_5#">Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# - '>
														<cfloop query="fetch_squadnames"><cfif fetch_squadnames.SquadID IS canchallengeunclaimed_adjacent_test_unowned.owner_path_5><cfset optionstring= optionstring & '#fetch_squadnames.SquadName#'></cfif></cfloop>
													<cfif unownedstring IS NOT ''><cfset unownedstring=unownedstring&','></cfif>
													<cfset unownedstring=unownedstring&canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID>															
													<cfset pathcheck=1>
													<cfset validchallenge=1>
												<cfelse>
													You cannot challenge #fetch_squadnames.SquadName# for Unclamined sector #canchallengeunclaimed_adjacent_test_unowned.SectorName# - #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# because #fetch_squadnames.SquadName# has already been challenged the maximum of #challenged_max# times.<br>									
												</cfif>							
										</cfif>								
										
										<cfif NOT pathcheck>You cannot challenge for Sector: #canchallengeunclaimed_adjacent_test_unowned.SWSectors_ID# - #canchallengeunclaimed_adjacent_test_unowned.SectorName# because there are no available teams adjacent to this sector.<br></cfif>
										
									</cfloop>
								</cfif>			
								</cfif>
							</cfoutput>
						<br>
							<!--- <cfif validchallenge><input type="submit" value="Generate Match Code"><cfelse>There are no sectors you can challenge at this time.</cfif> --->
							<cfif NOT validchallenge>There are no sectors you can challenge at this time.<br>
								 <cfif NOT canchallengeunclaimed>You have already challenged an unclaimed sector.<br></cfif>
								 <cfif NOT canchallengeowned>You have already challenged a claimed sector.<br></cfif>
							</cfif>
						<!--- </cfform> --->
						<cfelse>
						You have filled your available challenge slots.
						</cfif>	
						</div>
						

				<cfif leagueid IS 1>
					<center>
						<cfset session.owned=ownedstring>
						<cfset session.unclaimed=unownedstring>
						<cfset session.show_challenge=1>
						<cfinclude template='#relativepath#leagues/1/map.cfm'>
						<cfset session.show_challenge=0>
					</center>
				<cfelseif leagueid IS 2>
					<center>
						<cfset session.owned=ownedstring>
						<cfset session.unclaimed=unownedstring>
						<cfset session.show_challenge=1>
						<cfinclude template='#relativepath#leagues/2/map.cfm'>
						<cfset session.show_challenge=0>
					</center>				
				<cfelseif leagueid IS 3>
				<cfelseif leagueid IS 4>
				</cfif>							
													
						<cfif validchallenge>
							<cfform action="_challengeack.cfm">
							Challenge 
							<select name="challenge_sector">
								<cfoutput>#optionstring#</cfoutput>	
							</select>	
							<input type="hidden" name=leagueid value="<cfoutput>#leagueid#</cfoutput>">
<!--- Scheduling stuff --->



<!--- END Scheduling stuff --->
							
							
							
							
							<input type="submit" value="Generate Match Code">
							</cfform>
						</cfif>

							<!--- show current matches --->
							<cfquery name="get_matches" datasource="#currentdatasource#">
							SELECT SWMatches.*
									,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad1) AS Challenger
									,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad2) AS Challenged
									,(SELECT SectorName FROM SWSectors WHERE SWSectors_ID = SWSector_ID) AS SWSector
							FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
							WHERE (((SWMatches.swsquad1)=#session.squadid#) OR ((SWMatches.swsquad2)=#session.squadid#)) AND (SWSectors.League_ID = #leagueid#)
							</cfquery>		
								
								<p>
								<div class="title">Pending Matches In This League:</div>
								<p>
								<cfif get_matches.recordcount IS 0>
									<div class="copy">No matches at this time.</div>
									<cfelse>
										<cfoutput query="get_matches">
											<div class="copy">
												<cfif SWSquad1 IS session.squadid>
													Your squad has challenged #Challenged# for control of Sector #SWSector_ID# #SWSector#, match code: <b>#SWCode#</b>.<br>
												<cfelse>
													Squad #Challenger# has challenged your squad for control of Sector #SWSector_ID# #SWSector#, match code: <b>#SWCode#</b>.<br>
												</cfif>
											
											</div>
										</cfoutput>
								</cfif>
								<p>	
								<!--- show current matches --->						
						
						<!--- GET SECTORS --->
							
								<cfquery name="get_sectors" datasource="#currentdatasource#">
									SELECT *
									FROM SWSectors
									WHERE (SectorSquad = #session.squadid#) AND (SWSectors.League_ID = #leagueid#)
								</cfquery>
						
								<p>
						
							
								<p>
								<div class="title">Your Squad Holds the Following Systems In This League:</div>	
								<p>
									
									<table border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
									<tr>
											<td bgcolor="" align=left><div class="copy"><b>Sector ID</b></b></div></td>
											<td bgcolor="" align=left><div class="copy"><b>System Name</b></div></td>
											<td bgcolor=""><div class="copy"><b>Held Since</b></div></td>								
									</tr>
									<cfoutput query="get_sectors">
										<tr>
											<td bgcolor="" align=left><div class="copy">&nbsp;#SwSectors_ID#</div></td>
											<td bgcolor="" align=left><div class="copy">&nbsp;#SectorName#</div></td>
											<td bgcolor=""><div class="copy">&nbsp;<cfif SectorTime IS '0'>Creation<cfelse><cfset helddate=DateAdd('s',SectorTime,CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(helddate,'hh:mm tt')# #DateFormat(helddate,'mm.dd.yyyy')#</cfif> GMT</div></td>
										</tr>
									</cfoutput>
									</table>	
							
							
						<cfelse>
							Invalid Squad Name or Password.  You need to log back in to your squad to reset your session variables.
						</cfif>

</cfif>					
			</td></tr></table>			
		</center>					
<cfset session.challenging=1>								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

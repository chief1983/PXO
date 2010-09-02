<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
					<!--- start menu main --->
					<img src="<cfoutput>#relativepath#</cfoutput>images/main/header.jpg" width=110 height=207 alt="" border="0"><br>
						
							<img src="<cfoutput>#relativepath#</cfoutput>images/menu/actions.gif" width=110 height=25 alt="" border="0"><br>
							<table width="100%" cellpadding=0 cellspacing=0 border=0>
								<tr>
									<td background="" valign="top">
										<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=5 height=1 alt="" border="0"><br>
									</td>
									<td background="" valign="top">
										<div class="copy">
											<font color="white"><b>General:</b></font><br>
											<a href="<cfoutput>#relativepath#</cfoutput>_logout.cfm">Log Out</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>enlist/">Enlist</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>recruits/">Recruit Board</a><br>	
											<a href="<cfoutput>#relativepath#</cfoutput>create/">Create a Squad</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>join/">Join a Squad</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>squads/admin.cfm">Admin Squad</a><br>

											<p>
						

											<font color="white"><b>Challenges:</b></font><br>
											<cfquery datasource="#currentdatasource#" name="get_thissquadsectorcount">
												SELECT SWSectors.SectorName FROM SWSectors WHERE (SWSectors.SectorSquad = #session.SquadId#) AND (SWSectors.League_ID = #leagueID#)				
											</cfquery>
											
											<cfif get_thissquadsectorcount.recordcount GT 0>
												<a href="challenge.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Make Challenge</a>
												<cfelse>
												<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
													SELECT *
													FROM SWSectors
													WHERE (Entry_Node=1) AND (SectorSquad=0) AND (SWSectors.League_ID = #leagueID#)
													<!--- WHERE SectorSquad=0 --->
												</cfquery>
												
												<cfif check_entry_nodes.recordcount GT 0>
														<a href="entermap.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Enter Map</a>
													<cfelse>
														<cfquery datasource="#currentdatasource#" name="check_entry_nodes_challenge">
															SELECT *
															FROM SWMatches
															WHERE (SWSquad1 = #session.squadid#) AND (League_ID = #leagueID#)
														</cfquery>
														<cfif check_entry_nodes_challenge.recordcount IS 0>
															<a href="challengeentrynode.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Entry Node</a>
														<cfelse>
															Entry Challenge Pending
														</cfif>
												</cfif>
											</cfif>
 
 											
											<p>
											<font color="white"><b>League:</b></font><br>
											<cfif isdefined("leagueid")><cfif leagueid IS NOT ''>
											<a href="<cfoutput>#relativepath#</cfoutput>league.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">League Map</a>
											<a href="<cfoutput>#relativepath#</cfoutput>leaguehistory.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">League History</a>
											<a href="<cfoutput>#relativepath#</cfoutput>leaguepending.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Pending Matches</a>
											</cfif></cfif>						
										</div>				
										&nbsp;<br>											
									</td>								
								</tr>
							</table>
			
							<img src="<cfoutput>#relativepath#</cfoutput>images/menu/info.gif" width=110 height=25 alt="" border="0"><br>
							<table background="" width="100%" cellpadding=0 cellspacing=0 border=0>
								<tr>
									<td background="" valign="top">
										<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=5 height=1 alt="" border="0"><br>
									</td>
									<td background="" valign="top">
										<div class="copy">
											<a href="<cfoutput>#relativepath#</cfoutput>index.cfm">News</a><br>	
											<a href="<cfoutput>#relativepath#</cfoutput>oldnews.cfm">News Archive</a><br>	
											<a href="<cfoutput>#relativepath#</cfoutput>missions/">Mission List</a><br>											
											<a href="<cfoutput>#relativepath#</cfoutput>staff/">Contact Staff</a><br>							
										</div>
										&nbsp;<br>														
									</td>
								</tr>
							</table>				
							<img src="<cfoutput>#relativepath#</cfoutput>images/menu/leages.gif" width=110 height=25 alt="" border="0"><br>
							<cfquery name="get_swleagues" datasource="#currentdatasource#">
								SELECT *
								FROM SWLeagues
								WHERE Active=1
								ORDER BY League_ID
							</cfquery>
			
							<table background="" width="100%" cellpadding=0 cellspacing=0 border=0>
								<tr>
									<td background="" valign="top">
										<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=5 height=1 alt="" border="0"><br>
									</td>
									<td background="" valign="top">
										<b>Active</b><br>
										<div class="copy">
											<cfoutput query="get_swleagues">
												<a href="#relativepath#league.cfm?leagueid=#League_ID#">#Title#</a><br>
											</cfoutput>				
										</div>			
										&nbsp;<br>		
										<cfquery name="get_old_swleagues" datasource="#currentdatasource#">
											SELECT *
											FROM SWLeagues
											WHERE Archived=1
											ORDER BY League_ID
										</cfquery>			
										<b>Closed</b><br>
										<div class="copy">
											<cfoutput query="get_old_swleagues">
												<a href="#relativepath#league.cfm?leagueid=#League_ID#">#Title#</a><br>
											</cfoutput>				
										</div>																			
									</td>									
								</tr>
							</table>	
							<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=110 height=1 alt="" border="0"><br>
						<!--- end menu main --->	

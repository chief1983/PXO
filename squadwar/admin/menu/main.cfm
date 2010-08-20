<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

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
											<a href="pending_squads.cfm">Pending Squads</a><br>
											<a href="pendingmatches.cfm">Pending Matches</a>
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
											<a href="index.cfm">News</a><br>	
											<a href="oldnews.cfm">News Archive</a><br>												
											<a href="staff/">Contact Staff</a><br>						
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
								ORDER BY Title
							</cfquery>
			
							<table background="" width="100%" cellpadding=0 cellspacing=0 border=0>
								<tr>
									<td background="" valign="top">
										<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=5 height=1 alt="" border="0"><br>
									</td>
									<td background="" valign="top">
										<div class="copy">
											<cfoutput query="get_swleagues">
												<a href="league.cfm?leagueid=#League_ID#">#Title#</a>
											</cfoutput>				
										</div>			
										&nbsp;<br>										
									</td>									
								</tr>
							</table>	
							<img src="<cfoutput>#relativepath#</cfoutput>images/spacer.gif" width=110 height=1 alt="" border="0"><br>
						<!--- end menu main --->	

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
											<a href="../_logout.cfm">Log Out</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>enlist/">Enlist</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>recruits/">Recruit Board</a><br>										
											<a href="<cfoutput>#relativepath#</cfoutput>create/">Create a Squad</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>join/">Join a Squad</a><br>
											<a href="<cfoutput>#relativepath#</cfoutput>squads/admin.cfm">Admin Squad</a><br>
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

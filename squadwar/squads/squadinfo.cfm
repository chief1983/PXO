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
					 			,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
					 			,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
					 	FROM SWSquads 
					 	WHERE (squadid=#id#) AND (Active=1) 
					 </cfquery>
					 <cfquery name="get_squad_info" datasource="#currentdatasource#">
					 	SELECT *
					 	FROM SWSquad_Info
					 	WHERE (squadid=#id#)
					 </cfquery>
					 <cfset validdata=0>
					
					<cfif get_squad_info.recordcount IS NOT 0>
					 <cfset squadleader_trackerid=get_squad_info.Squad_Leader_ID>
					 <cfquery datasource="PXO" name="get_squad_leader">
					 	SELECT Email, Login 
					 	FROM users 
					 	WHERE TrackerID = '#squadleader_trackerid#'
					 </cfquery>		
					 <cfif get_squad_leader.recordcount IS NOT 0>
					 	<cfset validdata=1>		
						</cfif>
					</cfif>
					<div class="title">Squad Information</div>

					 	<table>
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Team Name:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfoutput query="get_squad"><a href="squadlogin.cfm?id=#id#<cfif isdefined("leagueid")>&leagueid=#leagueid#</cfif>">#squadname#</a></cfoutput></div>
					 			</td>
								</tr>
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Squad Leader:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfif (validdata) AND (get_squad_leader.recordcount IS NOT 0)><cfoutput>#get_squad_leader.Login#</cfoutput><cfelse>*yet to be determined</cfif></div>
					 			</td>
					 		</tr>			
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Squad Email:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfoutput query="get_squad_info"><a href="mailto:#squad_email#">#squad_email#</a></cfoutput></div>
					 			</td>
					 		</tr>	
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Squad Leader ICQ:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfif (validdata) AND (get_squad_info.Squad_Leader_ICQ IS NOT '')><cfoutput>#get_squad_info.Squad_Leader_ICQ#</cfoutput><cfelse>*yet to be determined</cfif></div>
					 			</td>
					 		</tr>		
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Squad IRC:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfif (validdata) AND (get_squad_info.Squad_IRC IS NOT '')><cfoutput>#get_squad_info.Squad_IRC#</cfoutput><cfelse>*yet to be determined</cfif></div>
					 			</td>
					 		</tr>		
					 		<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Web Link:</div>
					 			</td>
					 			<td valign="top" align=left>
					 				<div class="copy"><cfif (validdata) AND (get_squad_info.Squad_Web_Link IS NOT '')><cfoutput><a href="#get_squad_info.Squad_Web_Link#">#get_squad_info.Squad_Web_Link#</a></cfoutput><cfelse>*yet to be determined</cfif></div>
					 			</td>
					 		</tr>	
									<tr>
					 			<td valign="top" align=right>
					 				<div class="copy">Roster:</div>
					 			</td>
					 			<td align=left>
									<cfset querystring=''>
					 				<cfloop query="get_squad">
										<cfset querystring="('" & get_squad.squadmembers & "')">
									</cfloop>
					 				<cfset querystring=replace(querystring, "," , "','", "ALL")>
					 				<cfquery datasource="PXO" name="getpilotnames">
					 					SELECT Email, Login 
					 					FROM users 
					 					WHERE TrackerID IN #PreserveSingleQuotes(querystring)# 
					 				</cfquery>			
					 				<cfif getpilotnames.recordcount IS NOT 0>
					 						<div class="copy"><cfoutput query="getpilotnames"><a href="mailto:#email#">#Login#</a><br></cfoutput></div>
					 					<cfelse>
					 						<div class="copy">*yet to be determined</div>
					 				</cfif>			
					 			</td>
					 		</tr>	
					 	</table>
					<p>
					<div class="title">Ribbons and Medals:</div>
					<p>
					<cfif get_squad_info.ribbon_1><img src="../images/ribbons/swr_1.gif" width=80 height=20 alt="SquadWar Pre-Registered Squadron" border="0"></cfif>
					<cfif get_squad_info.ribbon_2><img src="../images/ribbons/swr_2.gif" width=80 height=20 alt="SquadWar Founding Member" border="0"></cfif>
					<cfif get_squad_info.ribbon_3><img src="../images/ribbons/swr_3.gif" width=80 height=20 alt="SquadWar First Match Participant" border="0"></cfif>
					<cfif get_squad_info.ribbon_4><img src="../images/ribbons/swr_4.gif" width=80 height=20 alt="SquadWar First Match Victor" border="0"></cfif>
					<cfif get_squad_info.ribbon_5><img src="../images/ribbons/swr_5.gif" width=80 height=20 alt="Defeated V_Summoner (Volition Squad)" border="0"></cfif>
					<cfif get_squad_info.ribbon_6><img src="../images/ribbons/swr_6.gif" width=80 height=20 alt="Defeated escentDay ourFay (Volition Squad)" border="0"></cfif><p>
					
					<cfif get_squad_info.medal_1><img src="../images/ribbons/swm_1.jpg" width=101 height=214 alt="SquadWar Medal for Exceptional Conduct" border="0"></cfif><p>
					
					
					
					<!--- GET MATCHES --->
					<cfif isdefined("leagueid")>
					 <cfif Trim(leagueid) IS NOT ''>
					 				
					 				
					 					<cfquery name="get_matches" datasource="#currentdatasource#">
					 					SELECT SWMatches.*
					 							,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.SWSquad1) AS Challenger
					 							,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.SWSquad2) AS Challenged
					 							,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = SWMatches.SWSector_ID) AS SWSector
					 					FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
					 					WHERE (((SWMatches.swsquad1)=#id#) OR ((SWMatches.swsquad2)=#id#)) AND (SWSectors.League_ID = #leagueid#)
					 					</cfquery>		
					 						
					 						<p>
					 						<div class="title">Pending Matches in This League:</div>
					 						<p>
					 						<cfif get_matches.recordcount IS 0>
					 							<div class="copy">No matches at this time.</div>
					 							<cfelse>
					 								<ol>
					 								<cfoutput query="get_matches">
					 									<li><div class="copy">Squad <cfif get_matches.SWSquad1 IS NOT id><a href="squadinfo.cfm?id=#SWSquad1#&leagueid=#leagueid#">#Challenger#</a><cfelse>#Challenger#</cfif> has challenged <cfif get_matches.SWSquad2 IS NOT id><a href="squadinfo.cfm?id=#SwSquad2#">#Challenged#</a><cfelse>#Challenged#</cfif> for control of #SWSector#.</div>
					 								</cfoutput>
					 								</ol>
													
					 						</cfif>

					 						
					 							<br clear="all">
													
					 				<!--- GET SECTORS --->
					 					
					 						<cfquery name="get_sectors" datasource="#currentdatasource#">
					 							SELECT *
					 							FROM SWSectors
					 							WHERE (SectorSquad = #id#) AND (SWSectors.League_ID = #leagueid#)
					 						</cfquery>
					 				

					 						<div class="title">This Squad Holds the Following Systems in This League:</div>	
					 						<p>
												<cfif get_sectors.recordcount GT 0>
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
						 									<td bgcolor=""><div class="copy">&nbsp;<cfif SectorTime IS '0'>Creation<cfelse><cfset helddate=DateAdd('s',Evaluate(SectorTime-21600),CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(helddate,'hh:mm tt')# #DateFormat(helddate,'mm.dd.yyyy')#</cfif> CST</div></td>
						 								</tr>
						 							</cfoutput>
						 							</table>		
												<cfelse>
													<div class="copy">This team holds no sectors in this league.</div>
												</cfif>	
													
					 				<!--- END GET MATCHES --->		
					 						
					 					
					 				<!---
					 						<cfquery name="get_matches" datasource="#currentdatasource#">
					 						SELECT DISTINCTROW SWMatches.*, SWSquads.SquadName AS Challenger, SWSquads_1.SquadName AS Challenged, SWSquads.SquadID AS ChallengerID, SWSquads_1.SquadID AS ChallengedID
					 						FROM SWSquads AS SWSquads_1 INNER JOIN (SWSquads INNER JOIN SWMatches ON SWSquads.SquadId = SWMatches.SWSquad1) ON SWSquads_1.SquadId = SWMatches.SWSquad2
					 						WHERE (swsquad1 = #id#) OR (swsquad2 = #id#)
					 						</cfquery>
					 						
					 						<p>
					 						<div class="newsitemtitle">Pending Matches:</div>
					 						<p>
					 						<cfif get_matches.recordcount IS 0>
					 							<div class="copy">No matches at this time.</div>
					 							<cfelse>
					 								<ol>
					 								<cfoutput query="get_matches">
					 									<li><div class="copy">Squad <cfif get_matches.ChallengerID IS NOT id><a href="squadinfo.cfm?id=#ChallengerID#">#Challenger#</a><cfelse>#Challenger#</cfif> has challenged <cfif get_matches.ChallengedID IS NOT id><a href="squadinfo.cfm?id=#ChallengedID#">#Challenged#</a><cfelse>#Challenged#</cfif> for control of #SWSector#.</div>
					 								</cfoutput>
					 								</ol>
					 						</cfif>
					 						<p>
					 				--->		
					 				
					 				
					 						<cfquery name="match_history" datasource="#currentdatasource#">
					 							SELECT match_history.*
					 									,SWSectors.SectorName AS SWSector
					 									,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_victor) AS Victor
					 									,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_loser) AS Loser
					 							FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )
					 							WHERE ((match_history.match_victor = #id#) OR (match_history.match_loser = #id#)) AND (SWSectors.League_ID = #leagueid#)
					 						</cfquery>
					 											
					 						<p>
					 						<div class="title">Match History in This League</div>	
					 						<p>
					 						
					 						<cfif match_history.recordcount IS 0>
					 						
					 						<div class="copy">
					 							This squad has no match history yet.
					 						</div>
					 						
					 						<cfelse>
					 						<center>
					 							<table width="90%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
					 							<tr>
					 									<td bgcolor="" align=left><div class="copy"><b>System Name</b></div></td>
					 									<td bgcolor=""><div class="copy"><b>Victor</b></div></td>
					 									<td bgcolor=""><div class="copy"><b>Loser</b></div></td>
					 									<td bgcolor=""><div class="copy"><b>Match Time</b></div></td>								
					 							</tr>
					 							<cfoutput query="match_history">
					 								<tr>
					 									<td bgcolor="" align=left><div class="copy">&nbsp;#SWSector#</div></td>
					 									<td bgcolor=""><div class="copy">&nbsp;<cfif match_victor IS id><b>#victor#</b><cfelse>#victor#</cfif></div></td>
					 									<td bgcolor=""><div class="copy">&nbsp;<cfif match_loser IS id><b>#loser#</b><cfelse>#loser#</cfif></div></td>
					 									<td bgcolor=""><div class="copy">&nbsp;<cfif match_time IS '0'>Creation<cfelse><cfset matchdate=DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(matchdate,'hh:mm tt')# #DateFormat(matchdate,'mm.dd.yyyy')#</cfif> CST</div></td>
					 								</tr>
					 							</cfoutput>
					 							</table>	
					 						</center>		
					 						</cfif>	
					 				
					 				
					 				<!--- END NEW STUFF --->
					 				
					 				<!--- End page info --->	
						</cfif>
					</cfif>
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

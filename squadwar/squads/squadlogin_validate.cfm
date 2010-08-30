<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist a Pilot">

<cfinclude template="#relativepath#doc_top.cfm">

<!--- preprocess login stuff --->
					<cfif NOT isdefined("id")>
							<cfif isdefined("form.id")>
								<cfset id=form.id>														
							<cfelseif isdefined("session.squadid")>
								<cfset id=session.squadid>							
							</cfif>							
						</cfif>
										
						<cfif id IS NOT ''>
							<cfquery name="get_squad" datasource="#currentdatasource#">
								SELECT *
								FROM SWSquads 
								WHERE (squadid=#id#) AND (Active=1)
							</cfquery>
							<cfset session.squadid=id>	
						</cfif>
						
						
						
						<cfif get_squad.recordcount IS 0>
							<cfset message=URLEncodedFormat('You have tried to access a squad which does not exist')>
							<cflocation url='#relativepath#/error/error.cfm?message=#message#'>
						</cfif>

										

						
						<cfset valid_login=0>
						<cfif isdefined("form.password")>
							<cfset session.squadpassword = form.password>
						</cfif>
						
						
						<cfif session.squadpassword IS NOT ''>
							<cfif get_squad.squadpassword IS session.squadpassword>
								<cfset valid_login=1>
							</cfif>
						</cfif>
						
					    <cfif NOT valid_login>
							<cfset message=URLEncodedFormat('Invalid squad password!')>
							<cflocation url='#relativepath#/error/error.cfm?message=#message#'>			
						</cfif>
						
						<cfset session.adminlastchosen=#id#>

<!--- end preprocess login stuff --->

<cfif isdefined("leagueid")>
	<cfinclude template="#relativepath#menu/league_loggedin_admin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/create_main.cfm">
</cfif>

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
<!---
						<cfif NOT isdefined("id")>
							<cfif isdefined("form.id")>
								<cfset id=form.id>														
							<cfelseif isdefined("session.squadid")>
								<cfset id=session.squadid>							
							</cfif>							
						</cfif>
										
						<cfif id IS NOT ''>
							<cfquery name="get_squad" datasource="#currentdatasource#">
								SELECT *
								FROM SWSquads 
								WHERE (squadid=#id#) AND (Active=1)
							</cfquery>
							<cfset session.squadid=id>	
						</cfif>
						
						
						
						<cfif get_squad.recordcount IS 0>
							<cfset message=URLEncodedFormat('You have tried to access a squad which does not exist')>
							<cflocation url='#relativepath#/error/error.cfm?message=#message#'>
						</cfif>

										
						<div class="title"><cfoutput query="get_squad">#SquadName#</cfoutput> Squad Management</div>	
						<p>
						
						<cfif isdefined("message")>
							<div class="copy"><cfoutput>#message#</cfoutput></div>
							<p>
						</cfif>
						
						<cfset valid_login=0>
						<cfif isdefined("form.password")>
							<cfset session.squadpassword = form.password>
						</cfif>
						
						
						<cfif session.squadpassword IS NOT ''>
							<cfif get_squad.squadpassword IS session.squadpassword>
								<cfset valid_login=1>
							</cfif>
						</cfif>
						
					    <cfif NOT valid_login>
							<cfset message=URLEncodedFormat('Invalid squad password!')>
							<cflocation url='#relativepath#/error/error.cfm?message=#message#'>			
						</cfif>
--->
						<div class="title"><cfoutput query="get_squad">#SquadName#</cfoutput> Squad Management</div>	
						<p>
						
						<cfif isdefined("message")>
							<div class="copy"><cfoutput>#message#</cfoutput></div>
							<p>
						</cfif>		
<cfif NOT isdefined("leagueid")>


				<cfquery datasource="#currentdatasource#" name="get_leagues">
					SELECT SWSquads_Leagues.Leagues
					FROM SWSquads_Leagues
					WHERE SWSquad_SquadID = #id#
				</cfquery>
				
				<cfset squadinleagues=''>
				<cfloop query="get_leagues">
					<cfif squadinleagues IS NOT ''><cfset squadinleagues=squadinleagues & ','></cfif>
					<cfset squadinleagues = squadinleagues & get_leagues.leagues>
				</cfloop>
				
				<cfif squadinleagues IS NOT ''>
				
				<cfquery datasource="#currentdatasource#" name="get_league_names">
					SELECT *
					FROM SWLeagues
					WHERE (SWLeagues.League_ID IN (#squadinleagues#)) AND (Archived <> 1)
				</cfquery>


				
				<div class="copy"><b>This Squad has signed up for the following leagues:</b></div>
				
				
				<div class="copy">
				<p>
				<i>Click on the league name(s) listed below to issue challenges and reach Admin options for that league.</i>
				<ul>
					<cfoutput query="get_league_names">
						<li><a href="squadlogin_validate.cfm?id=#id#&leagueid=#get_league_names.league_id#">#get_league_names.title#</a>
					</cfoutput>
				</ul>
				

				
				</div>
				</cfif>
				
				<div class="title">Administrative Options:</div>
				
				<div class="copy">
				<ul>
					<li><a href="join_league.cfm">Sign up for a league</a>
					<li><a href="squad_pending_matches.cfm">View pending matches for this squad and schedule matches</a>
					<li><a href="set_color.cfm">Set your squad color</a>
					<li><a href="edit_squad.cfm">Edit your squad's information</a>
				</ul>
				</div>
<!--- START PASTE --->
				<hr noshade color="#2E5537">	

				
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
					 	FROM Users 
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
					 					SELECT Email, Login, trackerid 
					 					FROM Users 
					 					WHERE TrackerID IN #PreserveSingleQuotes(querystring)# 
					 				</cfquery>			
					 				<cfif getpilotnames.recordcount IS NOT 0>									
										<table> 

						 						<cfoutput query="getpilotnames">
												<tr>
													<td>
													<div class="copy"><a href="mailto:#email#">#Login#</a><br></div>
													</td> 
													<td>
													<div class="copy"><a href="_remove_member_roster.cfm?memberid=#trackerid#"><font color="red">remove</font></a></div>
													</td>
													
												</tr>
												</cfoutput>
											</table>
					 						<cfelse>
											<div class="copy">This roster is empty</div>
					 				</cfif>			
					 			</td>
					 		</tr>	
					 	</table>
					<p>
					<div class="title">Ribbons and Medals:</div>
					<p>
					<cfoutput query="get_squad_info">
					<cfif get_squad_info.ribbon_1><img src="../images/ribbons/swr_1.gif" width=80 height=20 alt="SquadWar Pre-Registered Squadron" border="0"></cfif>
					<cfif get_squad_info.ribbon_2><img src="../images/ribbons/swr_2.gif" width=80 height=20 alt="SquadWar Founding Member" border="0"></cfif>
					<cfif get_squad_info.ribbon_3><img src="../images/ribbons/swr_3.gif" width=80 height=20 alt="SquadWar First Match Participant" border="0"></cfif>
					<cfif get_squad_info.ribbon_4><img src="../images/ribbons/swr_4.gif" width=80 height=20 alt="SquadWar First Match Victor" border="0"></cfif>
					<cfif get_squad_info.ribbon_5><img src="../images/ribbons/swr_5.gif" width=80 height=20 alt="Defeated V_Summoner (Volition Squad)" border="0"></cfif>
					<cfif get_squad_info.ribbon_6><img src="../images/ribbons/swr_6.gif" width=80 height=20 alt="Defeated escentDay ourFay (Volition Squad)" border="0"></cfif><p>
					
					<cfif get_squad_info.medal_1><img src="../images/ribbons/swm_1.jpg" width=101 height=214 alt="SquadWar Medal for Exceptional Conduct" border="0"></cfif><p>
					</cfoutput>
					
<!--- END PASTE --->				
				
<cfelse>

			
				<cfquery datasource="#currentdatasource#" name="get_league">
					SELECT *
					FROM SWLeagues
					WHERE (League_ID = #leagueid#)
				</cfquery>
				
				<div class="title">
					SquadWar <cfoutput>#get_league.title#</cfoutput> League
				</div>
				
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
				</cfif>				

				<cfquery datasource="#currentdatasource#" name="get_league_squads">
					SELECT *
					FROM SWSquads_Leagues
				</cfquery>
				
				<cfset squads_in_this_league=''>
				<cfloop query="get_league_squads">
					<cfif ListFind(get_league_squads.Leagues, leagueid)>
						<cfif squads_in_this_league IS NOT ''><cfset squads_in_this_league=squads_in_this_league & ','></cfif>
						<cfset squads_in_this_league=squads_in_this_league & get_league_squads.SWSquad_SquadID>
					</cfif>
				</cfloop>
<!---						
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active 
								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadId = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) OR (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode_challenger		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) ) AS CountOfSWCode_challenged								
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadId) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadId) OR (match_history.match_loser = SWSquads.SquadId)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,(SELECT Squad_Red FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Red
								,(SELECT Squad_Green FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Green
								,(SELECT Squad_Blue FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Blue
						FROM SWSquads LEFT JOIN SWSectors ON SWSquads.SquadId = SWSectors.SectorSquad
						WHERE SWSquads.SquadId IN (#squads_in_this_league#)
						GROUP BY SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active
						HAVING ((SWSquads.Active)=Yes)
						ORDER BY Count(SWSectors.SectorName) DESC , SWSquads.SquadName;
					</cfquery>	
--->
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active, SWSquads.SquadMembers

								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadId = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) OR (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode_Challenger
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) ) AS CountOfSWCode_Defender
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) ) AS CountOfSWCode_challenged	
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadId) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadId) OR (match_history.match_loser = SWSquads.SquadId)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,SWSquad_Info.Squad_Red AS Red, SWSquad_Info.Squad_Green AS Green, SWSquad_Info.Squad_Blue AS Blue, SWSquad_Info.power_rating
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadId = SWSquad_Info.SquadID
						WHERE (SWSquads.SquadId IN (#squads_in_this_league#)) AND (SWSquads.Active = YES)
						 ORDER BY power_rating DESC, SWSquads.SquadName		
					</cfquery>							 				

<!---
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active 
								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadId = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) OR (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadId) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadId) OR (match_history.match_loser = SWSquads.SquadId)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,(SELECT Squad_Red FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Red
								,(SELECT Squad_Green FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Green
								,(SELECT Squad_Blue FROM SWSquad_Info WHERE SWSquads.SquadId = SWSquad_Info.SquadId) AS Blue
						FROM SWSquads LEFT JOIN SWSectors ON SWSquads.SquadId = SWSectors.SectorSquad
						WHERE SWSquads.SquadId IN (#squads_in_this_league#)
						GROUP BY SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active
						HAVING ((SWSquads.Active)=Yes)
						ORDER BY Count(SWSectors.SectorName) DESC , SWSquads.SquadName;
					</cfquery>		
							
--->
							
							<cfset squadrank="0">
							<cfset notfoundsquadrank=1>
							<cfloop query="rank_count">
								<cfset squadrank=squadrank+1>
								<cfif session.squadid IS SquadID><cfbreak></cfif>
							</cfloop>
							<div class="copy">
							<cfoutput>Your Squad is currently ranked #squadrank# of #rank_count.recordcount#</cfoutput>
							</div>
							<p>
							
							
								<table width="90%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
									<tr><th align="center" colspan="9">The 10 opponents closest to your rank</td></tr>
									<tr>
										<td bgcolor="" align=left><div class="copy">&nbsp;</div></td>
										<td bgcolor=""><div class="copy"><b>Rank</b></div></td>
										<td bgcolor=""><div class="copy"><b>Squad Name</b></div></td>
										<td bgcolor=""><div class="copy"><b>League</b></div></td>
										<td bgcolor=""><div class="copy"><b>Overall</b></div></td>
										<td bgcolor=""><div class="copy"><b>Systems</b></div></td>								
										<td bgcolor=""><div class="copy"><b>Status</b></div></td>	
										<td bgcolor=""><div class="copy"><b>Challengers</b></div></td>	
										<td bgcolor=""><div class="copy"><b>Challenges</b></div></td>	
									</tr>
								
								<cfscript>
									/* initialize closest rank variables */
									looprank=1;
									startrow=squadrank-5;
									if (startrow LTE 0) { startrow=1; }
									endrow=startrow+10;
									if (endrow GT rank_count.recordcount)
										{ 
											endrow=rank_count.recordcount;
											startrow=endrow-10;
											if (startrow LT 1) { startrow = 1; }
										}
									displayrank=startrow;
								</cfscript>
						
						
								<cfif rank_count.recordcount IS NOT 0>
									<cfloop query="rank_count" startrow="#startrow#" endrow="#endrow#">
										<cfoutput>
											<cfif (Red IS '') OR (Green IS '') OR (Blue IS '')>
											<cfset teamcolor='000000'>
											<cfelse>
											<cfset convert_red = FormatBaseN(Red,16)>
											<cfset convert_green = FormatBaseN(Green,16)>
											<cfset convert_blue = FormatBaseN(Blue,16)>
											<cfif convert_red IS 0><cfset convert_red = '00'></cfif>
											<cfif convert_green IS 0><cfset convert_green = '00'></cfif>
											<cfif convert_blue IS 0><cfset convert_blue = '00'></cfif>
											<cfset teamcolor= convert_red & convert_green & convert_blue>
											</cfif>
												<tr>
													<td width=5 bgcolor="#teamcolor#" align=right><img src="images/spacer.gif" width=5 height=3 alt="" border="0"><br></td>
													<td bgcolor="" align=right><div class="copy">#displayrank#</div></td>
													<td bgcolor="" align=left><div class="copy">&nbsp;<cfif squadid IS session.squadid><b>#SquadName#</b><cfelse><a href="squadinfo.cfm?id=#squadid#&leagueid=#leagueid#">#SquadName#</a></cfif></div></td>
													<td bgcolor="" align=center><div class="copy"><cfif wins IS NOT ''>#Int(l_wins)#<cfelse>0</cfif>/<cfif totalmatches IS NOT ''>#Int(l_totalmatches)#<cfelse>0</cfif></div></td>
													<td bgcolor="" align=center><div class="copy"><cfif wins IS NOT ''>#Int(wins)#<cfelse>0</cfif>/<cfif totalmatches IS NOT ''>#Int(totalmatches)#<cfelse>0</cfif></div></td>
													<td bgcolor="" align=right><div class="copy"><cfif squadid IS session.squadid><cfset thissquadsectorcount=CountOfSectorName></cfif>#CountOfSectorName#</div></td>
													<td bgcolor="" align=right><div class="copy"><cfif CountOfSWCode_challenged LT 2>Available<cfelse>Challenged</cfif></div></td>
													<td bgcolor="" align=right><div class="copy">#CountOfSWCode_challenged#</div></td>
													<td bgcolor="" align=right><div class="copy">#CountOfSWCode_challenger#</div></td>
												</tr>
												<cfset displayrank=displayrank+1>
										</cfoutput>		
									</cfloop>
								</cfif>		
						</table>			
						
						<!--- POSE A CHALLENGE --->
						<!---
						<p>
						<div class="copy">
						
						<cfquery datasource="#currentdatasource#" name="get_thissquadsectorcount">
							SELECT SWSectors.SectorName FROM SWSectors WHERE (SWSectors.SectorSquad = #session.SquadId#) AND (SWSectors.League_ID = #leagueID#)				
						</cfquery>
						
						<cfif get_thissquadsectorcount.recordcount GT 0>
							<a href="challenge.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Pose a Challenge</a>
							<cfelse>
							<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
								SELECT *
								FROM SWSectors
								WHERE (Entry_Node=1) AND (SectorSquad=0)
							</cfquery>
							<cfif check_entry_nodes.recordcount GT 0>
									<a href="entermap.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Enter this Map</a>
								<cfelse>
									<cfquery datasource="#currentdatasource#" name="check_entry_nodes_challenge">
										SELECT *
										FROM SWMatches
										WHERE (SWSquad1 = #session.squadid#) OR (SWSquad2 = #session.squadID#)
									</cfquery>
									<cfif check_entry_nodes_challenge.recordcount IS 0>
										<a href="challengeentrynode.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Challenge Entry Node</a>
									</cfif>
							</cfif>
						</cfif>
						</div> 
						<p>
						--->
						<!--- GET MATCHES --->
						
							<cfquery name="get_matches" datasource="#currentdatasource#">
							SELECT SWMatches.*
									,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad1) AS Challenger
									,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad2) AS Challenged
									,(SELECT SectorName FROM SWSectors WHERE SWSectors_ID = SWSector_ID) AS SWSector
							FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
							WHERE ((SWMatches.swsquad1)=#session.squadid#) OR ((SWMatches.swsquad2)=#session.squadid#) AND (SWSectors.League_ID = #leagueid#)
							</cfquery>		
								
								<p>
								<div class="title">Pending Matches in This League:</div>
								<p>
								<cfif get_matches.recordcount IS 0>
									<div class="copy">No matches at this time.</div>
									<cfelse>
										<cfoutput query="get_matches">
											<div class="copy">
												<cfif SWSquad1 IS session.squadid>
													Your squad has challenged #Challenged# for control of sector #SWSector_ID# #SWSector#, match code: <b>#SWCode#</b>.<br>
												<cfelse>
													Squad #Challenger# has challenged your squad for control of #SWSector#, match code: <b>#SWCode#</b>.<br>
												</cfif>
											
											</div>
										</cfoutput>
								</cfif>
								<p>		
								
									<br clear="all">
						
						
						<!--- GET SECTORS --->
							
								<cfquery name="get_sectors" datasource="#currentdatasource#">
									SELECT *
									FROM SWSectors
									WHERE SectorSquad = #session.squadid# AND (SWSectors.League_ID = #leagueid#)
								</cfquery>
						
						
								<cfif get_sectors.recordcount GT 0>
								<div class="title">Your Squad Holds the Following Systems in This League:</div>	
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
											<td bgcolor=""><div class="copy">&nbsp;<cfif SectorTime IS '0'>Creation<cfelse><cfset helddate=DateAdd('s',Evaluate(SectorTime-21600),CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(helddate,'hh:mm tt')# #DateFormat(helddate,'mm.dd.yyyy')# CST</cfif></div></td>
										</tr>
									</cfoutput>
									</table>	
								<cfelse>
								<div class="title">Your squad holds no sectors in this league.</div>	
								<p>
								</cfif>
						
						
						
						
						<!--- MATCH HISTORY --->		
													<cfquery name="match_history" datasource="#currentdatasource#">
														SELECT match_history.*
																,SWSectors.SectorName AS SWSector
																,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_victor) AS Victor
																,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_loser) AS Loser
														FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )
														WHERE ((match_history.match_victor = #session.squadid#) OR (match_history.match_loser = #session.squadid#)) AND (SWSectors.League_ID = #leagueid#)
													</cfquery>
													

													
													<cfif match_history.recordcount IS 0>
													
													<div class="title">
														This squad has no match history yet.
													</div>
													<p>
													
													<cfelse>
													<div class="title">Match History in This League</div>	
													<p>													
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
						
							</cfif>		

						

			</td></tr></table>			
		</center>										
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

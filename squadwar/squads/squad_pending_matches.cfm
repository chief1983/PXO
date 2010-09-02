<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Pending Matches">

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
<cfquery datasource="squadwar" name="get_matches">
	SELECT SWMatches.SWCode, SWMatches.swsquad1, SWMatches.swsquad2
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad1) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad2) AS Squad2_name
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad1) AS Squad1_Email
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad2) AS Squad2_Email
		, SWMatches.swsector_ID
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = SWMatches.swsector_ID) AS Sectorname
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWMatches_Info.SWCode = SWMatches.SWCode) AS match_date --->
		,SWMatches_Info.Time_Created
		,(SELECT Title FROM SWLeagues WHERE SWMatches.League_ID = SWLeagues.League_ID) AS LeagueName
	FROM SWMatches LEFT JOIN SWMatches_Info ON SWMatches_Info.SWCode = SWMatches.SWCode
	WHERE (SWMatches.swsquad1 = #session.squadid#) OR (SWMatches.swsquad2 = #session.squadid#)
	ORDER BY SWMatches_Info.Time_Created DESC
</cfquery>


						<table width="95%" cellpadding=0 cellspacing=0 border=0>						
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="6" align="center"><div class="title">Pending Matches</div></td></tr>
								<tr><td colspan="6" align="center"><div class="copy">Click on the "<font color="red">match code</font>" to access scheduling options for these matches.</div></td></tr>
								<tr>
									<td><div class="copy">Date</div></td>
									<td><div class="copy">Code</div></td>
									<td><div class="copy">League</div></td>
									<td><div class="copy">Description</div></td>
									<td><div class="copy">Opponent's Email</div></td>
									<td><div class="copy">Status</div></td>
									<!--- <td><div class="copy">Last Phase Changed</div></td> --->
								</tr>
							<cfoutput query="get_matches">							
											<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
												<td valign="top">
													<div class="copy">
														<cfif get_matches.time_created LT DateAdd("d",-7,Now())>
															<font color="red">
														</cfif>
														<b>#DateFormat(get_matches.time_created,"m.d.yy")#</b>
														<cfif get_matches.time_created GT DateAdd("w",-1,Now())>
															</font>
														</cfif>
													</div>
												</td>
												<td valign="top"><div class="copy">&nbsp;<a href="squad_match_info.cfm?matchid=#get_matches.SWCode#"><font color="red">#get_matches.SWCode#</font></a>&nbsp;</div></td>
												<td valign="top"><div class="copy">#LeagueName#&nbsp;</div></td>
												<td valign="top">
													<div class="copy">
														<cfif swsquad1 IS NOT session.squadid><a href="squadinfo.cfm?id=#swsquad1#"></cfif>
														#get_matches.squad1_name#
														<cfif swsquad1 IS NOT session.squadid></a></cfif>
														Challenged
														<cfif swsquad2 IS NOT session.squadid><a href="squadinfo.cfm?id=#swsquad2#"></cfif>
														#get_matches.squad2_name#
														<cfif swsquad2 IS NOT session.squadid></a></cfif>
														for control of Sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
													</div>
												</td>
																							
												<td valign="top">
													<div class="copy">
													<cfif swsquad1 IS NOT session.squadid>
														<a href="mailto:#Squad1_Email#">#Squad1_Email#</a>
													<cfelse>
														<a href="mailto:#Squad2_Email#">#Squad2_Email#</a>
													</cfif>
													</div>
												</td>
												<td align="left" valign="top">
													<cfquery datasource="#currentdatasource#" name="get_schedule_info">
														SELECT *
														FROM SWMatches_Info
														WHERE SWCode = '#get_matches.SWCode#'
													</cfquery>
													<cfset current_phase=1>
													<cfif get_schedule_info.match_time2 IS NOT ''><cfset current_phase=2></cfif>
													<cfif get_schedule_info.match_time2 IS NOT ''><cfset current_phase=2></cfif>
													<cfif get_schedule_info.proposed_final_time IS NOT ''><cfset current_phase=3></cfif>
													<cfif get_schedule_info.proposed_alternate_time IS NOT ''><cfset current_phase=3></cfif>
													<cfif get_schedule_info.final_match_time IS NOT ''><cfset current_phase=4></cfif>																										
													<div class="copy">
														<cfif current_phase LT 4>
															Scheduling
															<cfif current_phase IS 1> - Created
															<cfelseif current_phase IS 2> - Phase 2 
															<cfelseif current_phase IS 3> - Phase 3
															</cfif>														
														<cfelse>
															<cfif NOW() GT get_schedule_info.final_match_time><font color="red"></cfif>#DateFormat(get_schedule_info.final_match_time,"mmmm d, yyyy")# #TimeFormat(get_schedule_info.final_match_time,"h:mm tt")#<cfif NOW() GT get_schedule_info.final_match_time></font></cfif>
														</cfif>													
													</div>
												</td>
												<!--- <td><cfif get_schedule_info.status_last_changed IS NOT ''><div class="copy">#DateFormat(get_schedule_info.status_last_changed,"mmmm d, yyyy")#<br>#TimeFormat(get_schedule_info.status_last_changed,"h:mm tt")# CST</div></cfif></td>	 --->
											</tr>
							</cfoutput>		
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="#0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
									<td colspan="6" align="center">
										<div class="copy">There are <cfoutput>#get_matches.recordcount#</cfoutput> matches pending for this squad.</div>
									</td>
								</tr>
						<cfelse>
							<tr><td colspan="6"><div class="title">Your squad has no pending matches in this league.</div></td></tr>
						</cfif>
						</table>
					
				
				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

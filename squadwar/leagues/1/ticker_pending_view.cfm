<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="squadwar" name="get_matches">
	SELECT swmatches.Swcode
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = swmatches.swsquad1) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = swmatches.swsquad2) AS Squad2_name
		, swmatches.swsector_ID
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = swmatches.swsector_ID) AS Sectorname
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWmatches_Info.swcode = swmatches.Swcode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM SWMatches LEFT JOIN SWMatches_INFO ON SWmatches_Info.swcode = swmatches.Swcode
	WHERE SWMatches.League_ID = 1
	ORDER BY SWMatches_Info.Time_Created DESC
</cfquery>


						<table width="90%" cellpadding=0 cellspacing=0 border=0>							
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="3" align="center"><div class="title">Pending Matches</div></td></tr>
							<cfoutput query="get_matches">							
											<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
												<td>
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
												<td>&nbsp;&nbsp;</td>
												<td>
													<div class="copy">
													
														#get_matches.squad1_name#
														Challenged
														#get_matches.squad2_name#
														for control of Sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
													</div>
												</td>
												<td align="left">
													<cfquery datasource="#currentdatasource#" name="get_schedule_info">
														SELECT *
														FROM SWMatches_Info
														WHERE SWCode = '#get_matches.swcode#'
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
														#DateFormat(get_schedule_info.final_match_time,"mmmm d, yyyy")# #TimeFormat(get_schedule_info.final_match_time,"h:mm tt")#
													</cfif>
													</div>
												</td>												
											</tr>
							</cfoutput>		
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="#0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
									<td colspan="3" align="center">
										<div class="copy">There are <cfoutput>#get_matches.recordcount#</cfoutput> matches pending in this league</div>
									</td>
								</tr>
						</cfif>
						</table>

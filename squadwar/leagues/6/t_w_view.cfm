<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfquery datasource="squadwar" name="get_matches">
	SELECT match_history.Swcode
		,match_history.special
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_victor) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_loser) AS Squad2_name
		, match_history.swsector_ID
		, match_history.match_time
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) AS Sectorname 
		,SWMatches_Info.Time_Created
	FROM match_history LEFT JOIN SWMatches_INFO ON SWmatches_Info.swcode = match_history.Swcode
	WHERE match_history.league_id = 6
	ORDER BY  match_history.match_time DESC
</cfquery>
						<table width="90%" cellpadding=0 cellspacing=0 border=0>							
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="3" align="center"><div class="title">League History</div></td></tr>
							<cfoutput query="get_matches">							
											<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
												<td>
													<div class="copy">
														<cfif thisdate IS NOT DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy')>												
															<b>#DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy')#</b>
														<cfelse>
															&nbsp;
														</cfif>		
														<cfset thisdate=DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0)),'mm.dd.yyyy')>
													</div>
												</td>
												<td>&nbsp;&nbsp;</td>
												<td>
													<div class="copy">
													
														#get_matches.squad1_name#
														Defeated
														#get_matches.squad2_name#
														for control of Sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
														
														<cfif get_matches.special IS 1><b>(forfeit)</b></cfif>
													</div>
												</td>
											</tr>
							</cfoutput>		
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="#0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
									<td colspan="3" align="center">
										<div class="copy">There have been <cfoutput>#get_matches.recordcount#</cfoutput> matches played in this league.</div>
									</td>
								</tr>
						</cfif>
						</table>
						
							

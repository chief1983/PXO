<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfset checkdate=DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())>
<cfset checkdate=checkdate-172800>
<cfquery datasource="squadwar" name="get_matches">
	SELECT match_history.Swcode
		,match_history.match_victor
		,match_history.match_loser
		,match_history.special
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_victor) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_loser) AS Squad2_name
		, match_history.swsector_ID
		, match_history.match_time
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) AS Sectorname 
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWmatches_Info.swcode = swmatches.Swcode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM match_history LEFT JOIN SWMatches_INFO ON SWmatches_Info.swcode = match_history.Swcode
	WHERE  (match_time > #checkdate#) AND (match_history.league_id = 3)
	ORDER BY  match_history.match_time DESC
</cfquery>


						<table width="90%" cellpadding=0 cellspacing=0 border=0>							
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="3" align="center"><div class="title">Results from the Last 48 Hours</div></td></tr>
							<cfoutput query="get_matches">							
											<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
												<td>
													<div class="copy">
														<cfif thisdate IS NOT DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy')>												
															<b>#DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy')#</b>
														<cfelse>
															&nbsp;
														</cfif>		
														<cfset thisdate=DateFormat(DateAdd('s',Evaluate(match_time-21600),CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy')>
													</div>
												</td>
												<td>&nbsp;&nbsp;</td>
												<td>
													<div class="copy">
													
														<cfif session.loggedin IS 1><a href="squads/squadinfo.cfm?id=#get_matches.match_victor#&leagueid=#leagueid#"></cfif>#get_matches.squad1_name#<cfif session.loggedin IS 1></a></cfif>
														Defeated
														<cfif session.loggedin IS 1><a href="squads/squadinfo.cfm?id=#get_matches.match_loser#&leagueid=#leagueid#"></cfif>#get_matches.squad2_name#<cfif session.loggedin IS 1></a></cfif>
														for control of sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
														<cfif special IS 1>(forfeit)</cfif>
													</div>
												</td>
											</tr>
							</cfoutput>		
						</cfif>
								</table>

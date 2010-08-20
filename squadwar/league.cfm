<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - League">

<cfinclude template="#relativepath#doc_top.cfm">

<script language="JavaScript">
<!-- hide


// open new window
// function openWindow(url, name, w, h) {
//  popupWin = window.open(url, name, 'resizable,scrollbars,menubar,width=' + w + ',height=' + h);
// }

function openAnyWindow(url, name) {
  var l = openAnyWindow.arguments.length;
  var w = "";
  var h = "";
  var features = "";

  for (i=2; i<l; i++) {
    var param = openAnyWindow.arguments[i];
    if ( (parseInt(param) == 0) || (isNaN(parseInt(param))) ) {
      features += param + ',';
    } else {
      (w == "") ? w = "width=" + param + "," :
        h = "height=" + param;
    }
  }

  features += w + h;
  var code = "popupWin = window.open(url, name";
  if (l > 2) code += ", '" + features;
  code += "')";
  eval(code);
  if (window.focus) {
  popupWin.focus();
  }
}
// done hiding -->
</script>

<cfif session.loggedin IS 0>
	<cfinclude template="#relativepath#menu/league_notloggedin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/league_loggedin.cfm">
</cfif>

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
<center>
<table width="95%" background="" cellpadding=0 cellspacing=0 border=0><tr><td>
<cfif isdefined("leagueid")>
	<cfif leagueid IS NOT ''>



				<cfquery datasource="#currentdatasource#" name="get_league_squads">
					SELECT *
					FROM SWSquads_Leagues
					WHERE Leagues = #leagueid#
				</cfquery>
				
				<cfset squads_in_this_league=''>
				<cfloop query="get_league_squads">
					<cfif ListFind(get_league_squads.Leagues, leagueid)>
						<cfif squads_in_this_league IS NOT ''><cfset squads_in_this_league=squads_in_this_league & ','></cfif>
						<cfset squads_in_this_league=squads_in_this_league & get_league_squads.SWSquad_SquadID>
					</cfif>
				</cfloop>
				
				<cfif squads_in_this_league IS NOT ''>
				
				<cfquery datasource="#currentdatasource#" name="get_league">
					SELECT *
					FROM SWLeagues
					WHERE League_ID = #leagueid#
				</cfquery>
				<!---
				<div class="copy">
					<cfoutput>#get_league.title#</cfoutput>
				</div>
				--->
				<br>
				
				<cfif leagueid IS 1>
					<center>
						<cfinclude template='leagues/1/t_w.cfm'>
						<cfinclude template='leagues/1/map.cfm'>
					</center>			

						<cfinclude template='leagues/1/ticker_pending.cfm'>
						<p>
						<center>
						<cfinclude template='leagues/1/t_w_info_yesterday.cfm'>
						</center>			
				<cfelseif leagueid IS 2>
					<center>
						<cfinclude template='leagues/2/t_w.cfm'>
						<cfinclude template='leagues/2/map.cfm'>
					</center>			

						<cfinclude template='leagues/2/ticker_pending.cfm'>
						<p>
						<center>
						<cfinclude template='leagues/2/t_w_info_yesterday.cfm'>
						</center>					
				<cfelseif leagueid IS 3>
					<center>
						<cfinclude template='leagues/3/t_w.cfm'>
						<cfinclude template='leagues/3/map.cfm'>
					</center>			

						<cfinclude template='leagues/3/ticker_pending.cfm'>
						<p>
						<center>
						<cfinclude template='leagues/3/t_w_info_yesterday.cfm'>
						</center>					
				<cfelseif leagueid IS 4>
					<center>
						<cfinclude template='leagues/4/map.cfm'>
					</center>			

				<cfelseif leagueid IS 5>
					<center>
						
						<cfinclude template='leagues/5/map.cfm'>
					</center>			

				<cfelseif leagueid IS 6>
					<center>

						<cfinclude template='leagues/6/map.cfm'>
					</center>			
																			
				</cfif>

				<p>
				
					<!-- 	<b>Rankings</b><p> --->
					
<!---					
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers

								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadID = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) OR (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode_Challenger
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) ) AS CountOfSWCode_Defender
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadID ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadID OR match_loser = SWSquads.SquadID) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadID) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadID) OR (match_history.match_loser = SWSquads.SquadID)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,SWSquad_Info.Squad_Red AS Red, SWSquad_Info.Squad_Green AS Green, SWSquad_Info.Squad_Blue AS Blue, SWSquad_Info.power_rating
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
						WHERE (SWSquads.SquadID IN (#squads_in_this_league#)) AND (SWSquads.Active = YES)
						 ORDER BY  power_rating DESC, SWSquads.SquadName
					</cfquery>	
--->
<!---
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers

								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadID = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) OR (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode_Challenger
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) ) AS CountOfSWCode_Defender
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadID ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadID OR match_loser = SWSquads.SquadID) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadID) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadID) OR (match_history.match_loser = SWSquads.SquadID)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
	
								
								,(SELECT Squad_Red FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Red
								,(SELECT Squad_Green FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Green
								,(SELECT Squad_Blue FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Blue
								,(SELECT win_loss FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSquads.SquadID) AS win_loss 						
								,(SELECT power_rating FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWsquads.squadid) AS power_rating
								
								,SWSquad_Info.Squad_Red AS Red, SWSquad_Info.Squad_Green AS Green, SWSquad_Info.Squad_Blue AS Blue, SWSquad_Info.power_rating
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
						WHERE (SWSquads.SquadID IN (#squads_in_this_league#)) AND (SWSquads.Active = YES)
						 GROUP BY SWSquads.SquadName, SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers 
						 HAVING ((SWSquads.Active)=Yes) 
						 ORDER BY  power_rating DESC,  Count(SWSectors.SectorName) DESC, SWSquads.SquadName; 
					</cfquery>	---> 
					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers
								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadID = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) OR (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode							
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad1) AND (SWMatches.League_ID = #leagueID#)) AS CountOfSWCode_Challenger
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) AND (SWMatches.League_ID = #leagueID#)) AS CountOfSWCode_Defender
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadID ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadID OR match_loser = SWSquads.SquadID) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadID) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadID) OR (match_history.match_loser = SWSquads.SquadID)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,(SELECT Squad_Red FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Red
								,(SELECT Squad_Green FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Green
								,(SELECT Squad_Blue FROM SWSquad_Info WHERE SWSquads.SquadID = SWSquad_Info.SquadID) AS Blue
								<!--- ,(SELECT power_rating FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWsquads.squadid) AS power_rating --->
								,SWSquad_Info.power_rating
						FROM SWSectors, SWSquad_Info, SWSquads
							<!--- RIGHT OUTER JOIN SWSquads ON SWSquads.SquadID = SWSectors.SectorSquad JOIN SWSquad_Info ON SWSquad_Info.SquadID = SWsquads.squadid --->
						WHERE SWSquads.SquadID IN (#squads_in_this_league#) AND (SWSectors.League_ID = #leagueID#)
								AND SWSquads.SquadID = SWSectors.SectorSquad
								AND SWSquad_Info.SquadID = SWsquads.squadid
						GROUP BY SWSquads.SquadName ,SWSquad_Info.power_rating ,SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers
						HAVING ((SWSquads.Active)=Yes) 
						ORDER BY Count(SWSectors.SectorName) DESC , SWSquad_Info.power_rating DESC, SWSquads.SquadName;
					</cfquery>	
					
					<cfquery datasource="#currentdatasource#" name="rank_count2">
						SELECT  SWSquads.SquadName, SWSquads.SquadID, SWSquads.Active, SWSquads.SquadMembers

								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadID = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) AS CountOfSectorName
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) OR (SWSquads.SquadID = SWMatches.SWSquad1) ) AS CountOfSWCode		
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad1) AND (SWMatches.League_ID = #leagueID#)) AS CountOfSWCode_Challenger
								,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadID = SWMatches.SWSquad2) AND (SWMatches.League_ID = #leagueID#)) AS CountOfSWCode_Defender
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadID ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadID OR match_loser = SWSquads.SquadID) ) AS totalmatches
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadID) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadID) OR (match_history.match_loser = SWSquads.SquadID)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
								,SWSquad_Info.Squad_Red AS Red, SWSquad_Info.Squad_Green AS Green, SWSquad_Info.Squad_Blue AS Blue, SWSquad_Info.power_rating
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquads.SquadID = SWSquad_Info.SquadID
						WHERE (SWSquads.SquadID IN (#squads_in_this_league#)) 
								AND (SWSquads.Active = YES) 
								AND (SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadID = SWSectors.SectorSquad) AND (SWSectors.League_ID = #leagueID#) ) = 0
						ORDER BY  power_rating DESC, SWSquads.SquadName
					</cfquery>					


						<cfset looprank=1>
						<cfset lastranktotal=99999>
						<cfset actualnumber=0>
						<cfset top_ranking_display=10>
						<center>


						<cfif rank_count.recordcount IS NOT 0>
						<!--- <table width="90%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0> --->
						<table width="90%" cellpadding=0 cellspacing=0 border=0>
							<tr><td align="center" colspan="9"><div class="title"><!--- The Top <cfoutput>#top_ranking_display#</cfoutput> of ---><cfoutput>#rank_count.recordcount#</cfoutput> Squadrons hold Systems in this League</div></td></tr>
							<tr>
								<td bgcolor="" align=left><div class="copy">&nbsp;</div></td>
								<td bgcolor="" align=left><div class="copy"><b>&nbsp;Rank&nbsp;</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Squad Name</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Power</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Systems</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>League Record</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Overall Record</b>&nbsp;</div></td>	
								<!--- <td bgcolor=""><div class="copy" align="center">&nbsp;<b>Ratio</b>&nbsp;</div></td>			--->
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Members</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Chall.</b>&nbsp;</div></td>	
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Defend</b>&nbsp;</div></td>
							</tr>						
													<cfset coloredrow=1>
							<cfoutput query="rank_count">
							
								
											<cfset actualnumber=actualnumber+1>
											
								
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
											<cfif (coloredrow IS 1)>
													<cfif (looprank LTE top_ranking_display)>
															<cfset coloredrow=0><tr bgcolor="##0B160D">
														<cfelse>
															<cfset coloredrow=0><tr bgcolor="##161616">
													</cfif>
												<cfelse>
													<tr><cfset coloredrow=1>
											</cfif>
											<!--- <cfif (coloredrow IS 1) AND (looprank GT top_ranking_display)><cfset coloredrow=0><tr bgcolor="##161616"><cfelse><tr><cfset coloredrow=1></cfif> --->
												<td width=5 bgcolor="#teamcolor#" align=right><img src="images/spacer.gif" width=5 height=3 alt="" border="0"><br></td>
												<td bgcolor="" align="right"><div class="copy"><!--- <cfif lastranktotal GT rank_count.countofsectorname>---><b>#looprank#</b><cfset looprank=looprank+1><!---</cfif>--->&nbsp;</div></td>
												<td bgcolor="" align="left"><div class="copy">&nbsp;<cfif session.loggedin IS 1><a href="squads/squadinfo.cfm?id=#squadid#&leagueid=#leagueid#"></cfif>#SquadName#<cfif session.loggedin IS 1></a></cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0>#NumberFormat("#power_rating#", '_.____')#<cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif CountOfSectorName GT 0>#CountOfSectorName#<cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0><cfif wins IS NOT ''>#Int(l_wins)#<cfelse>0</cfif>  - <cfif totalmatches IS NOT ''>#Evaluate(Int(l_totalmatches)-Int(l_wins))#<cfelse>0</cfif><cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0><cfif wins IS NOT ''>#Int(wins)#<cfelse>0</cfif> - <cfif totalmatches IS NOT ''>#Evaluate(Int(totalmatches)-Int(wins))#<cfelse>0</cfif><cfelse>&nbsp;</cfif></div></td>												
												<!--- <td bgcolor="" align="left"><div class="copy">#NumberFormat("#win_loss#", '_.____')#</div></td> --->
												<td bgcolor="" align="center"><div class="copy">#ListLen(SquadMembers)#</div></td>
												<td bgcolor="" align="right"><div class="copy"><cfif CountOfSWCode IS 0>&nbsp;<cfelse>#CountOfSWCode_Challenger#</cfif></div></td>
												<td bgcolor="" align="right"><div class="copy"><cfif CountOfSWCode IS 0>&nbsp;<cfelse>#CountOfSWCode_Defender#</cfif></div></td>
											</tr>
											<cfset lastranktotal=CountOfSectorName>																	

							</cfoutput>		
								</table>
					</cfif>		 
<!---					
				<cfelse>
					<div class="title">No Squads have registered for this league.</div>
				</cfif>	
--->				
				
				<!--- section 2 --->
				<p>
						<cfif rank_count2.recordcount IS NOT 0>
						<!--- <table width="90%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0> --->
						<table width="90%" cellpadding=0 cellspacing=0 border=0>
							<tr><td align="center" colspan="9"><div class="title"><!--- The Top <cfoutput>#top_ranking_display#</cfoutput> of ---><cfoutput>#rank_count2.recordcount#</cfoutput> Squadrons hold no Systems in this League</div></td></tr>
							<tr>
								<td bgcolor="" align=left><div class="copy">&nbsp;</div></td>
								<td bgcolor="" align=left><div class="copy"><b>&nbsp;Rank&nbsp;</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Squad Name</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Power</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Systems</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>League Record</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Overall Record</b>&nbsp;</div></td>	
								<!--- <td bgcolor=""><div class="copy" align="center">&nbsp;<b>Ratio</b>&nbsp;</div></td>			--->
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Members</b>&nbsp;</div></td>
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Chall.</b>&nbsp;</div></td>	
								<td bgcolor=""><div class="copy" align="center">&nbsp;<b>Defend</b>&nbsp;</div></td>
							</tr>						
													<cfset coloredrow=1>
							<cfoutput query="rank_count2">
							
								
											<cfset actualnumber=actualnumber+1>
											
								
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
											<cfif (coloredrow IS 1)>
													<cfif (looprank LTE top_ranking_display)>
															<cfset coloredrow=0><tr bgcolor="##0B160D">
														<cfelse>
															<cfset coloredrow=0><tr bgcolor="##161616">
													</cfif>
												<cfelse>
													<tr><cfset coloredrow=1>
											</cfif>
											<!--- <cfif (coloredrow IS 1) AND (looprank GT top_ranking_display)><cfset coloredrow=0><tr bgcolor="##161616"><cfelse><tr><cfset coloredrow=1></cfif> --->
												<td width=5 bgcolor="#teamcolor#" align=right><img src="images/spacer.gif" width=5 height=3 alt="" border="0"><br></td>
												<td bgcolor="" align="right"><div class="copy"><!--- <cfif lastranktotal GT rank_count2.countofsectorname>---><b>#looprank#</b><cfset looprank=looprank+1><!---</cfif>--->&nbsp;</div></td>
												<td bgcolor="" align="left"><div class="copy">&nbsp;<cfif session.loggedin IS 1><a href="squads/squadinfo.cfm?id=#squadid#&leagueid=#leagueid#"></cfif>#SquadName#<cfif session.loggedin IS 1></a></cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0>#NumberFormat("#power_rating#", '_.____')#<cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif CountOfSectorName GT 0>#CountOfSectorName#<cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0><cfif wins IS NOT ''>#Int(l_wins)#<cfelse>0</cfif>  - <cfif totalmatches IS NOT ''>#Evaluate(Int(l_totalmatches)-Int(l_wins))#<cfelse>0</cfif><cfelse>&nbsp;</cfif></div></td>
												<td bgcolor="" align="center"><div class="copy"><cfif totalmatches GT 0><cfif wins IS NOT ''>#Int(wins)#<cfelse>0</cfif> - <cfif totalmatches IS NOT ''>#Evaluate(Int(totalmatches)-Int(wins))#<cfelse>0</cfif><cfelse>&nbsp;</cfif></div></td>												
												<!--- <td bgcolor="" align="left"><div class="copy">#NumberFormat("#win_loss#", '_.____')#</div></td> --->
												<td bgcolor="" align="center"><div class="copy">#ListLen(SquadMembers)#</div></td>
												<td bgcolor="" align="right"><div class="copy"><cfif CountOfSWCode IS 0>&nbsp;<cfelse>#CountOfSWCode_Challenger#</cfif></div></td>
												<td bgcolor="" align="right"><div class="copy"><cfif CountOfSWCode IS 0>&nbsp;<cfelse>#CountOfSWCode_Defender#</cfif></div></td>
											</tr>
											<cfset lastranktotal=CountOfSectorName>																	

							</cfoutput>		
								</table>
					</cfif>		 
				<cfelse>
					<div class="title">No Squads have registered for this league.</div>
				</cfif>					
				<!--- end section 2 --->
				</center>
				
	</cfif>
</cfif>		

</td></tr></table>		


				
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

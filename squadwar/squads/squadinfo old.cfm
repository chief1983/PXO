<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<html><body>
<!--- Page info goes here	 --->			

<!--- NEW STUFF --->

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
<div class="newsitemtitle">General Information</div>
<p>
<cfoutput><a href="join_squad.cfm?id=#id#">Join this squad</a></cfoutput>
<p>
		<table>
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Team Name:</b></font></div>
				</td>
				<td valign="top" align=left>
					<div class="copy"><cfoutput query="get_squad"><a href="squadlogin.cfm?id=#id#<cfif isdefined("leagueid")>&leagueid=#leagueid#</cfif>">#squadname#</a></cfoutput></div>
				</td>
			</tr>
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Squad Leader:</b></font></div>
				</td>
				<td valign="top" align=left>
					<!--- <div class="copy"><cfif (validdata) AND (get_squad_leader.recordcount IS NOT 0)><cfoutput>#get_squad_leader.Login#</cfoutput><cfelse>*yet to be determined</cfif></div> --->
				</td>
			</tr>			
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Squad Email:</b></font></div>
				</td>
				<td valign="top" align=left>
					<div class="copy"><cfoutput query="get_squad_info"><a href="mailto:#squad_email#">#squad_email#</a></cfoutput></div>
				</td>
			</tr>	
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Squad Leader ICQ:</b></font></div>
				</td>
				<td valign="top" align=left>
					<div class="copy"><cfif (validdata) AND (get_squad_info.Squad_Leader_ICQ IS NOT '')><cfoutput>#get_squad_info.Squad_Leader_ICQ#</cfoutput><cfelse>*yet to be determined</cfif></div>
				</td>
			</tr>		
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Squad IRC:</b></font></div>
				</td>
				<td valign="top" align=left>
					<div class="copy">*yet to be determined</div>
				</td>
			</tr>		
			<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Web Link:</b></font></div>
				</td>
				<td valign="top" align=left>
					<div class="copy">*not for beta</div>
				</td>
			</tr>	
				<tr>
				<td valign="top" align=right>
					<div class="copy"><font color="black"><b>Roster:</b></font></div>
				</td>
				<td align=left>
					<cfloop query="get_squad"><cfset querystring="('" & squadmembers & "')"></cfloop>
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
							<div class="newsitemtitle">Pending Matches:</div>
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
							<p>		
							
								<br clear="all">
								
					<!--- GET SECTORS --->
						
							<cfquery name="get_sectors" datasource="#currentdatasource#">
								SELECT *
								FROM SWSectors
								WHERE (SectorSquad = #id#) AND (SWSectors.League_ID = #leagueid#)
							</cfquery>
					
							<p>
					
						
							<p>
							<div class="newsitemtitle">This Squad holds the following systems:</div>	
							<p>
								
								<table border=1 bordercolorlight="" bordercolordark="" cellspacing=0>
								<tr>
										<td bgcolor="" align=left><div class="copy"><font color=""><b>Sector ID</b></b></font></div></td>
										<td bgcolor="" align=left><div class="copy"><font color=""><b>System Name</b></font></div></td>
										<td bgcolor=""><div class="copy"><font color=""><b>Held Since</b></font></div></td>								
								</tr>
								<cfoutput query="get_sectors">
									<tr>
										<td bgcolor="" align=left><div class="copy">&nbsp;#SwSectors_ID#</div></td>
										<td bgcolor="" align=left><div class="copy">&nbsp;#SectorName#</div></td>
										<td bgcolor=""><div class="copy">&nbsp;<cfif SectorTime IS '0'>Creation<cfelse><cfset helddate=DateAdd('s',SectorTime,CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(helddate,'hh:mm tt')# #DateFormat(helddate,'mm.dd.yyyy')#</cfif></div></td>
									</tr>
								</cfoutput>
								</table>			
								
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
							<div class="newsitemtitle">Match History</div>	
							<p>
							
							<cfif match_history.recordcount IS 0>
							
							<div class="copy">
								This squad has no match history yet.
							</div>
							
							<cfelse>
							<center>
								<table width="90%" border=1 bordercolorlight="" bordercolordark="" cellspacing=0>
								<tr>
										<td bgcolor="" align=left><div class="copy"><font color="black"><b>System Name</b></font></div></td>
										<td bgcolor=""><div class="copy"><font color="black"><b>Victor</b></font></div></td>
										<td bgcolor=""><div class="copy"><font color="black"><b>Loser</b></font></div></td>
										<td bgcolor=""><div class="copy"><font color="black"><b>Match Time</b></font></div></td>								
								</tr>
								<cfoutput query="match_history">
									<tr>
										<td bgcolor="" align=left><div class="copy">&nbsp;#SWSector#</div></td>
										<td bgcolor=""><div class="copy">&nbsp;<cfif match_victor IS id><b>#victor#</b><cfelse>#victor#</cfif></div></td>
										<td bgcolor=""><div class="copy">&nbsp;<cfif match_loser IS id><b>#loser#</b><cfelse>#loser#</cfif></div></td>
										<td bgcolor=""><div class="copy">&nbsp;<cfif match_time IS '0'>Creation<cfelse><cfset matchdate=DateAdd('s',match_time,CreateDateTime(1970,1,1,0,0,0))>#TimeFormat(matchdate,'hh:mm tt')# #DateFormat(matchdate,'mm.dd.yyyy')#</cfif></div></td>
									</tr>
								</cfoutput>
								</table>	
							</center>		
							</cfif>	
					
					
					<!--- END NEW STUFF --->
					
					<!--- End page info --->	
	</cfif>
</cfif>

</body></html>





<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfif NOT isdefined("id")>
	<cfif isdefined("session.squadid")><cfset id=session.squadid></cfif>
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
	You have tried to access a squad which does not exist
<cfelse>

<div class="newsitemtitle"><cfoutput query="get_squad">#SquadName#</cfoutput> Squad Management</div>	
<p>

<cfset valid_login=0>
<cfif isdefined("form.password")>
	<cfset session.squadpassword = form.password>
</cfif>


<cfif session.squadpassword IS NOT ''>
	<cfif get_squad.squadpassword IS session.squadpassword>
		<cfset valid_login=1>
	</cfif>
</cfif>

<cfif valid_login>

	<cfquery datasource="#currentdatasource#" name="rank_count">
		SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active
				,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE SWSquads.SquadId = SWSectors.SectorSquad) AS CountOfSectorName
				,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad1) ) AS CountOfSWCode_challenger		
				,(SELECT COUNT(SWMatches.SWCode) FROM SWMatches WHERE (SWSquads.SquadId = SWMatches.SWSquad2) ) AS CountOfSWCode_challenged
				,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
				,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
				,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } )  WHERE (match_history.match_victor = SWSquads.SquadId) AND (SWSectors.League_ID = #leagueid#)  ) AS l_wins
				,(SELECT COUNT(match_history.match_victor) FROM match_history LEFT JOIN SWSectors ON (SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) WHERE ((match_history.match_victor = SWSquads.SquadId) OR (match_history.match_loser = SWSquads.SquadId)) AND (SWSectors.League_ID = #leagueid#)) AS l_totalmatches 
		FROM (SWSquads LEFT JOIN SWSectors ON SWSquads.SquadId = SWSectors.SectorSquad)
		GROUP BY SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active
		HAVING ((SWSquads.Active)=Yes)
		ORDER BY Count(SWSectors.SectorName) DESC , SWSquads.SquadName;
	</cfquery>		
	
	<cfset squadrank="0">
	<cfset notfoundsquadrank=1>
	<cfloop query="rank_count">
		<cfset squadrank=squadrank+1>
		<cfif #id# IS SquadID><cfbreak></cfif>
	</cfloop>
	
	<cfoutput>Your Squad is currently ranked #squadrank# of #rank_count.recordcount#</cfoutput>
	
	<p>
	
	
		<table width="90%" border=1 bordercolorlight="" bordercolordark="" cellspacing=0>
			<tr><td align="center" colspan="8">The 10 opponents closets to your rank</td></tr>
			<tr>
				<td bgcolor=""><div class="copy"><font color=""><b>Rank</b></font></div></td>
				<td bgcolor=""><div class="copy"><font color=""><b>Squad Name</b></font></div></td>
				<td bgcolor=""><div class="copy"><font color=""><b>League Record</b></font></div></td>
				<td bgcolor=""><div class="copy"><font color=""><b>Overall Record</b></font></div></td>
				<td bgcolor=""><div class="copy"><font color=""><b>Number of Systems Held</b></font></div></td>								
				<td bgcolor=""><div class="copy"><font color=""><b>Status</b></font></div></td>	
				<td bgcolor=""><div class="copy"><font color=""><b>Pending Challengers</b></font></div></td>	
				<td bgcolor=""><div class="copy"><font color=""><b>Pending Challenges</b></font></div></td>	
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
						
						<tr>
							<td bgcolor="" align=right><div class="copy">#displayrank#</div></td>
							<td bgcolor="" align=left><div class="copy">&nbsp;<cfif squadid IS id><b>#SquadName#</b><cfelse><a href="squadinfo.cfm?id=#squadid#&leagueid=#leagueid#">#SquadName#</a></cfif></div></td>
							<td bgcolor="" align=center><div class="copy"><cfif wins IS NOT ''>#Int(l_wins)#<cfelse>0</cfif>  - <cfif totalmatches IS NOT ''>#Evaluate(Int(l_totalmatches)-Int(l_wins))#<cfelse>0</cfif></div></td>
							<td bgcolor="" align=center><div class="copy"><cfif wins IS NOT ''>#Int(wins)#<cfelse>0</cfif> - <cfif totalmatches IS NOT ''>#Evaluate(Int(totalmatches)-Int(wins))#<cfelse>0</cfif></div></td>
							<td bgcolor="" align=right><div class="copy">#CountOfSectorName#</div></td>
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
<p>
<a href="challenge.cfm?leagueid=<cfoutput>#leagueid#</cfoutput>">Pose a Challenge</a>
<p>

<!--- GET MATCHES --->

	<cfquery name="get_matches" datasource="#currentdatasource#">
	SELECT SWMatches.*
			,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad1) AS Challenger
			,(SELECT SquadName FROM SWSquads WHERE SquadID = SWSquad2) AS Challenged
			,(SELECT SectorName FROM SWSectors WHERE SWSectors_ID = SWSector_ID) AS SWSector
	FROM SWMatches LEFT JOIN SWSectors ON SWMatches.SWSector_ID = SWSectors.SWSectors_ID
	WHERE ((SWMatches.swsquad1)=#id#) OR ((SWMatches.swsquad2)=#id#) AND (SWSectors.League_ID = #leagueid#)
	</cfquery>		
		
		<p>
		<div class="newsitemtitle">Pending Matches:</div>
		<p>
		<cfif get_matches.recordcount IS 0>
			<div class="copy">No matches at this time.</div>
			<cfelse>
				<cfoutput query="get_matches">
					<div class="copy">
						<cfif SWSquad1 IS id>
							Your squad has challenged #Challenged# for control of #SWSector#, match code: <b>#SWCode#</b>.<br>
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
			WHERE SectorSquad = #id# AND (SWSectors.League_ID = #leagueid#)
		</cfquery>

		<p>

	
		<p>
		<div class="newsitemtitle">Your Squad holds the following systems:</div>	
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




<!--- MATCH HISTORY --->		
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


<cfelse>
	<div class="copy"><font color=""><b>Invalid squad password!</b></font></div>
</cfif>
</cfif>






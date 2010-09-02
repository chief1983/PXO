<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - League">

<cfinclude template="#relativepath#doc_top.cfm">

<cfif session.loggedin IS 0>
	<cfinclude template="#relativepath#menu/league_notloggedin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/league_loggedin.cfm">
</cfif>

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
				<br>
				<br>

				<cfset inc = 200>

<div class="copy">
<cfset checkdate=DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())>
Current game time is: <cfoutput>#checkdate#</cfoutput>

<cfif isdefined("last")><cfelse><cfset last=0></cfif>
</div>

					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active 
								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadId = SWSectors.SectorSquad)) AS CountOfSectorName
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
								,(SELECT win_loss FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSquads.SquadID) AS win_loss
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
						FROM SWSquads LEFT JOIN SWSectors ON SWSquads.SquadId = SWSectors.SectorSquad
						GROUP BY SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active, SWSquads.SquadMembers
						HAVING ((SWSquads.Active)=Yes) AND (SWSquads.SquadId > #last#) AND (SWSquads.SquadId <= #Evaluate(last + inc)#)
						ORDER BY Count(SWSectors.SectorName) DESC, SWSquads.SquadName;
					</cfquery>	
					
<cfif rank_count.recordcount GT 0>			
<p>
<table>
<cfloop query="rank_count">
	<cfoutput>
	<tr>
	
		<td><div class="copy">#squadid#</div></td>
		<td><div class="copy">#SquadName#</div></td>
		<!---<td><div class="copy">#win_loss#</div></td> --->
		
	</cfoutput>
				
			<cfif rank_count.totalmatches IS NOT 0>
				<cfset power_rating=0>
				<cfquery datasource="#currentdatasource#" name="get_opponents">
					SELECT	match_history.match_victor, match_history.match_loser 
					FROM	match_history 
					WHERE	(match_victor = #rank_count.SquadId#) OR (match_loser = #rank_count.SquadId#) 
				</cfquery>
				<cfset opponent_list=''>
				<cfset team='#rank_count.SquadID#'>				
				<cfloop query="get_opponents">			
					<cfif '#team#' IS '#get_opponents.match_loser#'>
						<cfset opponent=get_opponents.match_victor>
					</cfif>
					<cfif '#team#' IS '#get_opponents.match_victor#'>
						<cfset opponent=get_opponents.match_loser>
					</cfif>
					<!--- <cfif NOT ListFind(opponent_list,"#opponent#")><cfset opponent_list = ListAppend(opponent_list,"#opponent#")></cfif> --->
					<cfset opponent_list = ListAppend(opponent_list,"#opponent#")>
				</cfloop>
				<!---  <td><div class="copy"><cfoutput><b>#get_opponents.recordcount#</b>-#opponent_list#-<b>#ListLen(opponent_list)#</b></cfoutput> </div></td> --->
				 <cfquery datasource="#currentdatasource#" name="get_opponent_ratings">
				 	SELECT	sum(win_loss) as R2_sum
					FROM	SWSquad_Info
					WHERE	SWSquad_Info.SquadID IN (#opponent_list#)
				 </cfquery>
				 <cfset r2=Evaluate(get_opponent_ratings.r2_sum/ListLen(opponent_list))>
				
							<!--- 
							<cfoutput>
							<td><div class="copy">#get_opponent_ratings.r2_sum#</div></td>
							<td><div class="copy">#ListLen(opponent_list)#</div></td>
							<td><div class="copy">#r2#</div></td>
							<td><div class="copy">#rank_count.CountOfSectorName#</div></td>
							</cfoutput>
							--->
				 <!--- <cfset power_rating=NumberFormat("#Evaluate(rank_count.win_loss + r2/2 )#", '_.____')> --->
				 <cfset power_rating2=NumberFormat("#Evaluate((rank_count.win_loss + r2/2))#", '___.____')>
				 <cfset power_rating=NumberFormat("#Evaluate((rank_count.win_loss + r2/2) * sqr(rank_count.totalmatches))#", '___.____')>
			<cfelse>
				<cfset power_rating=0>
				<cfset power_rating2=0>
			</cfif>
			<!---
			<td><div class="copy"><cfoutput><b>Total Matches:</b>#rank_count.totalmatches#</cfoutput></div></td>
			<td><div class="copy"><cfoutput>#power_rating2#</cfoutput></div></td>
			--->
			<td><div class="copy"><cfoutput>#power_rating#</cfoutput></div></td>
		
	</tr>
	<cfquery datasource="#currentdatasource#" name="upate_power_rating">
		UPDATE
			SWSquad_Info
		SET
			power_rating = #power_rating#
		WHERE
			SWSquad_Info.SquadID = #rank_count.SquadID#
	</cfquery>	

</cfloop>
</table>
	<cflocation url="power_rating.cfm?last=#Evaluate(last + inc)#">
<cfoutput>	<div class="copy"><a href="power_rating.cfm?last=#Evaluate(last + inc)#">Next #inc#</a></div></cfoutput>
<cfelse>
<div class="copy">done.</div>
</cfif>					
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">


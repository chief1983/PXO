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


<div class="copy">
<cfset checkdate=DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())>
Current game time is: <cfoutput>#checkdate#</cfoutput>

</div>

					<cfquery datasource="#currentdatasource#" name="rank_count">
						SELECT  SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active 
								,(SELECT COUNT(SWSectors.SectorName) FROM SWSectors WHERE (SWSquads.SquadId = SWSectors.SectorSquad)) AS CountOfSectorName
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE match_victor = SWSquads.SquadId ) AS wins
								,(SELECT COUNT(match_history.match_victor) FROM match_history WHERE (match_victor = SWSquads.SquadId OR match_loser = SWSquads.SquadId) ) AS totalmatches
						FROM SWSquads LEFT JOIN SWSectors ON SWSquads.SquadId = SWSectors.SectorSquad
						GROUP BY SWSquads.SquadName, SWSquads.SquadId, SWSquads.Active, SWSquads.SquadMembers
						HAVING ((SWSquads.Active)=1)
						ORDER BY Count(SWSectors.SectorName) DESC, SWSquads.SquadName;
					</cfquery>	
<p>
<table>
<cfloop query="rank_count">
	<cfoutput>
	<tr>
		<td><div class="copy">#SquadName#</div></td>
		<td><div class="copy">#wins#</div></td>
		<td><div class="copy">#totalmatches#</div></td>
		<td><div class="copy"><cfif rank_count.totalmatches IS NOT 0><cfset win_loss=NumberFormat("#Evaluate(rank_count.wins/rank_count.totalmatches)#", '_.____')><cfelse><cfset win_loss=0></cfif>#win_loss#</div></td>
	</tr>
	</cfoutput>
	<cfquery datasource="#currentdatasource#" name="upate_win_loss">
		UPDATE
			SWSquad_Info
		SET
			win_loss = #win_loss#
		WHERE
			SWSquad_Info.SquadID = #rank_count.SquadID#
	</cfquery>
</cfloop>
</table>
				
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">


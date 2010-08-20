<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - A Parallax Online Site">

<cfinclude template="doc_top.cfm">

	<cfinclude template="menu/main.cfm">

<cfinclude template="doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
		<br>		
		<center>
					
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>

					<cfquery datasource="pxo" name="count_pxo_users" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT Count(TrackerID) AS totalusers
						FROM Users
						WHERE Validated=1
					</cfquery>
					<cfquery datasource="pxo" name="count_fs2_pilots" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT Count(TrackerID) AS totalusers
						FROM FreeSpace2Full
					</cfquery>
					<cfquery datasource="pxo" name="count_fs2_players" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT Count(Pilot) AS totalusers
						FROM FreeSpace2Full
						GROUP BY TrackerID
					</cfquery>								
					<cfquery datasource="SquadWar" name="count_sw_squads" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT Count(Squadid) AS totalusers
						FROM SWSquads
					</cfquery>					
					<div class="title">PXO at a glance:</div>
					<div class="copy">
						<cfoutput><b>#count_pxo_users.totalusers#</b></cfoutput> Validated PXO Users<br>
						<cfoutput><b>#count_fs2_pilots.totalusers#</b></cfoutput> FreeSpace 2 Pilots<br>
						<cfoutput><b>#count_fs2_players.recordcount#</b></cfoutput> FreeSpace 2 Players<br>
						<cfoutput><b>#count_sw_squads.totalusers#</b></cfoutput> SquadWar Squadrons<br>

			</td></tr></table>			
			
		</center>				
				
<hr noshade color="#2E5537">				
	<!--- start --->	
				<center>
				<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>
				
				<div class="title">Squads Pending Activation</div>
				<p>
					<cfquery datasource="SquadWar" name="get_squads_not_approved">
						SELECT SWSquads.SquadId, SWSquads.SquadName,
							SWSquad_Info.Squad_Leader_ICQ,
							SWSquad_Info.Squad_IRC,
							SWSquad_Info.Squad_Web_Link,
							SWSquad_Info.Squad_Email
						FROM SWSquads LEFT JOIN SWSquad_Info ON SWSquad_Info.SquadID = SWSquads.SquadID
						WHERE Active = 0 AND suspended =0
					</cfquery>

					<table width="90%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
						<tr>
							<th>ID</th><th>Name</th><th>ICQ</th><th>IRC</th><th>Web</th><th>Email</th><th>&nbsp;</th>
						</tr>
						<cfoutput query="get_squads_not_approved">
						<tr>
							<td><div class="admin_table"><a href="_pending_squads.cfm?squadid=#Squadid#">#Squadid#</a>&nbsp;</div></td>
							<td><div class="admin_table">#SquadName#&nbsp;</div></td>
							<td><div class="admin_table">#Squad_Leader_ICQ#&nbsp;</div></td>
							<td><div class="admin_table">#Squad_IRC#&nbsp;</div></td>
							<td><div class="admin_table"><a href="#Squad_Web_Link#">#Squad_Web_Link#</a>&nbsp;</div></td>
							<td><div class="admin_table"><a href="mailto:#Squad_Email#">#Squad_Email#</a>&nbsp;</div></td>							
							<td><div class="admin_table"><a href="_delete_squad.cfm?squadid=#Squadid#">delete</a>&nbsp;</div></td>
						</tr>
						</cfoutput>
					</table>
					
				</td></tr></table>
				</center>	
				
		<!--- end --->

								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="doc_bot.cfm">

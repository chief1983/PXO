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
						FROM SwSquads
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
				&nbsp;
				</td></tr></table>
				</center>	
				
		<!--- end --->

								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="doc_bot.cfm">

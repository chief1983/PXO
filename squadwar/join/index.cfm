<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist a Pilot">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
<br>	
		<center>
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>			
				<div class="title"><cfoutput>PXO Account #session.login#</cfoutput></div>
				<table>
					<tr>
						<td align="right"><div class="copy">Full Name:</div></td>
						<td><div class="copy"><cfoutput>#session.firstname# #session.lastname#</cfoutput></div></td>
					</tr>
					<tr>
						<td align="right"><div class="copy">PXO Account Email:</div></td>
						<td><div class="copy"><cfoutput>#session.email#</cfoutput></div></td>
					</tr>			
					<tr>
						<td align="right"><div class="copy">PXO Tracker ID:</div></td>
						<td><div class="copy"><cfoutput>#session.trackerid#</cfoutput></div></td>
					</tr>											
					<tr>
						<td align="right"><div class="copy">FreeSpace 2 Pilots:</div></td>
						<td><div class="copy"><cfoutput>#session.totalfs2pilots#</cfoutput></div></td>
					</tr>						
				</table>
			</td></tr></table>			
		</center>				
				
<hr noshade color="#2E5537">				

		<center>
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>	
				<cfif session.totalfs2pilots GT 0>
						<cfquery datasource="SquadWar" name="get_squads">
							SELECT SWSquads.SquadName, SWSquads.SquadMembers
							   ,SWSquad_Info.SquadID ,SWSquad_Info.Squad_Leader_ID ,SWSquad_Info.Squad_Leader_ICQ 
									   ,SWSquad_Info.Squad_IRC ,SWSquad_Info.Squad_Web_Link ,SWSquad_Info.Squad_Email ,SWSquad_Info.Squad_Time_Zone, SWSquad_Info.Squad_Statement
							FROM SWSquads, SWSquad_Info
							WHERE (SWSquads.SquadID = SWSquad_Info.SquadID)
							ORDER BY SWSquads.SquadName
						</cfquery>
					<div class="copy">
						To join a Squad, the Squad Leader must give you the Squad's "join" password.  If you have the Squad's join password, select the Squad's name from the list below.  When you reach the next screen, enter the password where prompted on the form.
						<p>
						<b>Currently Pre-registered Squad Names:</b>
						<p>
						<table>
							<tr>
								<td><div class="squadtable"><b>Name</b></div></td>
								<td><div class="squadtable"><b>Web Link</b></div></td>
								<td><div class="squadtable"><b>Squad ICQ</b></div></td>
								<td><div class="squadtable"><b>Squad Email</b></div></td>
							</tr>
							<cfset coloredrow=1>
							<cfoutput query="get_squads">
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
								<td><div class="squadtable"><a href="join_squad.cfm?id=#SquadID#">#SquadName#</a></div></td>
								<td><div class="squadtable"><cfif Squad_Web_Link IS NOT ''><a href="#Squad_Web_Link#">yes</a><cfelse>&nbsp;</cfif></div></td>
								<td><div class="squadtable"><cfif Squad_Leader_ICQ IS NOT ''>#Squad_Leader_ICQ#</cfif></div></td>
								<td><div class="squadtable"><cfif Squad_Email IS NOT ''><a href="mailto:#Squad_Email#"></cfif>#Squad_Email#<cfif Squad_Email IS NOT ''></a></cfif></div></td>
								</tr>
							</cfoutput>				
						</table>
					</div>
					
				<cfelse>
					<div calss="copy">
						No pilots exist for this account.  You must log into PXO using FreeSpace 2 to create a multiplayer pilot in the PXO database before attempting to join a squad.<p>
					</div>
				</cfif>	
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/enlist_main.cfm">

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
				<div class="title">Recruitment Center</div>
				<p>
				<div class="copy">
					Welcome, <cfoutput>#session.login#</cfoutput>, to the SquadWar Recruitment Center.  
					<cfoutput>
					The recruitment center allows you to <a href="enlist.cfm?action=add">Enlist a FreeSpace 2 pilot for recruitment</a> on the <a href="#relativepath#recruits/">Recruits Board</a>, <a href="enlist.cfm?action=add">edit a pilot already on the board</a>, or <a href="enlist.cfm?action=deactivate">deactivate a pilot from the board.</a>
					</cfoutput>
					<p>
					The purpose of the Recruitment Center is to provide pilots with a way to show off their FreeSpace 2 stats to potential squadrons.  Squad Leaders will check out the Recruits Board for information on active pilots who want to join a Squad.
				
				</div>
								
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

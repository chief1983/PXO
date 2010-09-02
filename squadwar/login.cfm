<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Login">

<cfinclude template="#relativepath#doc_top.cfm">

	<cfinclude template="#relativepath#menu/main_notloggedin.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
		<br>		
		<center>
					
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>
				<!--- NOT LOGGED IN --->
				<table><tr><td valign="top">
					<cfform action="_login.cfm" method="POST" enablecab="No" name="login">
					<div class="title">SquadWar Log In</div>	
					<table>
						<tr>
							<td><div class="copy">PXO Login:</div></td>
							<td><cfinput type="text" name="login" message="You must enter your login." required="yes" size="15" maxlength="50"><br></td>
						</tr>
						<tr>
							<td><div class="copy">PXO Password:</div></td>
							<td><cfinput type="password" name="password" message="You must enter your password." required="yes" size="15" maxlength="50"><br></td>
						</tr>
						<tr>	
							<td></td>						
							<td>
								<input type="hidden" name="refer" value="index.cfm">
								<input type="image" src="images/forms/login.gif" value="Login">		
							</td>
						</tr>
					</table>	
					</cfform>
				</td>
				<td><td><img src="images/spacer.gif" width=40 height=3 alt="" border="0"></td></td>
				<td valign="top">
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
					<table><tr><td>
					<div class="copy">
						<cfoutput><b>#count_pxo_users.totalusers#</b></cfoutput> Validated PXO Users<br>
						<cfoutput><b>#count_fs2_pilots.totalusers#</b></cfoutput> FreeSpace 2 Pilots<br>
						<cfoutput><b>#count_fs2_players.recordcount#</b></cfoutput> FreeSpace 2 Players<br>
						<cfoutput><b>#count_sw_squads.totalusers#</b></cfoutput> SquadWar Squadrons<br>
					</div>
					</td></tr></table>
				</td></tr></table>
				<!--- END NOT LOGGED IN --->

			</td></tr></table>			
			
		</center>				
				


								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

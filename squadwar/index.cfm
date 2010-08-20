<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - A Parallax Online Site">

<cfinclude template="#relativepath#doc_top.cfm">

<cfif session.loggedin IS 0>
	<cfinclude template="#relativepath#menu/main_notloggedin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/main_loggedin.cfm">
</cfif>

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->

		<br>		
		<center>
					
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>
			<cfif session.loggedin IS 0>
				<!---NOT LOGGED IN--->
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
				<!---END NOT LOGGED IN--->
			<cfelse>
					<cfquery datasource="pxo" name="count_fs2_pilots">
						SELECT Count(TrackerID) AS totalusers
						FROM FreeSpace2Full
						WHERE TrackerID = '#session.trackerid#'
					</cfquery>
				<cfset session.totalfs2pilots=count_fs2_pilots.totalusers>
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
			</cfif>		
			</td></tr></table>			
			
		</center>				
<hr noshade color="#2E5537" >		
	<!--- start --->
				<center>
				<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>
					<cfquery datasource="InternetSQL" name="main_news" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT *
						FROM news_main
						WHERE SquadWar=1 AND news_main.date_posted > #DateAdd("m",-1,Now())#
						ORDER BY news_main.date_posted DESC
					</cfquery>
					
					<div class="newstitle">Recent SquadWar Headlines</div>
					
					<div class="copy">
						<ul>				
					<cfloop query="main_news" startrow=1 endrow=5>			
		
							<li><a href="index.cfm#<cfoutput>#newsid#</cfoutput>"><cfoutput>#main_news.title#</cfoutput></a>
						
					</cfloop>
						</ul>
					</div>
					
					<div class="copy">
						<a href="oldnews.cfm">SquadWar News Archive</a>
					</div>
					<p>
				</td></tr></table>
				</center>	
				
				<br>
				<cfif main_news.recordcount IS NOT 0>
					<center>
					<cfloop query="main_news">
						
						<a name="<cfoutput>#newsid#</cfoutput>"></a>
						<cfoutput>
						<table width="95%" cellpadding="0" cellspacing="0" border=0>
							<tr>
								<td colspan="2" valign="top" bgcolor="##172A1B">
									<div class="newstitle">#DateFormat(main_news.date_posted,"m.d.yy")# #TimeFormat(main_news.date_posted,"h:mm tt")# - #main_news.title#<br></div>							
								</td>
							</tr>
							<tr>
								<td width="17" valign="top">&nbsp;</td>
								<td valign="top">
								<br>
									<div class="newsitem">#main_news.news_item#</div>
								</td>
							</tr>
						</table>
							<br>
							
						</cfoutput>
					</cfloop>
					</center>
				<cfelse>
					<div class="copy">
						Sorry, but there is no news for FreeSpace 2 at this time.
					</div>
				</cfif>				
				
				<p>
				
		<!--- end --->
		
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

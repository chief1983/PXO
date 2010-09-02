<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - SquadWar News Archive">

<cfinclude template="#relativepath#doc_top.cfm">

<cfif session.loggedin IS 0>
	<cfinclude template="#relativepath#menu/main_notloggedin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/main_loggedin.cfm">
</cfif>

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
				
				
				
				
				
				
	<!--- start --->	
				<center>
				<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>
					<cfquery datasource="InternetSQL" name="main_news" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT *
						FROM news_main
						WHERE SquadWar=1 AND news_main.date_posted <= #DateAdd("m",-1,Now())#
						ORDER BY news_main.date_posted DESC
					</cfquery>
					
					<div class="newstitle">SquadWar News Archive</div>
					
					<div class="copy">
						<ul>				
					<cfloop query="main_news" startrow=1 endrow=5>			
		
							<li><a href="oldnews.cfm#<cfoutput>#newsid#</cfoutput>"><cfoutput>#main_news.title#</cfoutput></a>
						
					</cfloop>
						</ul>
					</div>
					
					<div class="copy">
						<a href="index.cfm">Recent SquadWar News</a>
					</div>
					<p>
				</td></tr></table>
				</center>	
				
				
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

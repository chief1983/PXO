<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

				<cfquery datasource="InternetSQL" name="main_news" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
					SELECT *
					FROM news_main
					WHERE PXO = 1 AND news_main.date_posted > #DateAdd("m",-2,Now())#
					ORDER BY news_main.date_posted DESC
				</cfquery>
				<cfoutput>#main_news.recordcount#</cfoutput>
			<table cellpadding="0" cellspacing="0" bgcolor="#000000" border="0">
				<tr>
					<td colspan="3"><img src="images/main/recenttop.gif" width=560 height=10 alt="" border="0"></td>
				</tr>
				<tr>
					<td width="2" bgcolor="#5A63F7"><img src="images/main/spacer.gif" width=2 height=1 alt="" border="0"></td>			
					<td width="556" bgcolor="#00217B" valign="top">
					<center><table width="540" cellpadding="0" cellspacing="0" border="0"><tr><td>
					<font color="white"><div class="newsitemtitle">Recent News:</div></font>
					<font color="#BBBBBB"><div class="newsitem"><ul><cfloop query="main_news" startrow="1" endrow="5"><li><a href="#<cfoutput>#newsid#">#title#</a></cfoutput></cfloop></ul></div></font>
					</td><td><font color="#BBBBBB"><center><div class="newsitemtitle">&nbsp;</div></center></font></td></tr></table></center>
					</td>
					<td width="2" bgcolor="#5A63F7"><img src="images/main/spacer.gif" width=2 height=1 alt="" border="0"></td>	
				</tr>
				<tr>
					<td valign="top" colspan="3"><img src="images/main/recentbot.gif" width=560 height=10 alt="" border="0"></td>
				</tr>
			</table>

			<p>
<!-- D3 tournament banner -->		
<!---	
			<center><a href="http://www.interplay.com/descent3/ftour.html"><img src="../images/banners/contest_banner3.gif" width=468 height=60 alt="" border="0"></a></center>
			<p>
--->
<!-- D3 tournament banner -->			
			<!--- News items go here --->
	<cfloop query="main_news">
			<cfoutput><a name="#newsid#"></a></cfoutput>
			<table width="560" cellpadding="0" cellspacing="0" border="0"><tr><td width="13"><img src="images/main/newsitemleft.gif" width=13 height=25 alt="" border="0"></td><td width="535" bgcolor="#00217B"><font color="white" size="+1"><b><div class="newsitemtitle"><cfoutput>#DateFormat(main_news.date_posted,"m.d.yy")# #TimeFormat(main_news.date_posted,"h:mm tt")# - #main_news.title#</cfoutput></div></b></font></td><td width="12"><img src="images/main/newsitemright.gif" width=12 height=25 alt="" border="0"><br></td></tr></table> 	
			<center><table width="530"><tr><td><font color="#BBBBBB"><div class="newsitem"><cfoutput>#main_news.news_item#</cfoutput></div></font></td></tr></table></center><p>	
	</cfloop>
			<!--- End News items --->
<cfinclude template="docmid.cfm">
<!--- End page info --->	

<cfinclude template="menus/menu_news.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">




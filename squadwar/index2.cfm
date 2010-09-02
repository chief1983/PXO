<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<cfset document_title="Volition, Inc. - News">

<cfinclude template="doc_top.cfm">

<!--- bgcolor="#C4C4C4"  --->

		
		
<!--- page content goes here --->

<!---	<a href="http://www.freespace2.com"><img src="images/main/header2.jpg" width=509 height=150 alt="" border="0"></a><br> --->

<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0"
 ID=header2 WIDTH=510 HEIGHT=150>
	 <PARAM NAME=movie VALUE="images/main/header2.swf"> 
	 <PARAM NAME=loop VALUE=false> 
	 <PARAM NAME=quality VALUE=high> 
	 <PARAM NAME=bgcolor VALUE=#FFFFFF> 

	<!---
	 <EMBED src="header2.swf" loop=false quality=high bgcolor=#FFFFFF  WIDTH=510 HEIGHT=150 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
	 </EMBED>
	 --->
	 <SCRIPT LANGUAGE=JavaScript><!--
	var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
	if ( plugin && parseInt(plugin.description.substring(plugin.description.indexOf(".")-1)) >= 4 ) {
		// Check for Flash version 4 or greater in Netscape
		document.write('<EMBED src="header2.swf" loop=false quality=high bgcolor=#FFFFFF ');
		document.write(' WIDTH=510 HEIGHT=150');
		document.write(' TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash');
	} else if (!(navigator.appName && navigator.appName.indexOf("Netscape")>=0 && navigator.appVersion.indexOf("2.")>=0)){
		// Netscape 2 will display the IMG tag below so don't write an extra one
		document.write('<a href="http://www.freespace2.com"><img src="images/main/header2.jpg" width=510 height=150 alt="" border="0"></a><br>');
	}//-->
	</SCRIPT>
	<NOSCRIPT><a href="http://www.freespace2.com"><img src="images/main/header2.jpg" width=510 height=150 alt="" border="0"></a><br></NOSCRIPT>
</OBJECT>	
	
		<!--- start --->	
				<center>
				<table width="470" cellpadding=0 cellspacing=0 border=0><tr><td>
					<cfquery datasource="InternetSQL" name="main_news" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT *
						FROM news_main
						WHERE (d4=1 OR fs=1 OR st=1 OR fs2=1 OR sm=1) AND news_main.date_posted >= #DateAdd("m",-1,Now())#
						ORDER BY news_main.date_posted DESC
					</cfquery>
					
					<div class="title">Recent Headlines</div>
					
					<div class="copy">
						<ul>				
					<cfloop query="main_news" startrow=1 endrow=5>			
		
							<li><a href="index.cfm#<cfoutput>#newsid#</cfoutput>"><cfoutput>#main_news.title#</cfoutput></a>
						
					</cfloop>
						</ul>
					</div>
					
					<div class="copy">
						<a href="oldnews.cfm">Volition News Archive</a>
					</div>
					<p>
				</td></tr></table>
				</center>	
				
				
				<cfif main_news.recordcount IS NOT 0>
					<center>
					<cfloop query="main_news">
						
						<a name="<cfoutput>#newsid#</cfoutput>"></a>
						<cfoutput>
						<table width="475" cellpadding="2" cellspacing="0" border=0>
							<tr>
								<td colspan="2" valign="top" bgcolor="##000000">
									<div class="newstitle">&nbsp;&nbsp;#DateFormat(main_news.date_posted,"m.d.yy")# #TimeFormat(main_news.date_posted,"h:mm tt")# - #main_news.title#<br></div>							
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
						Sorry, but there is no news at this time.
					</div>
				</cfif>				
				
				<p>
				
		<!--- end --->
<!--- page content goes here --->			
		
<cfinclude template="doc_bot.cfm">		
		
		
		
		
		
		
		
		
		
		
		







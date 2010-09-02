<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="#relativepath#doctop.cfm">
<!--- Page info goes here	 --->			

	<div class="newsitemtitle">Current Descent 3 Games:</div>
	
	<p>
	
	<table width="100%" border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
	<tr>
		<td><div class="copy"><font color="#FFFFFF"><b>Server Name</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Mission</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Script</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Level</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Players</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Max Players</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Ping Time</b></font></div></td>
		<td><div class="copy"><font color="#FFFFFF"><b>Mode</b></font></div></td>
		
	</tr>
	<cfinclude template="gamelist.html">
	</table>
	
			<!--- End News items --->
<cfinclude template="#relativepath#docmid.cfm">
<!--- End page info --->	

<cfinclude template="#relativepath#menus/menu_news.cfm">
	
<!--- end menus --->
<cfinclude template="#relativepath#docbot.cfm">




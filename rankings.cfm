<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

<!---
		<div class="copy"><b><font color="white">Rankings will be unavailable until early next week.</font></b></div>
--->		

		<font color="white"><b><div class="newsitemtitle">Select the Rankings for the available games below:</div></b></font>
		
		<p>
		<center>
		<img src="images/games/hrbar.gif" width=560 height=11 alt="" border="0"><p>
	
		<a href="rankings/fs2full.cfm"><img src="images/games/t_freespace2.jpg" width=387 height=73 alt="" border="0"></a>
		<p>
		<a href="rankings/fs2d.cfm"><img src="images/games/t_freespace2demo.jpg" width=387 height=73 alt="" border="0"></a>		
		<p>
		<a href="rankings/d3.cfm"><img src="images/rankings/d3logoall.jpg" width=389 height=60 alt="" border="0"></a>
		<p>
		<a href="rankings/fs.cfm"><img src="images/rankings/fslogo01.jpg" width=393 height=96 alt="" border="0"></a>
		<p>		
<!---
		<img src="images/rankings/d3logo1.jpg" width=391 height=65 alt="" border="0">
		<p>
		<img src="images/rankings/d3logo2.jpg" width=391 height=65 alt="" border="0">
--->		
		</center>

			
<!--- End page info --->	
<cfinclude template="#relativepath#docmid.cfm">


<cfinclude template="#relativepath#menus/menu_rankings.cfm">
	
<!--- end menus --->
<cfinclude template="#relativepath#docbot.cfm">




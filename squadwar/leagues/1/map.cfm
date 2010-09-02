<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfset id=1>
<cfquery datasource='#currentdatasource#' name='get_leagues'>
	SELECT *
	FROM SWLeagues
	WHERE League_ID = #id#
</cfquery>
<!---
<cfquery datasource='#currentdatasource#' name='get_sectors'>
	SELECT 
		SWSectors.SWSectors_ID
		,SWSectors.SectorSquad
		,SWSectors.SectorName
		,SWSectors.Entry_node
		,(SELECT Squad_red FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSectors.SectorSquad) AS sysRed
		,(SELECT Squad_green FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSectors.SectorSquad) AS sysGreen
		,(SELECT Squad_blue FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSectors.SectorSquad) AS sysBlue
		,(SELECT abbrv FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSectors.SectorSquad) AS abbrv
	FROM SWSectors
	WHERE (League_ID = #id#)
	ORDER BY SWSectors.SWSectors_ID
</cfquery>

<cfset mapstring=''>
<cfset local_show_challenge=0>
<cfif isdefined("session.show_challenge")>
	<cfset local_show_challenge=session.show_challenge>
</cfif>
<cfif local_show_challenge IS 1>
	<cfloop query='get_sectors'>
		<cfset sector=Evaluate(get_sectors.SWSectors_ID-10000)>
			<cfif (FindNoCase(get_sectors.SWSectors_ID,session.owned)) OR (FindNoCase(get_sectors.SWSectors_ID,session.unclaimed))><cfset strRed=255><cfset strGreen=255><cfset strBlue=255>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 1)>	<cfset strRed=196><cfset strGreen=196><cfset strBlue=196>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 0)>	<cfset strRed=0><cfset strGreen=0><cfset strBlue=0>
				<cfelse><cfset strRed=get_sectors.sysRed><cfset strGreen=get_sectors.sysGreen><cfset strBlue=get_sectors.sysBlue>
			</cfif>
			<cfif get_sectors.abbrv IS ''><cfset team=''><cfelse><cfset team=URLEncodedFormat(get_sectors.abbrv)></cfif>							 
						<cfif mapstring IS NOT ''><cfset mapstring = mapstring & '&'></cfif>					 
						<cfset mapstring = mapstring &
															 sector & 'r=' & strRed & '&' &
															 sector & 'g=' & strGreen & '&' &
															 sector & 'b=' & strBlue>
	</cfloop>
<cfelse>
	<cfloop query='get_sectors'>
		<cfset sector=Evaluate(get_sectors.SWSectors_ID-10000)>
			<cfif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 1)>	<cfset strRed=196><cfset strGreen=196><cfset strBlue=196>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 0)>	<cfset strRed=0><cfset strGreen=0><cfset strBlue=0>
				<cfelse><cfset strRed=get_sectors.sysRed><cfset strGreen=get_sectors.sysGreen><cfset strBlue=get_sectors.sysBlue>
			</cfif>
			<cfif get_sectors.abbrv IS ''><cfset team=''><cfelse><cfset team=URLEncodedFormat(get_sectors.abbrv)></cfif>							 
						<cfif mapstring IS NOT ''><cfset mapstring = mapstring & '&'></cfif>					 
						<cfset mapstring = mapstring &
															 sector & 'r=' & strRed & '&' &
															 sector & 'g=' & strGreen & '&' &
															 sector & 'b=' & strBlue>
	</cfloop>
</cfif>
--->

<cfset isfullscreenhref=''>
<cfset relativepath='../../'>
<center>
	<cfset fullscreenhref='#relativepath#leagues/1/map.cfm?isfullscreen=1&leagueid=1'>
</center>
<cfif isdefined("isfullscreen")>
		<html>
		<head>
		<title></title>
		</head>
		<body bgcolor="#000000">
		<center>
		
					<!-- URL's used in the movie-->
					<!-- text used in the movie-->
					
					<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					 codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0"
					  ID=leaguemap WIDTH=100% height=100%>
					 <!--- <PARAM NAME=movie VALUE="<cfoutput>#get_leagues.map_location#</cfoutput>?<cfoutput>#mapstring#</cfoutput>">  --->
					 <PARAM NAME=movie VALUE="<cfoutput>#get_leagues.map_location#</cfoutput>"> 
					 <PARAM NAME=quality VALUE=high> 
					 <PARAM NAME=bgcolor VALUE=#000000> 
					 
<!---					 <EMBED src="<cfoutput>#get_leagues.map_location#</cfoutput>?<cfoutput>#mapstring#</cfoutput>"  --->
					  <EMBED src="<cfoutput>#get_leagues.map_location#</cfoutput>" 
					 	quality=high bgcolor=#000000  WIDTH=100% HEIGHT=100% TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED>
					</OBJECT>
		</center>
		</body>
		</html>

<cfelse>

				<map name="fullscreen">
				<area shape="RECT" coords="400,0,449,68" href="<cfoutput>#fullscreenhref#</cfoutput>" target="map">
				</map>		
				<map name="fullscreen2">
				<area shape="RECT" coords="400,0,449,68" href="<cfoutput>#fullscreenhref#</cfoutput>" target="map">
				</map>				
		
		<table width=490 cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td valign="top" rowspan=3><img src="<cfoutput>#relativepath#</cfoutput>images/leagues/1/left.gif" width=12 height=435 alt="" border="0"><br></td>
				<td valign="top"><img src="<cfoutput>#relativepath#</cfoutput>images/leagues/1/top.gif" width=450 height=28 alt="" border="0"><br></td>
				<td valign="top" rowspan=3><img src="<cfoutput>#relativepath#</cfoutput>images/leagues/1/right.gif" width=28 height=435 alt="" border="0" usemap="#fullscreen2"><br></td>
			</tr>
			<tr>
				<td width=450 height=338 align=center>
				<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					 codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0"
					  ID=leaguemap WIDTH=427 HEIGHT=321>
					  <!---  <PARAM NAME=movie VALUE="<cfoutput>#get_leagues.map_location#</cfoutput>?<cfoutput>#mapstring#</cfoutput>">  --->
					  <PARAM NAME=movie VALUE="<cfoutput>#get_leagues.map_location#</cfoutput>">
					 <PARAM NAME=quality VALUE=high> 
					 <PARAM NAME=bgcolor VALUE=#000000> 					 
<!---					 <EMBED src="<cfoutput>#get_leagues.map_location#</cfoutput>?<cfoutput>#mapstring#</cfoutput>"  --->
					 <EMBED src="<cfoutput>#get_leagues.map_location#</cfoutput>" 
					 	quality=high bgcolor=#000000 WIDTH=427 HEIGHT=321 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED>
					</OBJECT>
					</td>
			</tr>
			<tr>
				<td valign="top"><img src="<cfoutput>#relativepath#</cfoutput>images/leagues/1/bottom.gif" width=450 height=69 alt="" border="0" usemap="#fullscreen"><br></td>
			</tr>
		</table>
		<!---
		<div class="mapcaption">
			<center>
				Right-click on the map to zoom and get a better view of the sectors.<br>
				Click on "Fullscreen" to launch map in a separate window.
			</center>
		</div>
		--->
</cfif>



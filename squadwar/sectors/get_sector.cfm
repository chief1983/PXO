<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<cfinclude template="variables.cfm">
<html>
<head>
	<title>Get Sector</title>
	<link href="<cfoutput>#relativepath#</cfoutput>squadwar.css" rel="STYLESHEET" type="text/css">	
</head>
<body text="#FFFFFF" bgcolor="#000000" alink="#8AFFA5" link="#5CAA6E" vlink="#5CAA6E">

<cfif isdefined("id")>
	<cfif id IS NOT ''>
		<cfquery datasource="#currentdatasource#" name="get_sector_info">
			SELECT SWSectors.SectorName
				,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWSectors.SectorSquad) AS owner
				,(SELECT Squad_Web_Link FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWSectors.SectorSquad) AS owner_web
			FROM SWSECTORS
			WHERE SWSectors_ID = #id#
		</cfquery>
<!---
<cfif get_sector_info.owner_web IS NOT ''>
	<cflocation url="http://www.squadwar.com/squads/squadinfo.cfm?id=2&leagueid=1">
	<cflocation url="#get_sector_info.owner_web#">
</cfif>
		--->
		<cfoutput query="get_sector_info">
			<div class="title">System #id#: #get_sector_info.SectorName#</div>
			<table>
				<tr>
					<td align="right"><div class="copy"><b>Owner:</b></div></td>
					<td><div class="copy"><cfif get_sector_info.owner IS ''>Unclaimed<cfelse>#get_sector_info.owner#</cfif></div></td>
				</tr>
			</table>
		</cfoutput>
		
	</cfif>
</cfif>

</body>
</html>

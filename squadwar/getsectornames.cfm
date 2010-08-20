<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery name="get_sectors" datasource="squadwar">
	SELECT * 
		,(SELECT SWSquads.SquadName FROM SWSquads WHERE SWSectors.SectorSquad = SWSquads.SquadID) AS SquadName_pretty 
		,(SELECT SWMatches.SWSquad1 FROM SWMatches WHERE SWSectors.SWSectors_ID = SWMatches.SWSector_ID) AS SectorChallengerID
		,(SELECT SWSquads.SquadName FROM SWSquads WHERE SWSquads.SquadID = (SELECT SWMatches.SWSquad1 FROM SWMatches WHERE SWSectors.SWSectors_ID = SWMatches.SWSector_ID)) AS Challenger
	FROM SWSectors	
	WHERE League_ID = 1	ORDER BY SWSectors.SWSectors_ID
</cfquery>
<cfset first=1>
<cfset outputstring=''>
<cfloop query="get_sectors">
	<cfif first><cfset first=0><cfelse><cfset outputstring=outputstring & '&'></cfif><cfset outputstring=outputstring & 'sector#SWSectors_ID#name=#SectorName#'>
	<cfif SquadName_pretty IS NOT ''><cfset outputstring=outputstring & '&sector#SWSectors_ID#owner=#SquadName_pretty#'><cfelse><cfset outputstring=outputstring & '&sector#SWSectors_ID#owner=%20'></cfif>
	<cfif SectorChallengerID IS NOT ''><cfset outputstring=outputstring & '&sector#SWSectors_ID#chall=#Challenger# '><cfelse><cfset outputstring=outputstring & '&sector#SWSectors_ID#chall=%20'></cfif>
</cfloop>

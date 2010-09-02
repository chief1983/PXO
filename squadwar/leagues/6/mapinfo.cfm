<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfset id=6>
<cfquery datasource='#currentdatasource#' name='get_leagues'>
	SELECT *
	FROM SWLeagues
	WHERE League_ID = #id#
</cfquery>

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
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWSectors.SectorSquad) AS thisSquadName
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
		<cfset sector=Evaluate(get_sectors.SWSectors_ID-60000)>
			<cfif (FindNoCase(get_sectors.SWSectors_ID,session.owned)) OR (FindNoCase(get_sectors.SWSectors_ID,session.unclaimed))><cfset strRed=255><cfset strGreen=255><cfset strBlue=255>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 1)>	<cfset strRed=196><cfset strGreen=196><cfset strBlue=196>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 0)>	<cfset strRed=0><cfset strGreen=0><cfset strBlue=0>
				<cfelse><cfset strRed=get_sectors.sysRed><cfset strGreen=get_sectors.sysGreen><cfset strBlue=get_sectors.sysBlue>
			</cfif>
			<cfif get_sectors.abbrv IS ''><cfset team=''><cfelse><cfset team=URLEncodedFormat(get_sectors.abbrv)></cfif>							 				 
						<cfset mapstring = mapstring &
															 sector & 'r,' & strRed &  chr(13) & chr(10) & 
															 sector & 'g,' & strGreen & chr(13) & chr(10) & 
															 sector & 'b,' & strBlue & chr(13) & chr(10) &
															 sector & 'q,' & chr(34) & thisSquadName & chr(34) & chr(13) & chr(10)>
	</cfloop>
<cfelse>
	<cfloop query='get_sectors'>
		<cfset sector=Evaluate(get_sectors.SWSectors_ID-60000)>
			<cfif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 1)>	<cfset strRed=196><cfset strGreen=196><cfset strBlue=196>
				<cfelseif (get_sectors.sectorSquad IS 0) AND (Entry_Node IS 0)>	<cfset strRed=0><cfset strGreen=0><cfset strBlue=0>
				<cfelse><cfset strRed=get_sectors.sysRed><cfset strGreen=get_sectors.sysGreen><cfset strBlue=get_sectors.sysBlue>
			</cfif>
			<cfif get_sectors.abbrv IS ''><cfset team=''><cfelse><cfset team=URLEncodedFormat(get_sectors.abbrv)></cfif>							 				 
						<cfset mapstring = mapstring &
															 sector & 'r,' & strRed &  chr(13) & chr(10) & 
															 sector & 'g,' & strGreen & chr(13) & chr(10) & 
															 sector & 'b,' & strBlue & chr(13) & chr(10) &
															 sector & 'q,' & chr(34) & thisSquadName & chr(34) & chr(13) & chr(10)>
	</cfloop>
</cfif>


Name,Value<cfoutput>
#mapstring#
</cfoutput>

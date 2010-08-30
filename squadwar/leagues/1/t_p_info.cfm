<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="squadwar" name="get_matches">
	SELECT SWMatches.SWCode
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad1) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad2) AS Squad2_name
		, SWMatches.swsector_ID
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = SWMatches.swsector_ID) AS Sectorname
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWMatches_Info.SWCode = SWMatches.SWCode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM SWMatches LEFT JOIN SWMatches_Info ON SWMatches_Info.SWCode = SWMatches.SWCode
	WHERE League_ID = 1
	ORDER BY SWMatches_Info.Time_Created
</cfquery>
<cfset matchstring=''>
<cfset number=0>
<cfoutput query="get_matches">
<cfif matchstring IS ''>
	<cfset matchstring='message' & ',,' & 'Current Pending Matches: ' & '#get_matches.recordcount#'  & ',,,,' & chr(13) & chr(10)>
</cfif>
	<cfset number=number+1>
<cfset matchstring = matchstring & 'tickerstuff' & ',' &
	chr(34) & number & chr(34) & ',' & 
	chr(34) & DateFormat(get_matches.time_created,"m.d.yy") & chr(34) & ',' & 
	chr(34) & get_matches.squad1_name & chr(34) & ',' & 
	chr(34) & get_matches.squad2_name & chr(34) & ',' & 
	chr(34) & get_matches.swsector_id & chr(34) & ',' & 
	chr(34) & get_matches.SectorName & chr(34) &  chr(13) & chr(10) >
</cfoutput>

Clip,Number,Date,squad1,squad2,sector_ID,SectorName
<cfoutput>#matchstring#</cfoutput>

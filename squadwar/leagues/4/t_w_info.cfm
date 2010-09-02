<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfset checkdate=DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())>
<cfset checkdate=checkdate-604800>
<cfquery datasource="squadwar" name="get_matches">
	SELECT match_history.Swcode
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_victor) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = match_history.match_loser) AS Squad2_name
		, match_history.swsector_ID
		, match_history.match_time
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = { fn CONVERT(match_history.SWSector_ID,SQL_NUMERIC) } ) AS Sectorname 
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWmatches_Info.swcode = swmatches.Swcode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM match_history LEFT JOIN SWMatches_INFO ON SWmatches_Info.swcode = match_history.Swcode
	WHERE  (match_time > #checkdate#) AND (match_history.league_id = 3)
	ORDER BY  match_history.match_time DESC
</cfquery>
<cfset matchstring=''>
<cfset number=0>
<cfoutput query="get_matches">
<cfif matchstring IS ''>
<!---
	<cfset matchstring='message' & ',Recent Matches     ,,,,,' & chr(13) & chr(10)>
--->
</cfif>
	<cfset number=number+1>
	
	<!--- 	chr(34) & number & chr(34) & ',' &  --->
<cfset matchstring = matchstring & 'ticker_horiz1' & ',' &

	chr(34) & DateFormat(DateAdd('s',match_time,CreateDateTime(1970,1,1,0,0,0))  ,'mm.dd.yyyy') & chr(34) & ',' & 
	chr(34) & get_matches.squad1_name & chr(34) & ',' & 
	chr(34) & get_matches.squad2_name & chr(34) & ',' & 
	chr(34) & get_matches.swsector_id & chr(34) & ',' & 
	chr(34) & get_matches.SectorName & chr(34) &  chr(13) & chr(10) >
</cfoutput>

Clip,Date,squad1,squad2,sector_ID,SectorName
<cfoutput>#matchstring#</cfoutput>

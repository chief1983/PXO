<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<h1>PXO Stats</h1>

<cfquery datasource="pxo" name="count_pxo_users">
	SELECT Count(TrackerID) AS totalusers
	FROM Users
	WHERE Validated=1
</cfquery>
					
<cfoutput><b>#count_pxo_users.totalusers#</b></cfoutput> Validated PXO Users<br>

<cfset today=CreateODBCDateTime(CreateDateTime(DatePart('yyyy',Now()),DatePart('m',Now()),DatePart('d',Now()),0,0,0))>


<cfquery datasource="pxo" name="count_pxo_logins">
	SELECT Count(TrackerID) AS Totallogins
	FROM Users
	WHERE (LastAuthTime > #today#)
</cfquery>

<cfoutput><b>#count_pxo_logins.Totallogins#</b> users have logged in today. (d3 only)</cfoutput>

<hr>


<b>FreeSpace 2 Full</b><p>
<cfquery datasource="PXO" name="sum_fs2_missionsflown">
	SELECT SUM(MissionsFlown) AS totalmissionsflown
	FROM FreeSpace2Full
</cfquery>

<cfquery datasource="PXO" name="sum_fs2_flighttime">
	SELECT SUM(FlightTime) AS totalflighttime
	FROM FreeSpace2Full
</cfquery>
<cfset str_days=Int(sum_fs2_flighttime.totalflighttime / 86400)>
<cfset str_hours=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days)) / 3600)>
<cfset str_minutes=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600)) / 60)>
<cfset str_seconds=sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>

<cfquery datasource="pxo" name="count_fs2_pilots">
	SELECT Count(TrackerID) AS totalusers
	FROM FreeSpace2Full
</cfquery>
<cfquery datasource="pxo" name="count_fs2_players">
	SELECT Count(Pilot) AS totalusers
	FROM FreeSpace2Full
	GROUP BY TrackerID
</cfquery>			

<cfoutput><b>#count_fs2_pilots.totalusers#</b></cfoutput> FreeSpace 2 Pilots<br>
<cfoutput><b>#count_fs2_players.recordcount#</b></cfoutput> FreeSpace 2 Players<br>

Missions Flown: <cfoutput>#Int(sum_fs2_missionsflown.totalmissionsflown)#</cfoutput><br>
Flight Time: <cfoutput>#str_days#d #str_hours#h #str_minutes#m #str_seconds#s or ~ #Int(Evaluate(sum_fs2_flighttime.totalflighttime/3600))# hours</cfoutput><br>

<cfquery datasource="SquadWar" name="count_sw_squads">
	SELECT Count(Squadid) AS totalusers
	FROM SwSquads
</cfquery>		

<cfoutput><b>#count_sw_squads.totalusers#</b></cfoutput> SquadWar Squadrons<br>

<cfquery datasource="squadwar" name="get_matches">
	SELECT match_history.Swcode
	FROM match_history 
</cfquery>
<cfoutput><b>#get_matches.recordcount#</b></cfoutput> SquadWar Matches Played<br>
<hr>

<b>FreeSpace 2 Demo</b><p>
<cfquery datasource="PXO" name="sum_fs2_missionsflown">
	SELECT SUM(MissionsFlown) AS totalmissionsflown
	FROM FreeSpace2
</cfquery>

<cfquery datasource="PXO" name="sum_fs2_flighttime">
	SELECT SUM(FlightTime) AS totalflighttime
	FROM FreeSpace2
</cfquery>
<cfset str_days=Int(sum_fs2_flighttime.totalflighttime / 86400)>
<cfset str_hours=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days)) / 3600)>
<cfset str_minutes=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600)) / 60)>
<cfset str_seconds=sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>

<cfquery datasource="pxo" name="count_fs2demo_pilots">
	SELECT Count(TrackerID) AS totalusers
	FROM FreeSpace2
</cfquery>
<cfquery datasource="pxo" name="count_fs2demo_players">
	SELECT Count(Pilot) AS totalusers
	FROM FreeSpace2
	GROUP BY TrackerID
</cfquery>		


<cfoutput><b>#count_fs2demo_pilots.totalusers#</b></cfoutput> FreeSpace 2 Demo Pilots<br>
<cfoutput><b>#count_fs2demo_players.recordcount#</b></cfoutput> FreeSpace 2 Demo Players<br>

Missions Flown: <cfoutput>#Int(sum_fs2_missionsflown.totalmissionsflown)#</cfoutput><br>
Flight Time: <cfoutput>#str_days#d #str_hours#h #str_minutes#m #str_seconds#s or ~ #Int(Evaluate(sum_fs2_flighttime.totalflighttime/3600))# hours</cfoutput><br>
<hr>
<b>Descent 3</b><p>
<!---
<cfquery datasource="PXOSQL" name="sum_fs2_missionsflown">
	SELECT SUM(MissionsFlown) AS totalmissionsflown
	FROM Descent3
</cfquery>
--->
<cfquery datasource="PXOSQL" name="sum_d3_flighttime">
	SELECT SUM(OnlineTime) AS totalflighttime
	FROM Descent3
	WHERE Pilot <> '-Server-'
</cfquery>
<cfset str_days=Int(sum_d3_flighttime.totalflighttime / 86400)>
<cfset str_hours=Int((sum_d3_flighttime.totalflighttime - (86400 * str_days)) / 3600)>
<cfset str_minutes=Int((sum_d3_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600)) / 60)>
<cfset str_seconds=sum_d3_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>

<cfquery datasource="PXOSQL" name="count_d3_pilots">
	SELECT Count(TrackerID) AS totalusers
	FROM Descent3
</cfquery>
<cfquery datasource="PXOSQL" name="count_d3_players">
	SELECT Count(Pilot) AS totalusers
	FROM Descent3
	GROUP BY TrackerID
</cfquery>	


<cfoutput><b>#count_d3_pilots.totalusers#</b></cfoutput> Descent3 Pilots<br>
<cfoutput><b>#count_d3_players.recordcount#</b></cfoutput> Descent3 Players<br>

<!--- Missions Flown: <cfoutput>#sum_fs2_missionsflown.totalmissionsflown#</cfoutput><br> --->
Flight Time: <cfoutput>#str_days#d #str_hours#h #str_minutes#m #str_seconds#s or ~ #Int(Evaluate(sum_d3_flighttime.totalflighttime/3600))# hours</cfoutput><br>
<hr>

<b>FreeSpace</b><p>
<cfquery datasource="PXO" name="sum_fs2_missionsflown">
	SELECT SUM(MissionsFlown) AS totalmissionsflown
	FROM FreeSpace
</cfquery>

<cfquery datasource="PXO" name="sum_fs2_flighttime">
	SELECT SUM(FlightTime) AS totalflighttime
	FROM FreeSpace
</cfquery>
<cfset str_days=Int(sum_fs2_flighttime.totalflighttime / 86400)>
<cfset str_hours=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days)) / 3600)>
<cfset str_minutes=Int((sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600)) / 60)>
<cfset str_seconds=sum_fs2_flighttime.totalflighttime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>

<cfquery datasource="pxo" name="count_fs_pilots">
	SELECT Count(TrackerID) AS totalusers
	FROM FreeSpace
</cfquery>
<cfquery datasource="pxo" name="count_fs_players">
	SELECT Count(Pilot) AS totalusers
	FROM FreeSpace
	GROUP BY TrackerID
</cfquery>		

<cfoutput><b>#count_fs_pilots.totalusers#</b></cfoutput> FreeSpace Pilots<br>
<cfoutput><b>#count_fs_players.recordcount#</b></cfoutput> FreeSpace Players<br>

Missions Flown: <cfoutput>#Int(sum_fs2_missionsflown.totalmissionsflown)#</cfoutput><br>
Flight Time: <cfoutput>#str_days#d #str_hours#h #str_minutes#m #str_seconds#s or ~ #Int(Evaluate(sum_fs2_flighttime.totalflighttime/3600))# hours</cfoutput><br>


<hr>
<cfquery datasource="pxo" name="count_hardcore_fs_fs2_players">
	SELECT Count(FreeSpace.Pilot) AS totalusers
	FROM FreeSpace
	WHERE FreeSpace.TrackerID IN (SELECT TrackerID FROM FreeSpace2)
	GROUP BY FreeSpace.TrackerID
</cfquery>		

<cfoutput><b>#count_hardcore_fs_fs2_players.recordcount#</b></cfoutput> hardcore FS/FS2 players which have registered TrackerID's for both games.

<hr>


</body>
</html>

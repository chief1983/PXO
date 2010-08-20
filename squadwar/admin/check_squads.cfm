<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="SquadWar" name="get_squads">
	SELECT * FROM SWSquads			
	WHERE (Squadid IN (SELECT SWSquad1 FROM match_history)) OR (Squadid IN (SELECT SWSquad2 FROM match_history))
	ORDER BY SquadID
</cfquery>

Squads that have played matches: <cfoutput><b>#get_squads.recordcount#</b></cfoutput><br>


<hr>
<p>
<cfset played_squads=''>
<cfloop query="get_squads">
	<cfif played_squads IS ''>
		<cfset played_squads = get_squads.SquadID>
	<cfelse>
		<cfset played_squads = played_squads & ',' & get_squads.SquadID>
	</cfif>
</cfloop>

<cfoutput>#played_squads#</cfoutput>

<cfquery datasource="SquadWar" name="get_lame_squads">
	SELECT * FROM SWSquads			
	WHERE Squadid NOT IN (#played_squads#)
	ORDER BY SquadID
</cfquery>
<hr>
<cfoutput>#get_lame_squads.recordcount#</cfoutput>

<cfquery datasource="SquadWar" name="delete_lame_squad1">
	DELETE FROM SWSquads			
	WHERE Squadid NOT IN (#played_squads#)
</cfquery>

<cfquery datasource="SquadWar" name="delete_lame_squad2">
	DELETE FROM SwSquad_Info			
	WHERE Squadid NOT IN (#played_squads#)
</cfquery>

<cfquery datasource="SquadWar" name="delete_lame_squad3">
	DELETE FROM SWSquads_Leagues
	WHERE SWSquad_squadID NOT IN (#played_squads#)
</cfquery>

<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="SquadWar" name="update_pending_squads">
	DELETE FROM SWSquads
	WHERE Squadid = #squadid#
</cfquery>

<cfquery datasource="SquadWar" name="update_pending_squads">
	DELETE FROM SWSquad_Info
	WHERE Squadid = #squadid#
</cfquery>


<cflocation url="pending_squads.cfm">

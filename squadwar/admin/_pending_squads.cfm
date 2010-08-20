<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="SquadWar" name="update_pending_squads">
	UPDATE SWSquads
	SET ACTIVE =1
	WHERE Squadid = #squadid#
</cfquery>

<cfquery datasource="SquadWar" name="update_pending_squads">
	UPDATE SwSquad_Info
	SET APPROVED=1
	WHERE Squadid = #squadid#
</cfquery>

<cfquery datasource="SquadWar" name="getSquad_info">
	SELECT *
	FROM SWSquad_Info
	WHERE Squadid = #squadid#
</cfquery>

<cfmail to="#getSquad_info.squad_email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="Squad Approved">

Your squad has been approved for participation.

For more information on the SquadWar rules, visit the rules page at:
http://www.squadwar.com/rules/

Thanks,
nc

- Alvan Monje
- SquadWar Administrator
- squadwar@pxo.net

**Please leave all correspondence intact in your reply**
</cfmail> 


<cflocation url="pending_squads.cfm">

<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="#currentdatasource#" name="get_squad_members">
	SELECT SquadMembers
	FROM SWSquads
	WHERE SquadID=#session.squadid#
</cfquery>
<cfoutput>#memberid#</cfoutput>
<cfset updatestring=get_squad_members.SquadMembers>
<cfif ListFindNoCase(updatestring,memberid) GT 0>
<cfset updatestring=ListDeleteAt(updatestring,ListFindNoCase(updatestring,memberid))>

<cfquery datasource="#currentdatasource#" name="update_squad_members">
	UPDATE SWSquads
	SET SquadMembers='#updatestring#'
	WHERE SquadID=#session.squadid#
</cfquery>

</cfif>
<cflocation url="squadlogin_validate.cfm">

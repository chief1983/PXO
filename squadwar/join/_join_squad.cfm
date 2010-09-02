<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">

	<cfquery name="get_squad" datasource="#currentdatasource#">
		SELECT *
		FROM SWSquad_Info 
		WHERE (squadid = #form.squadid#) AND (Squad_Join_PW = '#form.join_password#')
	</cfquery>
	<cfquery name="get_squad_exists" datasource="#currentdatasource#">
		SELECT *
		FROM SWSquad_Info 
		WHERE (squadid = #form.squadid#)
	</cfquery>
	<cfquery name="get_pxo" datasource="#currentdatasource#">
		SELECT *
		FROM Users
		WHERE (login = '#form.pxo_login#') AND (password = '#form.pxo_password#')
	</cfquery>
	<cfquery name="check_squad" datasource="#currentdatasource#">
		SELECT *
		FROM SWSquads
		WHERE (squadid = #form.squadid#)
	</cfquery>
	
<cfif (check_squad.recordcount IS 0)>
	<cflocation url="#relativepath#error/error.cfm?message=This%20Squad%20no%20longer%20exists.">
<cfelseif (get_squad.recordcount IS 0)>
	<cflocation url="#relativepath#error/error.cfm?message=Your%20Squad%20Join%20Password%20is%20incorrect.">	
<cfelseif (get_pxo.recordcount IS 0)>
	<cflocation url="#relativepath#error/error.cfm?message=Your%20PXO%20login%20and%20password%20are%20incorrect.">
<cfelseif (get_squad_exists.recordcount IS 0)>
	<cflocation url="#relativepath#error/error.cfm?message=The%20squad%20administrator%20has%20not%20set%20the%20join password.">

<cfelse>

	<cfif ListContainsNoCase("#check_squad.SquadMembers#", "#get_pxo.trackerid#") is 0>
		<cfset squad_roster=check_squad.SquadMembers>
		<cfif squad_roster IS ''>
			<cfset squad_roster=squad_roster & get_pxo.trackerid>
		<cfelse>
			<cfset squad_roster=squad_roster & ',' & get_pxo.trackerid>
		</cfif>
		<cfquery datasource="#currentdatasource#">
			UPDATE SWSquads
				SET 
				SquadMembers = '#squad_roster#'
				WHERE (squadid = #form.squadid#)
		</cfquery>		
		<cflocation url="#relativepath#squads/squadinfo.cfm?id=#form.squadid#">
	<cfelse>
		<cflocation url="#relativepath#error/error.cfm?message=This%20person%20is%20already%20a%20member%20of%20this%20squad.">	
	</cfif>
	
	
	
	
	
</cfif>
	

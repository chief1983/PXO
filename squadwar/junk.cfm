<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Login">

<cfinclude template="#relativepath#doc_top.cfm">

	<cfinclude template="#relativepath#menu/main_notloggedin.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->

	<cfquery datasource="#maindatasource#">
		UPDATE SWSectors
		SET
			SectorSquad=0,
			SectorTime=0
	</cfquery>

								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

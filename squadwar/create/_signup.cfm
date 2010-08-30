<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="squadwar" name="check_squads">
	SELECT *
	FROM SWSquads
	WHERE SquadName = '#form.squad_name#'
</cfquery>

<cfquery datasource="PXO" name="get_pxo_stuff">
	SELECT *
	FROM Users
	WHERE (login='#form.pxo_login#') AND (password='#form.pxo_password#')
</cfquery>

<cfif check_squads.recordcount IS NOT 0>
	<cflocation url="index.cfm?message=That%20squad%20name%20is%20already%20taken.%20Please%20try%20another%20name.">
</cfif>

<cfif get_pxo_stuff.recordcount IS 0>
	<cflocation url="index.cfm?message=Invalid%20PXO%20Login%20or%20password.">
</cfif>

<cfif form.join_password IS NOT form.join_password2>
	<cflocation url="index.cfm?message=Your%20Squad%20join%20password%20and%20confirmation%20do%20not%20match.">
</cfif>

<cfif form.admin_password IS NOT form.admin_password2>
	<cflocation url="index.cfm?message=Your%20Squad%20admin%20password%20and%20confirmation%20do%20not%20match.">
</cfif>

<cf_mailtest email='#form.squad_email#'>
<cfif (trim(form.squad_email) IS NOT '') AND (#EMail_Level# IS NOT 0)>
	<cflocation url="index.cfm?message=1&email_message=#email_message#">							
</cfif>

<cfoutput>
	#form.squad_name#<br>
	#form.squad_email#<br>
	#form.pxo_login#<br>
	#form.pxo_password#<br>
	#get_pxo_stuff.trackerid#<br>
	#form.join_password#<br>
	#form.admin_password#<br>
	#form.squad_time_zone#<br>
</cfoutput>

		<cfquery datasource="squadwar"  name="add_squad">
			INSERT INTO SWSquads(
				SquadName
				,SquadPassword
				,SquadMembers
			)
			VALUES(
				'#form.squad_name#'
				,'#form.admin_password#'						
				,'#get_pxo_stuff.TrackerID#'
			)
		</cfquery>

		<cfquery datasource="squadwar" name="get_recent_squad">
			SELECT *
			FROM SWSquads
			WHERE SquadName = '#form.squad_name#'
		</cfquery>
		
	
		<cfquery datasource="squadwar">
			INSERT INTO SWSquad_Info(
				SquadID	
				,Squad_Leader_ID
				,Squad_Email
				,Squad_Join_PW
				,Squad_Time_Zone
				,time_registered
				
				,Squad_Leader_ICQ
				,Squad_Web_Link								
			)
			VALUES(
				#get_recent_squad.squadid# 
				,'#get_pxo_stuff.TrackerID#'
				,'#form.squad_email#'
				,'#form.join_password#'
				,#form.squad_time_zone#
				,#Now()#

				<cfif isdefined("form.squad_leader_icq")><cfif Trim(form.squad_leader_icq) IS NOT ''>,'#form.squad_leader_icq#'<cfelse>,NULL</cfif><cfelse>,NULL</cfif>												
				<cfif isdefined("form.Squad_Web_Link")><cfif Trim(form.Squad_Web_Link) IS NOT ''>,'#form.Squad_Web_Link#'<cfelse>,NULL</cfif><cfelse>,NULL</cfif>				

			)
		</cfquery>

<cfset icq=''>
<cfset link=''>
<cfif isdefined("form.squad_leader_icq")><cfif Trim(form.squad_leader_icq) IS NOT ''><cfset icq=form.squad_leader_icq></cfif></cfif>
<cfif isdefined("form.Squad_Web_Link")><cfif Trim(form.Squad_Web_Link) IS NOT ''><cfset link=form.Squad_Web_Link></cfif></cfif>	
		
<cfmail to="squadwar@pxo.net" from="squadwar@pxo.net" subject="SQUADWAR:REGISTRATION:#form.squad_name# " server="v-exchange.volition.net">												
										
http://www.squadwar.com/admin/_pending_squads.cfm?squadid=#get_recent_squad.squadid#

	#form.squad_name#
	#form.squad_email#
	#form.pxo_login#
	#get_pxo_stuff.trackerid#
	#form.squad_time_zone#
	#icq#
	#link#							
	
</cfmail>				

<cfmail to="#form.squad_email#" from="squadwar@pxo.net" subject="Thank you for Registering a SquadWar Squadron" server="v-exchange.volition.net">
										
Thank you for signing up for SquadWar. Your team will be contacted via email when your Squad has been approved by the Administrator. Please note that all Squad Names are subject to approval from the SquadWar administrator. 

Squad Name: #form.squad_name#
Squad ID Number: #get_recent_squad.squadid#
Squad Admin Password: #form.admin_password#
Squad Join Password: #form.join_password#

Please keep this email for reference purposes.


- Nathan Camarillo
- SquadWar Administrator
- squadwar@pxo.net
										
</cfmail>		
<cflocation url="index.cfm?message=Thank%20you%20for%20signing%20up%20for%20Squad%20War.%20%20Your%20team%20will%20be%20contacted%20via%20email%20when%20we%20are%20ready%20for%20the%20next%20phase.">	


		

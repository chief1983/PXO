<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist a Pilot">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
	<br>	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>			
	 			<div class="title"><cfoutput>PXO Account #session.login#</cfoutput></div>
	 			<table>
	 				<tr>
	 					<td align="right"><div class="copy">Full Name:</div></td>
	 					<td><div class="copy"><cfoutput>#session.firstname# #session.lastname#</cfoutput></div></td>
	 				</tr>
	 				<tr>
	 					<td align="right"><div class="copy">PXO Account Email:</div></td>
	 					<td><div class="copy"><cfoutput>#session.email#</cfoutput></div></td>
	 				</tr>			
	 				<tr>
	 					<td align="right"><div class="copy">PXO Tracker ID:</div></td>
	 					<td><div class="copy"><cfoutput>#session.trackerid#</cfoutput></div></td>
	 				</tr>											
	 				<tr>
	 					<td align="right"><div class="copy">FreeSpace 2 Pilots:</div></td>
	 					<td><div class="copy"><cfoutput>#session.totalfs2pilots#</cfoutput></div></td>
	 				</tr>						
	 			</table>
	 		</td></tr></table>			
	 	</center>				
	 			
	<hr noshade color="#2E5537">				
	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>	

				<cfquery name="get_squad" datasource="#currentdatasource#">
					SELECT *
					FROM SWSquads 
					WHERE (squadid=#session.squadid#) AND (Active=1) AND (SquadPassword='#session.squadpassword#')
				</cfquery>	
			
				<cfset valid_login=0>
			
				<cfif get_squad.recordcount IS NOT 0>
						<cfset valid_login=1>
				</cfif>
				
			    <cfif NOT valid_login>
					<cfset message=URLEncodedFormat('You must properly log in as your squad.')>
					<cflocation url='#relativepath#/error/error.cfm?message=#message#'>
				</cfif>			
				
				<cfif ListLen(get_squad.squadmembers) LT 2>
					<cfset message=URLEncodedFormat('You must have at least two members on your Squad before attempting to join a league.')>
					<cflocation url='#relativepath#/error/error.cfm?message=#message#'>
				</cfif>
			
				<cfquery name="check_squad" datasource="#currentdatasource#">
					SELECT *
					FROM SWSquads_Leagues 
					WHERE (SWSquad_SquadID = #session.squadid#) AND (Leagues=#leagueid#)
				</cfquery>
				

			
				
				<cfif check_squad.recordcount IS 0>
				<!--- INSERT --->
						<cfquery datasource="#currentdatasource#"  name="add_squad">
							INSERT INTO SWSquads_Leagues(
								SWSquad_SquadID
								,Leagues
							)
							VALUES(
								#session.squadid#
								,#leagueid#						
							)
						</cfquery>
				<cfelse>
						<cfset message=''>
						<cflocation url='#relativepath#/error/error.cfm?message=#URLEncodedFormat('You have already joined this league.')#'>			
				</cfif>

				<cflocation url="squadlogin_validate.cfm">
					
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

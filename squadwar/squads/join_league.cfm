<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

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

				<cfif ISDefined("session.squadpassword")>
						<cfset valid_login=1>
				</cfif>
				
			    <cfif NOT valid_login>
					<cfset message=URLEncodedFormat('You must log into your squad')>
					<cflocation url='#relativepath#/error/error.cfm?message=#message#'>			
				</cfif>			
			
				<cfquery name="get_squad" datasource="#currentdatasource#">
					SELECT *
					FROM SWLeagues 
					WHERE Active=1
					ORDER BY Title
				</cfquery>
			
				<div class="title">Join a League</div>
			
			
						<div class="copy">
							<cfform action="_join_league.cfm" method="POST" enablecab="no" name="login">
								<b>League:</b><br>
								<select name="leagueid">
									<cfoutput query="get_squad">
										<option value="#League_ID#">#Title#
									</cfoutput>
								</select>
								<p>
								<!---
								<b>Admin Password:</b><br>
								<cfinput type="password" name="password" value="session.squadpassword" message="You must enter your password." required="yes" size="20" maxlength="50"><br>
								<br>
								--->
								<input type="submit" value="Join League">
							</cfform>
						</div>

					
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

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
				<cfif isdefined("id")>
						<cfquery name="get_squad" datasource="#currentdatasource#">
							SELECT *
							FROM SWSquads 
							WHERE (squadid=#id#) 
						</cfquery>
					
					<cfif get_squad.recordcount IS 0>
						This squad does not exist.
					<cfelse>
					<div class="title">Join Squad: <cfoutput query="get_squad">#SquadName#</cfoutput></div>
					<p>
					<div class="copy">
					To join a Squad, the Squad Leader must give you the Squad's "join" password.  If you have the Squad's join password enter the join password, your PXO login, and your PXO password where prompted on the form.
					</div>
					
								<div class="copy">
									<cfform action="_join_squad.cfm?id=#id#" method="POST" enablecab="No" name="login">
										<cfoutput query="get_squad">
											<b>#SquadName#' Join Password:</b><br>
											<cfinput type="password" name="join_password" message="You must enter your password." required="yes" size="20" maxlength="50"><br>
											<b>PXO Login:</b><br>
											<cfinput type="text" name="pxo_login" value="#session.login#" message="You must enter your PXO login." required="yes" size="20" maxlength="50"><br>
											<b>PXO Password:</b><br>
											<cfinput type="password" name="PXO_password" value="#session.password#" message="You must enter your PXO password." required="yes" size="20" maxlength="50"><br>
											<br>
											<input type="hidden" name="squadid" value="#id#">
											<input type="hidden" name="refer" value="register/index.cfm">
											<input type="submit" value="Join This Squad">					
					
										</cfoutput>
									</cfform>
								</div>
					</cfif>
				</cfif>
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Edit Squad">

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

			
					<cfquery datasource="#currentdatasource#" name="get_squad">
						SELECT *
						FROM SWSquads
						WHERE SquadID = #session.squadid#
					</cfquery>					
					<cfquery datasource="#currentdatasource#" name="get_squad_info">
						SELECT *
						FROM SWSquad_Info
						WHERE SquadID = #session.squadid#
					</cfquery>			
					
					<div class="title">Edit Your Squad's Information</div>
					<p>
					<CFFORM ACTION="_edit_squad.cfm" METHOD="POST">	
						<table>
						<tr>
							<td align="right"><div class="copy"><b>Email Address:</b></div></td>
							<td><cfinput type="Text" name="squad_email" size="25" maxlength="50" required="yes" value="#get_squad_info.squad_email#"  message="You must enter your email address."></td>
						</tr>
						<tr>
							<td align="right"><div class="copy"><b>Squad ICQ:</b></div></td>
							<td><cfinput type="Text" name="squad_leader_icq" size="25" maxlength="25" required="no" value="#get_squad_info.squad_leader_icq#"  message=""></td>
						</tr>											
						<tr>
							<td align="right"><div class="copy"><b>Squad IRC:</b></div></td>
							<td><cfinput type="Text" name="squad_irc" size="25" maxlength="25" required="no" value="#get_squad_info.squad_irc#"  message=""></td>
						</tr>							
						<tr>
							<td align="right" valign="top"><div class="copy"><b>Squad Web Link:</b><br>(include http://)</div></td>
							<td valign="top"><cfinput type="Text" name="squad_web_link" size="25" maxlength="55" required="no" value="#get_squad_info.squad_web_link#"  message=""></td>
						</tr>							
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td><INPUT TYPE="SUBMIT" VALUE="Submit Change"></td></tr>
						</table>
						
						</cfform>									

			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

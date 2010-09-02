<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Create a Squad">

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

<cfif isdefined("message")>

	<cfif message IS 1>
		<div class="copy">
			<p>
			<font face="arial" color="FFFFFF"><cfoutput><b>#email_message#</b></cfoutput></font>
			<p>
			Please try again, an error has been detected in your submission.<br> 								
			If you have any further questions, feel free to contact <a href="mailto:webmaster@volition-inc.com">webmaster@volition-inc.com</a>.		
			<p>
			<a href="index.cfm">Return to sign-up page</a>		
		</div>					
	<cfelse>
		<cfoutput>
			<div class="copy">
				<b>#message#</b>
				<p>
				<a href="index.cfm">Return to sign-up page</a>
			</div>
		</cfoutput>
	</cfif>
<cfelse>
	<cfquery datasource="SquadWar" name="get_squads">
		SELECT SWSquads.SquadName, SWSquads.SquadMembers
		   ,SWSquad_Info.SquadID ,SWSquad_Info.Squad_Leader_ID ,SWSquad_Info.Squad_Leader_ICQ 
				   ,SWSquad_Info.Squad_IRC ,SWSquad_Info.Squad_Web_Link ,SWSquad_Info.Squad_Email ,SWSquad_Info.Squad_Time_Zone, SWSquad_Info.Squad_Statement
		FROM SWSquads, SWSquad_Info
		WHERE (SWSquads.SquadID = SWSquad_Info.SquadID)
	</cfquery>
	

	<div class="Copy">
	We are currently taking registrations for SquadWar Squads.  Please fill out the form below.  You need a valid email address and a <A href="http://www.pxo.net">PXO</a> account.  You will be contacted as soon as your Squad name has been approved for use in SquadWar.<p>
	<p>
	Below the form you will find a list of squads which have Registered.  All Squad Names are subject to approval from the SquadWar administrator.
	<p>
	Your "admin" password should only be known by your squad leader and trusted members of the squad.  Your "join" password is the password you will give out to others when you want them to join your squad.
	<p>
	If you have problems with this form, please write email to <a href="mailto:squadwar@pxo.net">squadwar@pxo.net</a>.
		
				<cfform action="_signup.cfm" method="POST" enablecab="No" name="login">
					<cfoutput>
					<table>
						<tr>
							<td align=""><div class="form_required"><p>&nbsp;<p><b>Required Info</b></div></td>
							<td></td>
						</tr>							
						<tr>
							<td align="right"><div class="form_required"><b>Squad Name:</b></copy></td>
							<td><cfinput type="text" name="squad_Name" message="You must enter your Squad Name." required="yes" size="20" maxlength="50"></td>
						</tr>	
						<tr>
							<td align="right"><div class="form_required"><b>Squad Email:</b></copy></td>
							<td><cfinput type="text" name="squad_email" message="You must enter your Squad Email." required="yes" size="20" maxlength="50"></td>
						</tr>												
						<tr>
							<td align="right"><div class="form_required"><b>Your PXO Login:</b></copy></td>
							<td><cfinput type="text" name="pxo_login" message="You must enter your PXO login." required="yes" size="20" maxlength="50"></td>
						</tr>	
						<tr>
							<td align="right"><div class="form_required"><b>Your PXO Password:</b></copy></td>
							<td><cfinput type="password" name="PXO_password" message="You must enter your PXO password." required="yes" size="20" maxlength="50"></td>
						</tr>										
						<tr>
							<td align="right"><div class="form_required"><b>Squad Join Password:</b></copy></td>
							<td><cfinput type="password" name="join_password" message="You must enter your squad join password." required="yes" size="20" maxlength="50"></td>
						</tr>
						<tr>
							<td align="right"><div class="form_required"><b>Confirm Squad Join Password:</b></copy></td>
							<td><cfinput type="password" name="join_password2" message="You must confirm your squad join password." required="yes" size="20" maxlength="50"></td>
						</tr>	
						<tr>
							<td align="right"><div class="form_required"><b>Squad Admin Password:</b></copy></td>
							<td><cfinput type="password" name="admin_password" message="You must enter your squad admin password." required="yes" size="20" maxlength="50"></td>
						</tr>
						<tr>
							<td align="right"><div class="form_required"><b>Confirm Squad Admin Password:</b></copy></td>
							<td><cfinput type="password" name="admin_password2" message="You must confirm your squad admin password." required="yes" size="20" maxlength="50"></td>
						</tr>		
						<tr>
							<td align="right"><div class="form_required"><b>Time Zone/Country:</b></div></td>
							<td>
								<cfquery datasource="squadwar" name="get_form_time_zones">
									SELECT *
									FROM form_time_zones
									ORDER BY ID
								</cfquery>
								<select name="squad_time_zone" size=1>
									<cfloop query="get_form_time_zones">
										<option value="#get_form_time_zones.id#"<cfif get_form_time_zones.id IS 22> selected</cfif>> [GMT #get_form_time_zones.value_hours#:<cfif get_form_time_zones.value_minutes IS 0>00<cfelse>#get_form_time_zones.value_minutes#</cfif>] #get_form_time_zones.description#
									</cfloop>
								</select>								
							</td>
						</tr>							
						<tr>
							<td align=""><div class="form"><b>Optional Info</b></div></td>
							<td></td>
						</tr>					
						<tr>
							<td align="right"><div class="form">Squad Leader ICQ:</copy></td>
							<td><cfinput type="text" name="squad_leader_icq" message="" required="no" size="20" maxlength="50"></td>
						</tr>			
						<tr>
							<td align="right"><div class="form">Squad Leader Web Page:</copy></td>
							<td><cfinput type="text" name="Squad_Web_Link" message="" required="no" size="20" maxlength="50"></td>
						</tr>																																	
						<tr>
							<td align="right"><div class="form"></div></td>
							<td></td>
						</tr>														
						<tr>
							<td></td><td align="left"><input type="submit" value="Submit This Squad!"></td>
						</tr>
					</table>
										
					</cfoutput>
				</cfform>

<!---				
	<p>
	
	<b>Currently Registered Squad Names:</b>
		<ul>
		<cfoutput query="get_squads">
			<li>#SquadName#
		</cfoutput>
		</ul>				
--->		
	
	</div>
</cfif>
	
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

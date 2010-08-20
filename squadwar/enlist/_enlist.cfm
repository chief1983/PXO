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

<cfinclude template="#relativepath#menu/enlist_main.cfm">

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
	<cfif action IS 'update'>
		<cfquery datasource="#currentdatasource#" name="check_pilot">
			SELECT *
			FROM SWPilots
			WHERE (trackerid = '#form.trackerid#') AND (Pilot_Name = '#form.pilot#')
		</cfquery>
		
		<div class="title">Edit Pilot:</div>
		<p>
			<cfform action="_enlist_update.cfm?action=update" method="POST" enablecab="no" name="enlist_update">
				<cfoutput>
				<table>
					<tr>
						<td align="right"><div class="copy"><b>TrackerID:</b></div></td>
						<td><div class="copy">#check_pilot.trackerid#</div><input type="hidden" name="trackerid" value="#check_pilot.trackerid#"></td>
					</tr>
					<tr>
						<td align="right"><div class="copy"><b>Pilot:</b></div></td>
						<td><div class="copy">#check_pilot.Pilot_Name#</div><input type="hidden" name="Pilot" value="#check_pilot.Pilot_Name#"></td>
					</tr>
					<tr>
						<td align="right"><div class="copy"><b>ICQ:</b></div></td>
						<td><input type="text" name="ICQ" size=15 value="<cfif check_pilot.icq IS NOT ''>#check_pilot.icq#</cfif>"></td>
					</tr>			
					<tr>
						<td align="right"><div class="copy"><b>Time Zone:</b></div></td>
						<td>
							<cfquery datasource="#currentdatasource#" name="get_form_time_zones">
								SELECT *
								FROM form_time_zones
								ORDER BY ID
							</cfquery>
							<select name="time_zone" size=1>
								<cfloop query="get_form_time_zones">
									<option value="#get_form_time_zones.id#"<cfif check_pilot.time_zone IS get_form_time_zones.id> selected</cfif>> [GMT #get_form_time_zones.value_hours#:<cfif get_form_time_zones.value_minutes IS 0>00<cfelse>#get_form_time_zones.value_minutes#</cfif>] #get_form_time_zones.description#
								</cfloop>
							</select>
						</td>
					</tr>						
					<tr>
						<td align="right"><div class="copy"><b>Connection Type:</b></div></td>
						<td>
							<cfquery datasource="#currentdatasource#" name="get_form_connection_type">
								SELECT *
								FROM form_connection_type
								ORDER BY ID
							</cfquery>
							<select name="connection_type" size=1>
								<cfloop query="get_form_connection_type">
									<option value="#get_form_connection_type.id#"<cfif check_pilot.connection_type IS get_form_connection_type.id> selected</cfif>> #get_form_connection_type.type#
								</cfloop>
							</select>
						</td>
					</tr>	
					<tr>
						<td align="right"><div class="copy"><b>Show Email:</b></div></td>
						<td>
							<input type="checkbox" name="show_email"<cfif check_pilot.show_email> checked</cfif>>
						</td>
					</tr>		
					<tr>
						<td align="right"><div class="copy"><b>Email:</b></div></td>
						<td>
							<input type="text" size=25 name="email" value="<cfif check_pilot.email IS NOT ''>#check_pilot.email#</cfif>">
						</td>
					</tr>																					
				</table>
				<cfif check_pilot.recruitme IS 0>
					<input type="submit" value="Re-Enlist this Pilot">
				<cfelse>
					<input type="submit" value="Update this Pilot">
				</cfif>
				
				</cfoutput>
			</cfform>
	<cfelseif action IS 'add'>
		<div class="title">
			Enlist a Pilot
		</div>
		<p>
		<div class="copy">
			This pilot has not been signed up for recruitment.  Please enter this pilot's data:
		</div>
			<cfform action="_enlist_update.cfm?action=add" method="POST" enablecab="no" name="enlist_update">
				<cfoutput>
				<input type="hidden" name="refer" value="register/_enlist.cfm">
				<table>
					<tr>
						<td align="right"><div class="copy"><b>TrackerID:</b></div></td>
						<td><div class="copy">#session.trackerid#</div><input type="hidden" name="trackerid" value="#session.trackerid#"></td>
					</tr>
					<tr>
						<td align="right"><div class="copy"><b>Pilot:</b></div></td>
						<td><div class="copy">#Form.Pilot#</div><input type="hidden" name="Pilot" value="#Form.Pilot#"></td>
					</tr>
					<tr>
						<td align="right"><div class="copy"><b>ICQ:</b></div></td>
						<td><input type="text" name="ICQ" size=15></td>
					</tr>			
					<tr>
						<td align="right"><div class="copy"><b>Time Zone:</b></div></td>
						<td>
							<cfquery datasource="#currentdatasource#" name="get_form_time_zones">
								SELECT *
								FROM form_time_zones
								ORDER BY ID
							</cfquery>
							<select name="time_zone" size=1>
								<cfloop query="get_form_time_zones">
									<option value="#get_form_time_zones.id#"<cfif #get_form_time_zones.id# IS "22"> selected</cfif>> [GMT #get_form_time_zones.value_hours#:<cfif get_form_time_zones.value_minutes IS 0>00<cfelse>#get_form_time_zones.value_minutes#</cfif>] #get_form_time_zones.description#
								</cfloop>
							</select>
						</td>
					</tr>		
					<tr>
						<td align="right"><div class="copy"><b>Connection Type:</b></div></td>
						<td>
							<cfquery datasource="#currentdatasource#" name="get_form_connection_type">
								SELECT *
								FROM form_connection_type
								ORDER BY ID
							</cfquery>
							<select name="connection_type" size=1>
								<cfloop query="get_form_connection_type">
									<option value="#get_form_connection_type.id#"> #get_form_connection_type.type#
								</cfloop>
							</select>
						</td>
					</tr>	
					<tr>
						<td align="right"><div class="copy"><b>Show Email:</b></div></td>
						<td>
							<input type="checkbox" name="show_email">
						</td>
					</tr>		
					<tr>
						<td align="right"><div class="copy"><b>Email:</b></div></td>
						<td>
							<input type="text" size=25 name="email" value="">
						</td>
					</tr>																					
				</table>
				 
				 
				 
				
				<p>
				<input type="submit" value="Enlist this Pilot">
				</cfoutput>
			</cfform>		
	</cfif>

			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

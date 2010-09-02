<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
	<cfif action IS 'update'>
		<cfquery datasource="#currentdatasource#" name="check_pilot">
			SELECT *
			FROM SWPilots
			WHERE (trackerid = '#form.trackerid#') AND (Pilot_Name = '#form.pilot#')
		</cfquery>
	
		<cfoutput>#check_pilot.recordcount#</cfoutput><p>
		You can edit this pilot's data:
			<cfform action="_enlist_update.cfm?action=update" method="POST" enablecab="no" name="enlist_update">
				<cfoutput>
				<table>
					<tr>
						<td align="right"><b>TrackerID:</b></td>
						<td>#check_pilot.trackerid#<input type="hidden" name="trackerid" value="#check_pilot.trackerid#"><br></td>
					</tr>
					<tr>
						<td align="right"><b>Pilot:</b></td>
						<td>#check_pilot.Pilot_Name#<input type="hidden" name="Pilot" value="#check_pilot.Pilot_Name#"><br></td>
					</tr>
					<tr>
						<td align="right"><b>ICQ:</b></td>
						<td><input type="text" name="ICQ" size=15 value="<cfif check_pilot.icq IS NOT ''>#check_pilot.icq#</cfif>"></td>
					</tr>			
					<tr>
						<td align="right"><b>Time Zone:</b></td>
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
						<td align="right"><b>Connection Type:</b></td>
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
						<td align="right"><b>Show Email:</b></td>
						<td>
							<input type="checkbox" name="show_email"<cfif check_pilot.show_email> checked</cfif>>
						</td>
					</tr>		
					<tr>
						<td align="right"><b>Email:</b></td>
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
		This pilot has not been signed up for recruitment.  Please enter this pilot's data:
			<cfform action="_enlist_update.cfm?action=add" method="POST" enablecab="no" name="enlist_update">
				<cfoutput>
				<input type="hidden" name="refer" value="register/_enlist.cfm">
				<table>
					<tr>
						<td align="right"><b>TrackerID:</b></td>
						<td>#session.trackerid#<input type="hidden" name="trackerid" value="#session.trackerid#"><br></td>
					</tr>
					<tr>
						<td align="right"><b>Pilot:</b></td>
						<td>#Form.Pilot#<input type="hidden" name="Pilot" value="#Form.Pilot#"><br></td>
					</tr>
					<tr>
						<td align="right"><b>ICQ:</b></td>
						<td><input type="text" name="ICQ" size=15></td>
					</tr>			
					<tr>
						<td align="right"><b>Time Zone:</b></td>
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
						<td align="right"><b>Connection Type:</b></td>
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
						<td align="right"><b>Show Email:</b></td>
						<td>
							<input type="checkbox" name="show_email">
						</td>
					</tr>		
					<tr>
						<td align="right"><b>Email:</b></td>
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

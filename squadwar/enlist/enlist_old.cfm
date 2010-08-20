<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->


										
										<cfquery datasource="PXO" name="fs2_search_pilots">
											SELECT *
											FROM FreeSpace2Full
											WHERE TrackerID = '#session.trackerid#'
										</cfquery>								

<!--- FreeSpace 2 --->


										<cfoutput>
											<font color="white"><b><div class="newsitemtitle">#session.login#'s FreeSpace 2 Pilots</div></b></font>								
										</cfoutput>
										
										<cfif fs2_search_pilots.recordcount IS 0>
											No pilots exist for this account.<p>
										<cfelse>
	
											<ol>
											<cfoutput query="fs2_search_pilots">	

																<cfset str_rank="Ensign">
																	<cfif fs2_search_pilots.Rank IS '0'><cfset str_rank="Ensign">
																		<cfelseif fs2_search_pilots.Rank IS '1'><cfset str_rank="Lt.J.G.">
																		<cfelseif fs2_search_pilots.Rank IS '2'><cfset str_rank="Lt.">
																		<cfelseif fs2_search_pilots.Rank IS '3'><cfset str_rank="Lt.Cmdr.">
																		<cfelseif fs2_search_pilots.Rank IS '4'><cfset str_rank="Cmdr.">
																		<cfelseif fs2_search_pilots.Rank IS '5'><cfset str_rank="Capt.">
																		<cfelseif fs2_search_pilots.Rank IS '6'><cfset str_rank="Cmdore.">
																		<cfelseif fs2_search_pilots.Rank IS '7'><cfset str_rank="R.Admir.">
																		<cfelseif fs2_search_pilots.Rank IS '8'><cfset str_rank="V.Admir.">
																		<cfelseif fs2_search_pilots.Rank IS '9'><cfset str_rank="Admiral">
																	</cfif>							
																	
																	<cfset str_days=Int(fs2_search_pilots.FlightTime / 86400)>
																	<cfset str_hours=Int((fs2_search_pilots.FlightTime - (86400 * str_days)) / 3600)>
																	<cfset str_minutes=Int((fs2_search_pilots.FlightTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
																	<cfset str_seconds=fs2_search_pilots.FlightTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
																	
																	<cfif str_days IS 0><cfset str_days='0'></cfif>
																	<cfif str_hours IS 0><cfset str_hours='0'></cfif>
																	<cfif str_hours LT 10><cfset str_hours='0' & str_hours></cfif>
																	<cfif str_minutes IS 0><cfset str_minutes='0'></cfif>
																	<cfif str_minutes LT 10><cfset str_minutes='0' & str_minutes></cfif>
																	<cfif str_seconds LT 10><cfset str_seconds='0' & str_seconds></cfif>
																	<cfset str_time= str_days & ' days ' & str_hours & ' hours ' & str_minutes & ' minutes'>																						
																										
																	<li><font color=""><b>Pilot:</b> #Pilot#<br></font>
																		<font color=""><b>Score:</b></font> #Score#<br>
																		<font color=""><b>Rank:</b></font> #str_rank#<br>
																		<font color=""><b>Kills:</b></font> #KillCountOK#<br>
																		<font color=""><b>Missions Flown:</b></font> #MissionsFlown#<br>
																		<font color=""><b>Flight Time:</b></font> #str_time#<br>
																		<cfform action="_enlist.cfm" method="POST" enablecab="no" name="addpilot">
																			<input type="hidden" name="refer" value="register/index.cfm">
																			<input type="hidden" name="trackerid" value="#session.trackerid#">
																			<input type="hidden" name="Pilot" value="#Pilot#">
																		<cfquery datasource="#currentdatasource#" name="get_enlisted_pilots">
																			SELECT *
																				,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
																				,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
																			FROM SWPilots
																			WHERE (TrackerID = '#session.trackerid#') AND (Pilot_Name = '#Pilot#')
																		</cfquery>
																		<cfif get_enlisted_pilots.recordcount LT 1>		
																			<input type="hidden" name="action" value="add">
																			<input type="submit" value="Enlist this pilot">																																				
																		<cfelse>
																			<font color=""><b>ICQ:</b></font> #get_enlisted_pilots.icq#<br>
																			<cfif get_enlisted_pilots.show_email IS 1>
																				<b>Email:</b> #get_enlisted_pilots.email#<br>
																			</cfif>
																			<font color=""><b>Time Zone:</b></font> #get_enlisted_pilots.fetch_time_zone#<br>
																			<font color=""><b>Connection Type:</b></font> #get_enlisted_pilots.fetch_connection_type#<br>
																			<input type="hidden" name="action" value="update">
																			<cfif get_enlisted_pilots.recruitme>
																				<input type="submit" value="Update this pilot">
																			<cfelse>
																				<input type="submit" value="Re-Enlist this pilot">
																			</cfif>
																																																																			
																		</cfif>				
																		</cfform>								
																		<br>
											</cfoutput>
												</ol>
										</cfif>
										
<!--- FreeSpace 2 --->	

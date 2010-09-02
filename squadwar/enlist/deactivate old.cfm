<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
										<cfquery datasource="PXO" name="fs2_search_pilots">
											SELECT *
											FROM FreeSpace2Full
											WHERE TrackerID = '#session.trackerid#'
										</cfquery>								

<!--- FreeSpace 2 --->


										<cfoutput>
											<font color="white"><b><div class="newsitemtitle">#session.login#'s FreeSpace 2 Pilots</div></b></font>								
										</cfoutput>
											<p>
											<div class="copy">
												Choose a pilot to remove from the Recruit Board.
											</div>
											<p>
										<cfif fs2_search_pilots.recordcount IS 0>
											<div class="copy">
												No pilots exist for this account.<p>
											</div>
										<cfelse>
	
											<ol>
											<cfoutput query="fs2_search_pilots">	
												<cfquery datasource="#currentdatasource#" name="get_enlisted_pilots">
													SELECT *
														,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
														,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
													FROM SWPilots
													WHERE (TrackerID = '#session.trackerid#') AND (Pilot_Name = '#Pilot#')
												</cfquery>
												<cfif get_enlisted_pilots.recordcount GT 0>
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
																										
																	<li><b>Pilot:</b> #Pilot#<br>
																		<b>Score:</b> #Score#<br>
																		<b>Rank:</b> #str_rank#<br>
																		<b>Kills:</b> #KillCountOK#<br>
																		<b>Missions Flown:</b> #MissionsFlown#<br>
																		<b>Flight Time:</b> #str_time#<br>
																		<cfform action="_enlist_deactivate.cfm" method="POST" enablecab="no" name="addpilot">
																			<input type="hidden" name="refer" value="register/index.cfm">
																			<input type="hidden" name="trackerid" value="#session.trackerid#">
																			<input type="hidden" name="Pilot" value="#Pilot#">
																			<b>ICQ:</b> #get_enlisted_pilots.icq#<br>
																			<b>Time Zone:</b> #get_enlisted_pilots.fetch_time_zone#<br>
																			<b>Connection Type:</b> #get_enlisted_pilots.fetch_connection_type#<br>
																			<input type="hidden" name="action" value="update">
																			<input type="submit" value="Deactivate this pilot">																														
																		</cfform>													
																		<br>
												</cfif>
											</cfoutput>
												</ol>
									</cfif>
										
<!--- FreeSpace 2 --->	

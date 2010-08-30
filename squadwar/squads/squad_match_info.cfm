<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Scheduling System">

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
<cfquery datasource="squadwar" name="get_matches">
	SELECT SWMatches.SWCode, SWMatches.swsquad1, SWMatches.swsquad2, SWMatches.league_id
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad1) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad2) AS Squad2_name
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad1) AS Squad1_Email
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad2) AS Squad2_Email
		, SWMatches.swsector_ID
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = SWMatches.swsector_ID) AS Sectorname
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWMatches_Info.SWCode = SWMatches.SWCode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM SWMatches LEFT JOIN SWMatches_Info ON SWMatches_Info.SWCode = SWMatches.SWCode
	WHERE ((SWMatches.swsquad1 = #session.squadid#) OR (SWMatches.swsquad2 = #session.squadid#)) AND (SWMatches.SWCode = '#matchid#')
	ORDER BY SWMatches_Info.Time_Created DESC
</cfquery>


						<table width="90%" cellpadding=0 cellspacing=0 border=0>							
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="4" align="center"><div class="title">Pending Match <cfoutput>#get_matches.SWCode#</cfoutput></div></td></tr>
								<tr>
									<td><div class="copy">Date</div></td>
									<td><div class="copy">Code</div></td>
									<td><div class="copy">Description</div></td>
									<td><div class="copy">Opponent's Email</div></td>
								</tr>
							<cfoutput query="get_matches">							
											<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="##0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
												<td>
													<div class="copy">
														<cfif get_matches.time_created LT DateAdd("d",-7,Now())>
															<font color="red">
														</cfif>
														<b>#DateFormat(get_matches.time_created,"m.d.yy")#</b>
														<cfif get_matches.time_created GT DateAdd("w",-1,Now())>
															</font>
														</cfif>
													</div>
												</td>
												<td><div class="copy">&nbsp;#SWCode#&nbsp;<cfset this_SWCode=get_matches.SWCode></div></td>
												<td>
													<div class="copy">
														<cfif swsquad1 IS NOT session.squadid><a href="squadinfo.cfm?id=#swsquad1#"></cfif>#get_matches.squad1_name#<cfif swsquad1 IS NOT session.squadid></a></cfif>
														Challenged
														<cfif swsquad2 IS NOT session.squadid><a href="squadinfo.cfm?id=#swsquad2#"></cfif>#get_matches.squad2_name#<cfif swsquad2 IS NOT session.squadid></a></cfif>
														for control of Sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
													</div>
												</td>
												<td>
													<div class="copy">
													<cfif swsquad1 IS NOT session.squadid>
														<a href="mailto:#Squad1_Email#">#Squad1_Email#</a>
													<cfelse>
														<a href="mailto:#Squad2_Email#">#Squad2_Email#</a>
													</cfif>
													</div>
												</td>
											</tr>
							</cfoutput>		
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="#0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
									<!---
									<td colspan="4" align="center">
										<div class="copy">There are <cfoutput>#get_matches.recordcount#</cfoutput> matches pending in this league</div>
									</td>
									--->
								</tr>
						<cfelse>
							<tr><td colspan="3"><div class="title">Your squad is not authorized to view the information for this match.</div></td></tr>
						</cfif>
						</table>
					
					
						<cfquery datasource="#currentdatasource#" name="get_SWMatches_info">
							SELECT *
							FROM SWMatches_Info
							WHERE SWCode = '#this_SWCode#'
						</cfquery>
						<cfset current_phase=1>
						<cfif get_SWMatches_info.match_time2 IS NOT ''><cfset current_phase=2></cfif>
						<cfif get_SWMatches_info.match_time2 IS NOT ''><cfset current_phase=2></cfif>
						<cfif get_SWMatches_info.proposed_final_time IS NOT ''><cfset current_phase=3></cfif>
						<cfif get_SWMatches_info.proposed_alternate_time IS NOT ''><cfset current_phase=3></cfif>
						<cfif get_SWMatches_info.final_match_time IS NOT ''><cfset current_phase=4></cfif>
						<!-- <div class="copy">This match is in the current phase of: <cfoutput>#current_phase#</cfoutput></div> -->
						<p>

						<!--- START PHASE 0 --->
						<cfif current_phase IS 1>
						<hr>
						<p>						
							<cfif get_matches.swsquad1 IS session.squadid>
								<div class="title">
									Phase 1: Propose two times to play this match.
								</div>
								<p>
								
							
								<cfform action="_propose_phase_1.cfm">
								<center>
								<table>
									<tr>
										<th><font color="white">&nbsp;</font></th>
										<th><font color="white">Date</font></th>
										<th colspan="3"><font color="white">Time</font></th>
										<th><font color="white">Time Zone</font></th>
									</tr>																		
									<tr>
										<td align="top"><div class="copy"><nobr>Option 1:</nobr></div></td>
										<td align="top">
											<div class="copy">											
												<select name="date1">
												<cfloop from='6' to='8' index='day_add' step='1'>												
													<cfoutput><option value='#day_add#'>#DateFormat(DateAdd('d',day_add,get_SWMatches_info.time_created),"mmmm d yyyy")#</cfoutput>
												</cfloop>
												</select>																
											</div>										
										</td>											
										<td align="top">
											<div class="copy">											
												<select name="hour1">
												<cfloop from='0' to='23' index='hour' step='1'>
													<cfoutput><option value='#hour#'>#Numberformat(hour,'0_')#</cfoutput>
												</cfloop>
												</select>
											</div>
										<td><div class="copy"><font color="white"><b>:</b></font></div></td>
										<td align="top">
											<div class="copy">													
												<select name="minute1">
												<cfloop from='0' to='45' index='minute' step='15'>
													<cfoutput><option value='#minute#'>#Numberformat(minute,'0_')#</cfoutput>
												</cfloop>
												</select>																
											</div>										
										</td>
										<td align="top">
											<div class="copy">																		
												All times are <cfif get_matches.league_id IS 3>GMT<cfelse>EST</cfif>.														
											</div>
										</td>	
									</tr>
									
									<tr>
										<td align="top"><div class="copy"><nobr>Option 2:</nobr></div></td>
										<td align="top">
											<div class="copy">											
												<select name="date2">
												<cfloop from='6' to='8' index='day_add' step='1'>												
													<cfoutput><option value='#day_add#'>#DateFormat(DateAdd('d',day_add,get_SWMatches_info.time_created),"mmmm d yyyy")#</cfoutput>
												</cfloop>
												</select>																
											</div>										
										</td>	
										<td align="top">
											<div class="copy">											
												<select name="hour2">
												<cfloop from='0' to='23' index='hour' step='1'>
													<cfoutput><option value='#hour#'>#Numberformat(hour,'0_')#</cfoutput>
												</cfloop>
												</select>
											</div>
										<td><div class="copy"><font color="white"><b>:</b></font></div></td>
										<td align="top">
											<div class="copy">	
												<select name="minute2">
												<cfloop from='0' to='45' index='minute' step='15'>
													<cfoutput><option value='#minute#'>#Numberformat(minute,'0_')#</cfoutput>
												</cfloop>
												</select>																
											</div>											
										</td>	
										<td align="top">
											<div class="copy">																		
												All times are <cfif get_matches.league_id IS 3>GMT<cfelse>EST</cfif>.													
											</div>
										</td>								
									</tr>																	
								</table>
								</center>
								<p>
								<input type="hidden" name="SWCode" value="<cfoutput>#get_matches.SWCode#</cfoutput>">
								<center><input type='submit' value='Propose these times'></center>
								</cfform>		
								
							<cfelse>
								<div class="title">
									Phase 1: Waiting for challenging squad to propose a time to play this match.
								</div>								
							</cfif>
							<cfelse>
								<hr>
								<p>
								<div class="title">
									Phase 1 (completed): The initial proposed times for the match are...
								</div>
								<p>
								<cfoutput>
								<div class="copy">
									<b>Option 1:</b> #DateFormat(get_SWMatches_info.match_time1,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.match_time1,"h:mm tt")#<br>
									<b>Option 2:</b> #DateFormat(get_SWMatches_info.match_time2,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.match_time2,"h:mm tt")#<br>
								</div>
								</cfoutput>
								
						</cfif>
	<!--- END PHASE 1 --->
					
					
					
					
					
					
					
<!--- START PHASE 2 --->
						<cfif current_phase IS 2>
						<hr>
						<p>						
							<cfif get_matches.swsquad2 IS session.squadid>
								<div class="title">
									Phase 2: Set the battle parameters of this match.
								</div>
								<p>
								
							
								<cfform action="_propose_phase_2.cfm">
								<center>
								<table>
									<tr>
										<td align="right"><div class="copy"><b>Mission:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<select name="mission">
												<cfinclude template='../forms/form_missions.txt'>
											</select>										
										</td>
									</tr>
									<tr>
										<td align="right"><div class="copy"><b>Number of Pilots:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<select name="pilots">
												<cfinclude template='../forms/form_pilots.txt'>
											</select>										
										</td>										
									</tr>
									<tr>
										<td align="right"><div class="copy"><b>AI Pilots:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<select name="ai">
												<cfinclude template='../forms/form_ai.txt'>
											</select>										
										</td>										
									</tr>		
									<tr>
										<td align="right"><div class="copy"><b>Time Option:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<select name="proposed_final_time">
												<cfoutput>
												<option value="#DatePart("yyyy",get_SWMatches_info.match_time1)#,#DatePart("m",get_SWMatches_info.match_time1)#,#DatePart("d",get_SWMatches_info.match_time1)#,#DatePart("h",get_SWMatches_info.match_time1)#,#DatePart("n",get_SWMatches_info.match_time1)#,#DatePart("s",get_SWMatches_info.match_time1)#">#DateFormat(get_SWMatches_info.match_time1,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.match_time1,"h:mm tt")#
												<option value="#DatePart("yyyy",get_SWMatches_info.match_time2)#,#DatePart("m",get_SWMatches_info.match_time2)#,#DatePart("d",get_SWMatches_info.match_time2)#,#DatePart("h",get_SWMatches_info.match_time2)#,#DatePart("n",get_SWMatches_info.match_time2)#,#DatePart("s",get_SWMatches_info.match_time2)#">#DateFormat(get_SWMatches_info.match_time2,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.match_time2,"h:mm tt")#
												</cfoutput>
											</select>										
										</td>										
									</tr>		
									<tr>
										<td align="right"><div class="copy"><b>Alternate Time:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>

											<table cellpadding=0 cellspacing=0>
														<tr>
															<td align="top">
																<div class="copy">											
																	<select name="date1">											
																		<cfoutput><option value='#DateFormat(get_SWMatches_info.match_time1,"yyyy,m,d")#'>#DateFormat(get_SWMatches_info.match_time1,"mmmm d, yyyy")#</cfoutput>
																		<cfoutput><option value='#DateFormat(get_SWMatches_info.match_time2,"yyyy,m,d")#'>#DateFormat(get_SWMatches_info.match_time2,"mmmm d, yyyy")#</cfoutput>
																	</select>																
																</div>										
															</td>		
															<td><div class="copy">&nbsp;at&nbsp;</div></td>									
															<td align="top">
																<div class="copy">											
																	<select name="hour1">
																	<cfloop from='0' to='23' index='hour' step='1'>
																		<cfoutput><option value='#hour#'>#Numberformat(hour,'0_')#</cfoutput>
																	</cfloop>
																	</select>
																</div>
															<td><div class="copy"><font color="white"><b>:</b></font></div></td>
															<td align="top">
																<div class="copy">													
																	<select name="minute1">
																	<cfloop from='0' to='45' index='minute' step='15'>
																		<cfoutput><option value='#minute#'>#Numberformat(minute,'0_')#</cfoutput>
																	</cfloop>
																	</select>																
																</div>										
															</td>
															<td align="top">
																<div class="copy">																		
																	&nbsp;All times are <cfif get_matches.league_id IS 3>GMT<cfelse>EST</cfif>.														
																</div>
															</td>	
														</tr>
													</table>									
										</td>										
									</tr>																								
								</table>
								</center>
																					
								
								
								<input type="hidden" name="SWCode" value="<cfoutput>#get_matches.SWCode#</cfoutput>">
								<center><input type='submit' value='Set Battle Parameters'></center>
								</cfform>		
								
							<cfelse>
								<div class="title">
									Phase 2: Waiting for challenged squad to set battle parameters this match.
								</div>								
							</cfif>
							<cfelseif current_phase GT 2>
								<hr>
								<p>
								<div class="title">
									Phase 2 (completed): The battle paramaters for the match are...
								</div>
								<p>
								<table>
									<tr>
										<td align="right"><div class="copy"><b>Mission:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div class="copy">
												<cfoutput>#get_SWMatches_info.mission#</cfoutput>
											</div>								
										</td>
									</tr>
									<tr>
										<td align="right"><div class="copy"><b>Number of Pilots:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div class="copy">
												<cfoutput>#get_SWMatches_info.pilots#</cfoutput>
											</div>											
										</td>										
									</tr>
									<tr>
										<td align="right"><div class="copy"><b>AI Pilots:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div class="copy">
												<cfoutput>#get_SWMatches_info.ai#</cfoutput>
											</div>										
										</td>										
									</tr>																																	
								</table>

						</cfif>
	<!--- END PHASE 2 --->						
					
					
<!--- START PHASE 3 --->
						<cfif current_phase IS 3>
						<hr>
						<p>						
							<cfif get_matches.swsquad1 IS session.squadid>
								<div class="title">
									Phase 3: Set the final time for this match.
								</div>
								<p>
								
							
								<cfform action="_propose_phase_3.cfm">
								<table>
									<tr>
										<td align="right"><div class="copy"><b>Time Option:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<select name="final_time">
												<cfoutput>
												<option value="#DatePart("yyyy",get_SWMatches_info.proposed_final_time)#,#DatePart("m",get_SWMatches_info.proposed_final_time)#,#DatePart("d",get_SWMatches_info.proposed_final_time)#,#DatePart("h",get_SWMatches_info.proposed_final_time)#,#DatePart("n",get_SWMatches_info.proposed_final_time)#,#DatePart("s",get_SWMatches_info.proposed_final_time)#">#DateFormat(get_SWMatches_info.proposed_final_time,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.proposed_final_time,"h:mm tt")#
												<option value="#DatePart("yyyy",get_SWMatches_info.proposed_alternate_time)#,#DatePart("m",get_SWMatches_info.proposed_alternate_time)#,#DatePart("d",get_SWMatches_info.proposed_alternate_time)#,#DatePart("h",get_SWMatches_info.proposed_alternate_time)#,#DatePart("n",get_SWMatches_info.proposed_alternate_time)#,#DatePart("s",get_SWMatches_info.proposed_alternate_time)#">#DateFormat(get_SWMatches_info.proposed_alternate_time,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.proposed_alternate_time,"h:mm tt")#
												</cfoutput>
											</select>										
										</td>										
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>
											<input type="hidden" name="SWCode" value="<cfoutput>#get_matches.SWCode#</cfoutput>">
											<input type='submit' value='Set Final Time'>
										</td>
									</tr>																									
								</table>								
								</cfform>		
								
							<cfelse>
								<div class="title">
									Phase 3: Waiting for challenging squad to set the final time for this match.
								</div>								
							</cfif>
							<cfelseif current_phase GT 2>
								<hr>
								<p>
								<div class="title">
									Phase 3 (completed): The final time for this match is:
								</div>
								<p>
								<table>
									<tr>
										<td align="right"><div class="copy"><b>Final match time:</b></div></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div class="copy">
												<cfoutput>
												#DateFormat(get_SWMatches_info.final_match_time,"mmmm d, yyyy")# #TimeFormat(get_SWMatches_info.final_match_time,"h:mm tt")#
												</cfoutput>
											</div>								
										</td>
									</tr>																																
								</table>

						</cfif>
	<!--- END PHASE 3 --->							
						<cfif current_phase IS 4>
								
								<hr>
								<p>
								<div class="title">
									Phase 4: Play the match or report a No-Show
								</div>
								<p>
								
								<cfquery datasource="#currentdatasource#" name="check_noshow">
									SELECT *
									FROM SWMatches_Info LEFT JOIN SWMatches ON SWMatches_Info.SWCode = SWMatches.SWCode
									WHERE SWMatches.SWCode = '#this_SWCode#'
								</cfquery>
								<cfset this_reported=0>
								<cfset other_reported=0>
								<cfif (check_noshow.swsquad1 IS session.squadid) AND check_noshow.swsquad1_reports_noshow><cfset this_reported=1></cfif>
								<cfif (check_noshow.swsquad2 IS session.squadid) AND check_noshow.swsquad2_reports_noshow><cfset this_reported=1></cfif>
								<cfif (check_noshow.swsquad1 IS session.squadid) AND check_noshow.swsquad2_reports_noshow><cfset other_reported=1></cfif>
								<cfif (check_noshow.swsquad2 IS session.squadid) AND check_noshow.swsquad1_reports_noshow><cfset other_reported=1></cfif>
								
								<table>
									<tr>
										<td align="right">&nbsp;</td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<cfif other_reported><div class="copy">The other Squad has declared a No-Show or requests a reschedule.</div></cfif>
											<cfif NOT this_reported>
											<div class="copy">
												<cfform action="noshow.cfm">
												<input type="hidden" name="SWCode" value="<cfoutput>#this_SWCode#</cfoutput>">
												<input type="submit" value="Report the other squad was a No-Show or request a Reschedule">
												</cfform>
											</div>		
											<cfelse>
											<div class="copy">
												Your squad has declared a No-Show or requests a reschedule.
											</div>
											</cfif>						
										</td>
									</tr>																																
								</table>	
							<cfif get_SWMatches_info.final_match_time LT Now()>		
							</cfif>						
						</cfif>
	<!--- END PHASE 4 --->
					<p>
					<div class="title">Protest This Match:
					<p>
					<div class="copy">
						Protesting a match removes the match from the auto-forfeit system.  You can use this feature to dispute poorly chosen match times, etc.  You can still play this match code even when it has been protested.  An administrator will contact both squads if a protest has been filed.						
					</div>
					
					<cfquery datasource="#currentdatasource#" name="check_protest">
						SELECT *
						FROM SWMatches_Info LEFT JOIN SWMatches ON SWMatches_Info.SWCode = SWMatches.SWCode
						WHERE SWMatches.SWCode = '#this_SWCode#'
					</cfquery>					
				<cfset this_protested=0>
				<cfset other_protested=0>
				<cfif (check_protest.swsquad1 IS session.squadid) AND check_protest.swsquad1_protest><cfset this_protested=1></cfif>
				<cfif (check_protest.swsquad2 IS session.squadid) AND check_protest.swsquad2_protest><cfset this_protested=1></cfif>
				<cfif (check_protest.swsquad1 IS session.squadid) AND check_protest.swsquad2_protest><cfset other_protested=1></cfif>
				<cfif (check_protest.swsquad2 IS session.squadid) AND check_protest.swsquad1_protest><cfset other_protested=1></cfif>					
				<cfif other_protested><div class="copy">The other Squad has protested this match and has removed it from the auto-forfeit system.</div></cfif>
				<cfif NOT this_protested>
					<cfform action="protest.cfm">
					<input type="hidden" name="SWCode" value="<cfoutput>#this_SWCode#</cfoutput>">
					<input type="submit" value="Protest">
					</cfform>
					</div>
				<cfelse>
				<div class="copy">
					Your squad has protested this match and has removed it from the auto-forfeit system.
				</div>
				</cfif>					
					
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

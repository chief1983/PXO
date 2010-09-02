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

<cfinclude template="#relativepath#menu/recruit_main.cfm">

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

					<cfset maxscore=1000>
					
							
							<div class="title">Recruitment Board</div>
							<p>
							
					<cfif NOT isdefined("type")><cfset type="scores"></cfif>
					<cfif Trim("type") IS ''><cfset type="scores"></cfif>
						<cfif type IS 'kills'>
							<cfif isdefined("application.squadwarrecruitboardkillsmax")><cfset app_fskillsmax=application.squadwarrecruitboardkillsmax><cfelse><cfset app_fskillsmax=0></cfif>
								<CFQUERY NAME="recruits" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
								SELECT      FreeSpace2Full.TrackerID, FreeSpace2Full.Rank, FreeSpace2Full.Pilot, FreeSpace2Full.Score, FreeSpace2Full.KillCountOK, FreeSpace2Full.MissionsFlown, FreeSpace2Full.FlightTime
											,SWPilots.ICQ
											,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
											,(SELECT value_hours FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_hours
											,(SELECT value_minutes FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_minutes
											,SWPilots.Member_Since
											,SWPilots.show_email AS SWShowEmail
											,SWPilots.email	AS SWEmail	
								FROM         SWPilots, FreeSpace2Full 
								WHERE ((FreeSpace2Full.TrackerID = SWPilots.TrackerID) AND (FreeSpace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1)) <!--- AND ((KillCountOK > #app_fskillsmax#) AND (MissionsFlown > 0)) --->
								ORDER BY  KillCountOK DESC
								</CFQUERY>
								<cfloop query="recruits" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
									<cfset application.squadwarrecruitboardkillsmax=recruits.KillCountOK>
								</cfloop>			
						<cfelse><cfif type IS 'msns'>
								<cfif isdefined("application.squadwarrecruitboardmsnsmax")><cfset app_fsmsnsmax=application.squadwarrecruitboardmsnsmax><cfelse><cfset app_fsmsnsmax=0></cfif>
								<CFQUERY NAME="recruits" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
								SELECT      FreeSpace2Full.TrackerID, FreeSpace2Full.Rank, FreeSpace2Full.Pilot, FreeSpace2Full.Score, FreeSpace2Full.KillCountOK, FreeSpace2Full.MissionsFlown, FreeSpace2Full.FlightTime
											,SWPilots.ICQ
											,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
											,(SELECT value_hours FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_hours
											,(SELECT value_minutes FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_minutes
											,SWPilots.Member_Since
											,SWPilots.show_email AS SWShowEmail
											,SWPilots.email	AS SWEmail					
								FROM         SWPilots, FreeSpace2Full 
								WHERE ((FreeSpace2Full.TrackerID = SWPilots.TrackerID) AND (FreeSpace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1))	<!---  AND (MissionsFlown > #app_fsmsnsmax#) --->
								ORDER BY  MissionsFlown DESC
								</CFQUERY>
								<cfloop query="recruits" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
									<cfset application.squadwarrecruitboardmsnsmax=recruits.MissionsFlown>
								</cfloop>						
						<cfelse><cfif type IS 'time'>
								<cfif isdefined("application.squadwarrecruitboardtimemax")><cfset app_fstimemax=application.squadwarrecruitboardtimemax><cfelse><cfset app_fstimemax=0></cfif>
								<CFQUERY NAME="recruits" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
								SELECT      FreeSpace2Full.TrackerID, FreeSpace2Full.Rank, FreeSpace2Full.Pilot, FreeSpace2Full.Score, FreeSpace2Full.KillCountOK, FreeSpace2Full.MissionsFlown, FreeSpace2Full.FlightTime
											,SWPilots.ICQ
											,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
											,(SELECT value_hours FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_hours
											,(SELECT value_minutes FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_minutes
											,SWPilots.Member_Since
											,SWPilots.show_email AS SWShowEmail
											,SWPilots.email	AS SWEmail					
								FROM         SWPilots, FreeSpace2Full 
								WHERE ((FreeSpace2Full.TrackerID = SWPilots.TrackerID) AND (FreeSpace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1)) <!--- AND (FlightTime > #app_fstimemax# AND MissionsFlown > 0) --->
								ORDER BY  FlightTime DESC
								</CFQUERY>
								<cfloop query="recruits" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
								<cfset application.squadwarrecruitboardtimemax=recruits.FlightTime>
								</cfloop>
						<cfelse>
								<cfif isdefined("application.squadwarrecruitboardscoresmax")><cfset app_fsscoresmax=application.squadwarrecruitboardscoresmax><cfelse><cfset app_fsscoresmax=0></cfif>
								<CFQUERY NAME="recruits" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
								SELECT      FreeSpace2Full.TrackerID, FreeSpace2Full.Rank, FreeSpace2Full.Pilot, FreeSpace2Full.Score, FreeSpace2Full.KillCountOK, FreeSpace2Full.MissionsFlown, FreeSpace2Full.FlightTime
											,SWPilots.ICQ
											,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
											,(SELECT value_hours FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_hours
											,(SELECT value_minutes FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone_minutes
											,SWPilots.Member_Since		
											,SWPilots.show_email AS SWShowEmail
											,SWPilots.email	AS SWEmail							
								FROM         SWPilots, FreeSpace2Full 
								WHERE ((FreeSpace2Full.TrackerID = SWPilots.TrackerID) AND (FreeSpace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1))
								ORDER BY  Score DESC
								</CFQUERY>
								<cfloop query="recruits" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
								<cfset application.squadwarrecruitboardscoresmax=recruits.score>
								</cfloop>		
								<cfset type="scores">
						</cfif></cfif></cfif>
									
							<cfset incrementer=100>
							<cfset this=1>
							<cfif Isdefined("next")>
								<cfset this=next>
							</cfif>
							<cfif Isdefined("previous")>
								<cfset this=previous>
							</cfif>
							
							<cfset next=this+incrementer>
							<cfset previous=this-incrementer>
							
							<cfif next GTE maxscore>
								<cfset stop=maxscore>
							<cfelse>
								<cfset stop=next-1>
							</cfif>											
							<cfset current=this>
							<cfset i=this>							

							<div class="copy">
							<cfif previous GT 0>
								<a href="index.cfm?previous=<cfoutput>#previous#</cfoutput>">Previous 100</a>
							</cfif>							
							<p>
							<cfif recruits.recordcount GT next>
								<a href="index.cfm?next=<cfoutput>#next#</cfoutput>">Next 100</a>
							</cfif>
							</div>
							<p>
							
						<table width=100% border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
						<tr>
							<th><div class="recruit">Name</div></th><th><div class="recruit">Score</div></th><th><div class="recruit">Kills</div></th><th><div class="recruit">Missions</div></th><th><div class="recruit">Flight Time</div></th>
							<th><div class="recruit">ICQ</div></th><th><div class="recruit">Conn.</div></th><th><div class="recruit">Time Zone</div></th><th><div class="recruit">Joined</div></th>
						</tr>
					<cfloop query="recruits" startrow="#this#" endrow="#stop#">
					
						<cfif recruits.Rank IS '0'><cfset str_rank="Ensign">
							<cfelseif recruits.Rank IS '1'><cfset str_rank="Lt.J.G.">
							<cfelseif recruits.Rank IS '2'><cfset str_rank="Lt.">
							<cfelseif recruits.Rank IS '3'><cfset str_rank="Lt.Cmdr.">
							<cfelseif recruits.Rank IS '4'><cfset str_rank="Cmdr.">
							<cfelseif recruits.Rank IS '5'><cfset str_rank="Capt.">
							<cfelseif recruits.Rank IS '6'><cfset str_rank="Cmdore.">
							<cfelseif recruits.Rank IS '7'><cfset str_rank="R.Admir.">
							<cfelseif recruits.Rank IS '8'><cfset str_rank="V.Admir.">
							<cfelseif recruits.Rank IS '9'><cfset str_rank="Admiral">
						</cfif>
					
																<cfset str_days=Int(recruits.FlightTime / 86400)>
																<cfset str_hours=Int((recruits.FlightTime - (86400 * str_days)) / 3600)>
																<cfset str_minutes=Int((recruits.FlightTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
																<cfset str_seconds=recruits.FlightTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
																
																<cfif str_days IS 0><cfset str_days='0'></cfif>
																<cfif str_hours IS 0><cfset str_hours='0'></cfif>
																<cfif str_hours LT 10><cfset str_hours='0' & str_hours></cfif>
																<cfif str_minutes IS 0><cfset str_minutes='0'></cfif>
																<cfif str_minutes LT 10><cfset str_minutes='0' & str_minutes></cfif>
																<cfif str_seconds LT 10><cfset str_seconds='0' & str_seconds></cfif>
																<cfset str_time= str_days & '.' & str_hours & '.' & str_minutes>
																
																<cfif isdefined("type")>
																	<cfif Trim("type") IS NOT ''>
																		<tr>
																		<cfoutput><td align=left><div class="recruit"><nobr> #i#. #str_rank# <cfif ((SWShowEmail) AND (Trim(SWEmail) IS NOT ''))><a href="mailto:#SWEmail#">#Left(Pilot,12)#</a><cfelse>#Left(Pilot,12)#</cfif></nobr></div></td></cfoutput>
																		<cfif type IS 'scores'>
																			<cfoutput><td align=right><div class="recruit"><b>#NumberFormat(Score)#</b></div></td>
																						<td align=right><div class="recruit">#NumberFormat(KillCountOK)#</div></td>
																						<td align=right><div class="recruit">#NumberFormat(MissionsFlown)#</div></td>
																						<td align=right><div class="recruit">#str_time#</div></td></cfoutput>
																		<cfelseif type IS 'kills'>
																			<cfoutput><td align=right><div class="recruit">#NumberFormat(Score)#</div></td>
																						<td align=right><div class="recruit"><b>#NumberFormat(KillCountOK)#</b></div></td>
																						<td align=right><div class="recruit">#NumberFormat(MissionsFlown)#</div></td>
																						<td align=right><div class="recruit">#str_time#</div></td></cfoutput>																							
																		<cfelseif type IS 'msns'>
																			<cfoutput><td align=right><div class="recruit">#NumberFormat(Score)#</div></td>
																						<td align=right><div class="recruit">#NumberFormat(KillCountOK)#</div></td>
																						<td align=right><div class="recruit"><b>#NumberFormat(MissionsFlown)#</b></div></td>
																						<td align=right><div class="recruit">#str_time#</div></td></cfoutput>																							
																		<cfelseif type IS 'time'>
																			<cfoutput><td align=right><div class="recruit">#NumberFormat(Score)#</div></td>
																						<td align=right><div class="recruit">#NumberFormat(KillCountOK)#</div></td>
																						<td align=right><div class="recruit">#NumberFormat(MissionsFlown)#</div></td>
																						<td align=right><div class="recruit"><b>#str_time#</b></div></td></cfoutput>																								
																		</cfif>
																			<cfoutput><td><div class="recruit">&nbsp;#ICQ#&nbsp;</div></td>
																						<td><div class="recruit">#fetch_connection_type#</div></td>
																						<td><div class="recruit">#fetch_time_zone_hours#<cfif fetch_time_zone_minutes GT 0>.5</cfif> GMT</div></td>
																						<td><div class="recruit">#DateFormat(Member_Since,"m.d.yyyy")#</div></td></cfoutput>
																		</tr>
																	</cfif>
																</cfif>
						<cfset i=i+1>
					</cfloop>
															</table>

	
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

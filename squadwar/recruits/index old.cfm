<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfset maxscore=1000>

		
		Welcome to the Squad War Recruitment Board.
		
<cfif NOT isdefined("type")><cfset type="scores"></cfif>
<cfif Trim("type") IS ''><cfset type="scores"></cfif>
	<cfif type IS 'kills'>
		<cfif isdefined("application.squadwarrecruitboardkillsmax")><cfset app_fskillsmax=application.squadwarrecruitboardkillsmax><cfelse><cfset app_fskillsmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
			SELECT      Freespace2Full.TrackerID, Freespace2Full.Rank, Freespace2Full.Pilot, Freespace2Full.Score, Freespace2Full.KillCountOK, Freespace2Full.MissionsFlown, Freespace2Full.FlightTime
						,SWPilots.ICQ
						,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
						,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
						,SWPilots.Member_Since
						,SWPilots.show_email AS SWShowEmail
						,SWPilots.email	AS SWEmail	
			FROM         SWPilots, Freespace2Full 
			WHERE ((Freespace2Full.TrackerID = SWPilots.TrackerID) AND (Freespace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1)) <!--- AND ((KillCountOK > #app_fskillsmax#) AND (MissionsFlown > 0)) --->
			ORDER BY  KillCountOK DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
				<cfset application.squadwarrecruitboardkillsmax=fsscores.KillCountOK>
			</cfloop>			
	<cfelse><cfif type IS 'msns'>
			<cfif isdefined("application.squadwarrecruitboardmsnsmax")><cfset app_fsmsnsmax=application.squadwarrecruitboardmsnsmax><cfelse><cfset app_fsmsnsmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
			SELECT      Freespace2Full.TrackerID, Freespace2Full.Rank, Freespace2Full.Pilot, Freespace2Full.Score, Freespace2Full.KillCountOK, Freespace2Full.MissionsFlown, Freespace2Full.FlightTime
						,SWPilots.ICQ
						,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
						,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
						,SWPilots.Member_Since
						,SWPilots.show_email AS SWShowEmail
						,SWPilots.email	AS SWEmail					
			FROM         SWPilots, Freespace2Full 
			WHERE ((Freespace2Full.TrackerID = SWPilots.TrackerID) AND (Freespace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1))	<!---  AND (MissionsFlown > #app_fsmsnsmax#) --->
			ORDER BY  MissionsFlown DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
				<cfset application.squadwarrecruitboardmsnsmax=fsscores.MissionsFlown>
			</cfloop>						
	<cfelse><cfif type IS 'time'>
			<cfif isdefined("application.squadwarrecruitboardtimemax")><cfset app_fstimemax=application.squadwarrecruitboardtimemax><cfelse><cfset app_fstimemax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
			SELECT      Freespace2Full.TrackerID, Freespace2Full.Rank, Freespace2Full.Pilot, Freespace2Full.Score, Freespace2Full.KillCountOK, Freespace2Full.MissionsFlown, Freespace2Full.FlightTime
						,SWPilots.ICQ
						,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
						,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
						,SWPilots.Member_Since
						,SWPilots.show_email AS SWShowEmail
						,SWPilots.email	AS SWEmail					
			FROM         SWPilots, Freespace2Full 
			WHERE ((Freespace2Full.TrackerID = SWPilots.TrackerID) AND (Freespace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1)) <!--- AND (FlightTime > #app_fstimemax# AND MissionsFlown > 0) --->
			ORDER BY  FlightTime DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
			<cfset application.squadwarrecruitboardtimemax=fsscores.FlightTime>
			</cfloop>
	<cfelse>
			<cfif isdefined("application.squadwarrecruitboardscoresmax")><cfset app_fsscoresmax=application.squadwarrecruitboardscoresmax><cfelse><cfset app_fsscoresmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="#currentdatasource#"> <!---  cachedwithin="#CreateTimeSpan(0,0,10,0)#"> --->
			SELECT      Freespace2Full.TrackerID, Freespace2Full.Rank, Freespace2Full.Pilot, Freespace2Full.Score, Freespace2Full.KillCountOK, Freespace2Full.MissionsFlown, Freespace2Full.FlightTime
						,SWPilots.ICQ
						,(SELECT type FROM form_connection_type WHERE ID = SWPilots.connection_type) AS fetch_connection_type
						,(SELECT description FROM form_time_zones WHERE ID = SWPilots.time_zone) AS fetch_time_zone
						,SWPilots.Member_Since		
						,SWPilots.show_email AS SWShowEmail
						,SWPilots.email	AS SWEmail							
			FROM         SWPilots, Freespace2Full 
			WHERE ((Freespace2Full.TrackerID = SWPilots.TrackerID) AND (Freespace2Full.Pilot = SWPilots.Pilot_Name) AND (SWPilots.Recruitme=1))
			ORDER BY  Score DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
			<cfset application.squadwarrecruitboardscoresmax=fsscores.score>
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

<MAP NAME="charts">
<AREA SHAPE="RECT" COORDS="235,23,366,71" HREF="squadwarrecruitboard.cfm?type=scores">
<AREA SHAPE="RECT" COORDS="283,0,422,22" HREF="squadwarrecruitboard.cfm?type=kills">
<AREA SHAPE="RECT" COORDS="423,0,553,22" HREF="squadwarrecruitboard.cfm?type=msns">
<AREA SHAPE="RECT" COORDS="473,23,553,71" HREF="squadwarrecruitboard.cfm?type=time">
</MAP>
<ul>
	<li><a href="index.cfm?type=scores">Score</a>
	<li><a href="index.cfm?type=kills">Kills</a>
	<li><a href="index.cfm?type=msns">Missions</a>
	<li><a href="index.cfm?type=time">Time</a>
</ul>
<a href="../index.cfm">Main SquadWar Page</a><p>

	
	
	<table width=100% border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
	<tr>
		<th>Name</th><th>Score</th><th>Kills</th><th>Missions</th><th>Flight Time</th>
		<th>ICQ</th><th>Connection Type</th><th>Time Zone</th><th>Member Since</th>
	</tr>
<cfloop query="fsscores" startrow="#this#" endrow="#stop#">

	<cfif fsscores.Rank IS '0'><cfset str_rank="Ensign">
		<cfelseif fsscores.Rank IS '1'><cfset str_rank="Lt.J.G.">
		<cfelseif fsscores.Rank IS '2'><cfset str_rank="Lt.">
		<cfelseif fsscores.Rank IS '3'><cfset str_rank="Lt.Cmdr.">
		<cfelseif fsscores.Rank IS '4'><cfset str_rank="Cmdr.">
		<cfelseif fsscores.Rank IS '5'><cfset str_rank="Capt.">
		<cfelseif fsscores.Rank IS '6'><cfset str_rank="Cmdore.">
		<cfelseif fsscores.Rank IS '7'><cfset str_rank="R.Admir.">
		<cfelseif fsscores.Rank IS '8'><cfset str_rank="V.Admir.">
		<cfelseif fsscores.Rank IS '9'><cfset str_rank="Admiral">
	</cfif>

											<cfset str_days=Int(fsscores.FlightTime / 86400)>
											<cfset str_hours=Int((fsscores.FlightTime - (86400 * str_days)) / 3600)>
											<cfset str_minutes=Int((fsscores.FlightTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
											<cfset str_seconds=fsscores.FlightTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
											
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
													<cfoutput><td align=left><nobr> #i#. #str_rank# <cfif ((SWShowEmail) AND (Trim(SWEmail) IS NOT ''))><a href="mailto:#SWEmail#">#Left(Pilot,12)#</a><cfelse>#Left(Pilot,12)#</cfif></nobr></td></cfoutput>
													<cfif type IS 'scores'>
														<cfoutput><td align=right><b>#NumberFormat(Score)#</b></td><td align=right>#NumberFormat(KillCountOK)#</td><td align=right>#NumberFormat(MissionsFlown)#</td><td align=right>#str_time#</td></cfoutput>
													<cfelseif type IS 'kills'>
														<cfoutput><td align=right>#NumberFormat(Score)#</td><td align=right><b>#NumberFormat(KillCountOK)#</b></td><td align=right>#NumberFormat(MissionsFlown)#</td><td align=right>#str_time#</td></cfoutput>																							
													<cfelseif type IS 'msns'>
														<cfoutput><td align=right>#NumberFormat(Score)#</td><td align=right>#NumberFormat(KillCountOK)#</td><td align=right><b>#NumberFormat(MissionsFlown)#</b></td><td align=right>#str_time#</td></cfoutput>																							
													<cfelseif type IS 'time'>
														<cfoutput><td align=right>#NumberFormat(Score)#</td><td align=right>#NumberFormat(KillCountOK)#</td><td align=right>#NumberFormat(MissionsFlown)#</td><td align=right><b>#str_time#</b></td></cfoutput>																								
													</cfif>
														<cfoutput><td>&nbsp;#ICQ#&nbsp;</td><td>#fetch_connection_type#</td><td>#fetch_time_zone#</td><td>#DateFormat(Member_Since,"m.d.yyyy")#</td></cfoutput>
													</tr>
												</cfif>
											</cfif>
	<cfset i=i+1>
</cfloop>
										</table>			


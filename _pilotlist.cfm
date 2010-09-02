<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

<cfquery datasource="PXO" name="get_Tracker">
	SELECT TrackerID
	FROM Users
	WHERE (Login = '#form.login#') AND (Password = '#form.password#')
</cfquery>

	<font color="white"><b><div class="newsitemtitle">PXO Pilot Lookup:</div></b></font>
	<p>
	<cfif get_Tracker.recordcount IS 0>
		<div class="copy">
			The login and password combination do not exist.
			<p>
			This could mean that you have entered an incorrect password, or that the login does not exist.
		</div>
	<cfelse>
	
<CFQUERY NAME="fs2scores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
	FROM         FreeSpace2Full 
	WHERE 		TrackerID = '#get_Tracker.TrackerID#'
</CFQUERY>
<CFQUERY NAME="fs2dscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
	FROM         Freespace2 
	WHERE 		TrackerID = '#get_Tracker.TrackerID#'
</CFQUERY>
<CFQUERY NAME="d3scores" DATASOURCE="PXOSQL"> <!--- cachedwithin="#CreateTimeSpan(0,0,30,0)#" --->
	SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
	FROM         Descent3
	WHERE 		TrackerID = '#get_Tracker.TrackerID#'
</CFQUERY>
<CFQUERY NAME="fsscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,15,0)#">
	SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
	FROM         Freespace 
	WHERE 		TrackerID = '#get_Tracker.TrackerID#'
</CFQUERY>
	
<!--- FREESPACE 2 SCORES --->

		<cfif NOT fs2scores.recordcount IS 0>
			<div class="copy"><b>FreeSpace 2:</b></div>
			<p>
			<table width="542" cellpadding="0" cellspacing="0"><tr><td valign="top">
			<table width=542 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
			<tr><td><div class="copysm">Rank/Callsign</div></td><td><div class="copysm">FreeSpace Score</div></td><td><div class="copysm">Enemy Kills</div></td><td><div class="copysm">Msns. Flown</div></td><td><div class="copysm">Flight Time</div></td></tr>
			<cfoutput query="fs2scores">
			
					<cfif fs2scores.Rank IS '0'><cfset str_rank="Ensign"><cfelse>
						<cfif fs2scores.Rank IS '1'><cfset str_rank="Lt.J.G."><cfelse>
							<cfif fs2scores.Rank IS '2'><cfset str_rank="Lt."><cfelse>
								<cfif fs2scores.Rank IS '3'><cfset str_rank="Lt.Cmdr."><cfelse>
									<cfif fs2scores.Rank IS '4'><cfset str_rank="Cmdr."><cfelse>	
										<cfif fs2scores.Rank IS '5'><cfset str_rank="Capt."><cfelse>	
											<cfif fs2scores.Rank IS '6'><cfset str_rank="Cmdore."><cfelse>
												<cfif fs2scores.Rank IS '7'><cfset str_rank="R.Admir."><cfelse>
													<cfif fs2scores.Rank IS '8'><cfset str_rank="V.Admir."><cfelse>
														<cfif fs2scores.Rank IS '9'><cfset str_rank="Admiral">
															</cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif>
													
					<cfset str_days=Int(fs2scores.FlightTime / 86400)>
					<cfset str_hours=Int((fs2scores.FlightTime - (86400 * str_days)) / 3600)>
					<cfset str_minutes=Int((fs2scores.FlightTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
					<cfset str_seconds=fs2scores.FlightTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
											
					<cfif str_days IS 0><cfset str_days='0'></cfif>
					<cfif str_hours IS 0><cfset str_hours='0'></cfif>
					<cfif str_hours LT 10><cfset str_hours='0' & str_hours></cfif>
					<cfif str_minutes IS 0><cfset str_minutes='0'></cfif>
					<cfif str_minutes LT 10><cfset str_minutes='0' & str_minutes></cfif>
					<cfif str_seconds LT 10><cfset str_seconds='0' & str_seconds></cfif>
					<cfset str_time= str_days & '.' & str_hours & '.' & str_minutes>

					<tr><td bgcolor="##333333" align=left><font color=white><nobr> #str_rank# #Left(fs2scores.Pilot,12)#</nobr></font></td><td align=right bgcolor=""><font color=silver>#NumberFormat(fs2scores.Score)#</font></td><td align=right><font color=silver>#NumberFormat(fs2scores.KillCountOK)#</font></td><td align=right><font color=silver>#NumberFormat(fs2scores.MissionsFlown)#</font></td><td align=right><font color=silver>#str_time#</font></td></tr>	
				

				
			</cfoutput>
			<tr><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=230 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=127 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=53 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=46 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=76 height=1 border="0"></td></tr></table></td></tr></table></center>
		</cfif>
		
<!--- FREESPACE 2 DEMO SCORES --->

		<cfif NOT fs2dscores.recordcount IS 0>
			<p>
			<div class="copy"><b>FreeSpace 2 Demo:</b></div>
			<p>
			<table width="542" cellpadding="0" cellspacing="0"><tr><td valign="top">
			<table width=542 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
			<tr><td><div class="copysm">Rank/Callsign</div></td><td><div class="copysm">FreeSpace Score</div></td><td><div class="copysm">Enemy Kills</div></td><td><div class="copysm">Msns. Flown</div></td><td><div class="copysm">Flight Time</div></td></tr>
			<cfoutput query="fs2dscores">
			
					<cfif fs2dscores.Rank IS '0'><cfset str_rank="Ensign"><cfelse>
						<cfif fs2dscores.Rank IS '1'><cfset str_rank="Lt.J.G."><cfelse>
							<cfif fs2dscores.Rank IS '2'><cfset str_rank="Lt."><cfelse>
								<cfif fs2dscores.Rank IS '3'><cfset str_rank="Lt.Cmdr."><cfelse>
									<cfif fs2dscores.Rank IS '4'><cfset str_rank="Cmdr."><cfelse>	
										<cfif fs2dscores.Rank IS '5'><cfset str_rank="Capt."><cfelse>	
											<cfif fs2dscores.Rank IS '6'><cfset str_rank="Cmdore."><cfelse>
												<cfif fs2dscores.Rank IS '7'><cfset str_rank="R.Admir."><cfelse>
													<cfif fs2dscores.Rank IS '8'><cfset str_rank="V.Admir."><cfelse>
														<cfif fs2dscores.Rank IS '9'><cfset str_rank="Admiral">
															</cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif>
													
					<cfset str_days=Int(fs2dscores.FlightTime / 86400)>
					<cfset str_hours=Int((fs2dscores.FlightTime - (86400 * str_days)) / 3600)>
					<cfset str_minutes=Int((fs2dscores.FlightTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
					<cfset str_seconds=fs2dscores.FlightTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
											
					<cfif str_days IS 0><cfset str_days='0'></cfif>
					<cfif str_hours IS 0><cfset str_hours='0'></cfif>
					<cfif str_hours LT 10><cfset str_hours='0' & str_hours></cfif>
					<cfif str_minutes IS 0><cfset str_minutes='0'></cfif>
					<cfif str_minutes LT 10><cfset str_minutes='0' & str_minutes></cfif>
					<cfif str_seconds LT 10><cfset str_seconds='0' & str_seconds></cfif>
					<cfset str_time= str_days & '.' & str_hours & '.' & str_minutes>

					<tr><td bgcolor="##333333" align=left><font color=white><nobr> #str_rank# #Left(fs2dscores.Pilot,12)#</nobr></font></td><td align=right bgcolor=""><font color=silver>#NumberFormat(fs2dscores.Score)#</font></td><td align=right><font color=silver>#NumberFormat(fs2dscores.KillCountOK)#</font></td><td align=right><font color=silver>#NumberFormat(fs2dscores.MissionsFlown)#</font></td><td align=right><font color=silver>#str_time#</font></td></tr>	
				

				
			</cfoutput>
			<tr><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=230 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=127 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=53 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=46 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=76 height=1 border="0"></td></tr></table></td></tr></table></center>
		</cfif>
		
<!--- DESCENT 3 SCORES --->

		<cfif NOT d3scores.recordcount IS 0>
			<p>
			<div class="copy"><b>Descent 3:</b></div>
			<p>
				<table width=562 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
					<tr>
						<td bordercolor="##000000"><div class="copysm">Pilot Name</div></td>
						<td bordercolor="##000000"><div class="copysm">Kills</div></td>	
						<td bordercolor="##000000"><div class="copysm">Rank</div></td>
						<td bordercolor="##000000"><div class="copysm">Deaths</div></td>
						<td bordercolor="##000000"><div class="copysm">Descructs</div></td>
						<td bordercolor="##000000"><div class="copysm">Efficiency</div></td>		
						<td bordercolor="##000000"><div class="copysm">KPH</div></td>
						<td bordercolor="##000000"><div class="copysm">DPH</div></td>
						<td bordercolor="##000000"><div class="copysm">SDPH</div></td>
						<td bordercolor="##000000"><div class="copysm">Game Time</div></td>
					</tr>
					
			<cfoutput query="d3scores">
											<cfset str_days=Int(d3scores.OnlineTime / 86400)>
											<cfset str_hours=Int((d3scores.OnlineTime - (86400 * str_days)) / 3600)>
											<cfset str_minutes=Int((d3scores.OnlineTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
											<cfset str_seconds=d3scores.OnlineTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
											
											<cfset floathours = ((d3scores.OnlineTime - (86400 * str_days)) / 3600) + str_days * 24>
											<cfif floathours IS 0>
												<cfset kph=0>
												<cfset dph=0>
												<cfset sdph=0>
											<cfelse>
												<cfset kph=Int(d3scores.totalkills / floathours)>
												<cfset dph=Int(d3scores.totaldeaths / floathours)>
												<cfset sdph=Int(d3scores.suicides / floathours)>	
											</cfif>									
											
											<cfif str_days IS 0><cfset str_days='0'></cfif>
											<cfif str_hours LT 10><cfset str_hours='0' & str_hours></cfif>
											<cfif str_minutes LT 10><cfset str_minutes='0' & str_minutes></cfif>
											<cfif str_seconds LT 10><cfset str_seconds='0' & str_seconds></cfif>
											<cfset str_time= str_days & '.' & str_hours & '.' & str_minutes>
											<cfset rank_setter=Fix(Evaluate(NewRank / 65536))>
											<cfif rank_setter LT 600>
													<cfset str_rank= 'Cadet'>
												<cfelseif rank_setter LT 900>
													<cfset str_rank= 'Ensign'>
												<cfelseif rank_setter LT 1200>
													<cfset str_rank= 'Lieutenant'>
												<cfelseif rank_setter LT 1500>
													<cfset str_rank= 'Lt. Cmdr.'>
												<cfelseif rank_setter LT 1800>
													<cfset str_rank= 'Commander'>
												<cfelseif rank_setter LT 2100>
													<cfset str_rank= 'Captain'>
												<cfelseif rank_setter LT 2400>
													<cfset str_rank= 'Commodore'>
												<cfelseif rank_setter LT 2600>
													<cfset str_rank= 'Rear Admiral'>
												<cfelseif rank_setter LT 3000>
													<cfset str_rank= 'Admiral'>
												<cfelse>
													<cfset str_rank= 'Demigod'>
											</cfif>	
											
					<TR><td bgcolor="##333333" align=left><font color=white><nobr> #d3scores.Pilot#</nobr></font></td><td align=right><font color=silver>#d3scores.TotalKills#</font></td><td align=right><font color=silver>#str_rank#</font></td><td align=right><font color=silver>#d3scores.totaldeaths#</font></td><td align=right><font color=silver>#d3scores.suicides#</font></td><td align=right><font color=silver>#d3scores.efficiency#%</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR>
			</cfoutput>
			
			</table>
		</cfif>
		
<!--- FREESPACE 1 SCORES --->

		<cfif NOT fsscores.recordcount IS 0>
			<p>
			<div class="copy"><b>FreeSpace:</b></div>
			<p>
			<table width="542" cellpadding="0" cellspacing="0"><tr><td valign="top">
			<table width=542 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
			<tr><td><div class="copysm">Rank/Callsign</div></td><td><div class="copysm">FreeSpace Score</div></td><td><div class="copysm">Enemy Kills</div></td><td><div class="copysm">Msns. Flown</div></td><td><div class="copysm">Flight Time</div></td></tr>
			<cfoutput query="fsscores">
			
					<cfif fsscores.Rank IS '0'><cfset str_rank="Ensign"><cfelse>
						<cfif fsscores.Rank IS '1'><cfset str_rank="Lt.J.G."><cfelse>
							<cfif fsscores.Rank IS '2'><cfset str_rank="Lt."><cfelse>
								<cfif fsscores.Rank IS '3'><cfset str_rank="Lt.Cmdr."><cfelse>
									<cfif fsscores.Rank IS '4'><cfset str_rank="Cmdr."><cfelse>	
										<cfif fsscores.Rank IS '5'><cfset str_rank="Capt."><cfelse>	
											<cfif fsscores.Rank IS '6'><cfset str_rank="Cmdore."><cfelse>
												<cfif fsscores.Rank IS '7'><cfset str_rank="R.Admir."><cfelse>
													<cfif fsscores.Rank IS '8'><cfset str_rank="V.Admir."><cfelse>
														<cfif fsscores.Rank IS '9'><cfset str_rank="Admiral">
															</cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif></cfif>
													
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

					<tr><td bgcolor="##333333" align=left><font color=white><nobr> #str_rank# #Left(fsscores.Pilot,12)#</nobr></font></td><td align=right bgcolor=""><font color=silver>#NumberFormat(fsscores.Score)#</font></td><td align=right><font color=silver>#NumberFormat(fsscores.KillCountOK)#</font></td><td align=right><font color=silver>#NumberFormat(fsscores.MissionsFlown)#</font></td><td align=right><font color=silver>#str_time#</font></td></tr>	
				

				
			</cfoutput>
			<tr><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=230 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=127 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=53 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=46 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="rankings/images/fsstats/SPACER2.GIF" width=76 height=1 border="0"></td></tr></table></td></tr></table></center>
		</cfif>
		
	</cfif>
	
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">

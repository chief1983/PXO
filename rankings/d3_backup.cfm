<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="#relativepath#doctop.cfm">
<!--- Page info goes here	 --->			
<center><a href="rankings/d3.cfm"><img src="../images/rankings/d3logoall.jpg" width=389 height=60 alt="" border="0"></a></center>
<!--- lame d3 banner --->
<br>
<center><a href="http://www.interplay.com/descent3/ftour.html"><img src="../images/banners/contest_banner3.gif" width=468 height=60 alt="" border="0"></a></center>
<br>
<!--- lame d3 banner --->
		<font color="white"><b><div class="newsitemtitle">Welcome to the Descent 3 rankings page!</div></b></font>
		
<a href="../pilotlist.cfm">Look up all pilot scores for your PXO login.</a>		
		
<cfif NOT isdefined("type")><cfset type="kills"></cfif>
<cfif Trim("type") IS ''><cfset type="kills"></cfif>
<cfset lastrow=1150>
	<cfif type IS 'deaths'>
			<cfif isdefined("application.d3deathsmax")><cfset app_d3deathsmax=application.d3deathsmax><cfelse><cfset app_d3deathsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXO"> <!--- cachedwithin="#CreateTimeSpan(0,0,30,0)#" --->
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
			FROM         Descent3 
			WHERE 		TotalDeaths >= #app_d3deathsmax#
			ORDER BY  TotalDeaths DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3deathsmax=d3scores.TotalDeaths>
			</cfloop>			
	<cfelseif type IS 'destructs'>
			<cfif isdefined("application.d3destructsmax")><cfset app_d3destructsmax=application.d3destructsmax><cfelse><cfset app_d3destructsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
			FROM         Descent3 
			WHERE 		Suicides >= #app_d3destructsmax#
			ORDER BY  Suicides DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3destructsmax=d3scores.Suicides>
			</cfloop>					
	<cfelseif type IS 'effic'>
			<cfif isdefined("application.d3efficmax")><cfset app_d3efficmax=application.d3efficmax><cfelse><cfset app_d3efficmax=0></cfif>
			<cfif isdefined("application.d3killsmax")><cfset app_d3killsmax=application.d3killsmax><cfelse><cfset app_d3killsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
			FROM         Descent3 
			WHERE 		(Efficiency >= #app_d3efficmax#) AND (TotalKills >= #app_d3killsmax#)
			ORDER BY  Efficiency DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3efficmax=d3scores.Efficiency>
			</cfloop>
	<cfelseif type IS 'rank'>
			<cfif isdefined("application.d3rankmax")><cfset app_d3rankmax=application.d3rankmax><cfelse><cfset app_d3rankmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
			FROM         Descent3 
			WHERE 		NewRank >= #app_d3rankmax#
			ORDER BY  NewRank DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3rankmax=d3scores.NewRank>
			</cfloop>			
	<cfelse>
			<cfif isdefined("application.d3killsmax")><cfset app_d3killsmax=application.d3killsmax><cfelse><cfset app_d3killsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXO"> <!--- cachedwithin="#CreateTimeSpan(0,0,30,0)#" --->
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour, NewRank
			FROM         Descent3 
			WHERE 		TotalKills >= #app_d3killsmax#
			ORDER BY  TotalKills DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3killsmax=d3scores.TotalKills>
			</cfloop>		
			<cfset type="kills">
	</cfif>
				
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
		
		<cfif next GTE 2000>
			<cfset stop=2000>
		<cfelse>
			<cfset stop=next-1>
		</cfif>											
		<cfset current=this>
		<cfset i=this>							

<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="d3.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td><td width="50%" align="right"><cfif stop LT 2000><a href="d3.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>


<center>
	<table width=562 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
<cfoutput>
<tr>
	<td bordercolor="##000000"><img src="#relativepath#images/rankings/d3_pilot_name.gif" height=90 width=131 alt="" border="0"></td>
	<cfif type IS 'kills'>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=kills"><img src="#relativepath#images/rankings/d3_kills_selected.gif" width=24 height=90 alt="" border="0"></a></td>	
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=rank"><img src="#relativepath#images/rankings/d3_rank.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=deaths"><img src="#relativepath#images/rankings/d3_deaths.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=destructs"><img src="#relativepath#images/rankings/d3_destructs.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=effic"><img src="#relativepath#images/rankings/d3_efficiency.gif" width=24 height=90 alt="" border="0"></a></td>		
	<cfelseif type IS 'deaths'>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=deaths"><img src="#relativepath#images/rankings/d3_deaths_selected.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=kills"><img src="#relativepath#images/rankings/d3_kills.gif" width=24 height=90 alt="" border="0"></a></td>	
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=rank"><img src="#relativepath#images/rankings/d3_rank.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=destructs"><img src="#relativepath#images/rankings/d3_destructs.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=effic"><img src="#relativepath#images/rankings/d3_efficiency.gif" width=24 height=90 alt="" border="0"></a></td>	
	<cfelseif type IS 'destructs'>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=destructs"><img src="#relativepath#images/rankings/d3_destructs_selected.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=kills"><img src="#relativepath#images/rankings/d3_kills.gif" width=24 height=90 alt="" border="0"></a></td>	
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=rank"><img src="#relativepath#images/rankings/d3_rank.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=deaths"><img src="#relativepath#images/rankings/d3_deaths.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=effic"><img src="#relativepath#images/rankings/d3_efficiency.gif" width=24 height=90 alt="" border="0"></a></td>	
	<cfelseif type IS 'effic'>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=effic"><img src="#relativepath#images/rankings/d3_efficiency_selected.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=kills"><img src="#relativepath#images/rankings/d3_kills.gif" width=24 height=90 alt="" border="0"></a></td>	
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=rank"><img src="#relativepath#images/rankings/d3_rank.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=deaths"><img src="#relativepath#images/rankings/d3_deaths.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=destructs"><img src="#relativepath#images/rankings/d3_destructs.gif" width=24 height=90 alt="" border="0"></a></td>			
	<cfelseif type IS 'rank'>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=rank"><img src="#relativepath#images/rankings/d3_rank_selected.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=kills"><img src="#relativepath#images/rankings/d3_kills.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=deaths"><img src="#relativepath#images/rankings/d3_deaths.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=destructs"><img src="#relativepath#images/rankings/d3_destructs.gif" width=24 height=90 alt="" border="0"></a></td>
		<td bordercolor="##000000" align="right"><a href="d3.cfm?type=effic"><img src="#relativepath#images/rankings/d3_efficiency.gif" width=24 height=90 alt="" border="0"></a></td>	
	</cfif>
	<td bordercolor="##000000" align="right"><img src="#relativepath#images/rankings/kph.gif" width=24 height=90 alt="" border="0"></td>
	<td bordercolor="##000000" align="right"><img src="#relativepath#images/rankings/dph.gif" width=24 height=90 alt="" border="0"></td>
	<td bordercolor="##000000" align="right"><img src="#relativepath#images/rankings/sdph.gif" width=24 height=90 alt="" border="0"></td>
	<td bordercolor="##000000" align="right"><img src="#relativepath#images/rankings/gametime.gif" width=44 height=90 alt="" border="0"></td>	
</tr>	
</cfoutput>	
<cfloop query="d3scores" startrow="#this#" endrow="#stop#">

											<cfset str_days=Int(d3scores.OnlineTime / 86400)>
											<cfset str_hours=Int((d3scores.OnlineTime - (86400 * str_days)) / 3600)>
											<cfset str_minutes=Int((d3scores.OnlineTime - (86400 * str_days) - (str_hours * 3600)) / 60)>
											<cfset str_seconds=d3scores.OnlineTime - (86400 * str_days) - (str_hours * 3600) - (str_minutes * 60)>
											
											<cfset floathours = ((d3scores.OnlineTime - (86400 * str_days)) / 3600) + str_days * 24>
											<cfset kph=Int(d3scores.totalkills / floathours)>
											<cfset dph=Int(d3scores.totaldeaths / floathours)>
											<cfset sdph=Int(d3scores.suicides / floathours)>										
											
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
											
											<cfif isdefined("type")>
												<cfif Trim("type") IS NOT ''>
													<cfif type IS 'kills'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#TotalKills#</b></font></td><td align=right><font color=silver>#str_rank#</font></td><td align=right><font color=silver>#totaldeaths#</font></td><td align=right><font color=silver>#suicides#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>
													<cfelseif type IS 'deaths'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#totaldeaths#</b></font></td><td align=right><font color=silver>#TotalKills#</font></td><td align=right><font color=silver>#str_rank#</font></td><td align=right><font color=silver>#suicides#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																							
													<cfelseif type IS 'destructs'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#suicides#</b></font></td><td align=right><font color=silver>#TotalKills#</font></td><td align=right><font color=silver>#str_rank#</font></td><td align=right><font color=silver>#totaldeaths#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																							
													<cfelseif type IS 'effic'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#efficiency#%</b></font></td><td align=right><font color=silver>#TotalKills#</font></td><td align=right><font color=silver>#str_rank#</font></td><td align=right><font color=silver>#totaldeaths#</font></td><td align=right><font color=silver>#suicides#</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																								
													<cfelseif type IS 'rank'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#str_rank#</b></font></td><td align=right><font color=silver>#TotalKills#</font></td><td align=right><font color=silver>#totaldeaths#</font></td><td align=right><font color=silver>#suicides#</font></td><td align=right><font color=silver>#efficiency#</font></td><td align=right><font color=silver>#kph#</font></td><td align=right><font color=silver>#dph#</font></td><td align=right><font color=silver>#sdph#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>	
													</cfif>
												</cfif>
											</cfif>
		<cfset i=i+1>
	</cfloop>
</table>
</center>														


<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="d3.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td><td width="50%" align="right"><cfif stop LT 1000><a href="d3.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>						

<!--- End page info --->	
<cfinclude template="#relativepath#docmid.cfm">

<cfinclude template="#relativepath#menus/_menu_rankings.cfm">
	
<!--- end menus --->
<cfinclude template="#relativepath#docbot.cfm">









<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="#relativepath#doctop.cfm">
<!--- Page info goes here	 --->			

		<font color="white"><b><div class="newsitemtitle">Welcome to the Descent 3 rankings page!</div></b></font>
		
<cfif NOT isdefined("type")><cfset type="kills"></cfif>
<cfif Trim("type") IS ''><cfset type="kills"></cfif>
<cfset lastrow=1150>
	<cfif type IS 'deaths'>
			<cfif isdefined("application.d3deathsmax")><cfset app_d3deathsmax=application.d3deathsmax><cfelse><cfset app_d3deathsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXOSQL"> <!--- cachedwithin="#CreateTimeSpan(0,0,30,0)#" --->
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour
			FROM         Descent3 
			WHERE 		TotalDeaths >= #app_d3deathsmax#
			ORDER BY  TotalDeaths DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3deathsmax=d3scores.TotalDeaths>
			</cfloop>			
	<cfelse><cfif type IS 'destructs'>
			<cfif isdefined("application.d3destructsmax")><cfset app_d3destructsmax=application.d3destructsmax><cfelse><cfset app_d3destructsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXOSQL" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour
			FROM         Descent3 
			WHERE 		Suicides >= #app_d3destructsmax#
			ORDER BY  Suicides DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3destructsmax=d3scores.Suicides>
			</cfloop>					
	<cfelse><cfif type IS 'effic'>
			<cfif isdefined("application.d3destructsmax")><cfset app_d3efficmax=application.d3efficmax><cfelse><cfset app_d3efficmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXOSQL" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour
			FROM         Descent3 
			WHERE 		Efficiency >= #app_d3efficmax#
			ORDER BY  Efficiency DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3efficmax=d3scores.Efficiency>
			</cfloop>
	<cfelse>
			<cfif isdefined("application.d3killsmax")><cfset app_d3killsmax=application.d3killsmax><cfelse><cfset app_d3killsmax=0></cfif>
			<CFQUERY NAME="d3scores" DATASOURCE="PXOSQL"> <!--- cachedwithin="#CreateTimeSpan(0,0,30,0)#" --->
			SELECT      TrackerID, Pilot, TotalKills , TotalDeaths, Suicides, OnlineTime, Efficiency, KillsPerHour, DeathsPerHour, SuicidesPerHour
			FROM         Descent3 
			WHERE 		TotalKills >= #app_d3killsmax#
			ORDER BY  TotalKills DESC
			</CFQUERY>
			<cfif d3scores.recordcount LT 1150><cfset lastrow=d3scores.recordcount></cfif>
			<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
			<cfset application.d3killsmax=d3scores.TotalKills>
			</cfloop>		
			<cfset type="kills">
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
		
		<cfif next GTE 1000>
			<cfset stop=1000>
		<cfelse>
			<cfset stop=next-1>
		</cfif>											
		<cfset current=this>
		<cfset i=this>							

<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="d3demo.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td><td width="50%" align="right"><cfif stop LT 1000><a href="d3demo.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>


	
<center>
<cfif type IS 'kills'>
		<map name="kills">
			<area shape="RECT" coords="198,0,221,110" href="d3demo.cfm?type=kills">
			<area shape="RECT" coords="255,0,274,110" href="d3demo.cfm?type=deaths">
			<area shape="RECT" coords="292,0,309,110" href="d3demo.cfm?type=destructs">
			<area shape="RECT" coords="323,0,344,110" href="d3demo.cfm?type=effic">
		</map>
	<cfoutput><img src="#relativepath#images/rankings/d3kills.gif" width=562 height=110 alt="" border="0" usemap="##kills"><br></cfoutput>
<cfelse><cfif type IS 'deaths'>
		<map name="deaths">
			<area shape="RECT" coords="204,0,223,110" HREF="d3demo.cfm?type=deaths">
			<area shape="RECT" coords="257,0,277,110" HREF="d3demo.cfm?type=kills">
			<area shape="RECT" coords="294,0,311,110" HREF="d3demo.cfm?type=destructs">
			<area shape="RECT" coords="333,0,361,110" HREF="d3demo.cfm?type=effic">
		</map>
	<cfoutput><img src="#relativepath#images/rankings/d3deaths.gif" width=562 height=110 alt="" border="0" usemap="##deaths"><br></cfoutput>
<cfelse><cfif type IS 'destructs'>
		<map name="destructs">
			<area shape="RECT" coords="185,0,205,110" HREF="d3demo.cfm?type=destructs">
			<area shape="RECT" coords="240,0,260,110" HREF="d3demo.cfm?type=kills">
			<area shape="RECT" coords="296,0,314,110" HREF="d3demo.cfm?type=deaths">
			<area shape="RECT" coords="337,0,358,110" HREF="d3demo.cfm?type=effic">
		</map>	
	<cfoutput><img src="#relativepath#images/rankings/d3destructs.gif" width=562 height=110 alt="" border="0" usemap="##destructs"><br></cfoutput>
<cfelse><cfif type IS 'effic'>
		<map name="effic">
			<area shape="RECT" coords="194,0,216,110" HREF="d3demo.cfm?type=effic">
			<area shape="RECT" coords="249,0,267,110" href="d3demo.cfm?type=kills">
			<area shape="RECT" coords="303,0,322,110" href="d3demo.cfm?type=deaths">
			<area shape="RECT" coords="339,0,360,110" href="d3demo.cfm?type=destructs">
		</map>		
		<cfoutput><img src="#relativepath#images/rankings/d3efficiency.gif" width=562 height=110 alt="" border="0" usemap="##effic"><br></cfoutput>
</cfif></cfif></cfif></cfif>
</center>



<center>
	<table width=562 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
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
											
											<cfif isdefined("type")>
												<cfif Trim("type") IS NOT ''>
													<cfif type IS 'kills'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(TotalKills)#</b></font></td><td align=right><font color=silver>#NumberFormat(totaldeaths)#</font></td><td align=right><font color=silver>#NumberFormat(suicides)#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#NumberFormat(kph)#</font></td><td align=right><font color=silver>#NumberFormat(dph)#</font></td><td align=right><font color=silver>#NumberFormat(sdph)#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>
													<cfelse><cfif type IS 'deaths'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(totaldeaths)#</b></font></td><td align=right><font color=silver>#NumberFormat(TotalKills)#</font></td><td align=right><font color=silver>#NumberFormat(suicides)#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#NumberFormat(kph)#</font></td><td align=right><font color=silver>#NumberFormat(dph)#</font></td><td align=right><font color=silver>#NumberFormat(sdph)#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																							
													<cfelse><cfif type IS 'destructs'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(suicides)#</b></font></td><td align=right><font color=silver>#NumberFormat(TotalKills)#</font></td><td align=right><font color=silver>#NumberFormat(totaldeaths)#</font></td><td align=right><font color=silver>#efficiency#%</font></td><td align=right><font color=silver>#NumberFormat(kph)#</font></td><td align=right><font color=silver>#NumberFormat(dph)#</font></td><td align=right><font color=silver>#NumberFormat(sdph)#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																							
													<cfelse><cfif type IS 'effic'>
														<cfoutput><TR><td bgcolor="##333333" align=left><font color=white><nobr>#i#. #Pilot#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#efficiency#%</b></font></td><td align=right><font color=silver>#NumberFormat(TotalKills)#</font></td><td align=right><font color=silver>#NumberFormat(totaldeaths)#</font></td><td align=right><font color=silver>#NumberFormat(suicides)#</font></td><td align=right><font color=silver>#NumberFormat(kph)#</font></td><td align=right><font color=silver>#NumberFormat(dph)#</font></td><td align=right><font color=silver>#NumberFormat(sdph)#</font></td><td align=right><font color=silver>#str_time#</font></td></TR></cfoutput>																								
														</cfif></cfif></cfif></cfif>
												</cfif>
											</cfif>
		<cfset i=i+1>
	</cfloop>
													<cfif type IS 'kills'>
														<cfoutput><tr><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=162 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=30 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=32 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=70 height=1 border="0"></td></tr></cfoutput>
													<cfelse><cfif type IS 'deaths'>
														<cfoutput><tr><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=162 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=30 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=32 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=70 height=1 border="0"></td></tr></cfoutput>
													<cfelse><cfif type IS 'destructs'>
														<cfoutput><tr><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=162 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=30 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=32 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=70 height=1 border="0"></td></tr></cfoutput>
													<cfelse><cfif type IS 'effic'>
														<cfoutput><tr><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=162 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=50 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=30 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=40 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=32 height=1 border="0"></td><td bgcolor="##5A63F7"><img src="#relativepath#images/main/spacer.gif" width=70 height=1 border="0"></td></tr></cfoutput>																																					
														</cfif></cfif></cfif></cfif>	
</table>
</center>														


<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="d3demo.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td><td width="50%" align="right"><cfif stop LT 1000><a href="d3demo.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>						

<!--- End page info --->	
<cfinclude template="#relativepath#docmid.cfm">

<cfinclude template="#relativepath#menus/_menu_rankings.cfm">
	
<!--- end menus --->
<cfinclude template="#relativepath#docbot.cfm">









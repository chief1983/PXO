<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="#relativepath#doctop.cfm">
<!--- Page info goes here	 --->			

<cfset maxscore=1000>

		<font color="white"><b><div class="newsitemtitle">Welcome to the FreeSpace 2 rankings page!</div></b></font>
		
<cfif NOT isdefined("type")><cfset type="scores"></cfif>
<cfif Trim("type") IS ''><cfset type="scores"></cfif>
	<cfif type IS 'kills'>
		<cfif isdefined("application.fs2demokillsmax")><cfset app_fskillsmax=application.fs2demokillsmax><cfelse><cfset app_fskillsmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
			FROM         FreeSpace2Full 
			WHERE 		KillCountOK > #app_fskillsmax# AND MissionsFlown > 0
			ORDER BY  KillCountOK DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
				<cfset application.fs2demokillsmax=fsscores.KillCountOK>
			</cfloop>			
	<cfelse><cfif type IS 'msns'>
			<cfif isdefined("application.fs2demomsnsmax")><cfset app_fsmsnsmax=application.fs2demomsnsmax><cfelse><cfset app_fsmsnsmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
			FROM         FreeSpace2Full 
			WHERE 		MissionsFlown > #app_fsmsnsmax#
			ORDER BY  MissionsFlown DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
				<cfset application.fs2demomsnsmax=fsscores.MissionsFlown>
			</cfloop>						
	<cfelse><cfif type IS 'time'>
			<cfif isdefined("application.fs2demotimemax")><cfset app_fstimemax=application.fs2demotimemax><cfelse><cfset app_fstimemax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
			FROM         FreeSpace2Full 
			WHERE 		FlightTime > #app_fstimemax# AND MissionsFlown > 0
			ORDER BY  FlightTime DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
			<cfset application.fs2demotimemax=fsscores.FlightTime>
			</cfloop>
	<cfelse>
			<cfif isdefined("application.fs2demoscoresmax")><cfset app_fsscoresmax=application.fs2demoscoresmax><cfelse><cfset app_fsscoresmax=0></cfif>
			<CFQUERY NAME="fsscores" DATASOURCE="PXO" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			SELECT      TrackerID, Rank, Pilot, Score, KillCountOK, MissionsFlown, FlightTime
			FROM         FreeSpace2Full 
			WHERE MissionsFlown > 0
			ORDER BY  Score DESC
			</CFQUERY>
			<cfloop query="fsscores" startrow="#Evaluate(maxscore + 99)#" endrow="#Evaluate(maxscore + 100)#">
			<cfset application.fs2demoscoresmax=fsscores.score>
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
<AREA SHAPE="RECT" COORDS="235,23,366,71" HREF="fs2full.cfm?type=scores">
<AREA SHAPE="RECT" COORDS="283,0,422,22" HREF="fs2full.cfm?type=kills">
<AREA SHAPE="RECT" COORDS="423,0,553,22" HREF="fs2full.cfm?type=msns">
<AREA SHAPE="RECT" COORDS="473,23,553,71" HREF="fs2full.cfm?type=time">
</MAP>
<font color="#BBBBBB"><div class="newsitem">Pilots can increase their score by attacking more powerful targets and meeting Mission Objectives.  A capital ship has a much higher score value than an enemy fighter. Certain Mission Events can also award score values. Score penalties are issued for killing friendly ships. All score awards are scaled by skill level.</div><p><a href="../pilotlist.cfm">Look up all pilot scores for your PXO login</a></font>
<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="fs2full.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td>
	<td width="50%" align="right"><cfif (stop LT maxscore) AND (stop LT fsscores.recordcount)><a href="fs2full.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>
<center><table width="542" cellpadding="0" cellspacing="0"><tr><td valign="top"> 
<img src="../images/rankings/tabletopnew.gif" width=554 height=72 usemap="#charts" border="0"><br>
	<table width=542 border=1 bordercolorlight="#5A63F7" bordercolordark="#5A63F7" cellspacing=0>
<cfloop query="fsscores" startrow="#this#" endrow="#stop#">

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
											
											<cfif isdefined("type")>
												<cfif Trim("type") IS NOT ''>
													<cfif type IS 'scores'>
														<cfoutput><tr><td bgcolor="##333333" align=left><font color=white><nobr> #i#. #str_rank# #Left(Pilot,12)#</nobr></font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(Score)#</b></font></td><td align=right><font color=silver>#NumberFormat(KillCountOK)#</font></td><td align=right><font color=silver>#NumberFormat(MissionsFlown)#</font></td><td align=right><font color=silver>#str_time#</font></td></tr></cfoutput>
													<cfelse><cfif type IS 'kills'>
														<cfoutput><tr><td bgcolor="##333333" align=left><font color=white><nobr> #i#. #str_rank# #Left(Pilot,12)#</nobr></font></td><td align=right><font color=silver>#NumberFormat(Score)#</font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(KillCountOK)#</b></font></td><td align=right><font color=silver>#NumberFormat(MissionsFlown)#</font></td><td align=right><font color=silver>#str_time#</font></td></tr></cfoutput>																							
													<cfelse><cfif type IS 'msns'>
														<cfoutput><tr><td bgcolor="##333333" align=left><font color=white><nobr> #i#. #str_rank# #Left(Pilot,12)#</nobr></font></td><td align=right><font color=silver>#NumberFormat(Score)#</font></td><td align=right><font color=silver>#NumberFormat(KillCountOK)#</font></td><td align=right bgcolor="##00217B"><font color=white><b>#NumberFormat(MissionsFlown)#</b></font></td><td align=right><font color=silver>#str_time#</font></td></tr></cfoutput>																							
													<cfelse><cfif type IS 'time'>
														<cfoutput><tr><td bgcolor="##333333" align=left><font color=white><nobr> #i#. #str_rank# #Left(Pilot,12)#</nobr></font></td><td align=right><font color=silver>#NumberFormat(Score)#</font></td><td align=right><font color=silver>#NumberFormat(KillCountOK)#</font></td><td align=right><font color=silver>#NumberFormat(MissionsFlown)#</font></td><td align=right bgcolor="##00217B"><font color=white><b>#str_time#</b></font></td></tr></cfoutput>																								
														</cfif></cfif></cfif></cfif>
												</cfif>
											</cfif>
	<cfset i=i+1>
</cfloop>
											<tr><td bgcolor="#5A63F7"><img src="images/fsstats/SPACER2.GIF" width=230 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="images/fsstats/SPACER2.GIF" width=127 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="images/fsstats/SPACER2.GIF" width=53 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="images/fsstats/SPACER2.GIF" width=46 height=1 border="0"></td><td bgcolor="#5A63F7"><img src="images/fsstats/SPACER2.GIF" width=76 height=1 border="0"></td></tr></table>			
										</td></tr></table></center>

<table width="100%"><tr><td width="50%" align="left"><cfif this GT incrementer><a href="fs2full.cfm?<cfoutput>previous=#previous#&type=#type#</cfoutput>"><img src="../images/rankings/previous.gif" alt="" border="0" align="left"></a></cfif><br></td>
	<td width="50%" align="right"><cfif (stop LT maxscore) AND (stop LT fsscores.recordcount)><a href="fs2full.cfm?<cfoutput>next=#next#&type=#type#</cfoutput>"><img src="../images/rankings/next.gif" alt="" border="0" valign="right"></a></cfif><br></td></tr></table>						

<!--- End page info --->	
<cfinclude template="#relativepath#docmid.cfm">

<cfinclude template="#relativepath#menus/_menu_rankings.cfm">
	
<!--- end menus --->
<cfinclude template="#relativepath#docbot.cfm">








<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - League">

<cfinclude template="#relativepath#doc_top.cfm">

<script language="JavaScript">
<!-- hide


// open new window
// function openWindow(url, name, w, h) {
//  popupWin = window.open(url, name, 'resizable,scrollbars,menubar,width=' + w + ',height=' + h);
// }

function openAnyWindow(url, name) {
  var l = openAnyWindow.arguments.length;
  var w = "";
  var h = "";
  var features = "";

  for (i=2; i<l; i++) {
    var param = openAnyWindow.arguments[i];
    if ( (parseInt(param) == 0) || (isNaN(parseInt(param))) ) {
      features += param + ',';
    } else {
      (w == "") ? w = "width=" + param + "," :
        h = "height=" + param;
    }
  }

  features += w + h;
  var code = "popupWin = window.open(url, name";
  if (l > 2) code += ", '" + features;
  code += "')";
  eval(code);
  if (window.focus) {
  popupWin.focus();
  }
}
// done hiding -->
</script>

<cfif session.loggedin IS 0>
	<cfinclude template="#relativepath#menu/league_notloggedin.cfm">
<cfelse>
	<cfinclude template="#relativepath#menu/league_loggedin.cfm">
</cfif>

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
				<br>
				<br>
<center>
<table width="95%" background="" cellpadding=0 cellspacing=0 border=0><tr><td>


<div class="copy">
<cfset checkdate=DateDiff('s',CreateDateTime(1970,1,1,0,0,0),NOW())>
Current game time is: <cfoutput>#checkdate#</cfoutput>
</div>

<cfquery datasource="squadwar" name="get_matches">
	SELECT SWMatches.SWCode, SWMatches.swsquad1, SWMatches.swsquad2
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad1) AS Squad1_name
		,(SELECT SquadName FROM SWSquads WHERE SWSquads.SquadID = SWMatches.swsquad2) AS Squad2_name
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad1) AS Squad1_Email
		,(SELECT Squad_Email FROM SWSquad_Info WHERE SWSquad_Info.SquadID = SWMatches.swsquad2) AS Squad2_Email
		, SWMatches.swsector_ID
		,(SELECT SectorName FROM SWSectors WHERE SWSectors.SWSectors_ID = SWMatches.swsector_ID) AS Sectorname
<!---		,(SELECT Time_Created FROM SWMatches_Info WHERE SWMatches_Info.SWCode = SWMatches.SWCode) AS match_date --->
		,SWMatches_Info.Time_Created
	FROM SWMatches LEFT JOIN SWMatches_Info ON SWMatches_Info.SWCode = SWMatches.SWCode
	ORDER BY SWMatches_Info.Time_Created DESC
</cfquery>


						<table width="98%" cellpadding=0 cellspacing=0 border=0>							
						<cfif get_matches.recordcount IS NOT 0>
							<cfset coloredrow=1>
							<cfset thisdate=''>
								<tr><td colspan="7" align="center"><div class="title">Pending Matches</div></td></tr>
							<cfloop query="get_matches">	
											<cfoutput>						
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
												<td><div class="copy">&nbsp;#SWCode#&nbsp;</div></td>
												<td>
													<div class="copy">
														
														#get_matches.squad1_name#
														Challenged
														#get_matches.squad2_name#
														for control of Sector 
														#get_matches.swsector_id#
														#get_matches.SectorName#
													</div>
												</td>
												<td>
													<div class="copy">&nbsp;#swsquad1#&nbsp;</div>
												</td>
												<td>
													<div class="copy">
														<a href="mailto:#Squad1_Email#">#Squad1_Email#</a>
													</div>
												</td>
												<td>
													<div class="copy">&nbsp;#swsquad2#&nbsp;</div>
												</td>												
												<td>
													<div class="copy">
														<a href="mailto:#Squad2_Email#">#Squad2_Email#</a>
													</div>
												</td>												
											</tr>
											</cfoutput>
<cfif get_matches.time_created LT DateAdd("d",-7,Now())>
<cfmail to="#Squad1_Email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="SquadWar:Challenge:Delinquent Match - #SWCode#" server="v-exchange.volition.net">

Respond directly to this email!  If your squad receives multiple emails regarding outstanding matches, reply to each one individually so the subject stays intact!
										
Your squad has an outstanding SquadWar match.  Please respond with the current status and situation of the match listed below.  Please respond within 24 hours or the Administrator may force a forfeit of your match.  If you have already sent email to the Administrator regarding the status of this match, please do so again as this is a bulk emailing.

Match Code: #SWCode#
Created On: #DateFormat(get_matches.time_created,"m.d.yy")#
#get_matches.squad1_name# Challenged #get_matches.squad2_name# for control of Sector #get_matches.swsector_id# #get_matches.SectorName#

Please contact me if you have any difficulties or questions.


- Nathan Camarillo
- SquadWar Administrator
- squadwar@pxo.net
										
</cfmail>	
<cfmail to="#Squad2_Email#" from="squadwar@pxo.net" cc="squadwar@pxo.net" subject="SquadWar:Challenge:Delinquent Match - #SWCode#" server="v-exchange.volition.net">
							
Respond directly to this email! If your squad receives multiple emails regarding outstanding matches, reply to each one individually so the subject stays intact!								
										
Your squad has an outstanding SquadWar match.  Please respond with the current status and situation of the match listed below.  Please respond within 24 hours or the Administrator may force a forfeit of your match.  If you have already sent email to the Administrator regarding the status of this match, please do so again as this is a bulk emailing.

Match Code: #SWCode#
Created On: #DateFormat(get_matches.time_created,"m.d.yy")#
#get_matches.squad1_name# Challenged #get_matches.squad2_name# for control of Sector #get_matches.swsector_id# #get_matches.SectorName#

Please contact me if you have any difficulties or questions.


- Nathan Camarillo
- SquadWar Administrator
- squadwar@pxo.net
										
</cfmail>	
</cfif>											
							</cfloop>		
								<cfif coloredrow IS 1><cfset coloredrow=0><tr bgcolor="#0B160D"><cfelse><tr><cfset coloredrow=1></cfif>
									<td colspan="7" align="center">
										<div class="copy">There are <cfoutput>#get_matches.recordcount#</cfoutput> matches pending in this league</div>
									</td>
								</tr>
						</cfif>
						</table>	
	


</td></tr></table>				
<p>
				
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

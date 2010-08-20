<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

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


<cfif isdefined("leagueid")>
	<cfif leagueid IS NOT ''>


				<cfif leagueid IS 1>
					<center>
						<cfinclude template='leagues/1/map.cfm'>
						<p>
						<cfinclude template='leagues/1/ticker_pending_view.cfm'>
					</center>			
				<cfelseif leagueid IS 2>
					<center>
						<cfinclude template='leagues/2/map.cfm'>
						<p>
						<cfinclude template='leagues/2/ticker_pending_view.cfm'>
					</center>					
				<cfelseif leagueid IS 3>
					<center>
						<cfinclude template='leagues/3/map.cfm'>
						<p>
						<cfinclude template='leagues/3/ticker_pending_view.cfm'>
					</center>					
				<cfelseif leagueid IS 4>
					<center>
						<cfinclude template='leagues/4/map.cfm'>
						<p>
						<cfinclude template='leagues/4/ticker_pending_view.cfm'>
					</center>
				<cfelseif leagueid IS 5>
					<center>
						<cfinclude template='leagues/5/map.cfm'>
						<p>
						<cfinclude template='leagues/5/ticker_pending_view.cfm'>
					</center>	
				<cfelseif leagueid IS 6>
					<center>
						<cfinclude template='leagues/6/map.cfm'>
						<p>
						<cfinclude template='leagues/6/ticker_pending_view.cfm'>
					</center>	
				</cfif>	
	</cfif>
</cfif>
</td></tr></table>				
<p>
				
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

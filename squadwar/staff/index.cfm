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

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
	<br>	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>	

				<div class="Title">SquadWar Staff</div>
				<p>
				<div class="copy">
					<b>Nathan Camarillo</b> - Administrator, Moderator, SquadWar Support<br>
					<b>Eric Keyser</b>	 - PXO Support/FreeSpace 2 Multiplayer Support<br>
					<b>James Tsai</b> - PXO Support/FreeSpace 2 Multiplayer Support<br>

				<p>
				If you have a problem with single-player FreeSpace please contact Interplay support at <a href="http://www.interplay.com">http://www.interplay.com</a>
				<p>
				If you have a problem with PXO, connecting to PXO, or hosting a SquadWar match please contact PXO Support at: <a href="mailto:support@pxo.net">support@pxo.net</a>
				<p>
				If you have a problem with the SquadWar web application, your SquadWar information, Squadron, or to dispute or report information about individuals detrimental to SquadWar, please write the circumstances in full and complete detail to: <a href="mailto:squadwar@volition-inc.com">squadwar@volition-inc.com</a>
				</div>				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

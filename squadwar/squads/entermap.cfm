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
<cfset session.challenging=1>				
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

				<cfif leagueid IS 1>
					<center>
						<cfinclude template='#relativepath#leagues/1/map.cfm'>
					</center>
				<cfelseif leagueid IS 2>
					<center>
						<cfinclude template='#relativepath#leagues/2/map.cfm'>
					</center>				
				<cfelseif leagueid IS 3>
					<center>
						<cfinclude template='#relativepath#leagues/3/map.cfm'>
					</center>					
				<cfelseif leagueid IS 4>
					<center>
						<cfinclude template='#relativepath#leagues/4/map.cfm'>
					</center>		
				<cfelseif leagueid IS 5>
					<center>
						<cfinclude template='#relativepath#leagues/5/map.cfm'>
					</center>									
				<cfelseif leagueid IS 6>
					<center>
						<cfinclude template='#relativepath#leagues/6/map.cfm'>
					</center>						
				</cfif>		
				<!---
				<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
					SELECT *
					FROM SWSectors
					WHERE (Entry_Node=1) AND (SectorSquad=0)
					ORDER BY SWSectors_ID
				</cfquery>
				--->
				
		<cfquery datasource="#currentdatasource#" name="check_all_nodes">
			SELECT *
			FROM SWSectors
			WHERE (SectorSquad = #session.squadid#) AND (league_id = #leagueid#)
			ORDER BY SWSectors_ID				
		</cfquery>

		<cfif check_all_nodes.recordcount IS 0>

				<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
					SELECT *
					FROM SWSectors
					WHERE (SectorSquad=0) AND (SWSectors_ID <> 0) AND (SectorSquad <> #session.squadid#) AND (league_id = #leagueid#)
					ORDER BY SWSectors_ID
				</cfquery>
				
				<cfform action="_entermap.cfm">
					Challenge 
					<select name="sector">
						<cfoutput query="check_entry_nodes">
							<cfquery datasource="#currentdatasource#" name="check_match_node">
								SELECT *
								FROM SWMatches
								WHERE (SWSector_ID = #check_entry_nodes.SWSectors_ID#) AND (league_id = #leagueid#)
							</cfquery>
							<cfif check_match_node.recordcount IS 0>
								<option value="#check_entry_nodes.SWSectors_ID#">#check_entry_nodes.SWSectors_ID# #check_entry_nodes.SectorName#
							</cfif>
						</cfoutput>	
					</select>	
					<input type="hidden" name=leagueid value="<cfoutput>#leagueid#</cfoutput>">
					<input type="submit" value="Enter the Map">
				</cfform>
		</cfif>
				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

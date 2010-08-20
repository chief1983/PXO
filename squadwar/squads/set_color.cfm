<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Set Color">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

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
<cfif isdefined ("form.update")>
	<cfquery datasource="#currentdatasource#" name="update_color">
		UPDATE SWSquad_Info
		SET 
			Squad_Red = #form.red#,
			Squad_Green = #form.green#,
			Squad_Blue = #form.blue# 
		WHERE 
			SquadID = #session.squadid#
	</cfquery>	
</cfif>
		
					<cfquery datasource="#currentdatasource#" name="get_squad">
						SELECT SquadName
						FROM SWSquads
						WHERE SquadID = #session.squadid#
					</cfquery>					
					<cfquery datasource="#currentdatasource#" name="get_color">
						SELECT squad_red, squad_green, squad_blue
						FROM SWSquad_Info
						WHERE SquadID = #session.squadid#
					</cfquery>
					<cfset red=get_color.squad_red>
					<cfset green=get_color.squad_green>
					<cfset blue=get_color.squad_blue>
					<cfif (Red IS '') OR (Green IS '') OR (Blue IS '')>
					<cfset teamcolor='000000'>
					<cfelse>
					<cfset convert_red = FormatBaseN(Red,16)>
					<cfset convert_green = FormatBaseN(Green,16)>
					<cfset convert_blue = FormatBaseN(Blue,16)>
					<cfif convert_red IS 0><cfset convert_red = '00'></cfif>
					<cfif convert_green IS 0><cfset convert_green = '00'></cfif>
					<cfif convert_blue IS 0><cfset convert_blue = '00'></cfif>
					<cfset teamcolor= convert_red & convert_green & convert_blue>
												</cfif>
					<div class="title">Squad <font color="<cfoutput>#teamcolor#</cfoutput>"><cfoutput>#get_squad.SquadName#'s</cfoutput></font> Color Admin. Page</div>		
					<p>
					<div class="copy">Your Squad can choose a standard RGB Color for its Squad color.  The sum of the three numbers should be greater than 95 and lest than 707.  This will prevent colors from appearing too dark or too light on the map.</div>
					<p>
					<cfif isdefined ("form.update")>
					<div class="title">Your Squad Color has been updated.</div>
					<p>
					</cfif>
					<p>
					<div class="copy"><b>Your current Squad color is:</b> <cfoutput>Red - #get_color.squad_red#, Green - #get_color.squad_Green#, Blue - #get_color.squad_blue#</cfoutput></div>					
					<p>


					<cfif isdefined("form.red")>
						<cfif (form.Red IS '') OR (form.Green IS '') OR (form.Blue IS '') OR (NOT ISNumeric(form.Red)) OR (NOT ISNumeric(form.Green)) OR (NOT ISNumeric(form.Blue))>
							<cfset tablecolor='000000'>
							<div class="copy"><b>You must enter values between 0 and 255.</b></div>						

						<cfelseif (form.Red GT 255) OR (form.Green GT 255) OR (form.Blue GT 255)>
							<cfset tablecolor='000000'>
							<div class="copy"><b>You must enter values between 0 and 255.</b></div>		
						<cfelseif (form.Red LT 0) OR (form.Green LT 0) OR (form.Blue LT 0)>
							<cfset tablecolor='000000'>
							<div class="copy"><b>You must enter values between 0 and 255.</b></div>																
			
						<cfelseif Evaluate(form.red + form.green + form.blue) LT 96>
							<cfset tablecolor='000000'>
							<div class="copy"><b>Your color is too dark. The Sum of values must be greater than 96.</b></div>	
						<cfelseif Evaluate(form.red + form.green + form.blue) GT 706>
							<cfset tablecolor='000000'>
							<div class="copy"><b>Your color is too light. The Sum of values must be less than 707.</b></div>
						<cfelse>										
							<cfset convert_red = FormatBaseN(form.Red,16)>
							<cfset convert_green = FormatBaseN(form.Green,16)>
							<cfset convert_blue = FormatBaseN(form.Blue,16)>
							<cfif convert_red IS 0><cfset convert_red = '00'></cfif>
							<cfif convert_green IS 0><cfset convert_green = '00'></cfif>
							<cfif convert_blue IS 0><cfset convert_blue = '00'></cfif>
							<cfset tablecolor= convert_red & convert_green & convert_blue>
						</cfif>					
					<cfelse>
						<cfset tablecolor=teamcolor>
					</cfif>					
					
					
					
					<Table>
						<tr>
							<td valign="top">
								<table width=100 height=100 bgcolor="<cfoutput>#tablecolor#</cfoutput>" border=1><tr><td>&nbsp;</td></tr></table>					
							</td>
							<td valign="top">
								<div class="copy">
									
									<cfform action="set_color.cfm">
										<table>	
											<tr>	
												<td align="right"><div class="copy"><b>Red:</b></div></td>
												<td><input type="text" name="red" size=3 maxlength=3 value="<cfoutput><cfif isdefined("form.try")>#form.red#<cfelse>#get_color.squad_red#</cfif></cfoutput>"></td>
											</tr>
											<tr>	
												<td align="right"><div class="copy"><b>Green:</b></div></td>
												<td><input type="text" name="green" size=3 maxlength=3 value="<cfoutput><cfif isdefined("form.try")>#form.green#<cfelse>#get_color.squad_green#</cfif></cfoutput>"></td>
											</tr>
											<tr>	
												<td align="right"><div class="copy"><b>Blue:</b></div></td>
												<td><input type="text" name="blue" size=3 maxlength=3 value="<cfoutput><cfif isdefined("form.try")>#form.blue#<cfelse>#get_color.squad_blue#</cfif></cfoutput>"></td>
											</tr>	
											<tr>												
											</tr>										
										</table>
										<input type="hidden" name="try" value="1">
										<input type="submit" value="Test This Color">
									</cfform>
									<cfform action="set_color.cfm">	
										<input type="hidden" name="red" value="<cfoutput><cfif isdefined("form.red")>#form.red#<cfelse>#get_color.squad_red#</cfif></cfoutput>">
										<input type="hidden" name="green" value="<cfoutput><cfif isdefined("form.green")>#form.green#<cfelse>#get_color.squad_green#</cfif></cfoutput>">
										<input type="hidden" name="blue" value="<cfoutput><cfif isdefined("form.blue")>#form.blue#<cfelse>#get_color.squad_blue#</cfif></cfoutput>">
										<input type="hidden" name="update" value="1">
										<input type="submit" value="Accept This Color">
									</cfform>
								</div>
							</td>
						</tr>
					</table>
					<p>
					
				
				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

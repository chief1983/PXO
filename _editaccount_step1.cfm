<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">Edit Your Account</div></b></font>

						<font color="#BBBBBB">
							<div class="copy">
							
									<cfquery datasource="PXO" name="check_login">
										SELECT login, password, TrackerID, email
										FROM Users
										WHERE login = '#FORM.login#' AND password = '#FORM.password#'
									</cfquery>													
									<cfif (check_login.recordcount GT 0)>
									<cfset id = check_login.TrackerID>
									<CFFORM ACTION="_editaccount_step2.cfm" METHOD="POST">	
										<cfoutput>
											<input type="hidden" name="id" value="#id#">
											<input type="hidden" name="login" value="#form.login#">
											<input type="hidden" name="password" value="#form.password#">
										</cfoutput>
										<table>
										<tr>
											<td align="right"><div class="copy"><b>Email Address:</b></div></td>
											<td><cfinput type="Text" name="email" size="25" maxlength="50" required="yes" value="#check_login.email#"  message="You must enter your email address."></td>
										</tr>
										<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
										<tr><td>&nbsp;</td><td><INPUT TYPE="SUBMIT" VALUE="Submit Change"></td></tr>
										</table>
										
										</cfform>									
									<cfelse>
									
									This login and password does not exist in our database.  Please register a new account at:<br>
									<a href="http://www.pxo.net/accounts.cfm">http://www.pxo.net/accounts.cfm</a>
																
									</cfif>						



							


						
							</div>							
						</font>
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





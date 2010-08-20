<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

									<cfquery datasource="PXO" name="check_login">
										SELECT login, password, TrackerID, email, Validated
										FROM Users
										WHERE login = '#FORM.login#' AND password = '#FORM.password#'
									</cfquery>													
									<cfif (check_login.recordcount GT 0)>
									<cfset id = check_login.TrackerID>
									
										<cfif #check_login.Validated# IS 1>
										<div class="copy">
											<h3>Your account has been successfully validated.</h3><p>
											<a href="http://www.pxo.net/">Return to PXO.net</a>
										</div>
										<cfelse>
											<cfquery datasource="PXO">
												UPDATE Users
												SET validated=1
												WHERE TrackerID='#id#'
											</cfquery>
									
									<div class="copy">
										<h3>Your account has been successfully validated.</h3><p>
										<a href="http://www.pxo.net/">Return to PXO.net</a>
									</div>
										</cfif>
									<cfelse>
									
									This login and password does not exist in our database.  Please register a new account at:<br>
									<a href="http://www.pxo.net/accounts.cfm">http://www.pxo.net/accounts.cfm</a>
																
									</cfif>		

			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">









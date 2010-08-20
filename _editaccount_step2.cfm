<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfquery datasource="PXO">
	UPDATE Users
	SET email='#form.email#'
	WHERE TrackerID='#id#'
</cfquery>


<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">Email Changed</div></b></font>

				

		<div class="copy">
			<h3>Your email address has been successfully changed.</h3><p>
			<a href="http://www.pxo.net/">Return to PXO.net</a>
		</div>

			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





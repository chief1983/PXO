<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">PXO Account Management Services:</div></b></font>
	
	<div class="copy">
		<ul>
			<li><a href="newaccount.cfm">Create a new account</a>
			<li><a href="verify.cfm">Manually validate an account</a>
			<li><a href="fetch.cfm">Lost your PXO password, or would you like to know what your PXO login and password are?</a>
			<li><a href="editaccount.cfm">Change the email address for your account</a>
		</ul>
	</div>
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">








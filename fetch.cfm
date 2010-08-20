<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">PXO Pilot Lookup:</div></b></font>



<font color="#BBBBBB"><div class="copy">
Entering your PXO login will send an email to the email address to which that login is registered.
<p>
Entering your email address will email that address with all PXO logins and passwords related to that email address.
<p>
<CFFORM ACTION="_fetch.cfm" METHOD="POST">	
	<table>
		<tr>
			<td>
			<font color="#BBBBBB"><div class="copy"><b>Login:</b></div></font>
			</td>
			<td>
			<cfinput type="Text" name="login" size="25" maxlength="75">
			
			</td>
		</tr>
		<tr>
			<td colspan="2"><div class="copy">OR</div></td>
		</tr>
		<tr>
			<td>
			<font color="#BBBBBB"><div class="copy"><b>Email:</b></div></font>
			</td>
			<td>
			<cfinput type="text" name="email" size="25" maxlength="75">
			</td>
		</tr>
	</table>
	<p>
<INPUT TYPE="SUBMIT" VALUE="Find My Info">
	</cfform>
</div></font>

			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">










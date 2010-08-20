<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			



<cfif isdefined("message")>
	<div class="copy">
	<cfif message IS '1'>
		<b>Your login and/or password are incorrect.</b>
	<cfelseif message IS '2'>
		<b>Your two 'new password' entries do not match.</b>
	<cfelseif message IS '3'>
		<b>Your password has been successfully changed.</b>
	</cfif>
	</div>
<cfelse>
			
<table><tr><td>
	<div class="copy">
		<cfform action="_changepass.cfm" method="POST" enablecab="Yes" name="login">
			<b>Login:</b><br>
			<cfinput type="text" name="login" message="You must enter your login." required="yes" size="20" maxlength="50"><p>
			<b>Old Password:</b><br>
			<cfinput type="password" name="oldpassword" message="You must enter your old password." required="yes" size="20" maxlength="50"><p>
			<b>New Password:</b><br>
			<cfinput type="password" name="newpassword" message="You must enter your new password." required="yes" size="20" maxlength="50"><p>								
			<b>Dup Password:</b><br>
			<cfinput type="password" name="duppassword" message="You must confirm your new password." required="yes" size="20" maxlength="50"><p>								
			<br>
			<input type="submit" value="Change My Password">
		</cfform>
	</div>
</td></tr></table>
</cfif>

			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





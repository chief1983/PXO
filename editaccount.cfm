<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">Please log in:</div></b></font>



<font color="#BBBBBB"><div class="copy">
<CFFORM ACTION="_editaccount_step1.cfm" METHOD="POST">	
	<table>
		<tr>
			<td>
			<font color="#BBBBBB"><div class="copy"><b>Login:</b></div></font>
			</td>
			<td>
			<cfinput type="Text" name="login" size="25" maxlength="25" required="yes"  message="You must enter your password">
			
			</td>
		</tr>
		<tr>
			<td>
			<font color="#BBBBBB"><div class="copy"><b>Password:</b></div></font>
			</td>
			<td>
			<cfinput type="Text" name="password" size="25" maxlength="25" required="yes"  message="You must enter your login">
			</td>
		</tr>
	</table>
	<p>
<INPUT TYPE="SUBMIT" VALUE="Submit Registration">
	</cfform>
</div></font>

			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">









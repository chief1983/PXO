<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			


<cfquery datasource="PXO" name="validate">
	SELECT *
	FROM Users
	WHERE (password = '#FORM.oldpassword#') AND (login = '#FORM.login#')
</cfquery>

<cfif validate.recordcount IS 0>
	<cflocation url="changepass.cfm?message=1">
<cfelse>
	
	<cfif form.newpassword IS form.duppassword>
		<cfquery datasource="PXO" name="changepass">
			Update Users
				Set password = '#newpassword#'
				WHERE login = '#form.login#'
		</cfquery>
		
	<cfelse>
		<cflocation url="changepass.cfm?message=2">
	</cfif>
	<cflocation url="changepass.cfm?message=3">
</cfif>
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





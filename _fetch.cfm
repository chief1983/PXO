<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

<cfif #form.login# IS NOT ''>
<cfquery datasource="PXO" name="get_logins">
	SELECT *
	FROM Users
	WHERE login='#form.login#'
</cfquery>

<cfelseif #form.email# IS NOT ''>
<cfquery datasource="PXO" name="get_logins">
	SELECT *
	FROM Users
	WHERE email='#form.email#'
</cfquery>
<cfelse>
<div class="copy">
	You did not fill out the form.
</div>
</cfif>

<cfif #form.login# IS NOT ''>
	<cfif get_logins.recordcount IS 0>
		<!--- NO LOGIN IN DBASE --->
		<div class="copy">
			No login "<cfoutput>#form.login#</cfoutput>" is registered.
		</div>
	</cfif>
	<cfmail to="#get_logins.email#" from="support@parallaxonline.com" subject="Your Parallax Online Account" server="v-exchange.volition.net">
		Your Parallax Online password is "#get_logins.password#" for the login "#form.login#".
		
		Thank you!
		-Parallax Online Support
	</cfmail>

	<div class="copy">
		Your password has been emailed to <cfoutput>#get_logins.email#</cfoutput>.
	</div>

<cfelseif #form.email# IS NOT ''>
	<cfif get_logins.recordcount IS 0>
		<!--- NO EMAIL IN DBASE --->
		<div class="copy">
			The email "<cfoutput>#form.email#</cfoutput>" has no registered logins.
		</div>
	</cfif>
	
	<cfmail to="#form.email#" from="support@parallaxonline.com" subject="Your Parallax Online Account" server="v-exchange.volition.net">
		Here are the logins and passwords for all of the PXO accounts registered to "#form.email#":
		
		<cfloop query="get_logins">
			#get_logins.login# : #get_logins.password#
			
		</cfloop>
		
		Thank you!
		-Parallax Online Support
	</cfmail>
	
	<div class="copy">
		All account information has been emailed to <cfoutput>#form.email#</cfoutput>.
	</div>
</cfif>
	
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">










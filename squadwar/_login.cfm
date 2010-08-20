<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfif isdefined("form.login") AND isdefined("form.password")>

		<cfquery datasource="PXO" name="get_pxo_info_validated">
			SELECT * 
			FROM Users
			WHERE (login='#form.login#') AND (password='#form.password#') AND (Validated=1)
		</cfquery>


	

		<cfif get_pxo_info_validated.recordcount IS 0>
				<cfquery datasource="PXO" name="get_pxo_info_notvalidated">
					SELECT * 
					FROM Users
					WHERE (login='#form.login#') AND (password='#form.password#') AND (Validated=0)
				</cfquery>		
			<cfif get_pxo_info_notvalidated.recordcount GT 0>
				<cfquery datasource="PXO" name="get_pxo_info_notvalidated_update">
					UPDATE Users
					SET validated = 1
					WHERE (login='#form.login#') AND (password='#form.password#') AND (Validated=0)
				</cfquery>				
			<cfelse>
				<cfset session.loggedin=0>
				<cflocation url="error/error.cfm?message=Invalid%20login%20or%20user%20password.&refer=#refer#">
			</cfif>
		</cfif>
		<cfoutput>#get_pxo_info_validated.recordcount#</cfoutput>
		
		<cfset session.loggedin=1>
		<cfset session.show_challenge=0>
		<cfset session.login=form.login>
		<cfset session.password=form.password>
		<cfset session.adminlastchosen=''>
		<cfquery datasource="PXO" name="get_pxo_info">
			SELECT * 
			FROM Users
			WHERE (login='#form.login#') AND (password='#form.password#')
		</cfquery>		
		<cfloop query="get_pxo_info">
			<cfset session.trackerID=get_pxo_info.trackerID>
			<cfset session.firstname=get_pxo_info.firstname>
			<cfset session.lastname=get_pxo_info.lastname>
			<cfset session.email=get_pxo_info.email>
		</cfloop>
		<cflocation url="index.cfm"> 

<cfelse>
	<cflocation url="error/error.cfm?message=Invalid%20login%20or%20user%20password.&refer=#refer#">
</cfif>

<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfif action IS 'update'>

	<cf_mailtest email='#FORM.Email#'>
	<cfif (trim(form.email) IS NOT '') AND (#EMail_Level# IS NOT 0)>
			<p>
			<font face="arial" color="FF0000"><cfoutput><b>#email_message#</b></cfoutput></font>
			<p>
			Please try again, an error has been detected in your submission.<br> 								
			If you have any further questions, feel free to contact <a href="mailto:squadwar@pxo.net">squadwar@pxo.net</a>.			
	<cfelse>			
			<cfset flag_show_email=1>
			<cfquery datasource="#currentdatasource#">
				UPDATE SWPilots
					SET 
					ICQ = <cfif Trim(form.icq) IS NOT ''>'#form.ICQ#'<cfelse>NULL</cfif>
					,Time_Zone = #form.time_zone#
					,Connection_Type = #form.connection_type#
					,Recruitme=1
					
					<cfif isdefined("form.email")><cfif Trim(form.email) IS NOT ''>,email='#form.email#'<cfelse>,email=NULL<cfset flag_show_email=0></cfif><cfelse>,email=NULL<cfset flag_show_email=0></cfif>
					
					<cfif isdefined("form.show_email") AND (flag_show_email IS 1)><cfif (Trim(form.show_email) IS NOT '') AND (flag_show_email IS 1)>,show_email=1<cfelse>,show_email=0</cfif><cfelse>,show_email=0</cfif>
					
					WHERE (TrackerID = '#form.TrackerID#') AND (Pilot_Name = '#form.Pilot#')
			</cfquery>
		 	<cflocation url="enlist.cfm?action=add">
							
		
	</cfif>		

<cfelseif action IS 'add'>

	<cfquery datasource="#currentdatasource#" name="check_pilot">
		SELECT *
		FROM SWPilots
		WHERE (Pilot_Name = 'form.Pilot') AND (TrackerID = '#form.trackerID#')
	</cfquery>

	<cf_mailtest email='#FORM.Email#'>
	<cfif (trim(form.email) IS NOT '') AND (#EMail_Level# IS NOT 0) AND (check_pilot.recordcount IS 0)>
			<p>
			<font face="arial" color="FF0000"><cfoutput><b>#email_message#</b></cfoutput></font>
			<p>
			Please try again, an error has been detected in your submission.<br> 								
			If you have any further questions, feel free to contact <a href="mailto:squadwar@pxo.net">squadwar@pxo.net</a>.									
	<cfelse>
		<cfset flag_show_email=1>
		<cfquery datasource="#currentdatasource#">
			INSERT INTO SWPilots(
				TrackerID
				,Pilot_Name
				<cfif isdefined("form.icq")><cfif trim(form.icq) IS NOT ''>,ICQ</cfif></cfif>
				,Time_Zone
				,Connection_Type
				,Member_Since
				,Active
				,Recruitme
				,email
				,show_email
			)
			VALUES(
				'#Form.TrackerID#'
				,'#Form.Pilot#'
				<cfif isdefined("form.icq")><cfif trim(form.icq) IS NOT ''>,'#Form.ICQ#'</cfif></cfif>
				,#form.time_zone#
				,#form.connection_type#
				,#Now()#
				,1
				,1
				<cfif isdefined("form.email")><cfif Trim(form.email) IS NOT ''>,'#form.email#'<cfelse>,NULL<cfset flag_show_email=0></cfif><cfelse>,NULL<cfset flag_show_email=0></cfif>					
				<cfif isdefined("form.show_email") AND (flag_show_email IS 1)><cfif (Trim(form.show_email) IS NOT '') AND (flag_show_email IS 1)>,1<cfelse>,0</cfif><cfelse>,0</cfif>
									
				
			)
		</cfquery>
		<cflocation url="enlist.cfm?action=add">			
	</cfif>	
</cfif>

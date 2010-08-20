<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->


<cfquery datasource="#currentdatasource#" name="check_entry_nodes">
	SELECT *
	FROM SWSectors
	WHERE (SectorSquad=#session.squadid#) AND (SWSectors.League_ID = #leagueID#)
	<!--- WHERE SectorSquad=0 --->
</cfquery>

<cfif (check_entry_nodes.recordcount IS 0) AND (session.challenging IS 1)>
<!--- --->

<cfoutput>#DateDiff('s', CreateDateTime(1970, 1, 1, 0, 0, 0), Now())#</cfoutput>

									<cfquery name="check_sector" datasource="#currentdatasource#">
										SELECT *
										FROM SWSectors
										WHERE (SWSectors_ID = #form.sector#) AND (SectorSquad = 0)
									</cfquery>
											
									<cfif check_sector.recordcount GT 0>
									
									<cfquery datasource="#currentdatasource#">
										UPDATE SWSectors
											SET	SectorSquad = #session.squadid#,
												SectorTime = #Evaluate(DateDiff('s', CreateDateTime(1970, 1, 1, 0, 0, 0), Now()) + 21600)# 
											WHERE SWSectors_ID = #form.sector#
									</cfquery>

									<cfelse>
								
										<cfset message='Someone has already taken this sector.'>
										<cfset session.challenging=0>
										<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
										</cfif>
									
									<cfset message='You have successfully gained control of this sector.'>
									<cfset session.challenging=0>
									<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
<!--- --->
<cfelse>
	<cfset message='Dont be lame and try to take more than one sector.'>
	<cfset session.challenging=0>
	<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
</cfif>


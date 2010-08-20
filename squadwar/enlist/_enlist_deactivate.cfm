<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

	<cfquery datasource="#currentdatasource#">
		UPDATE SWPilots
		SET
			Recruitme = 0 
		WHERE (TrackerID = '#form.TrackerID#') AND (Pilot_Name = '#form.Pilot#')
	</cfquery>
	<cflocation url="enlist.cfm?action=add">

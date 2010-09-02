<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfquery datasource="squadwar" name="get_matches">	
	DELETE FROM SWMatches
	WHERE SWcode = '#id#'
</cfquery>
<cfquery datasource="squadwar" name="get_matches">
	DELETE FROM SWMatches_info
	WHERE SWcode = '#id#'
</cfquery>
<cflocation url="pendingmatches.cfm">

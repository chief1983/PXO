<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery datasource="squadwar" name="count_active_squads">
	SELECT SWSquad_SquadID
	FROM SWSquads_Leagues
	GROUP BY SWSquad_SquadID
</cfquery>

<cfoutput>#count_active_squads.recordcount#</cfoutput>

</body>
</html>

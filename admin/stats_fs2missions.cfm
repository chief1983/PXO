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
<cfquery datasource="PXO" name="sum_fs2_missionsflown">
	SELECT SUM(MissionsFlown) AS totalmissionsflown
	FROM FreeSpace2Full
	WHERE MissionsFlown > 50
</cfquery>


<cfoutput>#sum_fs2_missionsflown.totalmissionsflown#</cfoutput>

</body>
</html>

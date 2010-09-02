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
					<cfquery datasource="pxoizlame" name="count_pxo_users" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
						SELECT ID
						FROM Freespace2Full
					</cfquery>

<cfoutput query="count_pxo_users">#count_pxo_users.ID#<br></cfoutput>
					
</body>
</html>

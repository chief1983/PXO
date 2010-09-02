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

		<CFQUERY NAME="fsscores" DATASOURCE="PXO">
		SELECT      Score
		FROM         Freespace 
		ORDER BY  Score DESC
		</CFQUERY>


<cfset lastrow=1100>
<cfif fsscores.recordcount LT 1100><cfset lastrow=fsscores.recordcount></cfif>

<cfloop query="fsscores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
	<cfset application.fsscoresmax=fsscores.score>
</cfloop>

<cfoutput>#application.fsscoresmax#</cfoutput>

</body>
</html>

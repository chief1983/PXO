<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

		<CFQUERY NAME="d3scores" DATASOURCE="PXO">
		SELECT     	Suicides
		FROM         Descent3 
		ORDER BY Suicides DESC
		</CFQUERY>

<cfset lastrow=2150>
<cfif d3scores.recordcount LT 2150><cfset lastrow=d3scores.recordcount></cfif>

<cfloop query="d3scores" startrow="2149" endrow="2150">
	<cfset application.d3destructsmax=#Suicides#>
</cfloop>

</body>
</html>




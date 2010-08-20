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
		SELECT     	TotalKills
		FROM         Descent3 
		ORDER BY TotalKills DESC
		</CFQUERY>

<cfset lastrow=2150>
<cfif d3scores.recordcount LT 2150><cfset lastrow=d3scores.recordcount></cfif>

<cfloop query="d3scores" startrow="#Evaluate(lastrow-1)#" endrow="#lastrow#">
	<cfset application.d3killsmax=d3scores.TotalKills>
</cfloop>

<cfoutput>#application.d3killsmax#,#d3scores.recordcount#</cfoutput>

</body>
</html>



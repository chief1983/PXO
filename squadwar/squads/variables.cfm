<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfset relativepath='../'>
<cfif NOT isdefined("session.loggedin")>
	<cflocation url="#relativepath#login.cfm">
<cfelseif session.loggedin IS 0>
	<cflocation url="#relativepath#login.cfm">
</cfif>


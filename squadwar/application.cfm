<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfapplication
	name="squadwarfull"
	clientmanagement="yes"
	sessionmanagement="yes" 
	sessiontimeout=#CreateTimeSpan(0, 0, 
      45, 0)#
	>
<cfif not isdefined("session.loggedin")>
	<cfset session.loggedin=0>
	<!--- Try to set a cookie for testing later --->
	<cfcookie name="isOn" value="testing">
</cfif>


<cfset maindatasource='squadwar'>
<cfset accountsdatasource='squadwar'>
<cfset pxodatasource='PXO'>
<cfset currentdatasource=maindatasource>

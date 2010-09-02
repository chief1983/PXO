<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<html>
<body>
<cfif isdefined("session.loggedin")>
	<cfif session.loggedin>


	
		Welcome back <cfoutput>#session.login#, #session.trackerID#</cfoutput>.
	
		<p>							
										
		<ul>
			<li><a href="enlist.cfm">Sign a pilot up for recruitment</a>
			<li><a href="deactivate.cfm">Remove a pilot from the recruitment list</a>
			<li><a href="../recruits/index.cfm">View the Recruitment List</a>
			<li><a href="../index.cfm">Main Page</a>
			<!---
			<li><a href="joinsquad.cfm">Join an existing Squad</a>
			<li><a href="createsquad.cfm">Create a new Squad</a>
			--->
		</ul>									

	
	
	
	
	
	
	
	
	
	
	
	
	
		<cfform action="_logout.cfm" method="POST" enablecab="no" name="logout">
		<input type="hidden" name="refer" value="register/index.cfm">
		<input type="hidden" name="logout" value="logout">
		<input type="submit" value="Logout">
		</cfform>
	<cfelse>
		<cfset session.loggedin=0>
	</cfif>
<cfelse>
	<cfset session.loggedin=0>
</cfif>


<cfif NOT session.loggedin>
		<div class="copy">
		The full retail version of FreeSpace 2 includes support for Squad War. Squad War enables multiplayer squadrons to challenge other squadrons for control of territory in the FreeSpace 2 universe. Squad War is an organized form of team vs. team multiplayer gameplay. PXO servers will maintain a list of registered squadrons that will be managed by users through a web page. Squadrons will fight it out via team vs. team missions for control of star systems. The PXO database will keep track of which squadron controls which star system. 
		<p>
		</div>
		<b>You are not currently logged in:</b><p>
		
	Enter your PXO login and password to log in.
	<p>
				<div class="copy">
					<cfform action="_login.cfm" method="POST" enablecab="No" name="login">
						You need to have cookies enabled in order to properly access this site.
						<p>
						<b>Login:</b><br>
						<cfinput type="text" name="login" message="You must enter your login." required="yes" size="20" maxlength="50"><br>
						<b>Password:</b><br>
						<cfinput type="password" name="password" message="You must enter your password." required="yes" size="20" maxlength="50"><br>
						<br>
						<input type="hidden" name="refer" value="register/index.cfm">
						<input type="submit" value="Login">
					</cfform>
				</div>
	<p>
	If you do not have a PXO login, you can create one on our <a href="newaccount.cfm">new accounts page</a>.



</cfif>
































</body>
</html>

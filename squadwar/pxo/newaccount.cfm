<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Login">

<cfinclude template="#relativepath#doc_top.cfm">

	<cfinclude template="#relativepath#menu/pxo_notloggedin.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
		<br>		
		<center>
					
			<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>

<div class="copy">
<b>IMPORTANT NOTE:<BR></b>
	<b>A working email address is required for PXO registration.</b><p>
	Without it a working email address, you will be unable to complete your registration.
	Your email address will <B>not</b> be given to solicitors, bulk emailers or anyone else.
	<p>
	You may receive email from PXO announcing game updates, contests, or special events.	
	<p>
	To improve your Internet play, please make sure you're using the latest version of your game.  To do so, hit the
	"Update" button in your Launcher.
	<p>
	<B>NOTE:</b>  Parallax Online is not a standalone gaming service.  It is designed to work with Volition/Outrage
	games like 
	<A HREF="http://www.volition-inc.com/fs/">Descent: FreeSpace - The Great War</a>, 
	<a href="http://www.volition-inc.com/st">Descent: FreeSpace - Silent Threat</a>,
	<A HREF="http://www.outrage.com/descent3.htm">Descent 3 Demo</A>,
	<A HREF="http://www.outrage.com/descent3.htm">Descent 3</A>,
	<a href="http://www.freespace2.com">FreeSpace 2 Demo</a>,
	and <a href="http://www.freespace2.com">FreeSpace 2</a>
	 for your PC.  
	If you created a PXO account for one
	of these games, you do not need to register again to play the other.
	<P>

	<p>Your login name is simply a name used to identify your PXO account. It does not need to be the same
	as your pilot's callsign in FreeSpace/Descent 3.
	<p>If you receive an error that says that your requested login already exists
	and you've never registered before, it means that someone else has already chosen that login.  To fix this, select
	a different login.
	<p>

	<div class="title">Fill out the form below:</div>

	<CFFORM ACTION="_accounts.cfm" METHOD="POST">
	<P>
	
	<table>
		<tr>
			<td align="right">
				<div class="copy"><b>First Name:</b></div>
			</td>
			<td align="left">
				<div class="copy"><cfinput type="Text" name="firstname" size="25" maxlength="25" required="yes"  message="You must enter your First Name"></div>
			</td>
		</tr>
		<tr>
			<td align="right">
				<div class="copy"><b>Last Name:</b></div>
			</td>
			<td align="left"><cfINPUT TYPE="text" SIZE="25" NAME="lastname" MAXLENGTH="25" required="yes"  message="You must enter your Last Name">
			</td>
		</tr>
		<tr>
			<td align="right">
				<div class="copy"><b>Choose a login name:</b></div>
			</td>
			<td align="left">
				<CFINPUT TYPE="text" SIZE="19" NAME="login" MAXLENGTH="32" required="yes" message="You must enter your desired Login name">
			</td>
		</tr>		
		<tr>
			<td align="right">
				<div class="copy"><b>Choose a password:</b></div>
			</td>
			<td align="left">
				<cfINPUT TYPE="password" SIZE="16" NAME="password1" MAXLENGTH="16" required="yes" message="You must enter a password">
			</td>
		</tr>			
		<tr>
			<td align="right">
				<div class="copy"><b>Re-Enter your password:</b></div>
			</td>
			<td align="left">
				<cfINPUT TYPE="password" SIZE="16" NAME="password2" MAXLENGTH="16" required="yes" message="You must enter a password">
			</td>
		</tr>			
		<tr>
			<td align="right">
				<div class="copy"><b>Email Address:</b></div>
			</td>
			<td align="left">
				<cfINPUT TYPE="text" SIZE="40" NAME="email" MAXLENGTH="100" required="yes" message="You must enter a valid email address.">
			</td>
		</tr>					
	</table>
	<INPUT TYPE="SUBMIT" VALUE="Submit Registration">
	<P>
	</cfform>
	</div>			
			

			</td></tr></table>			
			
		</center>				
				


								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

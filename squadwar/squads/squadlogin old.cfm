<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->



	<cfquery name="get_squad" datasource="#currentdatasource#">
		SELECT *
		FROM SWSquads 
		WHERE (squadid=#id#) 
	</cfquery>

<div class="newsitemtitle"><cfoutput query="get_squad">#SquadName#</cfoutput> Squad Login</div>


			<div class="copy">
				<cfform action="squadlogin_validate.cfm?id=#id#&leagueid=#leagueid#" method="POST" enablecab="no" name="login">
					<b>Password:</b><br>
					<cfinput type="password" name="password" message="You must enter your password." required="yes" size="20" maxlength="50"><br>
					<br>
					<input type="submit" value="Login">
				</cfform>
			</div>





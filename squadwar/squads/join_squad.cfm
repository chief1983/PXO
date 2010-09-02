<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
	<cfquery name="get_squad" datasource="#currentdatasource#">
		SELECT *
		FROM SWSquads 
		WHERE (squadid=#id#) 
	</cfquery>

<cfif get_squad.recordcount IS 0>
	This squad no longer exists.
<cfelse>
<div class="newsitemtitle">Join Squad: <cfoutput query="get_squad">#SquadName#</cfoutput></div>


			<div class="copy">
				<cfform action="_join_squad.cfm?id=#id#" method="POST" enablecab="No" name="login">
					<cfoutput query="get_squad">
						<b>#SquadName#' Join Password:</b><br>
						<cfinput type="password" name="join_password" message="You must enter your password." required="yes" size="20" maxlength="50"><br>
						<b>PXO Login:</b><br>
						<cfinput type="text" name="pxo_login" message="You must enter your PXO login." required="yes" size="20" maxlength="50"><br>
						<b>PXO Password:</b><br>
						<cfinput type="password" name="PXO_password" message="You must enter your PXO password." required="yes" size="20" maxlength="50"><br>
						<br>
						<input type="hidden" name="squadid" value="#id#">
						<input type="hidden" name="refer" value="register/index.cfm">
						<input type="submit" value="Join This Squad">					

					</cfoutput>
				</cfform>
			</div>
</cfif>




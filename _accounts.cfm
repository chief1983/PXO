<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">Account Creation:</div></b></font>
<p>
				
							<div class="copy">
							
							<cf_mailtest email='#FORM.Email#'>

							<cfif #EMail_Level# IS 0>
									
									<cfquery datasource="PXO" name="check_login">
										SELECT login
										FROM Users
										WHERE login = '#FORM.login#'
									</cfquery>
															
									<cfif check_login.recordcount IS NOT 0>									
										That login already exists in the <b>PXO</b> database.
										<p>
										Please return to the form and try again.										
									</cfif>							
									
									<cfquery datasource="PXO" name="check_email">
										SELECT email
										FROM Users
										WHERE email = '#form.email#'
									</cfquery>
									
									<cfif check_email.recordcount IS NOT 0>									
										That email address already exists in the <b>PXO</b> database.
										<p>
										Please return to the form and try again.										
									</cfif>			
									
									<cfset id=''>
									<cfset index_check=1>
									<cfloop condition="index_check IS 1">
										<cfset seed=Year(Now()) & Month(Now()) & Day(Now()) & Hour(Now()) & Minute(Now()) & Second(Now())>
										<CFSET r=Randomize(seed)>
										<cfset id='#RandRange(0,999999999)#'>								
										<cfquery datasource="PXO" name="check_trackerID">
											SELECT TrackerID
											FROM Users
											WHERE TrackerID = '#id#'
										</cfquery>
										<cfif check_trackerID.recordcount IS 0><cfset index_check=0></cfif>
									</cfloop>


							


									<cfif (check_login.recordcount IS 0) AND (check_email.recordcount IS 0)>

										<cfquery datasource="PXO">
											INSERT INTO Users(
												TrackerID
											<cfif isdefined("FORM.login")><cfif Trim("FORM.login") IS NOT ''>,login</cfif></cfif>
												<cfif isdefined("FORM.firstname")><cfif Trim("FORM.firstname") IS NOT ''>,firstname</cfif></cfif>
												<cfif isdefined("FORM.lastname")><cfif Trim("FORM.lastname") IS NOT ''>,lastname</cfif></cfif>
												<cfif isdefined("FORM.email")><cfif Trim("FORM.email") IS NOT ''>,email</cfif></cfif>
												<cfif isdefined("FORM.password1")><cfif Trim("FORM.password1") IS NOT ''>,password</cfif></cfif>
												,datecreated										
<!---												<cfif isdefined("FORM.privmail")><cfif Trim("FORM.privmail") IS NOT ''>,showemail</cfif></cfif>
												<cfif isdefined("FORM.privname")><cfif Trim("FORM.privname") IS NOT ''>,showrealname</cfif></cfif>--->
												)
												VALUES(
												'#id#'
												<cfif isdefined("FORM.login")><cfif Trim("FORM.login") IS NOT ''>,'#form.login#'</cfif></cfif>
												<cfif isdefined("FORM.firstname")><cfif Trim("FORM.firstname") IS NOT ''>,'#form.firstname#'</cfif></cfif>
												<cfif isdefined("FORM.lastname")><cfif Trim("FORM.lastname") IS NOT ''>,'#form.lastname#'</cfif></cfif>
												<cfif isdefined("FORM.email")><cfif Trim("FORM.email") IS NOT ''>,'#form.email#'</cfif></cfif>
												<cfif isdefined("FORM.password1")><cfif Trim("FORM.password1") IS NOT ''>,'#form.password1#'</cfif></cfif>
												,#Now()#
<!---												<cfif isdefined("FORM.privmail")><cfif Trim("FORM.privmail") IS NOT ''>,#FORM.privmail#</cfif></cfif>
												<cfif isdefined("FORM.privname")><cfif Trim("FORM.privname") IS NOT ''>,#FORM.privname#</cfif></cfif>--->
												)
										</cfquery>										

		
										Step 1 complete!<P>
										<P>
										<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="31" HEIGHT="20" BORDER="0">
										<B><font size="+1" color="White">Check your email.</FONT></B><BR>
										<P>
										It may take several minutes for the email to arrive.  Follow the instructions in the email to complete your
										PXO Registration!
										<P><BR>
										If you do not receive the email within one hour, please contact us at:<BR>
										<A HREF="mailto:support@parallaxonline.com">support@parallaxonline.com</A>
							
<cfmail to="#form.email#" from="support@parallaxonline.com" subject="Your Parallax Online Account" server="v-exchange.volition.net">
										
Your Parallax Online Registration has been received.

=======================================
Your PXO Tracker ID number is: #id#
Your PXO Login is: #FORM.Login#
Your password is : #FORM.password1#
=======================================

You must now validate your PXO Account, which you can do by clicking on this URL:

http://www.pxo.net/validate.cfm?id=#id#
								
</cfmail>

<!---
Or you can do it manually by going to:
http://www.parallaxonline.com/validate.html
If you have any questions or problems, please email help@parallaxonline.com
--->									
									

										</cfif>	
						
							<cfelse>
									<p>
									<font face="arial" color="FF0000"><cfoutput><b>#email_message#</b></cfoutput></font>
									<p>
									You have entered an invalid email address.  Please try again.<br> 								
									If you have any further questions, feel free to contact <a href="mailto:support@pxo.net">support@pxo.net</a>.									
								
							</cfif>

						
							</div>							
		
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





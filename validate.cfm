<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<font color="white"><b><div class="newsitemtitle">Validating your account:</div></b></font>
<p>

<font color="#BBBBBB"><div class="copy">
								<cfif isdefined("id")>
									
									<cfquery datasource="PXO" name="check_trackerid">
										SELECT TrackerID
										FROM Users
										WHERE TrackerID = '#id#'
									</cfquery>
									
									<cfif (check_trackerid.recordcount IS 0)>
										The link provided failed to properly validate your account.
									</cfif>
									<cfif (check_trackerid.recordcount GT 0)>
										<cfquery datasource="PXO">	
											UPDATE USERS
											SET Validated = 1
											WHERE TrackerID = '#id#'
										</cfquery>

<b>Your PXO Account is now validated!</b></font><br><br><br><hr><font color="#FFFFFF"><b>To play Descent 3:</b></font><br><br><P><B><font size="+1" color="White">Configure Descent 3</FONT></B><BR><P><FONT COLOR="BBBBBB"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Create a PXO login.  If you have a login from FreeSpace, you do not need to create another.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Start the Descent 3 Demo.  From the launcher, hit Play.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Select or create a pilot.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">From the main menu choose Multiplayer.<br><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">On the Choose Connection Type dialog, select Parallax Online.<br><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">The game will now connect to PXO.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">When connected, the Login dialog will come up.  Enter your Login ID and Password.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">The game will now log you in.  If your login is successful, you will come up in the chat screen.<br><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">To see a list of games, click on Go To Games in the lower-right corner of the chat screen.<br><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">To join a game, select from the list of games and click on Join Selected.<br><p><hr><font color="#FFFFFF"><b>To play FreeSpace:</b></font><br><br>You simply have to configure FreeSpace with your Account info.<B>You only need to do this once!</b><P><B><font size="+1" color="White">Configure FreeSpace</FONT></B><BR><P><FONT COLOR="BBBBBB"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Start FreeSpace.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">From the Flight Deck hit F2 to go to Options.<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Go to the Multi tab and type your Login Name and Password under "Parallax Online".<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif">Make sure the Parallax Online toggle button is <B>ON</b>.<P><B>You're ready to play!</b> As long as you leave the PXO toggle on, all multiplayer pilots you create will	connect to PXO when you enter the Ready Room.<P><hr><p>You may register as many pilots as you like under this single PXO account.  Each one will have his/her flight statistics stored	independently on our servers. <B>Have fun!</b><P>More online help is available from the main PXO Chat screen inside the game.<BR>Again, if you have any technical problems using PXO, contact:<BR><A HREF="mailto:support@parallaxonline.com">support@parallaxonline.com</a>							
										
										
									</cfif>
								<cfelse>
									The link provided failed to properly validate your account.								
								</cfif>														

										<p>
										If you have any further questions, feel free to contact <a href="mailto:support@parallaxonline.com">support@parallaxonline.com</a>.	

</div></font>

<br>
<br>
<br>
<br>			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_accounts.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">





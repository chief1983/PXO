<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<div class="newsitemtitle">FreeSpace PXO FAQ</div>
<div class="copy">
<p>
<ul>
	<li><A HREF="#faq50">How do I create a FreeSpace pilot using PXO?</a><BR>
	<li><A HREF="#faq51">FreeSpace Internet games are slow and unreliable.  What can I do to improve this?</a><BR>
	<li><A HREF="#faq52">How many FreeSpace pilots can I use with my PXO account?</a><BR>
	<li><A HREF="#faq53">How are FreeSpace game servers sorted in PXO?</a><BR>
	<li><A HREF="#faq54">How do I start a Standalone (dedicated) server using PXO?</a><BR>
	<li><A HREF="#faq55">How do I set up a microphone for real-time voice in FreeSpace?</a><BR>
	<li><A HREF="#faq56">Why do my real-time voice transmissions sound so bad?</a><BR>
	<li><A HREF="#faq57">My computer locks up when trying to use the microphone during tests or missions.</a><BR>
	<li><A HREF="#faq58">I have a LAN set up, but I can't see any of the machines on it.</a><BR>
	<li><A HREF="#faq59">Freespace crashes when I try to join a game already in progress.</a><BR>
	<li><A HREF="#faq60">My stats are incorrect. I was playing on PXO and now they're drastically different than before I started playing.</a><BR>
	<li><A HREF="#faq61">When are you planing on wiping the pilot records?</a><BR>
	<li><A HREF="#faq63">I try to update but I get the errors,  <I>Verify of New File Failed.</I> or <I>An error occurred during the move process.</I> or <I>Old File not found<</i></a><BR>
	<li><A HREF="#faq64">Why can't I see any game servers? I am running version 1.03.01 and the game runs fine on my system, but when I try to play multi-player it doesn't give me any servers. I can talk and try to create but no servers.</a><BR>
	<li><A HREF="#faq65">When playing over the Internet I can't fire or anything because there's so much lag.  Is there anything I can do?</a><BR>
	<li><A HREF="#faq66">During multiplay, my ship spins around uncontrollably.  My joystick is calibrated and doesn't behave this way in single player.</a><BR>
</ul>

<P>
	<B>Answers to FreeSpace PXO Questions</B><BR>
	<P>
	<A NAME="faq50"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How do I create a FreeSpace pilot using PXO?<BR>
	A:</b></font>
	Simply create a new multiplayer pilot in FreeSpace.  If the "Parallax Online" button is on under Options/Multi, games
	played over PXO will automatically be tracked, and the statistics tallied under that pilot's name.

	<P>
	<A NAME="faq51"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: FreeSpace Internet games are slow and unreliable.  What can I do to improve this?<BR>
	A:</b></font>
	For starters, get the 1.01 update for FreeSpace (hit the "Update FreeSpace" button in the FS Launcher).
	This update dramatically increases the playability of FreeSpace over the Internet.  You should also make
	sure you have the Object Update setting in Options/Multi set according to your connection speed.  Here is
	some good rules of thumb:<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	28.8K modems = LOW Object Update setting<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	56K modems = MEDIUM Object Update setting<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	ISDN/faster = HIGH Object Update setting<P>
	It's <B>very</b> important to use the right setting here.

	<P>
	<A NAME="faq52"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How many FreeSpace pilots can I use with my PXO account?<BR>
	A:</b></font>
	There is currently no limit to the number of pilots you can use under one PXO account.  However, if a pilot goes
	more than 6 months with no PXO missions flown, it will be deleted from the database.

	<P>
	<A NAME="faq53"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How are FreeSpace game servers sorted in PXO?<BR>
	A:</b></font>
	Game servers must be assigned to a "channel" in PXO.  This can be one of the public channels, or a private one
	created by the game server operator.  To see the game servers currently running in a particular channel, join
	the channel and hit the "Games" button.	

	<P>
	<A NAME="faq54"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How do I start a Standalone (dedicated) server using PXO?<BR>
	A:</b></font>
	In your FreeSpace \data directory there's a file called "std.cfg".  This config file contains the line
	"+pxo Lobby_20".  This means that the Standalone server will be assigned to the "Lobby_20" channel.  Simply
	change that line to make your Standalone game server appear in another channel.  If the channel name you specify
	isn't one of the default channels, a private one will be created for it.  Once you have the std.cfg file configured,
	you simply need to run the standalone by typing "fs -standalone".  More info on Standalone FreeSpace servers can
	be found in the README.TXT that comes with FreeSpace.

	<P>
	<A NAME="faq55"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How do I set up a microphone for real-time voice in FreeSpace?<BR>
	A:</b></font>
	The README.TXT that comes with FreeSpace gives detailed instructions on how to set up your microphone.
	
	<P>
	<A NAME="faq56"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: Why do my real-time voice transmissions sound so bad?<BR>
	A:</b></font>
	You can do a number of things to make your voice transmissions better. <BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Speak clearly!  Enunciate your words more than usual.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Make sure your Windows microphone input volume is not too high.  25-50% is ideal.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Do not put the mic too close to your mouth.  6-10 inches is a good distance.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Use the Options\Multi\Voice voice test in FreeSpace.  This is very important, and will<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	keep you from "peaking" too much while speaking.  If it sounds good on the test screen,<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	it should be fine in the game.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	If you have a fast Internet connection, play on game servers that use the highest<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	Voice Quality setting.  This can make a big difference.<BR>

	<P>
	<A NAME="faq57"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: My computer locks up when trying to use the microphone during tests or missions.<BR>
	A:</b></font>
	This was a known bug in versions prior to 1.02; check to make 
	sure you've upgraded to the latest version by checking the version
	number in the lower right of your flight deck.  If it's anything
	other than 1.03.01, you should download the latest update.

	<P>
	<A NAME="faq58"></a>	
	<FONT COLOR="EEEEEE">
	<B>Q: I have a LAN set up, but I can't see any of the machines on it.<BR>
	A:</b></font>
	Make sure the IPs of all machines that may act as a server are 
	contained in the IP list in the Multi options screen.
	Also, be sure that the ParallaxOnline option is turned off.  
	Turning on local broadcast will allow you to see servers on 
	your local subnet.<BR>

	<P>
	<A NAME="faq59"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: Freespace crashes when I try to join a game already in progress.<BR>
	A:</b></font> Unfortunately, there are still several problems with in-game
	joining that we are continuing to track down.  We hope to have 
	all of these fixed for the next patch, so you may have to wait 
	until then to see this problems completely disappear.<BR>

	<P>
	<A NAME="faq60"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: My stats are incorrect. I was playing on PXO and now they're
	drastically different than before I started playing.<BR>
	A:</b></font>
	This is a known bug that we are currently attempting to 
	track down.<P>

	Also, please note that we will be wiping stats on PXO sometime 
	in the near future so all pilots are going to lose their stats 
	soon.  We are doing the wipe because of the stats bugs and 
	because of mission padding where people create outrageous 
	missions and pad their stats.<BR>

	<P>
	<A NAME="faq61"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: When are you planing on wiping the pilot records?<BR>
	A:</b></font>
	When we get the stats problems taken care of.  The wipe will
	hopefully coincide with the 1.04 release which will be in a couple
	of weeks.<BR>
	
	<P>
	<A NAME="faq63"></a>
	<FONT COLOR="EEEEEE">	
	<B>Q: I try to update but I get the errors, <i>Verify of New File Failed</i> or <i>An error
              occurred during the move process</i> or <i>Old File not found</i><BR>
	A:</b></font>
	You should be sure that you have enough disk space for the patch.   
	Going from 1.0 to 1.03, you should be sure that you have around 
	20M free.  The patch must produce the new file, then copy over 
	the old one.<P>

	If you have anything less than about 5M free, then this could 
	be your problem.<P>

	If you are unable to patch or install after numerous tries, then
	do the following, which should correct the problem:<P>

	1) Save your players folder somewhere safe.<BR>
	2) Uninstall FreeSpace completely, being sure that the folder is completely
	removed.<BR>
	3) Right click "My Computer".<BR>
	4) Choose Properties/Performance/File System/CD Rom.<BR>
	5) Change your read ahead speed from quad to triple.<BR>
	6) Reboot.<BR>
	7) Reinstall FreeSpace.<P>

	Then:<P>

	8) Run FreeSpace to store registry information.<BR>
	9) Update from the FreeSpace launcher keeping in mind the launcher bug
	where the progess bar looks done only seconds into the process.  Be sure to
	wait it out once the process has started.<BR>

	<P>
	<A NAME="faq64"></a>
	<FONT COLOR="EEEEEE">	
	<B>Q: Why can't I see the servers? I am running version 1.03.01 the game runs
	fine on my system but when I try to play multi player it doesn't give  me
	any servers. I can talk and try to create but no servers.<BR>
	A:</b></font>		
	First, verify that you are indeed running version 1.03.01. Look in 
	the lower right corner ot the flight deck (main game screen) and be
	sure that the number there is 1.03.01.  Also, there are still some
	issues with proxy servers not being able to host/see games all the time
	that we're still investigating.<BR>
	
	<P>
	<A NAME="faq65"></a>
	<FONT COLOR="EEEEEE">	
	<B>Q: When playing over the Internet I can't fire or anything 
	because there's so much lag. Is there anything I can do?<BR>
	A:</b></font> There are several reasons for the lag:<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	There are bad ping times to your server.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	A slow server connection to the Internet.  Servers running on a 56K	modem <BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	(or even a cable modem) can only reliably host 1 other person.   If they host more than<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	that, the gameplay will dramatically suffer for *all* clients involved.<P>

	Note that the 1.03 patch fixes many of these problems, and that if
	you're still having lag trouble, the problem is most likely one of
	the two things above.<BR>

	<P>
	<A NAME="faq66"></a>	
	<FONT COLOR="EEEEEE">	
	<B>Q: During multiplay, my ship spins around uncontrollably.  My
	joystick is calibrated and doesn't behave this way in single player.<BR>
	A:</b></font>You most likely are having a conflict between your modem and your
	joystick.  One suggestion is to go to the "Game Controllers" control panel,
	select your joystick, choose the advanced tab, and turn off "poll with
	Interrupts enabled".  Doing so might fix your problem.  This problem only
	affects analog joysticks.<BR>

	<P>	
	</div>
	

	
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_support.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">



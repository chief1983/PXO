<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

<div class="newsitemtitle">General PXO FAQ:</div>



<div class="copy">
	<ul>
		<li><A HREF="#faq1">What do I need to use PXO?</a><BR>
		<li><A HREF="#faq2">What does PXO do for me?</a><BR>
		<li><A HREF="#faq3">What does it cost to use PXO?</a><BR>
		<li><A HREF="#faq4">I registered but I can't play.  What's going on?</a><BR>
		<li><A HREF="#faq5">I get a "Failed to connect to PXO" popup.  What does that mean?</a><BR>
		<li><A HREF="#faq6">How do I see current player statistics & rankings?</a><BR>
		<li><A HREF="#faq7">Why is my chat name different than my player's name?</a><BR>
		<li><A HREF="#faq8">My registration fails saying my email isn't valid.</a><BR>
		<li><A HREF="#faq9">I tried to register, but I get an error message saying I'm already registered.</a><BR>
		<li><A HREF="#faq10">I tried to play Freespace via Internet, but it says that I have to login my ISP.</a><BR>
		<li><A HREF="#faq11">I registered, but I never got a login or password.</a><BR>
		<li><A HREF="#faq12">In the PXO Chat screen, my mouse is extremely slow, and my keypresses are slow to respond.</a><BR>
		<li><A HREF="#faq13">When I try to play on PXO, it gives me the error, <I>You must define your connection speed.  Please run the laucher, hit the setup button, and go to the network tab and select your speed.</i>	Except, I can't set my connection speed!</a><BR>
	</ul>

<p>
	<B>Answers to General PXO Questions</B><BR>
	<P>
	<A NAME="faq1"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: What do I need to use PXO?<BR>
	A:</b></font>
	You must first have an installed copy of a game supported by PXO.  Currently, PXO supports
	<A HREF="http://www.volition-inc.com/fs">Descent: FreeSpace</a>, <a href="http://www.outrage.com">Descent 3</a>, <a href="http://www.outrage.com">Descent 3 Demo</a>, and <a href="http://www.freespace2.com">FreeSpace 2 Demo</a> for the PC.   The only other thing
	you need is a valid email address.  Once you have these two things, you and your friends simply need to
	register with <A HREF="accounts.cfm">PXO</a>, and you'll be ready to play on the Internet!

	<P>
	<A NAME="faq2"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: What does PXO do for me?<BR>
	A:</b></font>
	Parallax Online is simply designed to make Internet games easier to set-up and play.  PXO provides the
	following features:<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	In-game chat rooms with multiple public/private channels, private messaging,<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	and "find player" feature.
	<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Sorted lists of channel-specific game servers, with ping times so you can find the best<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="18" HEIGHT="10" BORDER="0">
	server for your	location.
	<BR><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	<a href="rankings.cfm">Automatic statistics tracking</a>.  See how you measure up to other PXO players!

	<P>
	<A NAME="faq3"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: What does it cost to use PXO?<BR>
	A:</b></font>
	Nothing.  PXO is a free service operated by
	<A HREF="http://www.volition-inc.com">Volition, Inc.</a> and 
	<A HREF="http://www.outrage.com">Outrage Entertainment</a>.

	<P>
	<A NAME="faq4"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: I registered but I can't play.  What's going on?<BR>
	A:</b></font>
	You need to "validate" your account before you can use it to play.  The automatic email you were sent should
	explain what you need to do to validate your registration and start playing.  If you have validated your account
	and are still unable to play, <A HREF="mailto:support@pxo.net">contact us</a>.

	<P>
	<A NAME="faq5"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: I get a "Failed to connect to PXO" popup.  What does that mean?<BR>
	A:</b></font>
	This means your game could not connect to the PXO servers.  You should verify that your ISP/Internet connection
	is correctly configured and is "live".  If you still get this message, odds are the servers are down temporarily
	for maintenance.  Wait a short while and try again.

	<P>
	<A NAME="faq6"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: How do I see current player statistics & rankings?<BR>
	A:</b></font>
	Hit the "Player Ranking" button in the PXO Chat screen, or visit the
	<A HREF="rankings.cfm">PXO Rankings</a> pages.

	<P>
	<A NAME="faq7"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: Why is my chat name different than my player's name?<BR>
	A:</b></font>
	Unique player names are not enforced on PXO.  If the chat server finds another player online using the same name
	you are, it will append a single-digit number to the end of your chat name.  Tracking of statistics will not
	be effected.

	<P>
	<A NAME="faq8"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: My registration fails saying my email isn't valid.<BR>
	A:</b></font>
	This is a slightly misleading.  This error is also given (incorrectly) when data in other fields you have
	input are also invalid.<BR>

	<P>
	<A NAME="faq9"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: I tried to register, but I get an error message saying I'm already registered.<BR>
	A:</b></font>
	This generally means someone else has chosen the login that you requested.  The solution is to
	choose a different login.


	<P>
	<A NAME="faq10"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: I tried to play Freespace via Internet, but it says that I have to login my ISP.
<BR>
	A:</b></font>
	Change your network connection type to "direct/LAN connection" in the network setup portion of the launcher.<P>

	Be sure that you are logged in when you start FreeSpace. <BR>
	<i><b>Note:</b> This is a problem that primarily affects AOL users.</i><RB>

	<P>
	<A NAME="faq11"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: I registered, but I never got a login or password<BR>
	A:</b></font>
	Many people confuse the Interplay product registration that appears when you first install the game with PXO's
	pilot registration system.  In order to register a PXO pilot, go to: <BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="30" HEIGHT="15" BORDER="0">
	<A HREF=accounts.cfm>www.pxo.net</a><BR>


	<P>
	<A NAME="faq12"></a>
	<FONT COLOR="EEEEEE">
	<B>Q: In the PXO Chat screen, my mouse is extremely slow, and my
	keypresses are slow to respond.<BR>
	A:</b></font>
	You should make sure you've upgraded to the latest version of Freespace.  If that fails to work, upgrade to
	Winsock 2.2.  Earlier versions of Winsock conflict with FreeSpace.  We're still looking into this, but updating 
	Winsock to 2.2 Release solves this problem.<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="30" HEIGHT="15" BORDER="0">
	<A HREF=http://www.microsoft.com/windows/downloads/contents/Updates/W95Sockets2>http://www.microsoft.com/windows/downloads/contents/Updates/W95Sockets2</a><BR>
	Winver (shows what version of Winsock you have):<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="30" HEIGHT="15" BORDER="0">
	<A HREF=http://www.parallaxonline.com/files/wsver.zip>http://www.pxo.net/files/wsver.zip</a><BR>

	<P>
	<A NAME="faq13"></a>
	<FONT COLOR="EEEEEE">
	<B>Q:  When I try to play on PXO, it gives me the error, <i>You must define your
           connection speed. Please run the laucher, hit the setup button, and go to the 
           network tab and select your speed.</i> Except, I can't set my connection speed!<BR>
	A:</b></font>
	Make sure your FreeSpace.exe is <i>not</i> set to read-only.  If it is, 
	turn it off and re-apply the patch.<P>

	In some cases, you might have to reinstall from CD and patch up to the current version.  If you
	continue to have this problem after reinstalling from scratch, do the following:<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Reinstall from CD<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Manually or auto update up to 1.03.01<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	If autoupdating, exit the launcher without hitting the "Play FreeSpace button"<BR>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="5" HEIGHT="10" BORDER="0"><IMG SRC="<cfoutput>#relativepath#</cfoutput>images/support/bullet1.gif">
	Copy the file update/FreeSpace.exe over the FreeSpace.exe in your FreeSpace folder. <BR>

	<P>
	<IMG SRC="<cfoutput>#relativepath#</cfoutput>images/main/spacer.gif" WIDTH="17" HEIGHT="45" BORDER="0"><BR>
	
</div>
	
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_support.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">



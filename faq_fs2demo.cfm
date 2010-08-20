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



<div class="copysm">
<pre>
                 =========================
                 FreeSpace 2 - Demo v 1.00
                        Readme File
                 =========================


*** Please email fs2demo@volition-inc.com with all ***
***      problems you encounter in this Demo.      ***
***  We are also very interested in your comments! ***


For more information on FreeSpace 2, please visit
          http://www.volition-inc.com/
          http://www.freespace2.com/


-----------------
Table of Contents
-----------------

1. The FreeSpace 2 Launcher
     1a. Play FreeSpace 2
     1b. Setup
     1c. View Readme
     1d. Update
     1e. Help
     1f. Uninstall
     1g. Quit
     1h. Volition Logo
     1i. PXO Logo

2. Pre-Flight
     2a. Pilot Registration
     2b. The Main Hall
     2c. Barracks
     2d. Options
     2e. Ready Room

3. Gameplay
     3a. Demo Missions
     3b. Comm Menu
     3c. Additional HUD info

4. Multiplayer
     4a. PXO
     4b. Joining a game
     4c. Setting up a game
     4d. Standalone (Dedicated) Servers
     4e. Server Listing Additions
     4f. Co-op Mission
     4g. Dogfight
     4h. Squad War

5. Demo Feedback

6. Troubleshooting

7. Contacting Technical Support

8. FreeSpace 2 Web Links

9. Credits

10. Legal Stuff


---------------------------
1. The FreeSpace 2 Launcher
---------------------------

The Launcher's buttons enable you to set up and play FreeSpace 2, customize
your hardware settings, get updated versions of the Demo, and access the
FreeSpace 2 web pages at Volition, Inc. Here's what each button does:


1a. Play FreeSpace 2 
  Click this to launch FreeSpace 2.


1b. Setup
  Under Setup, you'll see tabs for Video, Audio, Joystick, Speed, Network,
DirectX, and Misc.

  * Video - You must have a 3D Accelerator card to play FreeSpace 2. You can
choose to have FreeSpace 2 detect Glide only, D3D only, or both by selecting
the proper checkboxes, then clicking on the "Detect Available Cards" button.
     - "Interlaced Cutscenes" and "Fast Clear for Cutscenes" are options
available only in the full retail version of FreeSpace 2.
     - "Fast D3D Textures" will improve your video and gameplay performance,
but at a cost to the visual quality of FreeSpace 2. Enable fast D3D textures
*only* if you are experiencing severe slowdown during gameplay.
     - WFOG is a Direct3D-only option. "Force WFOG" makes the D3D card use
WFOG (table-based rather than vertex-based fog) if available. Some cards
don't do WFOG properly (the S4, for example), so vertex fog is used by
default. Use this setting only for experimentation purposes.

  * Audio - FreeSpace 2 supports DirectSound, A3D, and EAX. You can choose
one of these by clicking on "Detect Available Sound Cards" and then selecting
from the dropdown box. You can enable Launcher sounds from here as well.

  * Joystick - Enables you to set up or change the joystick used by FreeSpace
2. Also lets you toggle Force Feedback support on or off (any joystick
supporting DirectX 6.0 force feedback may be used).

  * Speed - This setting determines the default Detail Level used in
FreeSpace 2 when new pilots are created. You may manually change this default
if you wish, but it may adversely affect your gameplay speed.

  * Network - Here you choose your LAN or Internet connection for multiplayer
games. Choose your connection type and speed.

  * DirectX - On this tab you can check your DirectX version and choose to
install or update DirectX on your machine.

  * Misc. - This tab is not active in the Demo version of FreeSpace 2.


1c. View Readme
  Views this file.


1d. Update
  This button enables you to see if a new version of the FreeSpace 2
Demo is available for downloading. If one is available, you can choose to
update the Demo by clicking on OK. The process is automated.


1e. Help
  This opens a Help document containing information about the Launcher
buttons.


1f. Uninstall
  Uninstalls FreeSpace 2 from your computer.


1g. Quit
  Closes the Launcher without running FreeSpace 2.


1h. Volition Logo
  This takes you to Volition's Internet home page.


1i. PXO Logo
  This takes you to the Internet home page for PXO, a free multiplayer
service for Volition and Outrage games.


-------------
2. Pre-Flight
-------------

2a. Pilot Registration

  When you enter the game, the first thing you do is create a pilot (or
choose an existing one). This pilot stores your Demo combat statistics as
well as your settings for Options and Control Config. You can also change
your active pilot in the Barracks screen.

  You can also create Multiplayer pilots from this screen. 


2b. The Main Hall
  This is the FreeSpace 2 main menu. Press F1 to view a Help overlay
outlining the different areas.

  In the Demo, you may use your mouse to click on the Ready Room, Barracks,
Options, or Exit. The Tech and Campaign Rooms are not available in the Demo.


2c. Barracks
  This room enables you to change your currently selected pilot and to view
combat statistics for your pilots. You can also change the pilot image used
by each pilot, as well as the squad logo that appears on the pilot's ship
during play.

  Viewing Service Medals is not available in the Demo.


2d. Options
  This screen enables you to change various global settings used in FreeSpace
2. Use it to adjust your sound, music, and voice volume levels, as well as
adjust your brightness setting and skill level. This is also where you
indicate whether you're using a mouse or joystick to control your ship in
FreeSpace 2, and how sensitive the ship should be to the movement of this
device.

  * Brightness: To correctly set the brightness on your monitor, use the
arrows on the brightness indicator until the stripes appear to be a uniform
shade of gray.

  * Mouse and Joystick Sensitivity: The higher these settings, the more
pronounced your ship's movement in response to your mouse or joystick's
movement.

  * Joystick Deadzone: The higher this setting, the less sensitive your ship
is to small movements of your joystick.


Multi Sub-Screen - This is where you specify the settings for multiplayer
games.
  * TCP/IPX - You can choose only TCP protocol in the Demo version.
  * IP Address - You can connect to specific IP addresses by entering them in
    this box.
  * PXO - This is where you enter your Login, Password, and Squadron that
    have been assigned to you by PXO.
  * Voice/General - This toggles between the Voice Specific and General
    multiplayer options.
  * Object Update - This tells the server how often you would like to be
    updated during a multiplayer game. If you have a slower connection (28.8,
    33.6), you should choose Low. For 56k modems, choose Medium. Cable modems
    and ADSL or higher should choose High. If you are playing on a LAN,
    choose LAN updates.
  * Pilot/Squad Images - If you would like to download custom pilot and squad
    pics choose "Yes."
  * Transfer Missions - Select which directory you would like to transfer
    missions to and from.
  * Flush Cache - Pick when you want FreeSpace 2 to flush its mission cache.


Detail Sub-Screen - This screen enables you to adjust the various detail
level settings for FreeSpace 2. It is recommended that you use the default
Preset Level chosen for you at install time. If you wish to change the
current setting, use the Preset buttons on the right side of the screen. The
Custom button enables you to modify the individual settings on the left side
of the screen.


Control Config Sub-Screen - Here you can configure your controls and key
bindings to better suit your preferences. A list of functions appears on the
left, with the corresponding key or button bindings on the right. Each of the
four categories of functions near the bottom of the screen (Targeting, Ship,
Weapons, and Misc.) has its own list of bound functions.

To change a binding, simply double-click on the appropriate line and then
press the new key or button. If two functions use the same key or button, it
will create a conflict. Clicking "Clear Conflict" removes the original
binding in favor of the new one.

You must resolve all conflicts before leaving the Controls Config screen.


HUD Config Sub-Screen - This screen is available only in the full version.


2e. Ready Room
  This door takes you straight to Briefing and then into the missions.

  * Briefing - This screen gives you an overview of the upcoming mission and
delivers your orders. Each Briefing is arranged in stages, which can be
navigated using the cursor keys or the arrow buttons on the bottom of the map
display.

  The text for each stage appears at the bottom. This is also read to you by
your commanding officer, unless you turned the voice off in the Options
screen.

  If this is your first time playing FreeSpace 2, you'll begin in a training
mission. It is STRONGLY recommended that you complete the training mission
before proceeding to the combat missions. Training will familiarize you with
different parts of the HUD display and with the basics of flight and combat.

  * NOTE: Several more training missions are included in the full release of
FreeSpace 2. They provide an easy way to learn not only basic controls but
also advanced combat techniques.

  The last stage in the Briefing displays your Objectives. Primary Objectives
are very important to the mission's success. If you fail a Primary Objective,
you may be forced to replay the mission before continuing. Secondary
Objectives are less important, but it is always good to fulfill them if you
can.

  Click "Commit" to accept your orders and begin the first training mission.
Your training instructor will take you through the basics and you will then
be ready to fly your first two combat missions.



-----------
3. Gameplay
-----------

3a. Demo Missions
  There are five missions included in this Demo. Mission 1 is training to
familiarize you with the basic combat controls. Missions 2 and 3 are single-
player missions that present you with a variety of challenges. If you perform
extremely well in Mission 2, you are given access to a new fighter for
Mission 3. The fourth and fifth missions are multiplayer missions for play
via Volition's free PXO gaming service.

  The retail version of FreeSpace 2 contains more than 50 new single-player
and multiplayer missions!


3b. Comm Menu
  How well you use the Comm Menu (default key "C") may be the difference
between success and failure in many missions. With this menu you can order
wingmen to attack or protect a target, cover you from enemy fire, or leave
the battle area. You may also use the Comm Menu to request Rearming/Repair
from a Support ship.


--------------
4. Multiplayer
--------------

4a. PXO
  PXO stands for "Parallax Online," a free multiplayer gaming service
offered for Volition and Outrage games. The FreeSpace 2 Demo is supported by
PXO. This service provides players with a meeting place in which to chat or
coordinate multiplayer games. It's also used to store statistics for pilots.
In order to play on PXO, you must have a Login and Password, which can be
obtained from the PXO website (http://www.pxo.net). Click on the "Accounts"
button and follow the directions. After you have registered, go into the
Options screen. In the Multi tab, enter your Login and Password in their
respective boxes. You can now play on PXO with any multiplayer pilot you have
created.

  If you already have a PXO account from FreeSpace 1 or Descent 3, you do not
need to create a new one. Your existing PXO Login and Password will track the
FreeSpace 2 Demo stats for your pilots.

  * NOTE: To play multiplayer for the FreeSpace 2 Demo, you MUST be on PXO.
IPX is supported in the full version of the game.


4b. Joining a game
  Once you're connected to PXO, click on the "Games" button at the bottom of
the page. This will show you the list of games that are running in that
channel. If you don't find any games to your liking, click "Cancel" to get
back to the main PXO page and choose a different channel to check out its
games.


4c. Setting up a game
  The first way to create a multiplayer game is to enter the PXO Ready Room,
choose a channel, and then click on the "Games" button. Click on "Create
Game" and then build your game. Pick a name and type (open, closed,
restricted, or password protected), then click the "Accept" button. Then
choose the mission (the Demo version contains two multiplayer missions--a
cooperative mission and a free-for-all dogfight) and set any Host Options
you'd like via the button near the bottom of the screen. Once you have enough
players, click on "Commit" to start the mission.


4d. Standalone (Dedicated) Servers ------------------------
  In FreeSpace 2 multiplayer, if you choose to "Create Game" in the Ready
Room, you are acting as a Non-Dedicated Game Server. Your machine will not
only run your local game simulation, but will also simulate the game for all
other players in your game. By doing both tasks, the other players in your
game may see performance problems, especially if you have 5 or more players
in the game.

  One way to avoid this is to run a Standalone Game Server. This enables one
machine to >only< run the game simulation, not allowing someone to also play
on it. By not doing game rendering, it enables more people to use the game
server with little or no performance hit.

  * NOTE: For FreeSpace 2 games with five or more players, it's STRONGLY
recommended that you use a Standalone/Dedicated Server. Non-Dedicated servers
will not handle 8-12 people reliably. It's also STRONGLY recommended that
anyone running a Standalone Server be connected to at least a dual-channel
ISDN line, and preferably a T1.

* Starting a Standalone Server:
  To run FreeSpace 2 as a Standalone Game Server, open an MS-DOS prompt to
your FreeSpace 2 directory and type:
     FS -standalone

  A Windows dialog will come up with a tabbed interface with your Standalone
Server options. Once the default Server Name has been filled in, the server
is up and running. You may change the Server Name field and it will update on
players' Join screens.

  Most of the interface options on the Standalone are self-explanatory.

  To shut down the server, press "Shut Down" or simply close the application.

  * NOTE: FreeSpace 2 Standalone servers perform better under Windows NT than
under Windows95/98.


* Standalone Config File
There's a file in your FreeSpace2\data directory called "multi.cfg" that
determines the default options used when you run a standalone server. The
following options are currently supported:

+name <servername> Sets the server name that appears in the games list.

+pxo <channelname> Makes your server appear on Parallax Online. The server
then appears in the specified channel's games listing and will upload
player statistics for anyone who plays on it. Public channel names must be
prefixed by a "#" and private channels by "+".

Examples:
+pxo #Team_Games - puts server in the public Team_Games channel
+pxo +Biffs_Games - creates private channel "Biffs_Games" and places
this server in it.

  * NOTE: If you want to use a public channel, the name >must< match one of
the default public channel names. If it does not match, it will not be placed
in any channel and won't be visible to anyone.

  The +pxo option is on by default in the multi.cfg file, assigned to a Lobby
Channel. If you do not use PXO with your Standalone Game Server, it will still
show up on a player's game lists if it's local to him and he has clicked the
"Broadcast Locally" option to "On" under Options/Multi. If it's not local to a
player, he may still join your non-PXO server by manually entering your
server's IP address in Options/Multi sub-screen.

+no_voice disallows voice transmission at any time

+passwd the first person to join the server while it's empty will
have to enter this password

+low_update
+med_update
+high_update
+lan_update
These options enforce an upper limit on datarate for clients. For example,
if the server has +high_update set, even if a client has LAN updates
selected, he will be limited to high updates. It is not recommended that
you run a standalone server unless it can support at least high update level.

+max_players #  Sets the maximum allowed players on your server. It's
recommended that you keep this at a reasonable limit, based on your server's
Internet connection type. The max supported players is 12.

+ban <callsign>  Bans a given player. Up to 50 banned players are supported.

+passwd <password>  Sets the host password. The first person connecting to
the server is required to enter this before being granted hostship.
Players joining later do not need the password.

  These options can be entered in any order and in any combination, with
repeats overriding the previously entered values.

* Standalone Servers & Mission Files
  Any FreeSpace 2 missions or campaigns appearing in your \data\missions
directory are available for players to use on your Standalone Server. If a
player does not have the mission file, the server automatically transfers
it. Players are not able to upload missions to your server, however, so you
have total control over what missions (and what types of missions) your
Standalone Server provides.


4e. Server Listing Additions ----------------------------
  Two symbols have been added to the server listings that appear in the
Join/Create game screen. An asterisk (*) appears next to Standalone Servers.
Non-Dedicated Servers will have no asterisk. If a "C" appears next to the
server name, it is currently running a Campaign mission (as opposed to a
single, non-campaign mission).



4f. Co-op Mission
  The fourth mission in the Demo is a cooperative mission in which all the
players are on the same side. A wing of fighters and a wing of bombers take
on a Shivan cruiser and its fighter escort.


4g. Dogfight
  The fifth and final mission in the Demo is a free-for-all dogfight in and
around an Alliance drydock. Up to 12 pilots can participate in the furball. 
Kills scored against AI pilots do not count in the dogfight mission.


4h. Squad War
  The full retail version of FreeSpace 2 includes support for Squad War.
Squad War enables multiplayer squadrons to challenge other squadrons for
control of territory in the FreeSpace 2 universe. Squad War is an organized
form of team vs. team multiplayer gameplay. PXO servers will maintain a
list of registered squadrons that will be managed by users through a
web page. Squadrons will fight it out via team vs. team missions for
control of star systems. The PXO database will keep track of which
squadron controls which star system.

More information can be found at the Squad War home page:
     http://www.squadwar.com



----------------
5. Demo Feedback
----------------

One reason to release a game demo is to get player feedback from players
all over the world. We are interested in what you think of the game!
You may contact us at one of the email addresses below:

General feedback, comments & bug reports:
  fs2demo@volition-inc.com

Technical questions/problems
  support@interplay.com
  (Also see section 6 below)


------------------
6. Troubleshooting
------------------

  The following are commonly asked questions, with answers. 

  * NOTE: For all Tech Support on Parallax Online (PXO), please visit the
support page (http://www.pxo.net/support.cfm). Interplay will >not< be able
to help you with PXO problems.


Common Questions & Answers

6a. DirectX -----------------------------------------------

Q: I'm having mysterious video/audio/input problems.

A:  A lot of problems can be attributed to out-of-date DirectX drivers. If
you're running Windows 95/98, make sure you're running DirectX 5.0 (or
better). If you're running under Windows NT 4.0, you must have DirectX
3.0/Service Pack 3.

You can obtain the latest drivers at:
Windows 95:
   http://www.microsoft.com/msdownload/directx/dxf/enduser5.0/default.htm
Windows NT:
   http://www.microsoft.com/support/winnt/default.htm


6b. Audio -------------------------------------------------

Q:  I get a warning about not having the Audio Compression Manager (ACM)
    installed.
A:  You need to install an ACM on your machine. Follow these steps for
    installing it:
  1) First see if you have the Microsoft ADPCM installed:
     a) Click on the "Multimedia" icon in your Control Panel
     b) Click the Advanced Tab, and expand the Audio Compression
        Codecs list
     c) If you see "Microsoft ADPCM Codec," then you have the 
        required ACM codec
  2) If you see the correct ACM codec installed, there are two possible
     reasons why the ACM is not working in the game:
     a) You don't have msacm32.dll in your path
     b) Your ACM version is not 3.5 or higher
  3) If the ACM codec is not installed, then follow these steps to
     install it:
     a) Click on the "Add New Hardware" icon in your Control Panel
     b) Select "No" when asked if Microsoft should search for new
        hardware (Click Next)
     c) Select "Sound, video and game controllers" from the
        Hardware Types list (Click Next)
     d) Select "Microsoft Audio Codecs" from the Manuf. list
     e) From the list of codecs on the right, select "Microsoft
        ADPCM CODEC" (Click Next)
     f) Reboot for the changes to take effect


6c. Video -------------------------------------------------

Q:  I have a 3DFX card, and it says "Expected VXD version 1.2, got V1.1."
    What do I do?
A:  This is caused by one of the following:
  1) Your \windows\system\fxmemmap.vxd file is out of date. Getting and
     installing the latest Glide drivers *should* fix this, according to
     3DFX. Or, simply copy the fxmemmap.vxd into your windows\system
     directory.
  2) There is an out of date fxmemmap.vxd somewhere besides the
     windows\system directory. You should find all versions of this file on
     your drive and put the latest one in windows\system. Delete all other
     versions of it.


6d. Joysticks ---------------------------------------------

Q:  My ForceFX Force Feedback joystick does not appear to work.

A: Do the following things:
  1) Make sure you have the latest version of DirectInput.
  2) Make sure you set up the joystick properly in the Windows 95 control
     panel. You should select "CH ForceFx Joystick for DX5 (Serial)". Do
     not use "CH Force FX Joystick (analog mode)", as this doesn't support
     Force Feedback.


-------------------------------
7. Contacting Technical Support
-------------------------------

Interplay Productions Technical Support now offers troubleshooting guides
with complete installation and setup instructions, as well as information
that will help you overcome the most common difficulties. If you have
access to the World Wide Web, you can find these at:

     www.interplay.com/support/

Here you will find troubleshooting information on as well as information
on regular system maintenance and performance.

     DirectX:  www.interplay.com/support/directx/
     Joysticks:  www.interplay.com/support/joystick/
     Modems and Networks:  www.interplay.com/support/modem/

(For game-specific information and additional troubleshooting, visit
our main page at www.interplay.com)

If you have questions about the program, our Technical Support Department
can help. Our web site contains up-to-date information on the most common
difficulties with our products, and this information is the same as that
used by our product support technicians. We keep the product support
pages updated on a regular basis, so please check here first for no-wait
solutions:

     www.interplay.com/support/

If you are unable to find the information you need on our web site, please
feel free to contact Technical Support via e-mail, phone, fax, or letter.
Please be sure to include the following information in your e-mail message,
fax, or letter:
	
   Title of Game
   Computer manufacturer
   Operating system (Windows 95, DOS 6.22, etc.)
   CPU type and speed in MHz
   Amount of RAM
   Sound card type and settings (address, IRQ, DMA)
   Video card
   CD-ROM
   Mouse driver and version
   Joystick and game card (if any)
   A copy of the CONFIG.SYS and AUTOEXEC.BAT files from your hard drive
   A description of the problem you're having

If you need to talk to someone immediately, call us at (949) 553-6678
Monday through Friday between 8:00AM-5:45PM, Pacific Standard Time, with
24-hour, 7 days a week support available through the use of our automated
wizard. Please have the above information ready when you call. This will
help us answer your question in the shortest possible time. When you call
you will initially be connected with our automated wizard.  For information
pertaining to your specific title, press "1" on the main menu and listen
carefully to all prompts. All titles are listed alphabetically. After you
have selected your title, the most common difficulties will be listed.  If
the difficulty you are having is not listed or you need additional
assistance, you may press "0" on your games main menu, and you will be
transferred to a Technical Support Representative.  No hints or codes are
available from this line.  

Interplay Productions Support Fax: (949) 252-2820

Interplay Productions Technical Support
   16815 Von Karman Avenue
   Irvine, CA  92606

How to reach us online
INTERNET E-MAIL:  support@interplay.com
WORLD WIDE WEB:  www.interplay.com
FTP:  ftp.interplay.com


UK & Europe
Virgin Interactive
Customer Support
74a Charlotte Street
London
W1P 1LR

Tel:  0171 551 4266
Fax:  0171 551 4267

Web:  www.vie.co.uk
Email:  customer_support@vie.co.uk



------------------------
8. FreeSpace 2 Web Links
------------------------

If you're interested in FreeSpace 2-related web sites and information, here
are some great places to start.

Volition, Inc. homepage
  http://www.volition-inc.com

Parallax Online
  http://www.pxo.net

Interplay Productions
  http://www.interplay.com

Descent Network FreeSpace page
  http://www.descent-freespace.com

Planet FreeSpace
  http://www.planetdescent.com/planetfs/

Xanadu's Mission Archive
  http://descent.gamestats.com/xanadu/index.html

Ground FreeSpace
  http://www.groundfs.com


----------
9. Credits
----------

FreeSpace 2 Demo developed by Volition, Inc.
for Interplay Productions


Volition, Inc.
--------------
Original Design
   Adam Pletcher (lead)
   Jason Scott
   Dave Baranec
   & FS2 Team

Programming
   Dave Baranec (lead)
   Dave Andsager
   Jeff Farris
   Neil Kumar

Art
   Jasen Whiteside (lead)
   John Enricco
   Matt Flegel
   David Gulisano
   Matt Kresge
   Kelly Snapka

Writing
   Jason Scott
   Mike Breault

Demo Mission Design
   James Agay

Additional Mission Design
   Brad Johnson
   Jim Boone
   Chad Nicholas
   Jordan Roc

Demo Sound and Music
   Dan Wentz

Additional Sound and Music
   Scott Lee

Vocal Samples
   Courtesy of Spectrasonics' "Symphony of Voices"

Voice Acting
   Denton Brown
   Dave Butler
   Kay Holley
   Nick Lee
   Barbara Ridenour
   William Ridenour
   Tim Schroeder
   Jason Scott

QA
   Anoop Shekar (lead)
   Allan Bautista
   Eric Keyser
   Nick Malnick
   Alvan Monje
   James Tsai
   Andrew McIntosh

Additional Programming
   Alan Lawrance
   John Slagel

Webmaster
   Nathan Camarillo

Network & Technical Support
   Mark Muller

Administrative Support
   Misty Goodman
   Ginny Gee
   Dawn Dvorak

Executive Producer
   Mike Kulas

Director of Product Development
   Philip Holt

Beta Testers
   Solrazor
   Paul Griffin
   Mike Diedrich
   Hideki Minowa
   Colin Czerneda
   Ed Finkler
   Todd Miller
   Heiko Herrmann
   Tane Piper



Interplay
---------
Producer
   Jim Boone

Line Producer
   Primo Pulanco

V.P. of Product Development
   Trish Wright

Division Director
   Feargus Urquhart

Director of Quality Assurance
   Jeremy Barnes

QA Manager
   Greg Baumeister

Quality Assurance Project Supervisor and Compatibility Manager
   Darrell Jones

Testers
   Eric Hernandez
   John Palmero
   Harold Kim
   Tony Piccoli
   David Fleischmann
   Matt Golembiewski
   Galacio Ramirez
   Tim Anderson
   Henry Lee

Compatibility Technicians
   John Parker
   Derek Gibbs
   Josh Walters
   David Parkyn

Product Marketing Manager
   Alison Quirion

Communications Manager
   Lisa Bucek




---------------
10. Legal Stuff
---------------

SOFTWARE USE LIMITATIONS AND LIMITED LICENSE

General Product License. This copy of FreeSpace 2 (the "Software") is
intended solely for your personal non-commercial home entertainment use.
You may not decompile, reverse engineer, or disassemble the Software,
except as permitted by law. Interplay Entertainment Corp. and its
licensors retain all right, title and interest in the Software including
all intellectual property rights embodied therein and derivatives thereof.
The Software, including, without limitation, all code, data structures,
characters, images, sounds, text, screens, game play, derivative works and
all other elements of the Software may not be copied, resold, rented,
leased, distributed (electronically or otherwise), used on a pay-per-play,
coin-op or other for-charge basis, or for any commercial purpose.  Any
permissions granted herein are provided on a temporary basis and can be
withdrawn by Interplay Productions at any time. All rights not expressly
granted are reserved.

Modem and Network Play. If the Software contains modem or network play,
you may play the Software via modem transmission with another person or
persons directly without transmission through a third party service or
indirectly through a third party service only if such service is an
authorized licensee of Interplay. For the purpose of this license, a
"third party service" refers to any third party service which provides a
connection between two or more users of the Software, manages, organizes,
or facilitates game play, translates protocols, or otherwise provides a
service which commercially exploits the Software, but does not include a
third party service which merely provides a telephonic connection (and
nothing more) for modem or network play. Authorized licensee services
are listed on the Interplay Entertainment Corp. World Wide Web Site
located at http://www.interplay.com. This limited right to transmit the
Software expressly excludes any transmission of the Software of any data
streams thereof on a commercial basis, including, without limitation,
transmitting the Software by way of a commercial service (excepting those
specific commercial services licensed by Interplay) which translates the
protocols or manages or organizes game play sessions.

Acceptance of License Terms. By downloading or acquiring and then retaining
this Software, you assent to the terms and restrictions of this limited 
license. If you acquired the Software and do not accept the terms of this
limited license, you must return the Software together with all packaging,
manuals and other material contained therein to the store where you acquired
the Software for a full refund and if you downloaded the Software, you must
delete it.



Copyright Information
---------------------

FreeSpace 2 Demo (and full version) (c) 1999 by Volition, Inc. All rights
reserved. Portions (c) 1999 Interplay Productions. All rights reserved.
FreeSpace 2, Interplay, the Interplay Logo, and "By Gamers. For Gamers." are
trademarks of Interplay Productions. Windows(r) 95 is a registered trademark
of Microsoft Corporation. All rights reserved. Exclusively licensed and
distributed by Interplay Productions. All other trademarks are the property
of their respective owners.


----
End of file
</pre>
</div>
	
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/_menu_support.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">



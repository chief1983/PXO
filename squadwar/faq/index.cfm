<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfif NOT isdefined("session.loggedin")><cfset session.loggedin=0></cfif>

<cfset document_title="SquadWar.Com - Enlist a Pilot">

<cfinclude template="#relativepath#doc_top.cfm">

<cfinclude template="#relativepath#menu/create_main.cfm">

<cfinclude template="#relativepath#doc_mid.cfm">
				<!--- MAIN PAGE INFO --->
	<br>	
	 	<center>
	 		<table width="95%" cellpadding=0 cellspacing=0 border=0><tr><td>	

				<div class="Title">SquadWar FAQ</div>
				<p>
				<div class="copy">
						
						<div class="question">
						<b>Q:</b> What is SquadWar?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> The basis for Squad War is that organized squadrons should be able to conquer and defend regions of space. Squad War allows multiplayer squadrons to challenge other squadrons for control of territory in the universe. Squad War is an organized form of team vs. team multiplayer gameplay. PXO servers will maintain a list of registered squadrons (each has a name, a password, and a list of members) which will be managed by users through a web page. Squadrons will fight it out (via team vs. team missions) for control of sectors. The PXO database will keep track of which squadron controls each sector. 
						</div>
							
						<p>
							
						<div class="question">
						<b>Q:</b> How do I play SquadWar?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> First, you need a valid copy of <a href="http://www.freespace2.com">FreeSpace 2</a>.  Once you have a copy of FreeSpace 2, you need to obtain a valid PXO account.  You can do this by clicking on "New Pilots" from the main SquadWar page, or by registering an acccount via the PXO web site.
						</div>							

						<p>
						
						<div class="question">
						<b>Q:</b> I already have a PXO account from Descent: FreeSpace - The Great War, Conflict: FreeSpace, Silent Theat, Descent 3 Demo, Descent 3, FreeSpace 2 Demo or FreeSpace 2, do I still need to register an account?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b>  No, if you already have a PXO, you can use this account to log into the SquadWar web site.
						</div>
						
						<p>					
						
						<div class="question">
						<b>Q:</b> How do I join a Squad?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> The Squad Leader must give you the Squad's "join password".  After logging into the SquadWar web site, click on "Join a Squad" from your list of actions.  Choose the Squad you wish to join from the list and enter the appropriate information into the form.  The process will automatically add you to the Squad's roster.
						</div>															
						
						<p>
				
						<div class="question">
						<b>Q:</b> How do I create a Squad?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b>  Simply log into the SquadWar web site and click on "Create a Squad" from the list of available actions.  Fill out the form completely and accurately to create your new Squadron.
						</div>															
						
						<p>
						
						<div class="question">
						<b>Q:</b> What is the "Enlist" action for?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Enlisting a pilot allows you to "show off" your PXO stats for a specific pilot on a public recruiting board. If Squad Leaders are looking for new members, or perhaps members to start a new squad, they will check out the Recruit Board to see who the best really is.
						</div>															
						
						<p>
						
						<div class="question">
						<b>Q:</b> What is the Recruit Board?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> The Recruit Board allows pilots to "show off" their PXO stats.  For more information, read the Question and Answer above.
						</div>															
						
						<p>																

						<div class="question">
						<b>Q:</b> What are Leagues and why don't the league maps contain nodes that we're familiar with from the FreeSpace series of games?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Leagues are individual "games" of SquadWar.  Think of a SquadWar League as something similar to a bowling league, basketball season, or club event.  Your team can participate in multiple Leagues at the same time.  The individual League maps don't exist within the rules of the FreeSpace universe.  The current FreeSpace node map is way too limiting to create a single league, much less multiple leagues.  A SquadWar league map needs at least three node connections from every system other than an entry node in order to provide the most amount of fun and ease of teritorrial expansion.
						</div>															
						
						<p>								
						
						<div class="question">
						<b>Q:</b> How do I join a league?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Click on the action "Admin Squad" once you have logged in to the SquadWar site.  Log into your Squad and you will be given the option to sign up for a league.  You must have two memebers on your active roster before joining a league.
						</div>															
						
						<p>		
						
						<div class="question">
						<b>Q:</b> How do I enter my Squad on a map?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> First, log into the SquadWar web site.  If your Squad has joined a league, click on the league name from the list of active leagues under the league list on the left side of the page.  Find your Squad's name on the list of of Squads in the current league and click on the link.  This will take you to the Squad Info page.  From the Squad Info page, click on the Squad Name again to log in as that Squad.  Using the "admin password", you will be taken to a new page which shows detailed league information for your Squad.
									A link, "Enter the Map" or "Challenge Entry Node", will appear on the page.  If "Enter the Map" is available, you can pick which system you want your Squad to start in.  For best results, choose an Entry Node close to another Squad.  
									If "Challenge Entry Node" is available, you can challenge another team for control of the Entry Node they currently hold.  Choosing the "Challenge Entry Node" option will generate a match code.
						</div>															
						
						<p>		
						
						<div class="question">
						<b>Q:</b> My Squad is already on the map, how do I challenge another Squad?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> First, log into the SquadWar web site.  If your Squad has joined a league, click on the league name from the list of active leagues under the league list on the left side of the page.  Find your Squad's name on the list of of Squads in the current league and click on the link.  This will take you to the Squad Info page.  From the Squad Info page, click on the Squad Name again to log in as that Squad.  Using the "admin password", you will be taken to a new page which shows detailed league information for your Squad.
									A link, "Pose a Challenge", will appear on the page.  Following this link will take you to a page which shows all the systems you can currently challenge.  If you cannot challenge a system adjacent to
									systems you currently hold, a brief explination will be given at the top of the page.  If your team can pose a challenge, a form will appear.  Choose the option you wish to pose a challenge for and submit the form.
									This will generate a match code.
						</div>															
						
						<p>						
						
						<div class="question">
						<b>Q:</b> What is a Match Code?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> A match code is a specific ID number which corresponds to a SquadWar event.  When you pose a challenge, a match code is generated.  Write this match code down.  If you have your Squad's "admin password" you can view your current match codes by looking at your Squad's detailed league information.
								You will use this match code when playing a SquadWar match in FreeSpace 2 on PXO to play the match.									
						</div>															
						
						<p>		
						
						<div class="question">
						<b>Q:</b> How do I play a SquadWar match?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> At least two members from each squad must be present for a valid SquadWar match to occur. All Squad participants should log into PXO and one Squad member should host the match.  The host must choose "Team" missions from the list of valid PXO missions and click the "SquadWar" button on the top left of the host screen.  When the host "commits" to the match, he will be prompted to enter the match code.  The host will enter the match code for your match to continue.
									When the mission is over, PXO will update the SquadWar map information.
						</div>															
						
						<p>		
						
						<!--- new stuff --->
						<div class="question">
						<b>Q:</b> My connection isn't as fast as everyone else I play with, is that fair?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Obviously people with faster connections will have an advantage and a faster reaction time.  There's nothing we can do about this.  If you have a poor connection (like I do at home) and feel like you're at a disadvantage but still want to play, you might want to be a bomber.  I have plenty of fun at home in co-op missions as a bomber.  You can be a very valuable asset to your Squad as a dedicated bomber.
						</div>															
						
						<p>	
						
						<div class="question">
						<b>Q:</b> How do I schedule a SquadWar match?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> 
							In order to track the progress of matches and to insure matches are resolved in a timely manner, I have created a match scheduling system to coordinate the process involved in scheduling a match.   If you are a Squad Admin you can reach your Squad Management page by clicking on the link in the menu on the left side of the page called "Admin Squad".  You can reach the scheduling page by clicking on the link titled "View pending matches for this squad and schedule matches" available on the Squad Management page.  The instructions are fairly simple:
							
							<ul>
							<li>A team creates a challenge
							<li><b>Phase 1:</b><br>The challenging team visits the scheduling page for that match code and proposes two times for that match to be played.
							<li><b>Phase 2:</b><br>The defending team is notified by SquadWar that the intial proposed times have been created.  The defending team then sets the battle paramaters for the match.  The battle parameters are the mission, number of pilots, and whether or not AI is present.  The defending team also proposes one alternate time for the match on one of the two days suggested in the initial proposition by the challenging team.
							<li><b>Phase 3:</b><br>The challenging team is notified by SquadWar that phase 2 has been completed.  The challenging team then picks the final match time from the two times offered by the defending team.
							<li>You play the match at the scheduled time, or request an extension from the squadwar administrator.
							</ol>
							<p>
							Please schedule all outstanding matches as quickly as possible.	
						
						</div>															
						
						<p>								
						
						<div class="question">
						<b>Q:</b> How many players must be present for a match?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> You have to have at least two members present during the match.  Both teams should agree in advance when the set the match up how many will participate.  If you agree to a four on four match and the other team only has two players show up at game time, the "short" team has to play with 2 players, and the "full" team can option to play with all 4 players on their squad if they are present.  The "full" Squad can agree to play with less if they choose but they aren't required to play with any less than they agreed to.

						</div>															
						
						<p>	
						
					
						
						<div class="question">
						<b>Q:</b> Who should host a SquadWar match? Does the host set the limitations, respawns, locations, and other parameters of the game in the multiplayer area?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Again, you should agree in advance what the specific rules for the match are, and what mission will be used.  The defending team can insist upon the three paramaters available through the scheduling system: Mission, Number of Pilots, and the use of AI Pilots.  Additionally the preference to host goes to the defending/challenged team.  Both teams should try to agree on a neutral server such as a Volition stand-alone server.  If they are unable to agree or find one, the "defending"/"challenged" team has first choice of stand-alones.  If a stand-alone cannot be agreed upon, the "defending"/"challenged" team has priority of hosting.
									Please note that any additional match rules must be agreed to by both teams.  If they are not agreed to by both teams, then the default rules apply.  For example, if both teams agree not to use a certain type of missile it is acceptable as long as both teams agree to it.  However, the defending team cannot force the attacking team to abide by this extra rule just because they are on defense.  If you feel like a team is taking advantage of this rule, please write the SquadWar Administrator with the match code, and a full description of the incident.
						</div>															
						
						<p>					
						
						<div class="question">
						<b>Q:</b> What should the difficulty level be set to?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> The difficulty level for all Team vs. Team matches is forced to "medium".
						</div>															
						
						<p>								
						
						<div class="question">
						<b>Q:</b> Does the Squad Admin need to be present at every match?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> No, but you should inform at least one person who plan on participating what the match code is.
						</div>															
						
						<p>																
						<!--- end new stuff--->						
						<div class="question">
						<b>Q:</b> We just played a SquadWar match and everything updated properly, but our match code is still displayed.  What is going on?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> After your match is complete, PXO waits a few minutes before moving and deleting the match code.  Please be patient and the match code will be moved to the match history information after a short period of time.
						</div>															
						
						<p>																																		

						<div class="question">
						<b>Q:</b> How do I set my team color?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> If you have the "admin password" for a Squad, choose the "Squad Admin" action from the list of available actions after you have logged into the SquadWar site.
						</div>															
						
						<p>	
						
						<div class="question">
						<b>Q:</b> Our SquadWar match ended, we didn't receive notification that stats had updated, but everything updated properly, whay happened?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Chances are one of the clients lost contact temporarily with the server at the end of match.  PXO was made aware of the game state when the match ended and since it couldn't contact the missing player, that attempt to contact "timed out" causing the stats to update as normal.
						</div>															
						
						<p>	
						
						<div class="question">
						<b>Q:</b> Will we be able to have our own squad logo appear on the SquadWar web site with our squad information?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Yes, more information about this will available soon.
						</div>															
						
						<p>	
						
						<div class="question">
						<b>Q:</b> Why did you decide to create SquadWar?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> We wanted to create a new multiplayer gaming experience that has the thrill of FreeSpace 2 multiplayer and the versatility of a web-based interface which could be dynamically changed and updated in real time.
						</div>															
						
						<p>																									
						
						<div class="question">
						<b>Q:</b> I still haven't found the answer to my question.  Who do I contact?
						</div>
						<p>					
						<div class="answer">
						<b>A:</b> Write <a href="mailto:squadwar@volition-inc.com">squadwar@volition-inc.com</a>
						</div>															
						
						<p>								
				</div>				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

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

				<div class="Title">SquadWar Rules</div>
				<p>
				<div class="copy">
						
						<b>Overview:</b>
						The basis for Squad War is that organized squadrons should be able to conquer and defend regions of space. Squad War allows multiplayer squadrons to challenge other squadrons for control of territory in the universe. Squad War is an organized form of team vs. team multiplayer gameplay. PXO servers will maintain a list of registered squadrons (each has a name, a password, and a list of members) which will be managed by users through a web page. Squadrons will fight it out (via team vs. team missions) for control of sectors. The PXO database will keep track of which squadron controls each sector. 
						<p>
						<b>Please note that these rules are subject to change at the discretion of the Administrator.</b>
						<p>
						
						<h2>Overview of Rules:</h2>
						<b>Squadrons</b>
						<ul>
						<li>A squadron consists of a squadron leader and multiple squadron officers.
						<li>PXO maintains a database of registered squadrons.  Each squadron has an unique ID number, a squadron name, squadron password and a list of squad members.
						<li>Squadrons may participate in multiple Squad War leagues simultaneously.  
						<li>PXO maintains contact information for each squadron leader.
						<li>Squadrons may consist of multiple members but need at least two members to join a league.  
						<li>Players may play for multiple squads, however a player who exists on more than one squad cannot play in a match where he exists on both rosters.
						</ul>
						<p>
						
						
						
						<b>Mission Types and Match Resolution</b>
						<ul>
						<!---
						<li>Primary mission type: Each team has primary objectives. If the sector is "uncontrolled" and both teams satisfy all primary objectives, the sector remains uncontrolled (stalemate). If a sector is controlled, and the defending squad satisfies primary objectives, they retain control regardless of the primary goal status of the other team. If they fail their primary objectives and the attacking team satisfies theirs, the attacking team gains control of the sector.
						<li>Alternate mission type: Whichever team satisfies their primary objectives first is declared the winner. This would mean that the missions must be designed such that the 2 teams' objectives must not be interdependent. 
						--->
						<li>The match is resolved by one team winning by points, or a draw.  If a match results in a draw, the victory goes to the defending/challenged team, and the challenger is awarded a loss.
						<li>A minimum of two players from each squadron must be present for a team vs. team mission. (currently 1 for testing purposes)
						<li>The results of a match are updated on PXO via FreeSpace 2 during the mission debriefing.
						<li>In the event a match ends prematurely, Either due to a losing team whimping out, a game crash, or other disconnect situation, the match will be declared invalid, and nothing gets updated.  If the match isn't replayed, expiration rules apply.  
						</ul>
						
						
						
						<b>Deactivation</b>
						<ul>
						<li>If a team fails to participate in any matches for a period of two weeks, they are placed on an administrative list and are considered for deactivation.
						<li>The Squad War administrator will contact squadrons pending deactivation.  Failure to respond within 48 hours will result in deactivation. 
						<li>Deactivated squadrons or squadrons who drop out of Squad War forfeit all of their sectors.  The sectors become uncontrolled and all pending matches are removed.  All contesting squadrons having pending matches with the removed squadron are notified via email.
						</ul>
						
						
						
						<b>Challenges</b>
						A squadron can only challenge for a node that it is adjacent to a controlled node.  If it is occupied, then that team is challenged.  If it is unoccupied, then an adjacent team must also challenge for it.  See example.
						<p>
						<center>
						<img src="images/examples/example1.gif" width=221 height=310 alt="" border="0">
						</center>
						<p>
						A may challenge B for node 2 or D for node 5.<br>
						A may challenge B or C for node 3.<br>
						A, B or C may not challenge D for node 3. (D has no adjacent nodes)<br>
						<ul>
						<li>Two squadrons can vie for control over an adjacent, unclaimed region of space.  If a sector of space is uncontrolled, one team may challenge another team adjacent to that sector for control of said sector.
						<li>If a sector is controlled, a squadron in an adjacent sector can pose a challenge to the controlling owner of that sector.  
						<li>A squadron may only issue two outstanding challenges, each unique:
						<ol>
						<li>A squadron may only issue one challenge at a time for controlled territory.
						<li>A squadron may only issue one challenge at a time for uncontrolled territory.
						</ol>
						<li>A squadron may have multiple outstanding challenges.  The number of outstanding challenges will be within a set limit. The current limit for this league is 10.
						<li>The challenge squad has 24 hours from the time the challenge is created to proprose two dates/times for the match to take place.
						<li>(to be implemented at a later date) A team has 48 hours to respond to challenge.  The challenger has 48 hours to finalize the challenge after the challenged squadron responds.
						<li>(to be implemented at a later date) A challenge must be scheduled to occur within eight days of the initial challenge, limited to days six through eight. Unless both teams agree to a shortened time period.  Both teams should still use the scheduling system to avoid an auto-forfeit.
						<li>(to be implemented at a later date) If a team is challenged and the match fails to occur or fails to be rescheduled within 48 hours after the expiration time, ownership may transfer.  If the sector is uncontested, the non-forfeiting team gains control of that sector.  In the event the sector is controlled, the non-forfeiting team retains or gains control of the sector.  If this cannot be honestly resolved by the Squad War admin, the match is considered void.
						<li>"Battle is resolved when the challenge is made." This means that the battle is officially resolved at the exact time the challenge is made.  In a persistent universe it would be impossible to reinforce the complexity which could arise.  From the picture above, squadron A challenges squadron B for control of sector 2.  While the match is pending its eventual conclusion, team D challenges team A for sector 1 (the sector from which A's initial challenge was issued).  If the match between A and D occurs first, and A loses sector 1. Would A still be able to challenge B for control of sector 2? If the universe relied upon the exact state of the universe at the time of the match, this would violate the rule which states A must have a sector adjacent to sector 2 in order to take control of sector 2 from squadron B.  We state that the battle is resolved at the time when the challenge is issued, although the actual event may occur at a later time.  Therefore squadron A would legally be able to challenge squadron B for control of sector 2 and no rules are violated.
						<li>If a squadron controls all nodes adjacent to an unoccupied node, the unoccupied node comes under the control of the surrounding squadron.  This gives added incentive for organized attacks.  The team which surrounds a sector must submit their claim to the Galactic Grants Office for processing.
						</ul>
						
						
						
						<b>Entering the Fray</b>
						<ul>
						<li>There are only a limited number of entry nodes.
						<li>If a new team wants to enter and there are no empty entry nodes, it may challenge for any entry node.
						<li>If there are empty entry nodes, a new squad will get assigned to an empty entry node.  We will favor placing them in an area to maximize battle options.  
						<li>You can only hold one entry node.  You cannot challenge for an entry node unless you are not currently on the map.
						</ul>				
				
						<b>Lag Bombing, Exploits, and Cheating</b>
						<ul>
							<li>There is currently an exploit known as "Lag-Bombing".  Until we patch this, using this exploit is considered illegal and will be dealt with at the Administrator's discretion.
							<li>Additionally, any attempt to use exploits, cheat, hack, or alter the intended SquadWar experience or web site will be considered illegal and will be dealt with at the Adminstrator's discretion.
						</ul>
				</div>				
			</td></tr></table>			
		</center>					
								
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

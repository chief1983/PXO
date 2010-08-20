<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

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

				<div class="Title">SquadWar Missions</div>
				<!---
				<p>
				<div class="copy">
				We recently discovered several multiplayer balance issues in the Team vs. Team missions used for SquadWar. Unzip the contents of the file into your FreeSpace2\data\missions directory.  The missions have been fixed, and are available for download:
				<p>
				<a href="http://www.squadwar.com/downloads/missions/SWR_v1.zip">http://www.squadwar.com/downloads/missions/SWR_v1.zip</a>
				</div>
				<p>
				--->
				<div class="copy">
						<!---
						<div class="title">MT-01 Aeolus Duel</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-01.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission in which two cruisers and their escorts tangle in a battle to the finish. Max respawns 10. Recommended respawns 6.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
										Each crusier is worth equal points.  The first team to destroy the enemy's crusier receives a bonus.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>							
						--->
						<div class="title">MT-02c Mentu Duel</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-02.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission in which two cruisers and their escorts tangle in a battle to the finish. Max respawns 10. Recommended respawns 6.  
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each crusier is worth equal points. There is a bonus for both cruisers, the value of fighter may cost you a win. 
									</div></td>
								</tr>
							</table>
						</center>										
						<p>			

						<div class="title">MT-03c Deimos Duel</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-03.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission in which two corvettes and their escorts tangle in a battle to the finish. Max respawns 10. Recommended respawns 6.  
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each corvette is worth equal points. The first team to destroy the enemy's corvette receives a bonus. The value of the individual fighters is negligible compared to the bonus.  
									</div></td>
								</tr>
							</table>
						</center>										
						<p>		

						<div class="title">MT-04 Cruiser Race</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-04.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									The first team to get its cruiser to the other team's jump node wins!
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each enemy cruiser is worth equal points.  There is no bonus for destroying the enemy's cruiser first.  A team will receives a bonus if their ship sucessfully departs from the sector.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>				
						
						<div class="title">MT-05a Close Quarters</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-05.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Destroy the other team's Shivan corvette before they destroy yours.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each corvette is worth equal points. The first team to destroy the enemy's corvettes receives a bonus. The value of the individual fighters is negligible compared to the bonus.  	
									</div></td>
								</tr>
							</table>
						</center>										
						<p>							
						
						<div class="title">MT-06 Nowhere to Run</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-06.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission -- no obstacles, no nebula, no excuses.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes.  After six minutes, the team in the lead receives a bonus.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>			
						
						<div class="title">MT-07 Ganymede Redux</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-07.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team furball in and around a Ganymede installation.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes.  After six minutes, the team in the lead receives a bonus.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>		
						
						<div class="title">MT-08 Stealth vs. AWACS 1</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-08.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team stealth mission with AWACS.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes. After six minutes, the team in the lead receives a bonus. The value of the individual fighters is negligible compared to the bonus. Little points are awarded for the destruction of the AWACS.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>				
						
						<div class="title">MT-09 Team Chaos</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-09.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission in an electrostatically charged nebula.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes.  After six minutes, the team in the lead receives a bonus.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>				
						
						<div class="title">MT-10 Ganymede Showdown</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										<img src="../images/missions/mt-10.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission around a Ganymede repair facility.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes.  After six minutes, the team in the lead receives a bonus.  The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>										
						<p>			
						


<!--- ADDED 9/21/00 --->
					<div class="title">MT-11 Aeolus Duel</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										 
										<img src="../images/missions/mt-11.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									2 Aeolus Cruisers and their escorts tangle in a battle to the finish. Max. Respawns 10. Recommended 6.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Cruisers are worth equal points, bonus given to team that gets Cruiser first. Also an AWAC for each side with a bonus for first AWAC killed. Both AWACS worth equal points Added Stealth fighters and bombers, to compliment AWACS.
									</div></td>
								</tr>
							</table>
						</center>
						<p>		
					<div class="title">MT-12 Fighter Mayhem</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mt-12.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission -- All fighters, no bombers, no obstacles, no fighter suppression (Fish, EMP ect.), no excuses.  
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes. After six minutes, the team in the lead receives a bonus. The value of the individual fighters is negligible compared to the bonus.					
									</div></td>
								</tr>
							</table>
						</center>
						<p>			
					<div class="title">MT-13 Bomber Mayhem</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mt-13.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission -- All bombers, no fighters, no obstacles, no nebula, no excuses.  
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes. After six minutes, the team in the lead receives a bonus. The value of the individual fighters is negligible compared to the bonus. 		
									</div></td>
								</tr>
							</table>
						</center>
						<p>		
					<div class="title">MT-14 Aspect Lock</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mt-14.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission -- no obstacles, no nebula, No fire and forget, no excuses.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes. After six minutes, the team in the lead receives a bonus. The value of the individual fighters is negligible compared to the bonus. 
									</div></td>
								</tr>
							</table>
						</center>
						<p>		
					<!---<div class="title">MT-15 Primary Mayhem</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mt-15.jpg" width=240 height=180 alt="" border="0">
									</td>
								</tr>
								<tr>
									<td><div class="copy">
									Team vs. team mission --  Fighters and Primaries only, no obstacles, no nebula, no excuses.<br>
									<i>(Recommended for use only on a Dedicated Server or with High Speed Internet Connections when using for Squad War)</i>
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									A race to the most kills in six minutes. After six minutes, the team in the lead receives a bonus. The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>
						<p>	--->
					<div class="title">MT-16 Stealth vs. Awac 2</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mt-16.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
										Team vs. team stealth mission with AWACS 2. An expansion of the original Stealth vs. Awac mission.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Similar to the original MT-08.
									</div></td>
								</tr>
							</table>
						</center>
						<p>		
					<div class="title">MAL-SD Sobek Duel</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mal-sd.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
										Team vs. team mission in which two DRN corvettes and their escorts tangle in a battle to the finish. Max respawns 10. Recommended respawns 6.  
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each corvette is worth equal points. The first team to destroy the enemy's corvette receives a bonus. The value of the individual fighters is negligible compared to the bonus.
									</div></td>
								</tr>
							</table>
						</center>
						<p>						
					<div class="title">MAL-ST Stealth Tag</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/mal-st.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
										Team vs. team mission in which two teams play Tag in stealth fighters.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									4 Aeolus cruisers loaded with Anti-fighter beams (6), and 2 AWACs providing limited coverage stand watch as two teams play Hide and Tag with each other, more points are awarded for Tagging a fighter (only once per fighter) then actually Killing it.
									</div></td>
								</tr>
							</table>
						</center>
						<p>
					<div class="title">gldm-HnS Hide-n-Seek</div>
						<center>
							<table width="95%">
								<tr>
									<td><div class="copy"><b>Description:</b></div></td>
									<td rowspan="4">
										
										<img src="../images/missions/gldm-hns.jpg" width=240 height=180 alt="" border="0">
										<!---
										&nbsp; --->
									</td>
								</tr>
								<tr>
									<td><div class="copy">
										Two deep recon fleets play hide and seek in a dense, asteroid strewn nebula.
									</div></td>
								</tr>
								<tr>
									<td><div class="copy"><b>Specifics:</b></div></td>
								</tr>
								<tr>
									<td><div class="copy">
									Each corvette is worth equal points. Each AWAC is worth equals points.  The value of individual fighters is negligible compared to points awarded for desctruction of the corvette and AWAC.
									</div></td>
								</tr>
							</table>
						</center>
						<p>																																									
<!--- END ADDED 9/21/00 --->																																																							
				</div>				
			</td></tr></table>			
		</center>					
							
				<!--- END MAIN PAGE INFO --->
<cfinclude template="#relativepath#doc_bot.cfm">

<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfquery datasource="#currentdatasource#" name="quick_check_entry_nodes_challenge">
	SELECT *
	FROM SWMatches
	WHERE (SWSquad1 = #session.squadid#) AND (league_ID = #leagueid#)
</cfquery>	

<cfif (quick_check_entry_nodes_challenge.recordcount IS 0) AND (session.challenging IS 1)>
<!--- --->										
							<cfquery name="matches" datasource="#currentdatasource#">
							SELECT *
							FROM SWMatches
							</cfquery> 

									<cfquery name="sector" datasource="#currentdatasource#">
										SELECT *
										FROM SWSectors
										WHERE SectorName = '#left(form.challenge_sector,Find(',',form.challenge_sector)-1)#'
									</cfquery>
								
									<cfset seed=Year(Now()) & Month(Now()) & Day(Now()) & Hour(Now()) & Minute(Now()) & Second(Now())>
									<CFSET r=Randomize(seed)>
									<CFSET code='#session.squadid#' & '#RandRange(0,99999)#'>
									<p>
			   <!---
									<cfoutput>
									#Right(Form.challenge_sector,Evaluate(Len(form.challenge_sector) - Find(',',form.challenge_sector)))#<p>
									#left(form.challenge_sector,Find(',',form.challenge_sector)-1)#<p>
													
									</cfoutput>
				--->

				
									<cfquery name="checkforsectoralreadyintable" datasource="#currentdatasource#">
										SELECT *
										FROM SWMatches
										WHERE SWSector_ID = #left(form.challenge_sector,Find(',',form.challenge_sector)-1)#	
									</cfquery>
							
									<cfif checkforsectoralreadyintable.recordcount IS 0>
									
									<cfquery datasource="#currentdatasource#">
									INSERT INTO SWMatches(SWCode,SWSquad1,SWSquad2,SWSector_ID,League_ID)
												Values(
													'#code#'
													,#session.squadid#
													,#Right(Form.challenge_sector,Evaluate(Len(form.challenge_sector) - Find(',',form.challenge_sector)))#
													,#left(form.challenge_sector,Find(',',form.challenge_sector)-1)#													
													,#form.leagueid#
													)
									</cfquery>

									<cfquery datasource="#currentdatasource#">
									INSERT INTO SWMatches_info(SWCode,time_created)
												Values(
													'#code#'
													,#Now()#												
													)
									</cfquery>										
								
									Your match code is: <cfoutput>#code#</cfoutput> 
									
									<cfelse>
									
									<cfset message='Someone has already challenged for this sector.'>
									<cfset session.challenging=0>
									<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
									</cfif>

<cfquery datasource="squadwar" name="get_challenger_squad">
	SELECT *
	FROM SWSquads
	WHERE SquadID = #session.squadid#
</cfquery>

<cfquery datasource="squadwar" name="get_challenger_squad_info">
	SELECT *
	FROM SWSquad_Info
	WHERE SquadID = #session.squadid#
</cfquery>

<cfquery datasource="squadwar" name="get_challenged_squad">
	SELECT *
	FROM SWSquads
	WHERE SquadID = #Right(Form.challenge_sector,Evaluate(Len(form.challenge_sector) - Find(',',form.challenge_sector)))#
</cfquery>

<cfquery datasource="squadwar" name="get_challenged_squad_info">
	SELECT *
	FROM SWSquad_Info
	WHERE SquadID = #Right(Form.challenge_sector,Evaluate(Len(form.challenge_sector) - Find(',',form.challenge_sector)))#
</cfquery>
									
<cfmail to="#get_challenger_squad_info.squad_email#" from="squadwar@pxo.net" subject="SquadWar:Challenge - Your Squad has challenged." server="v-exchange.volition.net">
										
Your Squad has issued a challenge for sector #left(form.challenge_sector,Find(',',form.challenge_sector)-1)#.

Please visit the scheduling page available on your Squad Management page to propose times for the match.  

You have 24 hours to complete the first phase of this match.

You can reach your Squad Management page by clicking on the link in the menu on the left side of the page called "Admin Squad".  You can reach the scheduling page by clicking on the link titled "View pending matches for this squad and schedule matches" available on the Squad Management page.

After your Squad proposes times, your opponent will choose one, offer an alternative time, and set battle conditions.

Your squad will then pick the final match time.

Your match code is: #code#
Your opponent is: #get_challenged_squad.SquadName#
Your opponent's email is: #get_challenged_squad_info.squad_email#

Please contact me if you have any difficulties or questions.


- Nathan Camarillo
- SquadWar Administrator
- squadwar@pxo.net
										
</cfmail>		

<cfmail to="#get_challenged_squad_info.squad_email#" from="squadwar@pxo.net" subject="SquadWar:Challenge - Your Squad has been challenged." server="v-exchange.volition.net">
										
Your Squad has been challenged for sector #left(form.challenge_sector,Find(',',form.challenge_sector)-1)#.

You will be contacted when your opponent has proposed times on the scheduling page. 

Your opponent has 24 hours to complete Phase 1.

After this has been completed you may set the battle conditions and offer an alternative match time.  Please visit the scheduling page available on your Squad Management page.  You can reach your Squad Management page by clicking on the link in the menu on the left side of the page called "Admin Squad".  You can reach the scheduling page by clicking on the link titled "View pending matches for this squad and schedule matches" available on the Squad Management page.

Your opponent's squad will pick the final match time. 

Your match code is: #code#
Your opponent is: #get_challenger_squad.SquadName#
Your opponent's email is: #get_challenger_squad_info.squad_email#

Please contact me if you have any difficulties or questions.

- Nathan Camarillo
- SquadWar Administrator
- squadwar@pxo.net
		
</cfmail>	

<cfmail to="squadwar@pxo.net" from="squadwar@pxo.net" subject="SquadWar:Challenge - Match #code# created" server="v-exchange.volition.net">
Match code is: #code# 
Challenger: #get_challenger_squad.SquadName#
Challenger's Email: #get_challenger_squad_info.squad_email#
Defender: #get_challenged_squad.SquadName#
Defender's Email: #get_challenged_squad_info.squad_email#

Battle is for dispute of Sector #left(form.challenge_sector,Find(',',form.challenge_sector)-1)#
</cfmail>	
				
									
									<cfset message='You have just created a challenge.  Your match code is: #code#'>
									<cfset session.challenging=0>
									<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
							

							</div>
<!--- --->						
<cfelse>
		<cfset message='Do not be lame.'>
		<cfset session.challenging=0>
		<cflocation url="squadlogin_validate.cfm?leagueid=#form.leagueid#&message=#URLEncodedFormat(message)#">
</cfif>


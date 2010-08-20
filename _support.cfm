<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

<cfmail to="support@pxo.net" from="#form.email#" subject="#form.name# : #form.product#" server="v-exchange.volition.net">

I used the form at the PXO.net website and submitted the following problem:

#form.description#

This is a description of my computer:

#form.cpu#

Thanks!

</cfmail>

<div class="copy">
	<h3>Your mail has been sent!</h3><p>
	<a href="http://www.pxo.net/">Return to PXO.net</a>
</div>
		
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_support.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">



<!---
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
--->
<cfinclude template="variables.cfm">
<cfinclude template="doctop.cfm">
<!--- Page info goes here	 --->			

	<div class="newsitemtitle">Welcome to Tech Support:</div>



	<div class="copy">
	<FONT COLOR="BBBBBB">
	Having problems?  Have a question about PXO?  The list of Frequently Asked Questions (FAQ) below may have the
	answers you need.<P>
	<ul>
		<li><a href="faq_pxo.cfm">General PXO FAQ</a>
		<li><a href="faq_d3.cfm">Descent 3 FAQ</a>
		<li><a href="faq_fs2demo.cfm">FreeSpace 2 Demo FAQ</a>
		<li><a href="faq_fs.cfm">FreeSpace and Silent Threat FAQ</a>
	</ul>
	
	
	If you still need assistance, the best way to receive prompt answers to your questions/problems is to email using the form below.
	If you are having problems using the email form, please write to <A HREF="mailto:support@parallaxonline.com">support@pxo.net</a> for PXO help, <a href="mailto:fs2demo@volition-inc.com">fs2demo@volition-inc.com</a> for all help with the <b>FreeSpace 2 Demo</b>.
	The technicians at Volition and Outrage will do their best to resolve your problems with PXO quickly.<p>
	<p>
	If you're having problems with the non-multiplayer portions of Descent 3 or Descent: FreeSpace - The Great War, please contact Interplay directly at <a href="http://www.interplay.com">www.interplay.com</a>.<P>
	PXO is solely operated by Volition and Outrage, please do not contact Interplay Support with questions/problems
	using Parallax Online.<P>

<p>
	<CFFORM ACTION="_support.cfm" METHOD="POST">
	<P>
	
	<table>
		<tr>
			<td align="right">
				<div class="copy"><b>First and Last Name:</b></div>
			</td>
			<td align="left">
				<div class="copy"><cfinput type="Text" name="name" size="25" maxlength="75" required="yes"  message="You must enter your First Name and Last Name"></div>
			</td>
		</tr>
		<tr>
			<td align="right">
				<div class="copy"><b>Email Address:</b></div>
			</td>
			<td align="left">
				<cfINPUT TYPE="text" SIZE="25" NAME="email" MAXLENGTH="100" required="yes" message="You must enter a valid email address.">
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">
				<div class="copy"><b>Product:</b></div>
			</td>
			<td align="left">
				<select name="product">
					<option value="PXO" selected>General PXO Help					
					<option value="PXOD3">PXO Descent 3 Help
					<option value="PXOD3D">PXO Descent 3 Demo Help
					<option value="PXOFS2">PXO FreeSpace 2 Help
					<option value="FS2Demo">PXO FreeSpace 2 Demo Help
					<option value="PXOFSST">PXO FreeSpace 1 Products Help
					<option value="D3">Descent 3
					<option value="D3Demo">Descent 3 Demo
					<option value="FS2Demo">FreeSpace 2 Demo
					<option value="FSST">FreeSpace 1 Products
				</select>
				<input type="hidden" name="product_required" value="You must enter a description.">
			</td>
		</tr>			
		<tr>
			<td align="right" valign="top">
				<div class="copy"><b>Description of Problem:</b></div>
			</td>
			<td align="left">
				<textarea name="description" cols="45" rows="10" wrap="VIRTUAL"></textarea>
				<input type="hidden" name="description_required" value="You must enter a description.">
			</td>
		</tr>		
		<tr>
			<td align="right" valign="top">
				<div class="copy"><b>Description of Computer:</b></div>
			</td>
			<td align="left">
				<textarea name="cpu" cols="45" rows="5" wrap="VIRTUAL"></textarea>
				<input type="hidden" name="cpu_required" value="You must enter a description.">
			</td>
		</tr>												
	</table>
	<p>
	<INPUT TYPE="SUBMIT" VALUE="Send to Support">
	<P>
	</cfform>
	
	</div>

	
			
<!--- End page info --->	
<cfinclude template="docmid.cfm">


<cfinclude template="menus/menu_support.cfm">
	
<!--- end menus --->
<cfinclude template="docbot.cfm">



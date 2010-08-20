<!--
   Copyright (C) Volition, Inc. 2005.  All rights reserved.

   All source code herein is the property of Volition, Inc. You may not sell 
   or otherwise commercially exploit the source or things you created based on the 
   source.
-->

<!---
		Call this with CF_MailTest.  Set the parameter "EMail" equal to the address
		you want to check.  This function will set two variables - "EMail_Level" and "EMail_Message"
		with an error level and a friendly error message, respectively.
--->

<CFSET EMail = Attributes.EMail>

<CFIF #EMail# is "">
	<CFSET #Caller.EMail_Level# = "1">
	<CFSET #Caller.EMail_Message# = "No e-mail address was supplied.">
<CFELSEIF #FindNoCase('@',EMail)# is 0>
	<CFSET #Caller.EMail_Level# = "2">
	<CFSET #Caller.EMail_Message# = "No @ sign detected.  An @ sign is part of every e-mail address.">
<CFELSEIF #Right(EMail,1)# is "@">
	<CFSET #Caller.EMail_Level# = "3">
	<CFSET #Caller.EMail_Message# = "An @ sign cannot be the last character of the e-mail address.">
<CFELSEIF #Left(EMail,1)# is "@">
	<CFSET #Caller.EMail_Level# = "4">
	<CFSET #Caller.EMail_Message# = "An @ sign cannot be the first character of the e-mail address.">
<CFELSEIF #FindNoCase('@',EMail,(FindNoCase('@',EMail) + 1))# is not 0>
	<CFSET #Caller.EMail_Level# = "5">
	<CFSET #Caller.EMail_Message# = "A valid e-mail address contains only one @ sign.">
<CFELSEIF #FindNoCase('.',Email)# is 0>
	<CFSET #Caller.EMail_Level# = "6">
	<CFSET #Caller.EMail_Message# = "No period detected.  An e-mail address contains at least one period.">
<CFELSEIF #Right(EMail,1)# is ".">
	<CFSET #Caller.EMail_Level# = "7">
	<CFSET #Caller.EMail_Message# = "The last character of the e-mail address cannot be a period.">
<CFELSEIF #Left(EMail,1)# is ".">
	<CFSET #Caller.EMail_Level# = "8">
	<CFSET #Caller.EMail_Message# = "The first character of the e-mail address cannot be a period.">
<CFELSEIF #FindNoCase(',',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "9">
	<CFSET #Caller.EMail_Message# = "A valid e-mail address cannot contain a comma.  If you have a Compuserve account, substitute a period for the comma in your Compuserve ID, like so: <B>12345.6789@compuserve.com</B>.">
<CFELSEIF #FindNoCase(' ',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "10">
	<CFSET #Caller.EMail_Message# = "You cannot have a space as part of a single e-mail address.">
<CFELSEIF #FindNoCase('*',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "11">
	<CFSET #Caller.EMail_Message# = "You cannot have an asterisk in an e-mail address.">
<CFELSEIF #FindNoCase(')',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "12">
	<CFSET #Caller.EMail_Message# = "You cannot have a close parenthesis sign in an e-mail address.">
<CFELSEIF #FindNoCase('(',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "13">
	<CFSET #Caller.EMail_Message# = "You cannot have an open parenthesis sign in an e-mail address.">
<CFELSEIF #FindNoCase(CHR(62),EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "14">
	<CFSET #Caller.EMail_Message# = "You cannot have a greater than sign in an e-mail address.">
<CFELSEIF #FindNoCase(CHR(60),EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "15">
	<CFSET #Caller.EMail_Message# = "You cannot have a less than sign in an e-mail address.">
<CFELSEIF #FindNoCase(':',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "16">
	<CFSET #Caller.EMail_Message# = "You cannot have a colon in an e-mail address.">
<CFELSEIF #FindNoCase(';',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "17">
	<CFSET #Caller.EMail_Message# = "You cannot have a semicolon in an e-mail address.">
<CFELSEIF #FindNoCase(CHR(34),EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "18">
	<CFSET #Caller.EMail_Message# = "You cannot have a double quote in an e-mail address.">
<CFELSEIF #FindNoCase('whitehouse.gov',EMail)# is not 0>
	<CFSET #Caller.EMail_Level# = "18">
	<CFSET #Caller.EMail_Message# = "You cannot have an e-mail address at whitehouse.gov.">	
<CFELSE>
	<CFSET #Caller.EMail_Level# = "0">
	<CFSET #Caller.EMail_Message# = "Good e-mail address.">
</CFIF>

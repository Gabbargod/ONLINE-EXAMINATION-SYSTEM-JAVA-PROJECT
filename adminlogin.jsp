<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT type="text/javascript">

window.history.forward();
function noBack() { window.history.forward(); }
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="img36.jpg" onLoad=document.f1.t1.focus()>
<form name="f1" method="post" action="adminlogin.jsp">
<CENTER>
<BR><BR><BR><BR><BR>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<th bgcolor="transparent" colspan=2>
<font face="Times New Roman" color=LIGHTgrey size=5 >ADMINISTRATOR LOGIN</FONT><BR></th>

<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>

<b>                 USER_ID              </b>
</font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="t1"  size=20 maxlength=20></td>
</tr>

<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>PASSWORD</b>
</font>
<input type="password" name="t2"  size=20 maxlength=20></td>
</tr>
<tr bgcolor="transparent">
<td valign=top > 
<input type="submit" name="b1" value="    LOGIN     ">
<input type="button" value="        EXIT      " onclick="location.href='page1.jsp'">
</tr>
</TABLE>
</CENTER>
</form>




<%
int flag=0;
String user=request.getParameter("t1");
String pass=request.getParameter("t2");
if(user!=" " && pass!=" ")
{
try{
if((user.equals("user")) && (pass.equals("pass")))
	response.sendRedirect("adminupdate.jsp");
else
{	%>
        	 <script language="javascript">
		     alert ("Invalid ID/Password");
		    
			</script>

        	 <%
}}catch(Exception e){}

}	
  

    
%>
</body>
</html>

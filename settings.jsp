<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="img36.jpg">
<form action="settings.jsp" method=post>
<center>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<BR><BR><BR><BR>
<th bgcolor="transparent" colspan=2>
<font size=10 face="Times New Roman" color=LIGHTgrey>SETTINGS </font>
<br>
</th>
 
<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>TIME DURATION</b>
</font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="t1" value=""  id="txt1" size=20 maxlength=20></td></tr>
<TR><td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>POSITIVE MARKS</b>
</font>
 &nbsp;&nbsp;&nbsp;<input type="text" name="t2" value="" size=20 maxlength=20></td>
</tr>

<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>NEGATIVE MARKS</b>
</font>
<input type="text" name="t3" value="" size=20 maxlength=10></td>

<tr bgcolor="transparent">
<td align=center colspan=2>
<input type="SUBMIT" value="SUBMIT">


<%
String td=request.getParameter("t1");
String pm=request.getParameter("t2");
String nm=request.getParameter("t3");


if(!(td==" " && pm==" "  && nm==" "))
{


     try{
    	 int x1=Integer.parseInt(td);
    	 int x2=Integer.parseInt(pm);
    	 int x3=Integer.parseInt(nm);
    	
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
    
    st.executeQuery("update sett set time="+x1+",pmarks="+x2+",nmarks="+x3+"where setno = 1");
    
    
    %>
	<script language=javascript>
	alert("Updated successfully!!");
	</script>
	<% 

}catch(Exception e1)
{
	
}
}
%>


<input type="button" value="   EXIT     " onclick="location.href='adminupdate.jsp'">

</tr>

</table>
</center>
 </form>
</body>

</html>

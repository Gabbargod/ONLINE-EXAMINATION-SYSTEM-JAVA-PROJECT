<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="img36.jpg">
<form action="adminupdate.jsp" name="f1" method=post>
<br><br><br><br>
<center>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<th bgcolor="transparent" colspan=2>
<font face="Times New Roman" color=LIGHTGREY size=5>ADMINISTRATOR</FONT><BR></th>

<tr bgcolor="transparent">
<td valign=top > 
<input type="button" value="STUDENT INFO" onclick="location.href='studentregistration.jsp'" ><br><BR>
<input type="button" value="    QUESTIONS    " onclick="location.href='question.jsp'"><br><BR>
<input type="button" value="INSTRUCTIONS" onclick="location.href='.jsp'" ><br><BR>
<input type="button" value="      SETTINGS     " onclick="location.href='settings.jsp'" ><br><BR>
<input type="SUBMIT" value="RESET RECORD" name="submit" ><br><BR>
<input type="button" value="       LOGOUT        " onclick="location.href='page1.jsp' "  >
<%
String s=request.getParameter("submit");
try{
	 if(s.equals("RESET RECORD"))
	 {%> 
	 <script language="javascript">
			
			var b=confirm ("Do You Confirm ");		
			if(b==1)
			{
			<%
	
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
			Statement st=con.createStatement();
			String query="delete from result ";
			 st.executeUpdate(query);
			%>
			  alert("Deleted");
			}
	</script>
			<% 
	}
	 }
catch(Exception e1)
{
}
%>
</td>
</tr>
</table>
</center>
</form>
</body>
</html>


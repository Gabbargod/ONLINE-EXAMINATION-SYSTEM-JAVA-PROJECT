<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<body background="img36.jpg">
<font face="Times New Roman" color=LIGHTYELLOW size=5 >


<CENTER>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<BR><BR><BR><BR>
<th bgcolor="transparent" colspan=2>
<font face="Times New Roman" color=LIGHTGREY size=7>
RESULT<BR></font></th>
<%
try{
	int i=0,marks=0,ta=0,flag=0;
	Object s3=session.getAttribute("user");
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil"); 
     Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     ResultSet rs1=st.executeQuery("select * from sett");
     rs1.next();
     String x=rs1.getString(4);
     ResultSet rs=st.executeQuery("select * from attempt");
    while(rs.next())
 	{
 		ta=ta+1;
 		if(x.equals(rs.getString(4)))
 			{
 				i=i+1;
 			}
 		marks=marks+Integer.parseInt(rs.getString(4));
 	}
     st.execute("insert into result values("+s3+","+ta+","+i+","+marks+")"); 
     out.println("<tr><td>NUMBER OF QUESTIONS ATTEMPTED:<td><B>"+ta+"</B></tr>");
 	out.println("<tr><td>NUMBER OF CORRECT ANSWERS    :<td><B>"+i+"</B></tr>");
 	out.println("<tr><td>TOTAL MARKS OBTAINED         :<td><B>"+marks+"</B></tr>");
 	st.execute("delete from attempt");
}catch(Exception e1)
{}%>


<tr bgcolor="transparent">
<td align=center colspan=2><input type="button" value="        CLOSE             " onclick="window.close()"></tr>



</table>
</CENTER>
</font>
</body>
</html>



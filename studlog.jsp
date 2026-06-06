<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page language ="java" import="java.sql.*" %>
<html>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body background="img36.jpg" onLoad=document.f1.t1.focus()>
<form name="f1" method="post">
<CENTER>
<BR><BR><BR><BR><BR>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<th bgcolor="transparent" colspan=2>
<font face="Times New Roman" color=LIGHTgrey size=5 ><B>STUDENT LOGIN</B></FONT><BR></th>
<tr bgcolor="transparent">
<td valign=top align =left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
USER_ID
</font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="t1" value="" size=20 maxlength=20></td>
</tr>

<tr bgcolor="transparent">
<td valign=top align =left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
PASSWORD
</font>
<input type="password" name="t2" value="" size=20 maxlength=20></td>
</tr>

<tr bgcolor="transparent">
<td valign=top> 
<input type="submit" name="b1" value="LOGIN">
<input type="button" value="EXIT" onclick="location.href='page1.jsp'">
</tr>


</TABLE>
</CENTER>

<%
String user=request.getParameter("t1");
String pass=request.getParameter("t2");
if(user!=" " && pass!=" ")
	 {
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
     
     ResultSet rs=st.executeQuery("select * from student");
     while(rs.next())
         {      
         String username=rs.getString(1);
         int stud_id=Integer.parseInt(username);
         String password=rs.getString(4);
        String name=rs.getString(2);
         if(user.equals(username) && pass.equals(password))
             {	
        		 ResultSet rs1=st.executeQuery("select * from result where stud_id="+stud_id);
        		 if(!rs1.next())
        		 {
        	 	session.setAttribute("user",user);
             	session.setAttribute("name",name);

 %>
             <jsp:forward page="instructions.jsp" />
             <input type=hidden name=user value=<%= username %>>
         
 <%       	 	 }
        		 else
        		 {
        			 %>
                	 <script language="javascript">
        		     alert ("ID ALREADY ENTERED");
        		     
        			</script>

                	 <%
              
        		 }
        	}
         
         
         }
        	 %>
        	 <script language="javascript">
		     alert ("Invalid ID/Password");
		     
			</script>

        	 <%
     
  
    
     
}catch(Exception e1)
{
		
}
     }
%>

</body>
</html>

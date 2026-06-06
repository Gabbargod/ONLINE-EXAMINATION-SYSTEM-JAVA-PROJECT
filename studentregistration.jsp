<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body background="img36.jpg">
<%!public int flag=0;%>
<form action="studentregistration.jsp" name="f1" method=post>
<center>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<BR><BR><BR><BR>
<th bgcolor="transparent" colspan=2>
<font size=10 face="Times New Roman" color=LIGHTgrey>STUDENT REGISTRATION </font>
<br>
</th>
 
<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>STUDENT_ID</b>
</font>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="t2" value="" size=20 maxlength=20></td>
<td valign=top align=left> <font size=5 face="Times New Roman" color=LIGHTYELLOW><b>NAME</b>
</font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="t1" value=""  id="txt1" size=20 maxlength=20></td>

</tr>

<tr bgcolor="transparent">
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>CONTACT NO.</b>
</font>
<input type="text" name="t3" value="" size=20 maxlength=10></td>
<td valign=top align=left> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>PASSWORD</b>
</font>
<input type="text" name="t4" value="" size=20 maxlength=20></td>


<tr bgcolor="transparent">
<td align=center colspan=2>
<input type="SUBMIT" value="SUBMIT" name="submit" >
<input type="submit" value="SEARCH" name="submit">
<input type="SUBMIT" value="DELETE"name="submit" >
<input type="SUBMIT" value="UPDATE"name="submit">
<%
String s=request.getParameter("submit");
String name=request.getParameter("t1");
String id=request.getParameter("t2");
String phone=request.getParameter("t3");
String pwd=request.getParameter("t4");



	

 try{
	 
   	 if(s.equals("SUBMIT"))
    	 {
    		 if(id!="" && name!=""  && phone!=""   && pwd!= "")
    		 	{
     				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     				Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     				Statement st=con.createStatement();
    				String sql="insert into student values("+id+",'"+name+"',"+phone+",'"+pwd+"')";
    				st.execute(sql);
    				%>
    				<script language=javascript>
    				alert("Inserted Sucessfully");
    				</script>
    				<% 
    	 		}
    		 else
    			{
    			 %>
    			    <script language=javascript>
    			    alert("Enter All Entries");
    			    </script>
    		    <% 
    			 }
    	}
   }
catch(Exception e1)
{

}





if(!(id==" "))
{


     try{
    	 if(s.equals("DELETE"))
    	 {%> 
    	 <script language="javascript">
    			
    			var b=confirm ("Do You Confirm ");		
    			if(b==1)
    			{
    			<%
    	
    			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     			Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     			Statement st=con.createStatement();
    			String query="delete from student where stud_id="+id;
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
}



if(!(id==" "))
{


     try{
    	 if(s.equals("SEARCH"))
    	 {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from student where stud_id="+id);
        	if(rs.next())
             {	
           		%>
        		<script language="javascript">
        		alert("search found");
        		document.f1.t2.value="<%=rs.getString(1)%>";
        		document.f1.t1.value="<%=rs.getString(2)%>";
        		document.f1.t3.value="<%=rs.getString(3)%>";
        		document.f1.t4.value="<%=rs.getString(4)%>";
        		
        		</script>
        		<%
        	}
        	else
         {
        		%>
        		<script language="javascript">
        		alert("Record not found");
        		</script>
        		<%
         }
    	}
    	 }
catch(Exception e1)
{
}
}



if(!(name==" " && id==" "  && phone==" "  && pwd== " "))
{


     try{
    	 if(s.equals("UPDATE"))
    	 {
    
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
    String query="update student set stud_id="+id+",stud_name='"+name+"',phone="+phone+",pwd='"+pwd+"'where stud_id="+id;
     st.executeUpdate(query);
     %>
		<script language=javascript>
		alert("Updated Sucessfully");
		</script>
		<% 
    	 }
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

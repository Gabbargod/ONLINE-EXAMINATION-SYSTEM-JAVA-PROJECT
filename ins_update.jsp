
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="img36.jpg">
<form action="ins_update.jsp" name="f1" method=post>
<center>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent" style="position:absolute;left:30px;top:25px" width=500 height=400>

<th bgcolor="transparent" colspan=2>
<font size=10 face="Times New Roman" color=LIGHTgrey>INSTRUCTIONS</font>
<br>
</th>
 
<tr bgcolor="transparent">
<td valign=top ALIGN="LEFT"> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>SR. NO.</b>
</font>
<input type="text" name="t1" value=""  id="txt1" size=3 maxlength=3><BR><BR><BR>.


<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>INSTRUCTION</b>
</font>
<br><TEXTAREA name="t2" rows=5 cols=60 Wrap=true> </TEXTAREA></td>
</tr>


<tr bgcolor="transparent">
<td align=center colspan=2>
<input type="SUBMIT" value="SUBMIT" name="submit" >
<input type="SUBMIT" value="DELETE"name="submit" >
<input type="SUBMIT" value="UPDATE"name="submit">
<%
String s=request.getParameter("submit");

String id=request.getParameter("t1");
String inst=request.getParameter("t2");



//int ans2=Integer.parseInt(ans);	
try{
    	 
   if(s.equals("SUBMIT"))
    	 {
    	 	if(id!=null && inst!=null )
    	 		{
    		 		//int qid2=Integer.parseInt(qid);
     				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    				 Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
    				 Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    				 String query1="insert into rule values('"+inst+"',"+id+")";
    				 st.executeUpdate(query1);
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
    	 	alert("Enter All Enteries");
    	 	</script>
    	 	<%	
    	 	}
    	 	
    	 } 	
   }catch(Exception e1)
{}






if(!( id==" " ))
{


     try{
    	 if(s.equals("SEARCH"))
    	 {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from rule where ins_id="+id);
    	if(rs.next())
         {	
         	
    		%>
    		<script language="javascript">
    		alert("search found");
    		document.f1.t1.value=<%=rs.getString(2)%>;
    		document.f1.t2.value=<%=rs.getString(1)%>;
    	
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
}catch(Exception e1)
{
}
}





 if(!(id==" " &&  inst== " "))
{


     try{
    	 if(s.equals("UPDATE"))
    	 {
    
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
    String query="update rule set ins_id="+id+",inst='"+inst+"'where ins_id="+id;
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


if(!(id==" "))
{


     try{
    	 if(s.equals("DELETE"))
    	 {
    		 %> 
        	 <script language="javascript">
        			
        			var b=confirm ("Do You Confirm ");		
        			if(b==1)
        			{
        					<%
       					 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     						Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
						Statement st=con.createStatement();
						String query="delete from rule where ins_id="+id;
						st.executeUpdate(query);
						%>
	  					alert("Deleted");
					}
			</script>
    		<% 
    	 }
}catch(Exception e1)
{
}
}

%>

<input type="button" value="   EXIT     " onclick="location.href='adminupdate.jsp'">

</td>
</tr>

</table>
</center>
<font face="Times New Roman" color=LIGHTYELLOW size=5 >
<TABLE border=10  style="position:absolute;left:660px;top:25px " width=600>
<%Object s3=session.getAttribute("name"); %>




<%


     try{
    
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from rule order by ins_id");
     while(rs.next())
         {
  %>
<tr>
<%        
    		out.println("<td>"+rs.getString(2));
    		out.println( "<td>"+rs.getString (1));
%>
</tr>
 <%   	
 		}
}catch(Exception e1)
{}


%>

</TABLE>
</font>

 </form>
</body>
</html>



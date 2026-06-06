<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%!public int i=1;%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body background="img36.jpg">
<form action="question.jsp" name="f1" method=post>
<center>
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent">
<BR><BR><BR><BR>
<th bgcolor="transparent" colspan=2>
<font size=10 face="Times New Roman" color=LIGHTgrey>QUESTION BANK</font>
<br>
</th>
 
<tr bgcolor="transparent">
<td valign=top> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>Q.NO.</b>
</font>
<input type="text" name="t1" value=""  id="txt1" size=3 maxlength=3></td>
<td valign=top> 
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>AUTHOR</b>
</font>
<input type="text" name="t2" value="" size=30 maxlength=30></td>
</tr>

<tr bgcolor="transparent">
<td align=center colspan=2>
<font size=5 face="Times New Roman" color=LIGHTYELLOW>
<b>QUESTION</b>
</font>
<br><TEXTAREA name="t3" rows=5 cols=100 Wrap=true> </TEXTAREA></td>
</tr>
<tr bgcolor="transparent">
<td align=center colspan=2>
<input type='radio' name='o1' value=1>1
<input type="text" name="t4" value="" size=40 maxlength=40><br>
<input type='radio' name='o1'value=2>2
<input type="text" name="t5" value="" size=40 maxlength=40><br>
<input type='radio' name='o1'value=3>3
<input type="text" name="t6" value="" size=40 maxlength=40><br>
<input type='radio' name='o1'value=4>4
<input type="text" name="t7" value="" size=40 maxlength=40>
</td>
</tr>

<tr bgcolor="transparent">
<td align=center colspan=2>
<input type="SUBMIT" value="SUBMIT" name="submit" >
<input type="submit" value="SEARCH" name="submit">
<input type="SUBMIT" value="DELETE"name="submit" >
<input type="SUBMIT" value="UPDATE"name="submit">
<%
String s=request.getParameter("submit");

String qid=request.getParameter("t1");
String author=request.getParameter("t2");
String quest=request.getParameter("t3");
String op1=request.getParameter("t4");
String op2=request.getParameter("t5");
String op3=request.getParameter("t6");
String op4=request.getParameter("t7");
String ans=request.getParameter("o1");


//int ans2=Integer.parseInt(ans);	
try{
    	 
   if(s.equals("SUBMIT"))
    	 {
    	 	if(qid!=null && author!=null  && quest!=null && op1!=null && op2!=null && op3!=null && op4!=null && ans!=null)
    	 		{
    		 		//int qid2=Integer.parseInt(qid);
     				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    				 Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
    				 Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    				 String query1="insert into question values("+qid+",'"+quest+"',"+ans+",'"+author+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"')";
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
			  alert("Enter all entries");
			    </script>
		    <% 
			 }
    	 }
}catch(Exception e1)
{out.println(e1);}






if(!( qid==" " ))
{


     try{
    	 if(s.equals("SEARCH"))
    	 {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from question where q_id="+qid);
    	if(rs.next())
         {	
         	
    		%>
    		<script language="javascript">
    		alert("search found");
    		document.f1.t1.value="<%=rs.getString(1)%>";
    		document.f1.t3.value="<%=rs.getString(2)%>";
    		document.f1.t2.value="<%=rs.getString(4)%>";
    		document.f1.t4.value="<%=rs.getString(5)%>";
    		document.f1.t5.value="<%=rs.getString(6)%>";
    		document.f1.t6.value="<%=rs.getString(7)%>";
    		document.f1.t7.value="<%=rs.getString(8)%>";
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





 if(!(qid==" " && author==" "  && quest==" "  && op1== " "&& op2== " "&& op3== " "&& op4== " "&& ans== " "))
{


     try{
    	 if(s.equals("UPDATE"))
    	 {
    
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
     Statement st=con.createStatement();
    String query="update question set q_id="+qid+",ques='"+quest+"',ans="+ans+",author='"+author+"',op1='"+op1+"',op2='"+op2+"',op3='"+op3+"',op4='"+op4+"'where q_id="+qid;
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


if(!(qid==" "))
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
						String query="delete from question where q_id="+qid;
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
 </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%String t=request.getParameter("t");int t1=Integer.parseInt(t);%>
<script language="JavaScript">
var flag;
var secs;

function cd() {
 	mins = min; // change minutes here
 	secs = 0 + s(":01"); // change seconds here (always add an additional second to your total)
 	redo();
}

function m(obj) {
 	for(var i = 0; i < obj.length; i++) {
  		if(obj.substring(i, i + 1) == ":")
  		break;
 	}
 	return(obj.substring(0, i));
}

function s(obj) {
 	for(var i = 0; i < obj.length; i++) {
  		if(obj.substring(i, i + 1) == ":")
  		break;
 	}
 	return(obj.substring(i + 1, obj.length));
}

function dis(mins,secs) {
 	var disp;
 	if(mins <= 9) {
  		disp = " 0";
 	} else {
  		disp = " ";
 	}
 	disp += mins + ":";
 	if(secs <= 9) {
  		disp += "0" + secs;
 	} else {
  		disp += secs;
 	}
 	return(disp);
} 

function redo() {
 	secs--;
 	if(secs == -1) {
  		secs = 59;
  		mins--;
 	}
 	document.cd.disp.value = dis(mins,secs); // setup additional displays here.
 	if((mins == 0) && (secs == 0)) {
  		window.alert("Time is up. Press OK to continue."); // change timeout message as required
  		 window.location = "exam2.java" 
 	} else {
 		cd = setTimeout("redo()",1000);
 	}
}

function init() {
 
 
  cd();
  
}
document.onload = init;
</script>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
    
    function fun1()
    {
    //alert("previous");
    document.exam1.action="exam2?t=<%= t1%>&x=2";
    exam1.submit();
    }
    
    function fun2()
    {
    //alert("submit");
    exam1.submit();
    }
    
    function fun3()
    {
   // alert("next");
    document.exam1.action="exam2?t=<%= t1%>&x=3";
    exam1.submit();
    }
    
</SCRIPT>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%!public int i=1,qid=0,mark=0,x1=0,x2=0,min1=40;String s2=null;boolean flag=false;%>


</head>
<body background="img36.jpg">
 <script language="JavaScript">
 var min=19;
 </script>

<form name="cd">
<input id="txt" bgcolor="transparent" readonly="true" type="text" value="10:00" border="0" name="disp">

</form>
	
	

<form name="exam1" action="exam2?t=<%= t1 %>&x=1" method=post>
<center>
<font face="Times New Roman" color=LIGHTgrey size=5 >
<table cellpadding=8 cellspacing=8 border="10" bgcolor="transparent"> 
<BR><BR>

 




  
<% 
try{
    
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
    Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 	ResultSet rs=st.executeQuery("select * from question where q_id="+t1);
  	rs.next();
   	s2=rs.getString(3);
   	qid=Integer.parseInt(rs.getString(1));
   	Object s3=	session.getAttribute("user");
   	
   	out.println( "<tr> <td align=center >          <b>  AUTHOR</b>         :-"         + rs.getString(4) +"<td><B>TIME LEFT </B>:-<input id='txt' bgcolor=transparent readonly=true type=text value=10:00 border=0 name=disp></TR>");	
   	out.println( "<tr><td align=left  colspan=2>"+rs.getString(1) +"&nbsp;&nbsp;&nbsp;"     +   rs.getString(2)+"</tr>");
    out.println("<tr><td align=left colspan=2> <input type='radio' name='o1' value=1> 1." + rs.getString(5)+"<br><input type='radio' name='o1' value=2> 2." + rs.getString(6)+"<br><input type='radio' name='o1' value=3> 3." + rs.getString(7)+"<br><input type='radio' name='o1' value=4> 4." + rs.getString(8)+"</tr>" );
	
%>
<input type=hidden name=q_id value=<%= qid %>>
<input type=hidden name=ans value=<%= s2 %>>
<input type=hidden name=user value=<%= s3 %>>

<%
}catch(Exception e){}
   
    %>    
<tr bgcolor="transparent">
<td align=center colspan=2><input type=button value="     PREVIOUS    " onclick=fun1()>
 <input type=button value="      SUBMIT      " onclick=fun2()>
<input type=button value="          NEXT         " onclick=fun3()>
<input type=button value="        EXIT           " onclick="location.href='result.jsp'">

</table>
</font>
</center>
</form>
</body>
</html>


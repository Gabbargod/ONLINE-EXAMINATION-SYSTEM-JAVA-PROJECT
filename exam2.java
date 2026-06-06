import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*; 
import java.io.*; 
/**
 * Servlet implementation class for Servlet: exam2
 *
 */
 public class exam2 extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public exam2() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String x=request.getParameter("x");
		String t=request.getParameter("t");
		int t1=Integer.parseInt(t);
		if(x.equals("2"))
		{
			t1--;
			RequestDispatcher view = request.getRequestDispatcher("exam1.jsp?t="+t1);  
			 view.forward(request, response);  
		}
		else if(x.equals("3"))
		{
			t1++;
			RequestDispatcher view = request.getRequestDispatcher("exam1.jsp?t="+t1);  
			 view.forward(request, response);  
		}
		else
		{
			try
			{
				String s2=request.getParameter("ans");
				String s1=request.getParameter("o1");
				String qid=request.getParameter("q_id");
				String s3=request.getParameter("user");
				response.getWriter().print(s3); 
				int q_id=Integer.parseInt(qid);
				
				
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:abc", "scott", "anil");
			Statement st=con.createStatement();
			ResultSet rs2=st.executeQuery("select stud_id from attempt where q_id="+q_id);
			if(!rs2.next())
			{
				ResultSet rs1=st.executeQuery("select * from sett");
				rs1.next();
		 	    int x1=Integer.parseInt(rs1.getString(4));
		 	 	int x2=Integer.parseInt(rs1.getString(3));
		 
		 	
		 		  if(s1!=null)
		 		  {
				 int ans1 = Integer.parseInt(s1);
				 if(s2.equals(s1))
					{
				    	
				    	 st.execute("insert into attempt values("+s3+","+q_id+","+ans1+","+x1+")");
				    }
				    else
				    {
				    	 
				    	  st.execute("insert into attempt values("+s3+","+q_id+","+ans1+","+-x2+")");
				    }
				   }
			t1++;
			RequestDispatcher view = request.getRequestDispatcher("exam1.jsp?t="+t1);  
			 view.forward(request, response);  
	
			}
			else
			{ 
			/*	PrintWriter pw = response.getWriter(); 
				response.setContentType("text/html"); 
				pw.println("<html><head>"+
				"<script language=\"text/javascript\">"+
				"alert (\" already submitted\")"+
				"</script></head></html>"); */
				
				
				RequestDispatcher view = request.getRequestDispatcher("exam1.jsp?t="+t1);  
				 view.forward(request, response);  
		
			}
			}
			catch(Exception e)
			{  
				 response.getWriter().print(e); 
			}
		}
	}   	  	    
}

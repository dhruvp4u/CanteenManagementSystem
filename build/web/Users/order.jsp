<%-- 
    Document   : order
    Created on : Mar 31, 2016, 2:44:25 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("email_session") == null) || (session.getAttribute("email_session") == "")) {
        response.sendRedirect("../login.jsp");
    } 
    else {
         
         String email = (String)request.getSession().getAttribute("email_session");                                      
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system","root", "root");                                        
         Statement st = con.createStatement();
         ResultSet rs;
         rs = st.executeQuery("select s_id from student_details where email_id='" + email + "' ");
   
         
   while(rs.next()){ 
    String s_id = rs.getString("s_id") ;  
    out.print(s_id);
    String ip = request.getRemoteAddr();
    out.print(ip);
    String local_host = "0:0:0:0:0:0:0:1";
    out.print(local_host);
    if(ip.equals(local_host))
    {
       Statement st1 = con.createStatement();
       
       int i = st1.executeUpdate("insert into active_order(room_no,m_id,s_id) values ('0','" + request.getParameter("menu_id") + "','" + s_id + "') ");
       response.sendRedirect("menu.jsp");
    }
    else
    {
    
    }
         
  
         
   } 
    }    
                        
%>



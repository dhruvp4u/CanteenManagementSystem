<%-- 
    Document   : complete_order
    Created on : Apr 1, 2016, 2:54:46 AM
    Author     : Dhruv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("admin_session") == null) || (session.getAttribute("admin_session") == "")) {
        response.sendRedirect("admin_login.jsp");
    } 
    else {                                      
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system","root", "root");                                        
         Statement st = con.createStatement();
         ResultSet rs;
         rs = st.executeQuery("select * from active_order where a_id='" + request.getParameter("a_id") + "' ");
   
         
   while(rs.next()){ 
    
    
       Statement st1 = con.createStatement();
       
       int i = st1.executeUpdate("insert into past_order(room_no,m_id,s_id) values ('" + rs.getString("room_no") + "','" + rs.getString("m_id") + "','" + rs.getString("s_id") + "') ");
       
       
       
       if(i>0)
       { 
       Statement st2 = con.createStatement();
       
       st2.executeUpdate("delete from active_order where a_id='" + request.getParameter("a_id") + "' ");
       
       response.sendRedirect("orders.jsp");
    
       } 
  
         
   } 
    }    
                        
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

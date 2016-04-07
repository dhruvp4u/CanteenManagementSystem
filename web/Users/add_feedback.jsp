<%-- 
    Document   : student_details
    Created on : Mar 27, 2016, 12:32:55 AM
    Author     : Dhruv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");    
    String category = request.getParameter("category");
    
    String service = request.getParameter("service");
    
    String comment = request.getParameter("comment");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs; 
    int i = st.executeUpdate("insert into feedback(name, food_rating, service, comment) values ('" + name + "','" + category + "','" + service + "','" + comment + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("feedback.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.print("Registration unsuccessfull");
    }
%>
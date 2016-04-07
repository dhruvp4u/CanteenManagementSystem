<%-- 
    Document   : delete_catagory
    Created on : Mar 31, 2016, 11:19:55 AM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String category = request.getParameter("delete_category");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs; 
    int i = st.executeUpdate("delete from menu_catagories where name='" + category + "'");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("manage_menu.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.print("Registration unsuccessfull");
    }
%>
<%-- 
    Document   : delete_food
    Created on : Mar 31, 2016, 11:25:26 AM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String food = request.getParameter("food_item");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs; 
    int i = st.executeUpdate("delete from menu where name='" + food + "'");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("manage_menu.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.print("Registration unsuccessfull");
    }
%>
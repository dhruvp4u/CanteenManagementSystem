<%-- 
    Document   : add_catagories
    Created on : Mar 30, 2016, 10:33:23 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String category = request.getParameter("add_category");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs; 
    int i = st.executeUpdate("insert into menu_catagories(name) values ('" + category + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("manage_menu.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.print("Registration unsuccessfull");
    }
%>
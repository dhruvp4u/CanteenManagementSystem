<%-- 
    Document   : let_in
    Created on : Mar 27, 2016, 2:56:22 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin_details where username='" + username + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("admin_session", username);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("admin_login.jsp");
    }
%>
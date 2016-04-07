<%-- 
    Document   : let_in
    Created on : Mar 27, 2016, 1:46:37 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String email = request.getParameter("email");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from student_details where email_id='" + email + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("email_session", email);
        response.sendRedirect("Users/index.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
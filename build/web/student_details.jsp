<%-- 
    Document   : student_details
    Created on : Mar 27, 2016, 12:32:55 AM
    Author     : Dhruv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");    
    String mobile = request.getParameter("mobile");
    //long mobile = Long.parseLong(mobile_string.trim());
    String somaiya_id = request.getParameter("somaiya_id");
    //long somaiya_id = Long.parseLong(somaiya_id_string.trim());
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs; 
    int i = st.executeUpdate("insert into student_details(somaiya_id, name, mobile_no, email_id, password) values ('" + somaiya_id + "','" + name + "','" + mobile + "','" + email + "','" + password + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("login.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.print("Registration unsuccessfull");
    }
%>
<%-- 
    Document   : logout
    Created on : Mar 27, 2016, 2:14:06 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("email_session", null);
session.invalidate();
response.sendRedirect("../index.jsp");
%>
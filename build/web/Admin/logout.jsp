<%-- 
    Document   : logout
    Created on : Mar 27, 2016, 3:02:14 PM
    Author     : Dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("admin_session", null);
session.invalidate();
response.sendRedirect("admin_login.jsp");
%>
<%-- 
    Document   : add_food
    Created on : Mar 30, 2016, 10:54:01 PM
    Author     : Dhruv
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("menu_item");
    String category = request.getParameter("category");
    String price_str = request.getParameter("price");
    String pic_name = request.getParameter("pic_name");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs; 
    Statement st1 = con.createStatement();

    rs = st1.executeQuery("select * from menu_catagories where name='"+ category +"'");
    while(rs.next()){
    String c_id1 = rs.getString("c_id");
    
    st.executeUpdate("insert into menu(name,price,picture_path,c_id) values ('" + name + "','" + price_str + "','" + pic_name + "','" + c_id1 + "')");
    }
    response.sendRedirect("manage_menu.jsp");
    
%>
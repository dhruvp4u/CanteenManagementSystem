<%-- 
    Document   : expense
    Created on : Apr 1, 2016, 3:30:38 AM
    Author     : Dhruv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("email_session") == null) || (session.getAttribute("email_session") == "")) {
        response.sendRedirect("../login.jsp");
    } 
    else {
        
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>Menu</title>
	<meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/slide.css">
	<link rel="stylesheet" href="css/menu.css">
	<!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
    
</head>
<body>
<div class="wrap-body">
	<!--///////////////////////////////////////Top-->
	<div class="top">
		<div class="zerogrid">
			<ul class="number f-left">
				<li class="mail"><p>Canteen@somaiya.edu</p></li>
				<li class="phone"><p>+91-8080808080</p></li>
			</ul>
			<ul class="top-social f-right">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram"></i></a></li>
			</ul>
		</div>
	</div>
	<!--////////////////////////////////////Header-->
	<header>
		<div class="zerogrid">
			<center><div class="logo"><img src="images/logo1.png" style="width:200px;height:150px;"></div></center>
		</div>
	</header>
	<div class="site-title">
		<div class="zerogrid">
			<div class="row">
				<h2 class="t-center">Somaiya Canteen</h2>
			</div>
		</div>
	</div>
    <!--//////////////////////////////////////Menu-->
    <a href="#" class="nav-toggle">Toggle Navigation</a>
    <nav class="cmn-tile-nav">
		<ul class="clearfix">
			<li class="colour-1"><a href="index.jsp">Home</a></li>
			<li class="colour-2"><a href="menu.jsp">Menu</a></li>
			<li class="colour-3"><a href="current_orders.jsp">Ordered Food</a></li>
			<li class="colour-4"><a href="past_orders.jsp">Past Orders</a></li>
			<li class="colour-5"><a href="bill.jsp">Bill</a></li>
			<li class="colour-6"><a href="expense.jsp">Expenses</a></li>
			<li class="colour-7"><a href="feedback.jsp">Feedback</a></li>
			<li class="colour-8"><a href="logout.jsp">Logout</a></li>
		</ul>
    </nav>
	
<!--////////////////////////////////////Container-->
<section id="container" class="sub-page">
	<div class="wrap-container zerogrid">
		<div class="crumbs">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="menu.jsp">Menu</a></li>
			</ul>
		</div>
		<div id="main-content">
                    <h1 style="margin-left:35px;"> Your total expenses </h1>
			<div class="wrap-content">
                        
                        <% 
                                                
                                               String email = (String)request.getSession().getAttribute("email_session");                                      
                                               Class.forName("com.mysql.jdbc.Driver");
                                               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteen_management_system","root", "root");                                        
                                               Statement st = con.createStatement();
                                               ResultSet rs;
                                               rs = st.executeQuery("select s_id from student_details where email_id='" + email + "' ");
   
        
                        %>
                        <%  while(rs.next()){ %>
				<div class="row">
					<div class="col-1-3">
						<div class="wrap-col">
							<h3></h3>
                                                        <%
                                                        String s_id = rs.getString("s_id") ;
                                                        Statement st1 = con.createStatement();
                                                        ResultSet rs1;
                                                       
                                                        rs1 = st1.executeQuery("select * from menu,past_order,student_details where menu.m_id=past_order.m_id and past_order.s_id=student_details.s_id and student_details.s_id='"+ s_id +"' ");
                                                        %>
                                                        <%! int paisa; %>
                                                        <%  while(rs1.next()){  
                                                            paisa = paisa +Integer.parseInt(rs1.getString("price"));
                                                        } %>
							<div class="post">
								
								<div class="wrapper">
								  <h3><a href="">You have to spent Rs. <%= paisa %> till today on Food.</a></h3>
								 
                                                                  
								</div>
							</div>
                                                        
						</div>
                                        </div>
				</div>
                              <% } %>  
			</div>
		</div> 
	</div>
</section>

<!--////////////////////////////////////Footer-->
<footer class="zerogrid">
	<div class="wrap-footer">
		<div class="row">
			<div class="col-1-3">
				<div class="wrap-col">
					<h4>Customer Testimonials</h4>
					<div class="row">
						<img src="images/a-1.jpg">
						<h5>Atiq Patel</h5>
						<p>I have enjoyed bunking the lectures and going to canteen with friends.</p>
					</div>
				</div>
			</div>
			<div class="col-1-3">
				<div class="wrap-col">
					<h4>Location</h4>
					<div class="wrap-map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3771.399653051212!2d72.8688745144242!3d19.046158257860267!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7cf21727f6e19%3A0x473006136ad440dc!2sK+J+Somaiya+Institute+of+Engineering+and+Information+Technology!5e0!3m2!1sen!2sin!4v1457594587591" width="100%" height="200" frameborder="0" style="border:0"></iframe></div>
				</div>
			</div>
			<div class="col-1-3">
				<div class="wrap-col">
					<h4>Open Daily</h4>
					<p><span>mon.-fir.</span> 8:30-19:30</p>
					<p><span>sat.</span> 9:30-16:30</p>
					<p><span>sun.</span> Holiday (except-specail occations)</p>
					
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">
		<div class="wrapper">
			Copyright 2016 - <a href="#" target="_blank" rel="nofollow">Canteen Mangagement System</a> Designed by Dhruv and Atiq
			<ul class="quick-link f-right">
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Terms of Use</a></li>
			</ul>
		</div>
	</div>
</footer>


	<!-- js -->
	<script src="js/classie.js"></script>
	<script src="js/demo.js"></script>

	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/responsiveslides.min.js"></script>
	<script>
	$(function () {
	  // Slideshow 4
	  $("#slider4").responsiveSlides({
		auto: true,
		pager: false,
		nav: false,
		speed: 500,
		namespace: "callbacks",
		before: function () {
		  $('.events').append("<li>before event fired.</li>");
		},
		after: function () {
		  $('.events').append("<li>after event fired.</li>");
		}
	  });
	});
	</script>
</div>
</body></html>
<%
    }
%>

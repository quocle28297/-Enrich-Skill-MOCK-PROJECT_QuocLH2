<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="w3l_banner_nav_left">
			<nav class="navbar nav_bottom">
			 <!-- Brand and toggle get grouped for better mobile display -->
			  <div class="navbar-header nav_2">
				  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
			   </div> 
			   <!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav nav_1">
						<li><a href="HomeServlet">Home</a></li>
						<li><a href="ProductServlet?type=1">Veggies & Fruits</a></li>
						<li><a href="ProductServlet?type=2">Drinks</a></li>
						<li><a href="ProductServlet?type=3">Frozen Food</a></li>
						<% 
							if(session.getAttribute("account") != null) {
								Account account = (Account)session.getAttribute("account");
								if(account.getUsername().equalsIgnoreCase("admin")){
						%>
						<li><a href="ProductmanagementServlet">Product Management</a></li>
						<%	
								}
							}
						%>
					</ul>
				 </div><!-- /.navbar-collapse -->
			</nav>
		</div>
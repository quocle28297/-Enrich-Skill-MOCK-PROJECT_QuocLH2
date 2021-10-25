<%@page import="model.bean.Account"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="agileits_header">
	<div class="w3l_offers">
		<a href="products.jsp">Today's special Offers !</a>
	</div>
	<div class="w3l_search">
		<form action="#" method="post">
			<input type="text" name="Product" value="Search a product..."
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Search a product...';}"
				required=""> <input type="submit" value=" ">
		</form>
	</div>
	<div class="product_list_header">
		<form action="#" method="post" class="last">
			<fieldset>
				<input type="hidden" name="cmd" value="_cart" /> <input
					type="hidden" name="display" value="1" /> <input type="submit"
					name="submit" value="View your cart" class="button" />
			</fieldset>
		</form>
	</div>
	<div class="w3l_header_right">
		<ul>
			<li class="dropdown profile_details_drop">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="text-decoration: none">
					<i class="fa fa-user" aria-hidden="true"></i>
					<%
						Account acc = (Account) session.getAttribute("account");
						if (acc != null) {
					%>
					<span>Xin Chào <%=acc.getName()%></span>
					<%}%>
					<span class="caret"></span>
				</a>
				<div class="mega-dropdown-menu">
					<ul class="dropdown-menu drp-mnu">
					<%
						if (acc == null) {
					%>
						<li><a href="login.jsp">Login</a></li>
					<%} else {%>
						<li><a href="LogoutServlet">Logout</a></li>
					<%} %>
						<li><a href="LoginServlet">Sign Up</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	<div class="w3l_header_right1">
		<h2>
			<a href="mail.jsp">Contact Us</a>
		</h2>
	</div>
	<div class="clearfix"></div>
</div>
<!-- script-for sticky-nav -->
<script>
	$(document).ready(function() {
		var navoffeset = $(".agileits_header").offset().top;
		$(window).scroll(function() {
			var scrollpos = $(window).scrollTop();
			if (scrollpos >= navoffeset) {
				$(".agileits_header").addClass("fixed");
			} else {
				$(".agileits_header").removeClass("fixed");
			}
		});

	});
	
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
</script>
<!-- //script-for sticky-nav -->
<div class="logo_products">
	<div class="container">
		<div class="w3ls_logo_products_left">
			<h1>
				<a href="index.jsp"><span>Grocery</span> Store</a>
			</h1>
		</div>
		<div class="w3ls_logo_products_left1">
			<ul class="special_items">
				<li><a href="events.jsp">Events</a><i>/</i></li>
				<li><a href="about.jsp">About Us</a><i>/</i></li>
				<li><a href="HomeServlet">Best Deals</a><i>/</i></li>
				<li><a href="services.jsp">Services</a></li>
			</ul>
		</div>
		<div class="w3ls_logo_products_left1">
			<ul class="phone_email">
				<li><i class="fa fa-phone" aria-hidden="true"></i>(+0123) 234
					567</li>
				<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a
					href="mailto:store@grocery.com">store@grocery.com</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%@page import="model.bean.ProductType"%>
<%@page import="model.bean.Image"%>
<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> 
<!-- //font-awesome icons -->

<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
        <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
        <!-- JS tạo nút bấm di chuyển trang end -->
</head>
	
<body>
<!-- header -->
<%@include file="/header.jsp" %>
<!-- //header -->
<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="HomeServlet">Home</a><span>|</span></li>
				<li>Checkout</li>
			</ul>
		</div>
	</div>
<!-- //products-breadcrumb -->
<!-- banner -->
	<div class="banner">
<!-- banner left -->
		<%@include file="/bannerleft.jsp" %>
		<!-- //banner left -->
		<div class="w3l_banner_nav_right">
<!-- about -->
		<div class="privacy about">
			<h3>List Product</h3>
	   		<div class="clearfix"> </div>
			<button class="btn btn-primary" name="addProduct" value="addProduct" data-toggle="modal" data-target="#modalAddProduct" >Add New</button>
	   		<div class="checkout-right">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>SL No.</th>
							<th>Product</th>
							<th colspan="2">Product Name</th>
							<th>Product Type</th>
							<th>Price</th>
							<th>Discount</th>
							<th colspan="2">Decription</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<ProductType> types = (List<ProductType>)request.getAttribute("types");
							List<Product> products = (List<Product>)request.getAttribute("products");
							int count =0;
							for(Product product : products){
								count ++;
						%>
						<tr class="rem1 contentPage">
							<td class="invert"><%=count %></td>
							<td class="invert-image"><img src="images/<%=product.getImage() %>" style="width: 50px; width: 50px; align-content: center;" alt=" " class="img-responsive"></td>
							<td ><%=product.getName() %></td>
							<%	for(ProductType type : types){ 
									if(type.getId() == product.getTypeId()){
							%>
							<td class="invert" colspan="2"><%= type.getName() %></td>
							<% 
									}
								} 
							%>
							<td class="invert">$<%=product.getPrice() %></td>
							<td class="invert" >$<%=product.getSale() %></td>
							<td class="invert" colspan="2"><%=product.getDecription() != null ? product.getDecription() : "" %></td>
							<td class="invert">
								<a href="" data-toggle="modal" data-target="#modalEditProduct" data-id="<%=product.getId()%>" data-description="<%=product.getDecription() %>" data-name="<%=product.getName() %>"
									data-type="<%=product.getTypeId()%>" data-price="<%=product.getPrice()%>" data-sale="<%=product.getSale()%>" data-image="<%=product.getImage()%>">
									<i class="fa fa-edit" style="font-size:30px;"></i>
								</a>
								<a href="" data-toggle="modal" data-target="#modalDeleteProduct" data-id="<%=product.getId()%>" data-name="<%=product.getName() %>" >
									<i class="fa fa-trash-o" style="font-size:30px;"></i>
								</a>
							</td>
						</tr>
						<%} %>

					</tbody>
				</table>
				<ul id="pagination"></ul>
			</div>
			
		</div>
		<script type="text/javascript">
            $(function () {
                var pageSize = 7; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = 40; // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);

                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
        <style>
            ///** CSS căn id pagination ra giữa màn hình **///
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
        </style>
<!-- //about -->
	</div>
	<div class="clearfix"></div>
	</div>
<!-- //banner -->
<!-- footer -->
<%@include file="/footer.jsp" %>
<!-- //footer -->
<!-- modal add product -->
<div class="modal fade" id="modalAddProduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog " role="document">

		<div class="modal-content p-3">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Add New Product</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="addProduct" action="ProductmanagementServlet">
					<div class="form-group">
						<label for="codeCarControlEdit">Product Name</label> <input type="text"
							class="form-control" id="nameProduct" name="nameProduct" required="required">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Product Type</label>
						<select id="productType" name="productType" class="form-control">
							<option value="">-- Choose Type Product --</option>
							<%for(ProductType type: (List<ProductType>) request.getAttribute("types")){ 
								String selected ="";
							%>
								
			  				<option value="<%=type.getId()%>" required=" "><%=type.getName() %></option>
						  	<%} %>
						</select>
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Price</label> <input type="number"
							class="form-control" id="price" name="price" required=" ">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Discount</label> <input type="number"
							class="form-control" id="sales" name="sales">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Description</label> <input type="text"
							class="form-control" id="description" name="description">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Image</label> <input type="file"
							class="form-control" id="image" name="image" required=" ">
					</div>
					<div class="form-group text-center">
						<button class="btn btn-primary" name="btnAddProduct" value="btnAddProduct">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- modal add product -->
<!-- modal edit product -->
<div class="modal fade" id="modalEditProduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog " role="document">

		<div class="modal-content p-3">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Update Product</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="editProduct" action="ProductmanagementServlet" >
					<div class="form-group" style="display:none;">
					 <input type="text" class="form-control" id="idProductEdit" name="idProductEdit" >
					 <input type="text" class="form-control" id="imageEdit" name="imageEdit" >
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Product Name</label> <input type="text"
							class="form-control" id="nameProductEdit" name="nameProductEdit" required=" ">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit" >Product Type</label>
						<select id="productTypeEdit" name="productTypeEdit" class="form-control">
							<option value="">-- Choose Type Product --</option>
							<%for(ProductType type: (List<ProductType>) request.getAttribute("types")){ 
								String selected ="";
							%>
								
			  				<option value="<%=type.getId()%>"><%=type.getName() %></option>
						  	<%} %>
						</select>
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Price</label> <input type="number"
							class="form-control" id="priceEdit" name="priceEdit" required=" ">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Discount</label> <input type="number"
							class="form-control" id="salesEdit" name="salesEdit">
					</div>
					<div class="form-group">
						<label for="codeCarControlEdit">Description</label> <input type="text"
							class="form-control" id="descriptionEdit" name="descriptionEdit">
					</div>
					<div class="form-group text-center">
						<button class="btn btn-primary" name="btnEdiProduct" value="btnEdiProduct">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- modal edit product -->
<!-- moDal delete Bus -->
<div class="modal fade" id="modalDeleteProduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog " role="document">

		<div class="modal-content p-3">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Delete Product</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="" action="ProductmanagementServlet">
					 <div class="form-group" style="display:none;">
					 <input type="text" class="form-control" id="idProductDelete" name="idProductDelete">
					</div>
					 <p id="namePrpductDelete" style="margin-bottom: 20px"></p>
					<div class="form-group text-center">
					<button class="btn btn-primary"  name="btnDeleteProduct" value="btnDeleteProduct"> Delete </button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- moDal delete Bus -->
<!-- js -->
							 <!--quantity-->
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								<!--quantity-->
							<script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script>
							<script>$(document).ready(function(c) {
								$('.close2').on('click', function(c){
									$('.rem2').fadeOut('slow', function(c){
										$('.rem2').remove();
									});
									});	  
								});
						   </script>
						  	<script>$(document).ready(function(c) {
								$('.close3').on('click', function(c){
									$('.rem3').fadeOut('slow', function(c){
										$('.rem3').remove();
									});
									});	  
								});
						   </script>

<!-- //js -->
<!-- script-for sticky-nav -->
<script>
	$(document).ready(function() {
		 var navoffeset=$(".agileits_header").offset().top;
		 $(window).scroll(function(){
			var scrollpos=$(window).scrollTop(); 
			if(scrollpos >=navoffeset){
				$(".agileits_header").addClass("fixed");
			}else{
				$(".agileits_header").removeClass("fixed");
			}
		 });
	});
</script>
<!-- //script-for sticky-nav -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.js"></script>
<script>
		paypal.minicart.render();

		paypal.minicart.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});

	</script>
	<script type="text/javascript">
	$("[data-target='#modalEditProduct']").each(function(){
		$(this).click(function(){
			$("#idProductEdit").val($(this).data("id"));
			$("#nameProductEdit").val($(this).data("name"));
			$("#priceEdit").val($(this).data("price"));
			$("#salesEdit").val($(this).data("sale"));
			$("#productTypeEdit").val($(this).data("type")).change();
			$("#descriptionEdit").val($(this).data("description"));
			$("#imageEdit").val($(this).data("image"));
		});
	});
	$("[data-target='#modalDeleteProduct']").each(function(){
		$(this).click(function(){
			var name =  $(this).data("name");
			$("#namePrpductDelete").html("Are you sure you want to delete <strong>'"+ name + "'</strong> ?" );
			
			$("#idProductDelete").val($(this).data("id"));		
		});
	});
  	
	$(window).on("load", function() {
		<%
			String message =(String)request.getAttribute("messageInsert") != null 
				? (String)request.getAttribute("messageInsert") 
				: (String)request.getAttribute("updateMessage") != null
					? (String)request.getAttribute("updateMessage") 
					:(String)request.getAttribute("messageDelete");
		
			if(message != null){
		%>
		  alert("<%=message%>");
		<%}%>
	});
</script>

</body>
</html>
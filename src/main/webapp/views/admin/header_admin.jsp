<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="sidebar">
	<div class="sidebar-inner">
		<div class="sidebar-logo">
			<a class="sidebar-link" href="/"> <img class="icon"
				src="/img/logo1.png">
				<h5 class="logo-text">Admin Manage</h5>
			</a>
		</div>

		<nav class="navbar scrollbar" id="style-1">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/admin/manage"><i
						class="fas fa-home"></i>Dashboard</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"><i class="fas fa-pencil-alt"></i>Forms</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/add-author">Author</a> <a
							class="dropdown-item" href="/admin/add-publisher">Publisher</a> <a
							class="dropdown-item" href="/admin/add-manufacturer">Manufacturer</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"><i class="far fa-copy"></i>Nhập hàng</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/book">Book</a> <a
							class="dropdown-item" href="/admin/electronics/laptop">Laptop</a>
						<a class="dropdown-item" href="/admin/electronics/mobilephone">Mobile
							phone</a> <a class="dropdown-item" href="/admin/electronics/tivi">Tivi</a>
						<a class="dropdown-item" href="/admin/clothes/jeans">Jeans</a> <a
							class="dropdown-item" href="/admin/clothes/dresses">Dresses</a> <a
							class="dropdown-item" href="/admin/clothes/swimwear">Swimwear</a>
						<a class="dropdown-item" href="/admin/shoes/sneaker">Sneaker</a> <a
							class="dropdown-item" href="/admin/shoes/highheels">Highheels</a>
						<a class="dropdown-item" href="/admin/shoes/boots">Boots</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"><i class="fas fa-list"></i>Đưa hàng lên
						website</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/book-item">Book Item</a> <a
							class="dropdown-item" href="/admin/electronics-item">Electronics
							Item</a> <a class="dropdown-item" href="/admin/clothes-item">Clothes
							Item</a> <a class="dropdown-item" href="/admin/shoes-item">Shoes
							Item</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="/admin/customer"><i class="fas fa-users"></i>Customer</a></li>
				<li class="nav-item"><a class="nav-link" href="/admin/order"><i class="fas fa-shopping-cart"></i>Order</a></li>
				<li class="nav-item"><a class="nav-link" href="/admin/shipment"><i
						class="fas fa-shipping-fast"></i>Shipment</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"><i class="fas fa-chart-bar"></i>Statistics</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/manage/statistic/item">Item</a>
						<a class="dropdown-item" href="/admin/manage/statistic/customer">Customer</a>
						<a class="dropdown-item" href="/admin/manage/statistic/shipment">Shipment</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-envelope"></i>Email</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-map"></i>Maps</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="far fa-comment-dots"></i>Chat</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="far fa-calendar-alt"></i>Calendar</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-chart-bar"></i>Charts</a></li>
			</ul>

		</nav>
	</div>
</div>
<div class="page-container">
	<div class="header-container">
		<nav class="navbar">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"><img class="icon" alt="user" src="/img/icons8-user-male-100.png"><div class="text-icon">${pageContext.request.remoteUser }</div>
				</a>
					<div class="dropdown-menu">
					<a class="dropdown-item" href="/logout-employee"><i
							class="fas fa-power-off"></i>Logout</a>
					</div></li>
			</ul>
		</nav>
	</div>
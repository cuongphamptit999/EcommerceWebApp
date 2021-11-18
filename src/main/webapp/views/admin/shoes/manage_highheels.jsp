<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp jstl vào jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description"
	content="ban laptop uy tin, chat luong, dich vu tot">
<meta name="keywords"
	content="laptop, asus, dell, hp, lenovo, acer, apple, msi, lg">
<meta name="author" content="CuongPham">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS & JAVA_SCRIPT -->
<%@ include file="/views/includes/css_js.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/manage.css">
<!-- ----------------- -->

<title>Ecommerce Project</title>
</head>

<body>

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0"
		nonce="ChmFo6ST"></script>

	<!-- MAIN -->
	<div id="main">
		<%@ include file="/views/admin/header_admin.jsp"%>
		<div class="main-content">
			<div class="row">
				<div class="col-md-12">
					div class="form-add"> <input class="form-control" id="myInput"
						type="text" placeholder="Search.."> <a
						href="/admin/shoes/add-highheels" class="btn btn-success"
						style="margin-top: 10px"><i class="fas fa-plus"></i> Add
						highheels</a>
					<h1 class="my-3"></h1>

					<table class="table">
						<thead class="thead-light">
							<tr>
								<th>Name</th>
								<th>Style</th>
								<th>Material</th>
								<th>Color</th>
								<th>Size</th>
								<th>Height</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach items="${highheels }" var="highheel">
								<tr>
									<td>${highheel.name }</td>
									<td>${highheel.style }</td>
									<td>${highheel.material }</td>
									<td>${highheel.color }</td>
									<td>${highheel.size }</td>
									<td>${highheel.height }</td>
									<td><a href="/admin/shoes/edit-highheels/${highheel.id }"
											class="btn btn-primary">Edit <i class="fas fa-edit"></i></a>
											<a href="javascript:void(0);"
											onclick="Shop.deleteProduct(${highheel.id },'/admin/shoes/delete-highheels/')"
											class="btn btn-danger">Delete <i class="fas fa-eraser"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/views/admin/footer_admin.jsp"%>
	</div>
	</div>

</body>

</html>
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
<meta name="description" content="app mua sách">
<meta name="keywords" content="app, mua, sách">
<meta name="author" content="CuongPham">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS & JS -->
<%@ include file="/views/includes/css_js.jsp"%>
<link rel="stylesheet" href="/css/slick.css">
<link rel="stylesheet" href="/css/slick-theme.css">
<script src="/js/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/item-detail.css">
<!-- --- -->

<title>Ecommerce Project</title>
</head>


<body>

	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->

	<div id="main" class="container ">
		<div class="information">
			<div class="row">
				<div class="slider col-md-5">
					<div class="slider-for">
						<c:forEach items="${bookItem.imgBookItems }" var="imgItem">
							<div>
								<img src="/files_item/${imgItem.name }" alt="Image">
							</div>
						</c:forEach>
					</div>
					<div class="slider-nav">
						<c:forEach items="${bookItem.imgBookItems }" var="imgItem">
							<div>
								<img src="/files_item/${imgItem.name }" alt="Image">
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="col-md-7">
					<div>
						<h4>${bookItem.book.title }</h4>
					</div>
					<div style="margin-top: 40px;">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>Tác giả</td>
									<td>${bookItem.book.authors.get(0).name }</td>
								</tr>
								<tr>
									<td>Nhà xuất bản</td>
									<td>${bookItem.book.publisher.name }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="display: flex;">
						<c:choose>
							<c:when test="${bookItem.discount > 0}">
								<h4 style="text-decoration: line-through; line-height: 35px;">
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${bookItem.price }" />
									₫
								</h4>
							</c:when>
						</c:choose>
						<h3 class="price">
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${bookItem.price*(100-bookItem.discount)/100 }" />
							₫
						</h3>
					</div>
					<div class="table-mid" style="margin-top: 20px">
						<div class="button" style="display: flex">
							<a href="javascript:Shop.addToCart('${bookItem.slug}','book');"
								class="btn1"
								style="background-color: #ffeee8; line-height: 46px; margin-right: 40px; color: #ee4d2d;">
								<i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
							</a> <a
								href="javascript:Shop.addToCartNow('${bookItem.slug}','book');"
								class="btn2"
								style="line-height: 46px; color: white; font-size: 16px; font-weight: 600;">MUA
								NGAY</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="book">
			<h3 class="tieu-de" style="margin-top: 20px; text-align: center;">Các
				sản phẩm tương tự</h3>
			<div class="row">
				<c:forEach var="bookItem" items="${bookItems }" varStatus="loop">
					<c:if test="${loop.index <4 }">
						<div class="col-md-3">
							<div style="text-align: center; width: 100%;">
								<a href="/book/${bookItem.slug }"><img
									src="/files_item/${bookItem.imgBookItems.get(0).name }"
									alt="${bookItem.book.title }"></a>
							</div>
							<div class="infor" style="text-align: center;">
								<a href="/book/${bookItem.slug }">
									<h6>${bookItem.book.title }</h6>
								</a>
								<c:choose>

									<c:when test="${bookItem.discount > 0}">
										<div class="gia-goc">
											<p class="gia-chinh">
												<fmt:formatNumber type="number" maxFractionDigits="3"
													value="${bookItem.price }" />
												₫
											</p>
											<p class="khuyen-mai">(Tiết kiệm: ${bookItem.discount}%)</p>
										</div>
									</c:when>
								</c:choose>
								<h6 class="gia-ban">
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${bookItem.price*(100-bookItem.discount)/100 }" />
									₫
								</h6>
								<a href="javascript:Shop.addToCart('${bookItem.slug}','book');"><i
									class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div class="book">
			<h4 class="mb-4">Hỏi đáp về sản phẩm</h4>
			<div class="comment-fb">
				<div class="fb-comments"
					data-href="https://developers.facebook.com/docs/plugins/${bookItem.barCode}"
					data-width="100%" data-numposts="5"></div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->
</body>

</html>
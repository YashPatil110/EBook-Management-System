
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.BookDaoImp"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/bookimg.jpg");
	height: 60vh;
	width: 1540px;
	background-repeat: no-repeat;
	background-size: 1550px;
}

.btn1 {
	background-color: #d32f2f;
	margin-left: 18px;
	border-radius: 10px;
	border-color: white;
}

.btn2 {
	background-color: #43a047;
	margin-left: 5px;
	border-radius: 10px;
	border-color: white;
}

.btn3 {
	background-color: #d32f2f;
	margin-left: 85px;
	margin-top: 5px;
	border-radius: 10px;
	border-color: white;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

.btn4 {
	background-color: #d32f2f;
	margin-top: 25px;
	border-radius: 10px;
	border-color: white;
}

.btn5 {
	background-color: #d32f2f;
	margin-left: 35px;
	border-radius: 10px;
	border-color: white;
}

.btn6 {
	background-color: #43a047;
	margin-left: 8px;
	border-radius: 10px;
	border-color: white;
}

.btn7 {
	background-color: #43a047;
	margin-left: 40px;
	border-radius: 10px;
	border-color: white;
}

.btn8 {
	background-color: #d32f2f;
	margin-left: 10px;
	margin-top: 5px;
	border-radius: 10px;
	border-color: white;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User us = (User) session.getAttribute("userobj");
	%>
<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-black">EBook Management System</h2>
	</div>


	<!-- start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDaoImp dao2 = new BookDaoImp(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							BookName:
							<%=b.getBookname()%></p>
						<p>
							AuthorName:
							<%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<button class="btn7">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									style="color: white;">View Details</a>
							</button>
							<button class="btn8">
								<a href="" style="color: white;"><%=b.getPrice()%><i
									class="fa-solid fa-indian-rupee-sign p-1"></i></a>
							</button>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (us == null) {
							%>
							<button class="btn1">
								<a href="login.jsp" style="color: white;"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							</button>
							<%
							} else {
							%>
							<button class="btn1">
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=us.getId()%>"
									style="color: white;"><i class="fa-solid fa-cart-shopping"></i>Add
									Cart</a>
							</button>
							<%
							}
							%>


							<button class="btn2">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									style="color: white;">View Details</a>
							</button>
							<button class="btn3">
								<a href="" style="color: white;"><%=b.getPrice()%><i
									class="fa-solid fa-indian-rupee-sign p-1"></i></a>
							</button>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="View" style="text-align: center;">
			<button class="btn4">
				<a href="all_recent_book.jsp" style="color: white;">View All</a>
			</button>
		</div>

	</div>

	<!-- End Recent Book -->

	<hr>

	<!-- start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							BookName:
							<%=b.getBookname()%></p>
						<p>
							AuthorName:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (us == null) {
							%>
							<button class="btn1">
								<a href="login.jsp" style="color: white;"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							</button>
							<%
							} else {
							%>
							<button class="btn1">
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=us.getId()%>"
									style="color: white;"><i class="fa-solid fa-cart-shopping"></i>Add
									Cart</a>
							</button>
							<%
							}
							%>


							<button class="btn2">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									style="color: white;">View Details</a>
							</button>
							<button class="btn3">
								<a href="" style="color: white;"><%=b.getPrice()%><i
									class="fa-solid fa-indian-rupee-sign p-1"></i></a>
							</button>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="View" style="text-align: center;">
			<button class="btn4">
				<a href="all_new_book.jsp" style="color: white;">View All</a>
			</button>
		</div>

	</div>

	<!-- End New Book -->

	<hr>

	<!-- start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDaoImp dao3 = new BookDaoImp(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							BookName:
							<%=b.getBookname()%></p>
						<p>
							AuthorName:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<button class="btn7">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									style="color: white;">View Details</a>
							</button>
							<button class="btn8">
								<a href="" style="color: white;"><%=b.getPrice()%><i
									class="fa-solid fa-indian-rupee-sign p-1"></i></a>
							</button>
						</div>


					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="View" style="text-align: center;">
			<button class="btn4">
				<a href="all_old_book.jsp" style="color: white;">View All</a>
			</button>
		</div>

	</div>

	<!-- End Old Book -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>

<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.Dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.btn1 {
	background-color: #d32f2f;
	margin-left: 60px;
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
	margin-left: 125px;
	margin-top: 5px;
	border-radius: 10px;
	border-color: white;
}

.btn7 {
	background-color: #43a047;
	margin-left: 80px;
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

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">


			<%
			BookDaoImp dao3 = new BookDaoImp(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p>BookName: <%=b.getBookname()%></p>
						<p>AuthorName: <%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory() %></p>
						<div class="row">
							<button class="btn7">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" style="color: white;">View Details</a>
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
	</div>

</body>
</html>
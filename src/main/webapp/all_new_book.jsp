<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.Dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<%
	User u = (User) session.getAttribute("userobj");
	%>


	<c:if test="${not empty addCart}">
		<div id="toast"> ${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">


			<%
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
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
							if (u == null) {
							%>
							<button class="btn1">
								<a href="login.jsp" style="color: white;"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							</button>
							<%
							} else {
							%>
							<button class="btn1">
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									style="color: white;"><i class="fa-solid fa-cart-shopping"></i>Add
									Cart</a>
							</button>
							<%
							}
							%>
							
							
							<button class="btn2">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" style="color: white;">View Details</a>
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
	</div>

</body>
</html>
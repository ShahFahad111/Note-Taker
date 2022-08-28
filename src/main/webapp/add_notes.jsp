<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container p-0">
		<%@include file="navbar.jsp"%>
		<h1>This is add notes page</h1>
		<!--  This is add form -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required type="text"
					name="title"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter Text here">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea required id="content" placeholder="Enter your Content here"
					name="content"
					class="form-control" style="height: 300px"></textarea>
			</div>
			<div class="contianer text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>

</body>
</html>
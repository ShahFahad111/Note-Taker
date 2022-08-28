<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="com.note.entity.*"%>
<%@page import="com.note.helper.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.*"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		</br>
		<h1 class="text-uppercase">Edit Notes :</h1>
		
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note)s.get(Note.class, noteId);
			
		 %>
		 
		 <form action="UpdateServlet" method="post">
		 	<input value="<%= note.getId()%>" name="noteId" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required type="text"
					name="title"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter Text here"
					value = "<%= note.getTitle() %>"
					/>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea required id="content" placeholder="Enter your Content here"
					name="content"
					class="form-control" style="height: 300px"><%= note.getContent() %></textarea>
			</div>
			<div class="contianer text-center">
				<button type="submit" class="btn btn-success">Update Notes</button>
			</div>
		</form>
	</div>

</body>
</html>
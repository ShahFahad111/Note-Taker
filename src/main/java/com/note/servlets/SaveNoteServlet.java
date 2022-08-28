package com.note.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.note.entity.Note;
import com.note.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			System.out.println(note.getId() + "   "+ note.getTitle());
			
			Session session =  FactoryProvider.getFactory().openSession();
			session.beginTransaction();
			session.save(note);
			session.getTransaction().commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1>Note is added Successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all Notes</a></h1>'");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

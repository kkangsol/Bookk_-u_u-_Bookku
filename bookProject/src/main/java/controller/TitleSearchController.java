package controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookDAO;
import model.entity.Books;

@WebServlet("/titleSearch")
public class TitleSearchController extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO dao = new BookDAO();
        List<Books> bookList = null;
        try{
        	bookList = dao.findTitle(request.getParameter("query"));
        }catch (SQLException e) {
			response.sendRedirect("/failView.jsp");
			e.printStackTrace();
		}
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/bookCard.jsp").forward(request, response);
	}
}
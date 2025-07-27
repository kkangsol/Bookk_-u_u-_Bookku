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

@WebServlet("/resultList")
public class ResultBookController extends HttpServlet {
	
    private static final BookDAO model = BookDAO.getModel();  
	
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Books> bookList = null;
        
		try {
			bookList =  model.findTitle(request.getParameter("title"));
		} catch (SQLException e) {
			response.sendRedirect("/failview.jsp");   
			return;
		}

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/bookCard.jsp").forward(request, response);

    }
}


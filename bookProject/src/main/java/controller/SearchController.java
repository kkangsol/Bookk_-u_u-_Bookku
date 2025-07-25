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
import model.entity.book;

@WebServlet("/bookSearch")
public class SearchController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        String query = request.getParameter("query");

        BookDAO dao = new BookDAO();
        List<book> filteredList = null;
        
        try {
	        switch(category) {
	        	case "title":
	        		filteredList = dao.findTitle(query);
	        		break;
	        	case "author":
	        		filteredList = dao.findAuthor(query);
	        		break;
	        	case "category":
	        		filteredList = dao.findCategory(query);
	        		break;
	        	default:
	        		filteredList = dao.findAll();
	        		break;
	        }
        }catch(SQLException e){
        	e.printStackTrace();
        	response.sendRedirect("/failView.jsp");
        }

        request.setAttribute("bookSearch", filteredList);
        request.getRequestDispatcher("/bookSearch.jsp").forward(request, response);
    }
}

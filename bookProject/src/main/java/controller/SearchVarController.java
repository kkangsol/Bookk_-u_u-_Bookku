package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import java.util.function.Function;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.entity.Books;

@WebServlet("/bookSearch")
public class SearchVarController extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        String query = request.getParameter("query");

        BookDAO dao = new BookDAO();

        // 메서드가 예외를 던지지 않는다고 가정하고 간결한 람다만 사용
        Map<String, Function<String, List<Books>>> searchMap = new HashMap<>();
        
//        searchMap.put("title", dao::findTitle);
//        searchMap.put("author", dao::findAuthor);
//        searchMap.put("category", dao::findCategory);
        
        searchMap.put("title", t -> {
			try {
				return dao.findTitle(t);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		});
        
        searchMap.put("author", t -> {
			try {
				return dao.findAuthor(t);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		});
        
        searchMap.put("category", t -> {
			try {
				return dao.findCategory(t);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		});

        List<Books> filteredList = searchMap
                .getOrDefault(category, k -> dao.findAll())
                .apply(query);

        request.setAttribute("bookSearch", filteredList);
        request.getRequestDispatcher("/bookSearch.jsp").forward(request, response);
    }
}

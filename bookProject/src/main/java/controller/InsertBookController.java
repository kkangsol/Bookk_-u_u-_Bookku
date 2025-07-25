package controller;

import model.entity.Books;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RegisterDAO;

@WebServlet("/registerBook")
public class InsertBookController extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
        
        Books book = new Books();
        
        book.setTitle(request.getParameter("title"));
        book.setSubTitle(request.getParameter("subtitle"));
        book.setCategory(request.getParameter("category"));
        book.setSubCategory(request.getParameter("subCategory"));
        book.setAuthor(request.getParameter("author"));
        book.setPublisher(request.getParameter("publisher"));
        String yearStr = request.getParameter("year");
        
        if (yearStr != null && !yearStr.isEmpty()) {
            book.setYear(Integer.parseInt(yearStr));
        }
        
        book.setDescription(request.getParameter("description"));

        RegisterDAO dao = new RegisterDAO();
        
        try {
			dao.insertBook(book);
		} catch (SQLException e) {
			response.sendRedirect("/failview.jsp");   
			return;
		}
        
        request.setAttribute("title", book.getTitle());
        request.getRequestDispatcher("/resultList").forward(request, response);

    }
}


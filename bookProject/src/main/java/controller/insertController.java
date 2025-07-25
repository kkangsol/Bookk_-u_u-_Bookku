package controller;

import model.entity.book;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RegisterDAO;

@WebServlet("/registerBook")
public class insertController extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
        
        
        book book = new book();
        
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
        dao.insertBook(book);

        response.sendRedirect("bookList"); 
    }
}


package controller;

import java.io.IOException;
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
        String yearStr = request.getParameter("year");

        BookDAO dao = new BookDAO();
        List<book> filteredList = dao.searchBooks(category, yearStr);

        request.setAttribute("bookSearch", filteredList);
        request.getRequestDispatcher("/bookSearch.jsp").forward(request, response);
    }
}

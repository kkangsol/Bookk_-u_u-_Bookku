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

@WebServlet("/bookList")
public class Controller extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BookDAO dao = new BookDAO();
        List<book> bookList = dao.findAll();

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/bookCard.jsp").forward(request, response);
    }
}


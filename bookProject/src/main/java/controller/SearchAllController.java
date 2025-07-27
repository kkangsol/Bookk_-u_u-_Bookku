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

@WebServlet("/bookList")
public class SearchAllController extends HttpServlet {

	private static final BookDAO model = BookDAO.getModel();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Books> bookList = model.findAll();

			request.setAttribute("bookList", bookList);
			request.getRequestDispatcher("/bookCard.jsp").forward(request, response);
		} catch (SQLException e) {
			response.sendRedirect("/failview.jsp");
			return;
		}

	}
}

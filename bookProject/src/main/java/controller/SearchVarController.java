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

	private static final BookDAO model = BookDAO.getModel();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String category = request.getParameter("category");
		String query = request.getParameter("query");

		Map<String, Function<String, List<Books>>> searchMap = new HashMap<>();

		searchMap.put("title", wrap(model::findTitle, response));
		searchMap.put("author", wrap(model::findAuthor, response));
		searchMap.put("category", wrap(model::findCategory, response));

		Function<String, List<Books>> searchFunction = searchMap.getOrDefault(category, wrap(t -> model.findAll(), response));
		List<Books> filteredList = searchFunction.apply(query);

		request.setAttribute("bookSearch", filteredList);
		request.getRequestDispatcher("/bookSearch.jsp").forward(request, response);
	}
	
	
	
	
	

	// 내부 함수형 인터페이스 정의 (SQLException 허용)
	@FunctionalInterface
	private interface SqlFunction<T, R> {
		R apply(T t) throws SQLException;
	}

	// 예외 감싸는 래퍼 함수 (람다 → 안전한 Function)
	private Function<String, List<Books>> wrap(SqlFunction<String, List<Books>> fn, HttpServletResponse response) {
		return t -> {
			try {
				return fn.apply(t);
			} catch (SQLException e) {
				try {
					response.sendRedirect("/failview.jsp");
				} catch (IOException io) {
					throw new RuntimeException(io); // sendRedirect 실패 시 강제 종료
				}
				return Collections.emptyList(); // null 대신 안전한 기본값
			}
		};
	}
}

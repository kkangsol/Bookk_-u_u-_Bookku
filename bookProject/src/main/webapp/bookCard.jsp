<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.entity.book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>

<h2>📚 도서 목록</h2>

<!-- bookList는 List<Book> -->
<c:forEach var="book" items="${bookList}">
	<table border="1" width="600" cellpadding="10" cellspacing="0" style="margin-bottom: 20px;">
	  <tr>
	    <!-- 책 이미지 -->
	    <td width="150" rowspan="5" align="center">
	      <img src="${book.url}" width="120" height="160" alt="도서 이미지">

	    </td>
	    <td><strong>제목:</strong> ${book.title}</td>
	  </tr>
	  <tr>
	    <td><strong>저자:</strong> ${book.author}</td>
	  </tr>
	  <tr>
	    <td><strong>출판사:</strong> ${book.publisher}</td>
	  </tr>
	  <tr>
	    <td><strong>출판년도:</strong> ${book.year}</td>
	  </tr>
	  <tr>
	    <td>
	      <strong>도서 설명:</strong><br>
	      <c:choose>
	        <c:when test="${not empty book.description}">
	          ${book.description}
	        </c:when>
	        <c:otherwise>
	          (설명 없음)
	        </c:otherwise>
	      </c:choose>
	    </td>
	  </tr>
	</table>
</c:forEach>

</body>
</html>

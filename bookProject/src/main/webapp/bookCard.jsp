<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.entity.book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

  body {
  font-family: 'Gowun Dodum', sans-serif;
  margin: 0;
  padding: 60px 20px;
  background:
    radial-gradient(circle at 15% 50%, rgba(255, 192, 203, 0.4), transparent 50%),
    radial-gradient(circle at 85% 50%, rgba(255, 192, 203, 0.4), transparent 50%),
    linear-gradient(to bottom, #fff9fb, #f0f4ff);
}

  h2 {
    text-align: center;
    margin-bottom: 50px;
    font-size: 28px;
    color: #333;
  }

  .book-card {
    width: 800px;
    max-width: 95%;
    margin: 0 auto 30px auto;
    background-color: #ffffffee;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    border-radius: 18px;
    display: flex;
    overflow: hidden;
    transition: transform 0.2s ease;
  }

  .book-card:hover {
    transform: scale(1.01);
  }

  .book-image {
    width: 200px;
    height: 280px;
    object-fit: cover;
    background-color: #fcdde9;
  }

  .book-details {
    padding: 24px;
    flex: 1;
  }

  .book-title {
    font-size: 20px;
    font-weight: bold;
    color: #222;
    margin-bottom: 12px;
  }

  .book-meta {
    font-size: 15px;
    color: #555;
    margin-bottom: 8px;
  }

  .book-description {
    margin-top: 14px;
    font-size: 15px;
    color: #333;
    line-height: 1.5;
  }

  .no-description {
    color: #aaa;
    font-style: italic;
  }
</style>
</head>
<body>

<h2>📚 도서 목록</h2>

<c:forEach var="book" items="${bookList}">
  <div class="book-card">
    <img src="${book.url}" alt="도서 이미지" class="book-image">
    <div class="book-details">
      <div class="book-title">${book.title}</div>
      <div class="book-meta"><strong>저자:</strong> ${book.author}</div>
      <div class="book-meta"><strong>출판사:</strong> ${book.publisher}</div>
      <div class="book-meta"><strong>출판년도:</strong> ${book.year}</div>
      <div class="book-description">
        <strong>도서 설명:</strong><br>
        <c:choose>
          <c:when test="${not empty book.description}">
            ${book.description}
          </c:when>
          <c:otherwise>
            <span class="no-description">(설명 없음)</span>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</c:forEach>

</body>
</html>

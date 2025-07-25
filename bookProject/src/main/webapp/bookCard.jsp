<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.entity.Books" %>
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

<div style="text-align: center; margin-bottom: 40px;">
  <a href="/bookProject/index.html">
    <button style="
      background-color: #fbcfe8;
      color: #333;
      border: none;
      padding: 10px 20px;
      font-size: 15px;
      border-radius: 12px;
      cursor: pointer;
      font-family: 'Gowun Dodum', sans-serif;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      transition: background-color 0.2s ease, transform 0.2s ease;">
      🏠 홈으로 돌아가기
    </button>
  </a>
</div>

<%-- ????? 변수명 소문자 권장 --%>
<c:forEach var="Books" items="${bookList}">
  <div class="book-card">
    <img src="${Books.url}" alt="도서 이미지" class="book-image">
    <div class="book-details">
      <div class="book-title">${Books.title}</div>
      <div class="book-meta"><strong>저자:</strong> ${Books.author}</div>
      <div class="book-meta"><strong>출판사:</strong> ${Books.publisher}</div>
      <div class="book-meta"><strong>출판년도:</strong> ${Books.year}</div>
      <div class="book-description">
        <strong>도서 설명:</strong><br>
        <c:choose>
          <c:when test="${not empty Books.description}">
            ${Books.description}
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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
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
    margin-bottom: 30px;
    font-size: 28px;
    color: #333;
  }

  .container {
    max-width: 880px;
    margin: 0 auto;
    background: #ffffffee;
    border-radius: 18px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    padding: 40px;
  }

  .home-btn {
    text-align: right;
    margin-bottom: 30px;
  }

  .home-btn a button {
    background-color: #fbcfe8;
    color: #333;
    border: none;
    padding: 10px 20px;
    font-size: 15px;
    border-radius: 12px;
    cursor: pointer;
    font-family: 'Gowun Dodum', sans-serif;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: background-color 0.2s ease, transform 0.2s ease;
  }

  .home-btn a button:hover {
    background-color: #f9a8d4;
  }

  .search-form {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 24px;
    justify-content: center;
  }

  .search-form select,
  .search-form input[type="text"] {
    height: 36px;
    padding: 4px 12px;
    font-size: 15px;
    border: 1.5px solid #bbb;
    border-radius: 8px;
    font-family: 'Gowun Dodum', sans-serif;
  }

  .search-form button {
    height: 38px;
    padding: 0 30px;
    background: #ffcce0;
    color: #333;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.2s ease;
  }

  .search-form button:hover {
    background: #ff99c8;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 24px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  }

  th, td {
    border-bottom: 1px solid #eee;
    padding: 14px;
    text-align: center;
    font-size: 15px;
  }

  th {
    background-color: #f4f4f4;
    font-weight: bold;
    color: #444;
  }

  .no-result {
    margin-top: 20px;
    color: #999;
    text-align: center;
    font-style: italic;
  }
</style>
</head>
<body>
  <div class="container">

    <div class="home-btn">
      <a href="/bookProject/index.html">
        <button>🏠 홈으로 돌아가기</button>
      </a>
    </div>

    <h2>🔍 도서 검색</h2>

    <!-- 검색 폼 -->
    <form class="search-form" action="/bookProject/bookSearch" method="get">
      <label for="category">검색</label>
      <select name="category" id="category">
        <option value="title">제목</option>
        <option value="category">장르</option>
        <option value="author">저자</option>
      </select>
      <input type="text" name="query" placeholder="검색어 입력" />
      <button type="submit">조회</button>
    </form>

    <!-- 검색 결과 -->
    <c:if test="${not empty bookSearch}">
      <table>
        <thead>
        
          <tr>
            <th>제목</th>
            <th>저자</th>
            <th>출판사</th>
            <th>출판연도</th>
            <th>장르</th>
            <th>대출 가능 여부</th>
          </tr>
          
        </thead>
        <tbody>
          <c:forEach var="Books" items="${bookSearch}">
            <tr>
              <td>${Books.title}</td>
              <td>${Books.author}</td>
              <td>${Books.publisher}</td>
              <td>${Books.year}</td>
              <td>${Books.category}</td>
              <td>
                <c:choose>
                  <c:when test="${Books.loaned}">
                    불가
                  </c:when>
                  <c:otherwise>
                    가능
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>

    <!-- 검색 결과 없을 때 -->
    <c:if test="${empty bookSearch}">
      <p class="no-result">검색 결과가 없습니다.</p>
    </c:if>
  </div>
</body>
</html>

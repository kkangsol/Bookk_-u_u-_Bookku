<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 검색</title>
    <style>
        body {
            font-family: 'Segoe UI', 'Malgun Gothic', Arial, sans-serif;
            background: #f9f9fb;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(140,140,140,0.08);
            padding: 32px;
        }

        .search-form {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 24px;
        }

        .search-form select,
        .search-form input[type="text"] {
            height: 36px;
            padding: 4px 12px;
            font-size: 15px;
            border: 1.5px solid #bbb;
            border-radius: 7px;
        }

        .search-form button {
            height: 38px;
            padding: 0 30px;
            background: #3a6cf6;
            color: #fff;
            border: none;
            border-radius: 7px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .search-form button:hover {
            background: #2a54c8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 24px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        .no-result {
            margin-top: 20px;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📚 도서 검색</h2>

        <!-- 검색 폼 -->
        <form class="search-form" action="/bookProject/bookSearch" method="get">
            <label for="category">검색</label>
            <select name="category" id="category">
                <option value="">전체</option>
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
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${bookSearch}">
                        <tr>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.publisher}</td>
                            <td>${book.year}</td>
                            <td>${book.category}</td>
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

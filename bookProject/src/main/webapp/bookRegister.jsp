<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.time.Year" %>
<%
    int currentYear = Year.now().getValue();
%>
<html>
<head>
<title>도서 등록</title>
<style>
body {
	font-family: 'Segoe UI', 'Malgun Gothic', Arial, sans-serif;
	background: #F9F9FB;
}

.container {
	max-width: 680px;
	margin: 32px auto;
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 2px 16px rgba(140, 140, 140, 0.08);
	padding: 32px 32px 40px 32px;
}

.register-form {
	display: flex;
	flex-direction: column;
	gap: 14px;
}

.register-row {
	display: flex;
	gap: 24px;
	align-items: center;
}

.register-row label {
	width: 88px;
	font-weight: bold;
	font-size: 16px;
	color: #3A3A4A;
}

.register-row input[type="text"], .register-row input[type="number"] {
	flex: 1;
	height: 34px;
	border: 1.5px solid #bbb;
	border-radius: 7px;
	font-size: 15px;
	padding: 2px 12px;
	background: #FCFCFE;
}

.register-row textarea {
	flex: 1;
	min-height: 38px;
	font-size: 15px;
	border: 1.5px solid #bbb;
	border-radius: 7px;
	padding: 4px 12px;
	background: #FCFCFE;
	resize: vertical;
}

.register-actions {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	gap: 18px;
	margin-top: 14px;
}

.register-actions button {
	padding: 7px 38px;
	font-size: 18px;
	border-radius: 7px;
	border: none;
	background: #3A6CF6;
	color: #fff;
	font-weight: bold;
	box-shadow: 0 1px 4px rgba(44, 44, 44, 0.06);
	cursor: pointer;
	letter-spacing: 2px;
	transition: background 0.14s;
}

.register-actions button:hover {
	background: #2A54C8;
}

.success-check {
	font-size: 34px;
	color: #2ECC71;
	margin-left: 6px;
	font-weight: bold;
	transition: opacity 0.2s;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 등록 영역 -->
			<form action="registerBook" method="post">
			<div class="register-row">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" required> <label for="author">저자</label> <input
					type="text" id="author" name="author" required>
			</div>
			<div class="register-row">
				<label for="publisher">출판사</label> <input type="text"
					id="publisher" name="publisher"> <label for="year">출판연도</label>
				<input type="number" id="year" name="year" class="year-input"
					min="1900" max="2099" placeholder="Year" value="<%= currentYear %>">
			</div>
			<div class="register-row">
				<label for="description">책소개</label>
				<textarea id="description" name="description"></textarea>
				<label for="url">URL</label> <input type="text" id="url" name="url">
			</div>
			<div class="register-actions">
				<button type="submit">등록</button>
				<%-- 등록 성공 시 체크 표시 --%>
				<%
                String regResult = (String)request.getAttribute("regResult");
                if("success".equals(regResult)){
            %>
				<span class="success-check">&#10003;</span>
				<%
                }
            %>
			</div>
		</form>
	</div>
</body>
</html>
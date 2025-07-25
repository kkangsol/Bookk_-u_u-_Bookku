<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.Year"%>
<%
    int currentYear = Year.now().getValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>📘 도서 등록</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap')
	;

body {
	font-family: 'Gowun Dodum', sans-serif;
	margin: 0;
	padding: 60px 20px;
	background: radial-gradient(circle at 15% 50%, rgba(255, 192, 203, 0.4),
		transparent 50%),
		radial-gradient(circle at 85% 50%, rgba(255, 192, 203, 0.4),
		transparent 50%), linear-gradient(to bottom, #fff9fb, #f0f4ff);
}

.container {
	max-width: 720px;
	margin: 0 auto;
	background: #ffffffee;
	border-radius: 18px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
	padding: 40px;
}

h2 {
	text-align: center;
	font-size: 26px;
	margin-bottom: 30px;
	color: #333;
}

form.register-form {
	display: flex;
	flex-direction: column;
	gap: 20px;
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

.register-row {
	display: flex;
	gap: 20px;
	align-items: center;
}

.register-row label {
	width: 90px;
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

.register-row input[type="text"], .register-row input[type="number"],
	.register-row textarea {
	flex: 1;
	font-size: 15px;
	padding: 6px 12px;
	border: 1.5px solid #ccc;
	border-radius: 10px;
	background-color: #fcfaff;
	resize: vertical;
}

.register-actions {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 24px;
	gap: 12px;
}

.register-actions button {
	background-color: #fbcfe8;
	color: #333;
	border: none;
	padding: 10px 26px;
	font-size: 17px;
	font-weight: bold;
	border-radius: 12px;
	cursor: pointer;
	font-family: 'Gowun Dodum', sans-serif;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: background-color 0.2s ease, transform 0.2s ease;
}

.register-actions button:hover {
	background-color: #f9a8d4;
	transform: scale(1.02);
}

.success-check {
	font-size: 28px;
	color: #2ecc71;
	font-weight: bold;
	padding-left: 8px;
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
		
		<h2>📘 도서 등록</h2>
		
		<form action="registerBook" method="post" class="register-form">
		
			<div class="register-row">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" required> <label for="author">저자</label> <input
					type="text" id="author" name="author" required>
			</div>
			
			<div class="register-row">
				<label for="publisher">출판사</label> <input type="text" id="publisher"
					name="publisher"> <label for="year">출판연도</label> <input
					type="number" id="year" name="year" min="1900" max="2099"
					value="<%= currentYear %>">
			</div>
			
			<div class="register-row">
				<label for="description">책소개</label>
				<textarea id="description" name="description"></textarea>
			</div>
			
			<div class="register-row">
				<label for="url">URL</label> <input type="text" id="url" name="url">
			</div>
			
			<div class="register-actions">
				<button type="submit">등록</button>
				<% String regResult = (String)request.getAttribute("regResult");
           			if("success".equals(regResult)){ %>
				<span class="success-check">&#10003;</span>
				<% } %>
			</div>
			
		</form>
	</div>
</body>
</html>

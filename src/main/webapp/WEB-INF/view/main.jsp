<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-05-31
  Time: 오후 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Review</title>
    <style>
        body {
            margin: 0;
        }
        #header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #header h1 {
            margin: 0;
        }
        #header ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        #header ul li {
            margin-right: 20px;
        }
        #header ul li a {
            color: #fff;
            text-decoration: none;
        }
        #searchForm {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        #searchForm input[type="text"] {
            padding: 8px;
            width: 420px;
            border: none;
            border-radius: 3px;
        }
    </style>
    <script>
        fetch("http://localhost:8081/api/admin", {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
    </script>
</head>
<body>
<div id="header">
    <h1>Movie Review</h1>
    <form id="searchForm" action="/search" method="GET">
        <input type="text" name="query" placeholder="검색어를 입력하세요">
    </form>
    <ul>
        <li><a href="/login">로그인</a></li>
        <li><a href="/join">회원가입</a></li>
    </ul>
</div>
</body>
</html>
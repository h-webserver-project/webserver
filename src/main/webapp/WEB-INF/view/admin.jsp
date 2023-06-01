<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-06-01
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>쇼핑몰</title>
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
    #header ul li p {
      color: #fff;
      text-decoration: none;
      cursor: pointer;
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
    #header ul li a:hover,
    #header ul li p:hover {
      cursor: pointer;
    }
  </style>
  <script>
    fetch("http://localhost:8080/api/admin/role", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": localStorage.getItem("jwtToken")

      }

    }).then(
            (response)=>{
              if(response.status === 403){
                console.log(403)
                fetch("http://localhost:8080/api/control/role", {
                  method: "GET",
                  headers: {
                    "Authorization": localStorage.getItem("jwtToken")
                  }
                }).then(
                        (response)=>{
                          console.log(response)
                          return response.json();
                        }
                ).then(
                        (json)=>{
                          console.log(json)
                          if(json.status ===400){
                            window.location.href ="/"
                          }
                          if(json.data.role === "ROLE_USER"){
                            window.location.href ="/user"
                          }
                          if(json.data.role === "ROLE_ADMIN"){
                            window.location.href="/admin"
                          }
                        }
                );

              }
            }

    ).then(
            (response)=>{
              console.log(response)
              return response.json();
            }
    ).then(
            (json)=>{
              console.log(json)
              if(json.data.role === "ROLE_USER"){
                window.location.href ="/user"
              }
              if(json.data.role === "ROLE_ADMIN"){
                window.location.href="/admin"
              }
            }
    )

    function logout() {
      // Remove ACCESS_TOKEN from localStorage
      localStorage.removeItem("jwtToken");

      // Redirect to "/"
      window.location.href = "/";
    }
  </script>
</head>
<body>
<div id="header">
  <h1>Movie Review</h1>
  <form id="searchForm" action="/search" method="GET">
    <input type="text" name="query" placeholder="검색어를 입력하세요">
  </form>
  <ul>
    <li><a href="">물건올리기</a></li>
    <li><a onclick="logout()">로그아웃</a></li>
  </ul>
</div>
</body>
</html>
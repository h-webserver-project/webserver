<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-06-14
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>>Movie Review</title>
    <style>
        body {
            margin: 0;
        }
        #header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #333;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 999;
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
            margin-right: 40px;
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

        #container {
            display: flex;

            width: 100%;
            height: 100vh;
        }
        #infoh{

            border-right: black solid 0.5px;
            height: 100%;
            width: 50%;
            position: relative;
        }
        #info {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #info h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        #info p {
            margin: 10px 0;
            font-size: 16px;
            line-height: 1.5;
        }

        #info strong {
            font-weight: bold;
        }
    </style>
    <script>

        fetch("http://localhost:8081/api/user/role", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Authorization": localStorage.getItem("jwtToken")

            }

        }).then(
            (response)=>{
                if(response.status === 403){
                    console.log(403)
                    fetch("http://localhost:8081/api/control/role", {
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
                            console.log(json.status)
                            if(json.status ===400){
                                window.location.href ="/"
                            }
                            if(json.data.role === "ROLE_USER"){
                                window.location.href ="/user"
                            }
                            if(json.data.role === "ROLE_ADMIN"){
                                window.location.href="/admin"
                            }
                            if(json.status === 500){
                                window.location.href ="/"
                            }
                        }
                    );

                }
            }

        )

        function logout() {

            localStorage.removeItem("jwtToken");


            window.location.href = "/";
        }

        function main(){

            window.location.href = "/user";
        }




        function fetchInfo(){
            fetch('http://localhost:8081/api/user/info',
                {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": localStorage.getItem("jwtToken")
                    }
                })
                .then(function(response) {
                    console.log(response)
                    response.json();
                })
                .then(function(data) {
                    console.log(data)
                    // 받은 데이터를 화면에 표시
                    document.getElementById('email').innerText = data.data.email;
                    document.getElementById('username').innerText = data.data.userName;
                    document.getElementById('phone').innerText = data.data.phoneNumber;
                    document.getElementById('nickname').innerText = data.data.nickName;
                })
                .catch(function(error) {
                    console.log('Error:', error);
                });
        }
        fetchInfo();
    </script>
</head>
<body>
<div id="header">
    <h1 onclick="main()" id="main" style="cursor:pointer">Movie Review</h1>
    <form id="searchForm" action="/user/moviesearch/" method="GET">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
    </form>
    <ul>
        <li><a href="/login">내정보</a></li>
        <li><a onclick="logout()">로그아웃</a></li>
    </ul>
</div>
<div id="container">
    <div id="infoh">
        <div id="info">
            <h2>내 정보</h2>
            <p><strong>Email:</strong> <span id="email"></span></p>
            <p><strong>Username:</strong> <span id="username"></span></p>
            <p><strong>Phone Number:</strong> <span id="phone"></span></p>
            <p><strong>Nickname:</strong> <span id="nickname"></span></p>
        </div>
    </div>
    <div id="reviewall">
        <div id="review">
            <h1>내 리뷰</h1>
        </div>review</div>
    </div>
</div>

</body>
</html>
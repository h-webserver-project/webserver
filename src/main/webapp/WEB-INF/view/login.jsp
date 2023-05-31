<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-05-29
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            overflow: hidden;
            margin: 0;
        }
        #MovieHeader{
            text-align: center;
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 50px;
            color: #fff;
            opacity: 0;
            transition: opacity 2s;
        }

        #MovieHeader.visible {
            opacity: 1;
        }

        #loginMain {
            height: 100vh;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #header{
            display: flex;
            justify-content: center;
            align-content: center;
            height: 100%;
            width: 50%;
            border-right: 1px solid white;
            background-color: #333;
            transition: background-color 0.3s;
            color: black;
            color: #fff;
        }
        #root{
            color: white;
            text-decoration: none;

        }

        #loginServe {
            width: 50%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #loginServe form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #loginServe form input[type="email"],
        #loginServe form input[type="password"]{
            padding: 10px;
            width: 300px;
            border: 0.5px solid black;
            border-radius: 5px;
        }
        #button {
            padding: 10px 20px;
            width: 120px;
            border-radius: 5px;
            border: none;
            background-color: lightgray;
            color: #000;
            transition: background-color 0.3s, color 0.3s;
        }

        #button:hover {
            background-color: #333;
            color: #fff;
        }
        h1 {
            text-align: center;
            font-size: 30px;
            color: #333;
            margin-bottom: 20px;
        }
        #loginServe a {
            align-self: flex-end; /* Added */
            margin-bottom: 10px; /* Added */
        }

    </style>
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            var movieHeader = document.getElementById('MovieHeader');
            setTimeout(function(){
                movieHeader.classList.add('visible');
            }, 300);
        });
        function submitForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;

            var data = {
                email: email,
                password: password
            };

            fetch("http://localhost:8080/api/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(function(response) {
                    if (response.ok) {
                        // 헤더에서 JWT 토큰 추출
                        var jwtToken = response.headers.get("Authorization");

                        // JWT 토큰을 LocalStorage에 저장
                        localStorage.setItem("jwtToken", jwtToken);

                        console.log("로그인이 완료되었습니다.");
                        window.location.href = "/movie";
                    } else {
                        alert("로그인 오류");
                        console.error("로그인 오류");
                    }
                })
                .catch(function(error) {
                    console.error(error);
                });
        }
    </script>
</head>
<body>
<div id="loginMain">
    <div id="header">
        <h1 id="MovieHeader"><a id="root" href="/">Movie Review</a></h1>

    </div>
    <div id="loginServe">
        <form>
            <h1>로그인</h1>
            <input type="email" id="email" required placeholder="email"><br>
            <input type="password" id="password" required placeholder="password"><br>
            <a href="/join">회원가입</a>

            <button id="button" type="button" value="로그인" onclick="submitForm()">로그인</button>
        </form>
    </div>

</div>

</body>
</html>


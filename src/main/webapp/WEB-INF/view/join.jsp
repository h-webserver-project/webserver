<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-05-29
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Review</title>
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
        #header{
            display: flex;
            justify-content: center;
            align-content: center;
            height: 100%;
            width: 50%;
            border-right: 1px solid white;
            background-color: #333;
            transition: background-color 0.3s;
            color: #fff;
        }

        #joinMain {
            height: 100vh;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        #joinServe {
            width: 50%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #joinServe form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

        }

        #joinServe form input[type="email"],
        #joinServe form input[type="password"],
        #joinServe form input[type="text"],
        #joinServe form input[type="tel"] {
            padding: 10px;
            width: 350px;
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
        #root{
            color: white;
            text-decoration: none;

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
            var userName = document.getElementById("userName").value;
            var phoneNumber = document.getElementById("phoneNumber").value;
            var nickName = document.getElementById("nickName").value;

            var data = {
                email: email,
                password: password,
                userName: userName,
                phoneNumber: phoneNumber,
                nickName: nickName
            };

            fetch("http://59.26.59.60:8081/api/join", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(function(response) {
                    if(response.ok){
                        window.location.href ="/login"
                    }
                    return response.json()

                }).then(
                (json)=>{
                    if(json.status === 200){
                        window.location.href ="/login"
                    }else{
                      if(json.status ===400){
                          if(json.message === "잘못된 형식의 번호입니다"){
                              alert("잘못된 형식의 번호입니다")
                          }
                          if(json.message ==="잘못된 형식의 이메일 입니다"){
                              alert("잘못된 형식의 이메일 입니다")
                          }
                          if(json.message ==="잘못된 형식의 데이터 입니다."){
                              alert("잘못된 형식의 데이터 입니다.");
                          }

                      }
                    }
                    console.log(json)
                }
            )
        }
        function handleClick() {
            var link = document.getElementById("joinLink");
            link.classList.add("clicked");
        }
    </script>
</head>
<body>
<div id="joinMain">
    <div id="header">
        <h1 id="MovieHeader"><a id="root" href="/">Movie Review</a></h1>

    </div>
    <div id="joinServe">

    <form>
        <h1>회원 가입</h1>

        <input type="email" id="email" placeholder="email" required><br>


        <input type="password" id="password" placeholder="password" required><br>

        <input type="text" id="userName" placeholder="이름" required><br>


        <input type="tel" id="phoneNumber" placeholder="전화번호" required><br>


        <input type="text" id="nickName" placeholder="닉네임" required><br>

        <button id="button" type="button" value="가입" onclick="submitForm()"> 가입</button>
    </form>
    </div>

</div>

</body>
</html>

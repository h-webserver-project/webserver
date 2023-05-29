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
    <title>회원 가입</title>
    <script>
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

            fetch("http://localhost:8080/api/join", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
                .then(function(response) {
                    if (response.ok) {
                        // 요청이 성공적으로 완료됨
                        console.log("회원 가입이 완료되었습니다.");
                    } else {
                        console.error("오류 발생");
                    }
                })
                .catch(function(error) {
                    console.error(error);
                });
        }
    </script>
</head>
<body>
<h1>회원 가입</h1>
<form>
    <label for="email">이메일:</label>
    <input type="email" id="email" required><br>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" required><br>

    <label for="userName">사용자 이름:</label>
    <input type="text" id="userName" required><br>

    <label for="phoneNumber">전화번호:</label>
    <input type="tel" id="phoneNumber" required><br>

    <label for="nickName">닉네임:</label>
    <input type="text" id="nickName" required><br>

    <input type="button" value="가입" onclick="submitForm()">
</form>
</body>
</html>

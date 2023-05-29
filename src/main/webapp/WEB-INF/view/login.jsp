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
    <script>
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
                    } else {
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
<h1>로그인</h1>
<form>
    <label for="email">이메일:</label>
    <input type="email" id="email" required><br>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" required><br>

    <input type="button" value="로그인" onclick="submitForm()">
</form>
</body>
</html>

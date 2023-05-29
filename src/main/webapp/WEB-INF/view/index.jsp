<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
        function sendGetRequest() {
            fetch('http://localhost:8080/get')
                .then(response => response.json())
                .then(data => {
                    // 요청에 대한 처리 로직을 작성합니다.
                    console.log(data);
                })
                .catch(error => {
                    // 오류 처리 로직을 작성합니다.
                    console.error(error);
                });
        }
    </script>
</head>

<body>
Hello
<button onclick="sendGetRequest()">GET 요청 보내기</button>

</body>

</html>
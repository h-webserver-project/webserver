<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-06-06
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Upload to imgbb</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            width: 100%;
            overflow: hidden;
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
        #bodydiv {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        input[type="file"] {
            margin-top: 20px;
            margin-left: 10px;
        }




        #uploadButton {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            margin-left: 10px;
        }

        #formContainer {
            margin-bottom: 20px;
        }

        #previewContainer {
            display: flex;
            align-items: center;
        }

        #previewImageContainer {
            width: 300px;
            height: 300px;
            border: 2px dashed #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        #previewImage {
            max-width: 100%;
            max-height: 100%;
        }

        #previewText {
            font-size: 24px;
            color: #999;
        }

        #fileInput {
            margin-left: 10px;
        }

        #inputContainer {
            display: flex;
            flex-direction: column;
            margin-left: 50px;
        }
    </style>
</head>
<body>
<div id="header">
    <h1 onclick="main()" id="main" style="cursor:pointer">Movie Review</h1>
    <form id="searchForm"  action="/admin/moviesearch/" method="GET">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
    </form>
    <ul>
        <li><a href="/movieCreate">물건올리기</a></li>
        <li><a onclick="logout()">로그아웃</a></li>
    </ul>
</div>
<div id="bodydiv">
<div id="formContainer">
    <div id="previewContainer">
        <div>
            <div id="previewImageContainer">
                <span id="previewText">+</span>
                <img id="previewImage" src="#" alt="Preview" style="display: none;">

            </div>
            <input type="file" id="fileInput">
        </div>
        <div>
            <div id="inputContainer">
                <input type="text" id="titleInput" placeholder="Title" style="margin-bottom: 10px;">
                <input type="text" id="directorInput" placeholder="Director" style="margin-bottom: 10px;">
                <input type="date" id="productYearInput" placeholder="Product Year" style="margin-bottom: 10px;">
                <input type="text" id="summaryInput" placeholder="Summary" style="margin-bottom: 10px;">
                <button id="uploadButton">Upload</button>
            </div>


        </div>

    </div>

</div>
</div>

<script>


    fetch("http://59.26.59.60:8081/api/admin/role", {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
            "Authorization": localStorage.getItem("jwtToken")

        }

    }).then(
        (response)=>{
            if(response.status === 403){
                console.log(403)
                fetch("http://59.26.59.60:8081/api/control/role", {
                    method: "GET",
                    headers: {
                        "Authorization": localStorage.getItem("jwtToken")
                    }
                }).then(
                    (response)=>{
                        console.log(response)
                        response.json();
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
                        if(json.status === 500){
                            window.location.href ="/"
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
    document.getElementById('uploadButton').addEventListener('click', uploadImage);
    document.getElementById('fileInput').addEventListener('change', previewImage);

    function uploadImage() {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];

        if (file) {
            var apiKey = 'ccc9bce509b3db7fd500bb3d3e79f8d0'; // 본인의 imgbb API 키로 대체해야 함

            var apiUrl = 'https://api.imgbb.com/1/upload';
            var formData = new FormData();
            formData.append('image', file);
            formData.append('key', apiKey);

            fetch(apiUrl, {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    console.log('imgbb API Response:', data);

                    if (data.status === 200) {
                        var imageUrl = data.data.url;
                        console.log('Uploaded Image URL:', imageUrl);

                        var titleInput = document.getElementById('titleInput');
                        var directorInput = document.getElementById('directorInput');
                        var productYearInput = document.getElementById('productYearInput');
                        var summaryInput = document.getElementById('summaryInput');

                        var title = titleInput.value;
                        var director = directorInput.value;
                        var productYear = productYearInput.value;
                        var summary = summaryInput.value;

                        var movieData = {
                            title: title,
                            director: director,
                            imgUrl: imageUrl,
                            productYear: productYear,
                            summary: summary
                        };

                        var createUrl = 'http://59.26.59.60:8081/api/movie/create';
                        fetch(createUrl, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                "Authorization": localStorage.getItem("jwtToken")
                            },
                            body: JSON.stringify(movieData)
                        })
                            .then((response) => {
                                if(response.status=== 200){
                                    window.location.href= "/admin";
                                }

                                if(data.status === 400){
                                    alert("잘못된 형식의 데이터 입니다.");
                                }
                                if(data.status === 403){
                                    window.location.href = "/";
                                }

                                return response.json()})
                            .then(data => {
                                console.log('Create movie API Response:', data);
                                console.log(data.status)

                                // 추가 작업 수행
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                    } else {
                        console.error('Image upload failed:', data.error);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }
    }

    function previewImage() {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];
        var previewImageContainer = document.getElementById('previewImageContainer');
        var previewImage = document.getElementById('previewImage');
        var previewText = document.getElementById('previewText');

        if (file) {
            var reader = new FileReader();

            reader.onload = function (e) {
                previewImage.setAttribute('src', e.target.result);
                previewImage.style.display = 'block';
                previewText.style.display = 'none';
            }

            reader.readAsDataURL(file);
        } else {
            previewImage.setAttribute('src', '#');
            previewImage.style.display = 'none';
            previewText.style.display = 'block';
        }
    }






    function main(){

        window.location.href = "/admin";
    }
</script>
</body>
</html>
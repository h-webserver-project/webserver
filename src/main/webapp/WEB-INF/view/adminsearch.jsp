<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-06-14
  Time: 오후 2:57
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


        #moviesContainer {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 20px;
            justify-items: center;
            padding: 20px 20px 0; /* Add padding to both ends */
            box-sizing: border-box; /* Include padding in the total width */
            margin-top: 100px; /* Add margin at the top */
        }

        .movie-item {
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f5f5f5;
            padding: 20px;
            transition: box-shadow 0.3s ease-in-out; /* Add transition for smooth effect */
        }

        .movie-item:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* Change the box shadow on hover */
        }

        .movie-item h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .movie-item img {
            width: 200px; /* Adjust the width as desired */
            height: 100px; /* Adjust the height as desired */
            object-fit: scale-down;
            margin-bottom: 10px;
        }

        .movie-item p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .movie-item hr {
            border: none;
            border-top: 1px solid #ddd;
            margin: 10px 0;
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
<div id="moviesContainer"></div>
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

                        if(json===undefined){
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
            response.json();
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



    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const searchs =  urlParams.get('search');

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
                        if(json.status === 403){
                            window.location.href = "/";
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
            response.json();
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

        localStorage.removeItem("jwtToken");


        window.location.href = "/";
    }

    function fetchMovies() {
        fetch("http://59.26.59.60:8081/api/movie/search/"+searchs, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Authorization": localStorage.getItem("jwtToken")
            }
        })
            .then((response) => response.json())
            .then((data) => {

                console.log(data)
                const moviesContainer = document.getElementById("moviesContainer");


                moviesContainer.innerHTML = "";


                data.data.forEach((movie) => {
                    const title = movie.title;
                    const movieItem = document.createElement("div");


                    movieItem.className = "movie-item";

                    movieItem.addEventListener("click", function() {
                        // Redirect to the moviedetail page with the movie ID
                        window.location.href = "/moviedetail/?movie=" + movie.id;
                    });


                    movieItem.innerHTML = "<h3>" + title + "</h3>" + "<img src=" +movie.imgUrl+"alt=Movie Poster class=movie-image>"+ "<p> 영화 감독: " + movie.director +"</p>"+ "<p> 출시일: " + movie.productYear +"</p>"+ "<p> 평점: " + movie.averageGrade +"</p>";

                    moviesContainer.appendChild(movieItem);
                });
            })
            .catch((error) => {
                console.error("Error fetching movies:", error);
            });
    }
    fetchMovies();


    function main(){

        window.location.href = "/admin";
    }
</script>
</body>
</html>
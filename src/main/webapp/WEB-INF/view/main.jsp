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
            z-index: 999; /* Ensure the header appears above other elements */
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

        #moviesContainer {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 20px;
            justify-items: center;
            padding: 20px 20px 0;
            box-sizing: border-box;
            margin-top: 100px;
        }

        .movie-item {
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f5f5f5;
            padding: 20px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .movie-item:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .movie-item h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .movie-item img {
            width: 200px;
            height: 100px;
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
    <script>



        fetch("http://59.26.59.60:8081/api/admin", {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
        function fetchMovies() {
            fetch("http://59.26.59.60:8081/api/movies", {
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

            window.location.href = "/";
        }
    </script>
</head>
<body>
<div id="header">
    <h1 onclick="main()" id="main" style="cursor:pointer">Movie Review</h1>
    <form id="searchForm" action="/moviesearch/" method="GET">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
    </form>
    <ul>
        <li><a href="/login">로그인</a></li>
        <li><a href="/join">회원가입</a></li>
    </ul>
</div>
<div id="moviesContainer"></div>
</body>
</html>
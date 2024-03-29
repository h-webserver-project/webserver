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
        /*리뷰 목록*/
        .review-item {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px 0;
        }

        .review-item h3 {
            margin: 8px 0;
        }

        .review-item p {
            margin: 4px 0;
        }

        .review-item button {
            border: none;
            background-color: transparent;
            color: #999;
            cursor: pointer;
        }

        .review-item button:hover {
            text-decoration: underline;
        }

        #reviewall {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 50%;
            height: 100%;
        }

        #review {
            width: 50%;
            height: 80%;
            overflow-y: scroll;
            scrollbar-width: none;
            margin-top: 20px;
        }

        #review::-webkit-scrollbar {
            display: none;
        }

        #myreview{
            margin-top: 100px;

        }
        #deleteBtn{
            padding: 0;
        }




    </style>
    <script>

        fetch("http://59.26.59.60:8081/api/user/role", {
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
                            //console.log(response)
                            response.json();
                        }
                    ).then(
                        (json)=>{
                            console.log(json)
                            console.log(json.status)
                            if(json.status ===400){
                                window.location.href ="/"
                            }
                            if(json.status ===403){
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
            fetch('http://59.26.59.60:8081/api/user/info',
                {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": localStorage.getItem("jwtToken")
                    }
                })
                .then(function(response) {
                    if (response.ok) {
                        return response.json();
                    }
                    throw new Error('Network response was not ok.');

                })
                .then((data) =>  {
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
        function fetchReviews() {


            fetch("http://59.26.59.60:8081/api/user/role", {
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

                                if(json ===undefined){
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
            fetch("http://59.26.59.60:8081/api/reviews", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": localStorage.getItem("jwtToken")
                }
            })
                .then((response) => response.json())
                .then((data) => {
                    console.log(data)
                    const reviewsContainer = document.getElementById("review");

                    reviewsContainer.innerHTML = "";

                    data.data.forEach((review) => {
                        const title = review.title;
                        const content = review.content;
                        const grade = review.grade;
                        const id = review.id;
                        console.log(grade);

                        const movieId = review.movieId;
                        const movieTile = review.movieTitle;

                        const reviewItem = document.createElement("div");

                        reviewItem.className = "review-item";

                        reviewItem.addEventListener("click", function() {
                            window.location.href = "/moviedetail/?movie=" + movieId;
                        });
                        reviewItem.style.cursor = "pointer";

                        // reviewItem.innerHTML = "<div>"+grade+"점"+"</div>"+"<h3>" +"제목 : " + title + "</h3>"  + "<p>" + content + "</p>"+"<br>"
                        //     +"<span id="deleteBtn">"+"제거"+"</span>";
                        reviewItem.innerHTML = "<h2> 영화명: " + movieTile + "</h2>" + "<h3>Title : " + title + "</h3>" + "<p> content: " + content + "</p>"  +"<p> 점수 "+grade +"점</p>" +  "<button id='deleteBtn'>" + "<br>" +"<button>"+ "제거" + "</button>";

                        // Get reference to the delete button span
                        const deleteBtn = reviewItem.querySelector("#deleteBtn");

                        // Add event listener for the delete button
                        deleteBtn.addEventListener("click", function() {
                            deleteReview(id);
                        });

                        reviewsContainer.appendChild(reviewItem);
                    });
                })
                .catch((error) => {
                    window.location.href = "/";
                });
        }
        fetchReviews();

        function deleteReview(id) {
            // Your logic to remove the review goes here
            const deleteUrl = "http://59.26.59.60:8081/api/review/delete/"+id;
            console.log(deleteUrl);
            fetch(deleteUrl, {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": localStorage.getItem("jwtToken")
                }
            })
                .then((response) => response.json())
                .catch((error) => {
                    console.error("Error fetching delete:", error);
                });
        }

    </script>
</head>
<body>
<div id="header">
    <h1 onclick="main()" id="main" style="cursor:pointer">Movie Review</h1>
    <form id="searchForm" action="/user/moviesearch/" method="GET">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
    </form>
    <ul>
        <li><a href="/myinfo">내정보</a></li>
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
        <div id =myreview>
            <h2>내가 올린 리뷰</h2>
        </div>
        <div id="review">



        </div>
    </div>
</div>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: jjong
  Date: 2023-06-13
  Time: 오전 3:48
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

        /*별모양 css*/
        .starpoint_wrap {
            display: inline-block;
        }
        .starpoint_box {
            position: relative;
            background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png)
            0 0 no-repeat;
            font-size: 0;
        }
        .starpoint_box .starpoint_bg {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            height: 18px;
            background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png)
            0 -20px no-repeat;
            pointer-events: none;
        }
        .starpoint_box .label_star {
            display: inline-block;
            width: 10px;
            height: 18px;
            box-sizing: border-box;
        }
        .starpoint_box .star_radio {
            opacity: 0;
            width: 0;
            height: 0;
            position: absolute;
        }
        .starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
            width: 10%;
        }
        .starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
            width: 20%;
        }
        .starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
            width: 30%;
        }
        .starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
            width: 40%;
        }
        .starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
            width: 50%;
        }
        .starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
            width: 60%;
        }
        .starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
            width: 70%;
        }
        .starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
            width: 80%;
        }
        .starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
            width: 90%;
        }
        .starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
            width: 100%;
        }

        .blind {
            position: absolute;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }

        /*별모양 css 끝*/

        #reviewMain {
            width: 30%;
            margin: 0 auto;
        }
        #reviewMain h3 {
            margin: 0;
            padding-bottom: 5px;
        }
        #registerBtn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #2196f3;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        #registerBtn:hover {
            background-color: #bbb;
        }

        #viewBtn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #ddd;
            color: #333;
            border-radius: 4px;
            cursor: pointer;
        }

        #viewBtn:hover {
            background-color: #bbb;
        }

        #reviewServe {
            padding: 20px;
            background-color: #f1f1f1;
            margin-top: 15px;
        }

        #reviewMain label {
            font-weight: bold;
        }

        #reviewMain input[type="title"],
        #reviewMain input[type="content"] {
            width: 100%;
            margin-bottom: 10px;
        }

        #reviewMain button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }

        #reviewMain button:hover {
            background-color: #45a049;
        }
        #reviewMain textarea {
            width: 100%;
            height: 100px; /* 원하는 높이로 조정 */
            resize: none; /* 크기 조정 비활성화 */
            font-family: inherit;
            /* font-size: inherit; */
        }
        .review-item {
            background-color: #f5f5f5;
            padding: 12px;
            margin: 5px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .review-item div {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
            font-family: 'Roboto', sans-serif;
        }

        .review-item h3 {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            letter-spacing: 0.5px;
        }

        .review-item p {
            font-size: 16px;
            font-weight: normal;
            color: #555;
            white-space: pre-wrap;
            line-height: 1.5;
            margin-top: 0;
            font-family: 'Roboto', sans-serif;
            letter-spacing: 0.3px;
            text-indent: 1rem;
        }
        .container {
            display: flex;
        }

        .image-container {
            width: 50%;
            display: flex; /* Add this line */
            justify-content: flex-end; /* Modify this line */
        }

        .image-container img {
            max-width: calc(100vh * 0.2 * (4/3)); /* 4:3 is the image's aspect ratio, Change to your image aspect ratio */
            max-height: 50vh; /* Modified to 20% of the viewport height */
            object-fit: contain;
            height: auto;
            border: 1px solid #888; /* Add this line to create a border */
            border-radius: 10px; /* Add this line to round the corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.25); /* Add this line for a drop shadow */
            margin: 20px;
        }

        .info {
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
        }

        .info-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            gap: 10px;
        }

        .info-container h1,
        .info-container h2,
        .info-container h3 {
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .info-container p {
            margin: 0;
            padding: 0;
            text-align: left;
        }



    </style>
    <script>

        function getMovieIdFromUrl() {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            return urlParams.get('movie');
        }

        // const movieId = getMovieIdFromUrl();
        // console.log(movieId);

        function submitForm() {
            //   var id = document.getElementById("id").value; //이부분은 영화값에서 받는거 아닌가?
            const movieId = getMovieIdFromUrl(); // getMovieIdFromUrl() 함수를 사용하여 movieId 값을 가져옵니다.
            var title = document.getElementById("title").value;
            var content = document.getElementById("content").value;


            var selectedRating = document.querySelector(
                'input[name="starpoint"]:checked'
            ).value;

            var grade = parseFloat(selectedRating);

            var reviewData = {
                title: title,
                content: content,
                grade: grade,
            };

            const postReviewUrl = "http://localhost:8081/api/review/create/"+movieId;
            console.log(postReviewUrl);
            fetch(postReviewUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    "Authorization": localStorage.getItem("jwtToken")
                },
                body: JSON.stringify(reviewData)
            })
                .then((response) => {

                    if(response.status=== 200){
                        console.log("리뷰가 작성되었습니다.")
                        // window.location.href= "/admin";
                    }

                    if(response.status === 400){
                        alert("잘못된 형식의 데이터 입니다.");
                    }

                     response.json()})
                .then(data => {
                    console.log('Create movie API Response:', data);
                    console.log(data.status)

                    // 추가 작업 수행
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            location.reload(); // 성공적으로 응답이 오면 페이지 새로고침

        }

        function showReviewList() {
            const reviewServer = document.querySelector('#reviewServe');
            const reviewList = document.querySelector('#ShowReviewList');

            reviewServer.style.display = 'none';
            reviewList.style.display = 'block';

            // change the style of the button
            const viewBtn = document.querySelector('#viewBtn');
            viewBtn.style.backgroundColor = '#2196f3';
            viewBtn.style.color = 'white';
            viewBtn.style.cursor = 'default';

            // change the style of the register button
            const registerBtn = document.querySelector('#registerBtn');
            registerBtn.style.backgroundColor = '#ddd';
            registerBtn.style.color = '#333';
            registerBtn.style.cursor = 'pointer';
        }
        function showReviewAdd(){
            const reviewServer = document.querySelector('#reviewServe');
            const reviewList = document.querySelector('#ShowReviewList');
            reviewServer.style.display = 'block';
            reviewList.style.display = 'none';
            // change the style of the view button
            const viewBtn = document.querySelector('#viewBtn');
            viewBtn.style.backgroundColor = '#ddd';
            viewBtn.style.color = '#333';
            viewBtn.style.cursor = 'pointer';

            // change the style of the register button
            const registerBtn = document.querySelector('#registerBtn');
            registerBtn.style.backgroundColor = '#2196f3';
            registerBtn.style.color = 'white';
            registerBtn.style.cursor = 'default';
        }

        function fetchReviews() {
            const movieId = getMovieIdFromUrl(); // getMovieIdFromUrl() 함수를 사용하여 movieId 값을 가져옵니다.
            const getReviews = "http://localhost:8081/api/review/movie/all/"+movieId;
            fetch(getReviews, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": localStorage.getItem("jwtToken")
                }
            })
                .then((response) => response.json())
                .then((data) => {
                    console.log(data)
                    const reviewsContainer = document.getElementById("ShowReviewList");

                    reviewsContainer.innerHTML = "";

                    data.data.forEach((review) => {
                        const title = review.title;
                        const content = review.content;
                        const grade = review.grade;

                        const reviewItem = document.createElement("div");

                        reviewItem.className = "review-item";

                        reviewItem.innerHTML = "<div>"+grade+"점"+"</div>"+"<h3>" +"제목 : " + title + "</h3>" + "<br>" + "<p>" + content + "</p>";

                        reviewsContainer.appendChild(reviewItem);
                    });
                })
                .catch((error) => {
                    console.error("Error fetching reviewes:", error);
                });
        }
        fetchReviews();

        function findMovie(){
            const movieId = getMovieIdFromUrl();
            const getReviews = "http://localhost:8081/api/movie/info/"+movieId;
            fetch(getReviews, {
                method: "GET",
                headers: {
                 "Content-Type": "application/json",
                 "Authorization": localStorage.getItem("jwtToken")
                }
            })
             .then((response) => response.json())
             .then((data) => {
                 console.log(data)
                 const title = data.data.title;
                 const director = data.data.director;
                 const imgUrl = data.data.imgUrl;
                 const productYear = data.data.productYear;
                 const summary = data.data.summary;
                 const averageGrade = data.data.averageGrade;

                 const imageContainer = document.querySelector('.image-container');
                 const infoContainer = document.querySelector('.info-container');

                 // 이미지 요소 생성
                 const imageElement = document.createElement('img');
                 imageElement.src = imgUrl;
                 imageElement.alt = title;
                 imageContainer.appendChild(imageElement);

                 // 영화 정보를 표시하는 요소 생성
                 const titleElement = document.createElement('h2');
                 titleElement.textContent = title;
                 infoContainer.appendChild(titleElement);

                 const directorElement = document.createElement('p');
                 directorElement.textContent = '감독: ' + director;
                 infoContainer.appendChild(directorElement);

                 const productYearElement = document.createElement('p');
                 productYearElement.textContent = '개봉일: ' + productYear;
                 infoContainer.appendChild(productYearElement);

                 const summaryElement = document.createElement('p');
                 summaryElement.textContent = '요약: ' + summary;
                 infoContainer.appendChild(summaryElement);

                 const averageGradeElement = document.createElement('p');
                 averageGradeElement.textContent = '평균 평점: ' + averageGrade;
                 infoContainer.appendChild(averageGradeElement);

             })
             .catch((error) => {
                 console.error("Error not Found movies:", error);
             });
        }
        findMovie();
    </script>
</head>
<body>
<div id="header">
    <h1>Movie Review</h1>
    <form id="searchForm" action="/search" method="GET">
        <input type="text" name="query" placeholder="검색어를 입력하세요" />
    </form>
    <ul>
        <li><a href="/myinfo">마이페이지</a></li>
    </ul>
</div>

<div class="container">
    <div class="image-container">
        <!-- 이미지는 이곳에 등록됩니다 -->
    </div>
    <div class="info">
        <div class="info-container">
        <!-- 영화 정보는 이곳에 표시됩니다 -->
        </div>
    </div>
</div>

<div id="reviewMain">
    <h3>Review</h3>
    <div>
        <span id="registerBtn" onclick="showReviewAdd()">등록</span>
        <span id="viewBtn" onclick="showReviewList()">보기</span>
    </div>

    <div id="ShowReviewList" style="display: none;">

    </div>

    <div id="reviewServe">
        <form>
            <label>평점</label>
            <div class="starpoint_wrap">
                <div class="starpoint_box">
                    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                    <label for="starpoint_3" class="label_star" title="1.5" ><span class="blind">1.5점</span></label >
                    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
                    <label for="starpoint_5" class="label_star" title="2.5" ><span class="blind">2.5점</span></label>
                    <label for="starpoint_6" class="label_star" title="3" ><span class="blind">3점</span></label>
                    <label for="starpoint_7" class="label_star" title="3.5" ><span class="blind">3.5점</span></label>
                    <label for="starpoint_8" class="label_star" title="4" ><span class="blind">4점</span></label>
                    <label for="starpoint_9" class="label_star" title="4.5" ><span class="blind">4.5점</span></label>
                    <label for="starpoint_10" class="label_star" title="5" ><span class="blind">5점</span></label >
                    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio" value="1"/>
                    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value="1.5"/>
                    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value="2" />
                    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value="2.5" />
                    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value="3" />
                    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value="3.5" />
                    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio" value="4" />
                    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value="4" />
                    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value="4.5" />
                    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value="5" />
                    <span class="starpoint_bg"></span>
                </div>
            </div>
            <br />
            <label>제목</label>
            <input type="title" id="title" placeholder="제목" required /><br />
            <label>후기</label><br />
            <textarea id="content" placeholder="후기" required></textarea><br />

            <button id="button" type="button" value="전송" onclick="submitForm()">
                전송
            </button>
        </form>
    </div>
</div>
</body>
</html>
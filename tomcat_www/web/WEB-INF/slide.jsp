<%@ page import="java.lang.reflect.Array" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String Length = request.getParameter("slideLength");
    String fileName = request.getParameter("fileName");
    String noTypeMp3 = fileName.replace(".mp3", "");
%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="./assets/css/main.css" />
    <noscript><link rel="stylesheet" href="./assets/css/noscript.css" /></noscript>
    <title>TTS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        #mainTitle {animation: mark 1s infinite; color: white;}
        @keyframes mark {
            to{color: #7ec3ee;}
        }
        #ppt {border: 1px solid black; margin-top: 10px;}
        #ppt > img {width: 90%;}
    </style>
    <script>
        let op = 0;
        function test(nextPageNum){
            op = nextPageNum;
            console.log(op);

            if(op > 1){
                document.getElementById("next").click();
            }
            document.getElementById("audio").src = "mp3Files/<%=noTypeMp3%>"+op+".mp3";  /* mp3파일 순차적 반복 */
            document.getElementById("audio").autoplay;

            let media = document.getElementById("audio");
            media.currentTime = 0;
            media.play();
        }
        function plus(){
            op = op + 1;
            document.getElementById("audio").src = "mp3Files/<%=noTypeMp3%>"+op+".mp3";  /* mp3파일 순차적 반복 */
            document.getElementById("audio").autoplay;

            let media = document.getElementById("audio");
            media.currentTime = 0;
            media.play();
        }
        function minus(){
            op = op - 1;
            document.getElementById("audio").src = "mp3Files/<%=noTypeMp3%>"+op+".mp3";  /* mp3파일 순차적 반복 */
            document.getElementById("audio").autoplay;

            let media = document.getElementById("audio");
            media.currentTime = 0;
            media.play();
        }
    </script>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">
    <!-- Header -->
    <header id="header" class="alt">
        <span class="logo"><img src="images/gu.png" alt="" /></span>
        <h1 id="mainTitle"><a href="index.jsp" style="text-decoration: none;">Go To Home</a></h1>
        <p style="color: white;">2022 GU Capstone Design Team.MTB<br>
            powered by HTML5UP
        </p>
    </header>
    <!-- Nav -->
    <nav id="nav">
        <ul>
            <li><a href="#intro" class="active" style="text-decoration: none; color: darkgrey;">Presentation Page</a></li>
        </ul>
    </nav>
    <!-- Main -->
    <div id="main">
        <!-- Introduction -->
        <section id="intro" class="main special" style="border-bottom: 1px solid darkgray;">
            <div class="spotlight">
                <div class="content">
                    <header class="major">
                        <h2>Power Point Slides</h2>
                        <h3 id="h3"></h3>
                    </header>
                </div>
            </div>

<%--            PPT 슬라이드 섹션--%>
            <div class="row aln-center">
                <audio id="audio" src="./mp3Files/default.mp3" type="audio/mp3" controls onended="test(op+1)"></audio>
                <div id="carouselExampleControls" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active" id="ppt">
                            <img src="/tempImg/pptCapturedImage<%= 1 %>.png" class="d-block w-90">
                        </div>
<%
                    for(int i = 1; i < Integer.parseInt(Length); i++){

%>
                        <div class="carousel-item" id="ppt">
                            <img src="/tempImg/pptCapturedImage<%= (i+1) %>.png" class="d-block w-90">
                        </div>
<%
                    }
%>
                    </div>
                    <div style="width: 100%; height: 10%; display: flex; justify-content: space-between;">
                        <button style="background-color: #636363; position: relative; display: inline-block; display: none;" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button id="next" style="background-color: #636363; position: relative; display: inline-block; display: none;" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                        <button id="prev1" style="background-color: #636363; position: relative; display: inline-block;" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" onclick="minus()">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button id="next1" style="background-color: #636363; position: relative; display: inline-block;" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" onclick="plus()">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>
            <br><br>
        </section>
    </div>
    <!-- Footer -->
    <footer id="footer">
        <section>
            <h2 style="color: white;">Summary</h2>
            <p style="color: white;">A program that reads the contents of files such as PPT, PPTX, DOC, DOCX, PDF, and HWP, Etc frequently used in daily life using TTS.</u> Also, in the case of a file in the same format as PowerPoint, the slide of the file is captured and displayed on the homepage, and automatically scrolls or turns over the slide in synchronization with the reading voice.</p>
            <ul class="actions">
                <li><a href="generic.jsp" class="button">Learn More</a></li>
            </ul>
        </section>
        <section>
            <h2 style="color: white;">Info</h2>
            <dl class="alt" style="color: white;">
                <dt>Address</dt>
                <dd>Gwangju University &bull; Hyoduk-ro 277, Gwang Ju &bull; Republic Of Korea</dd>
                <dt>Phone</dt>
                <dd>062-1234-5678</dd>
                <dt>Email</dt>
                <dd>risker30@kakao.com</dd>
            </dl>
            <ul class="icons">
                <li><a href="#" class="icon brands fa-twitter alt"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon brands fa-facebook-f alt"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon brands fa-instagram alt"><span class="label">Instagram</span></a></li>
                <li><a href="https://github.com/qnffnrl/gucapstone" class="icon brands fa-github alt"><span class="label">GitHub</span></a></li>
                <li><a href="#" class="icon brands fa-dribbble alt"><span class="label">Dribbble</span></a></li>
            </ul>
        </section>
        <p class="copyright" style="color: white;">&copy; Team.MTB All right reserved / Design: HTML5 UP</p>
    </footer>
</div>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
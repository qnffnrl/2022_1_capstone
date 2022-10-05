<%@page contentType="text/html; charset=EUC-KR" %>
<%--<%--%>
<%--    if ( request.getParameter("slideLength") == "null" ){--%>
<%--        response.sendRedirect("http://49.238.167.72:10000");--%>
<%--    }else {--%>
<%--%>--%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no" />
  <link rel="stylesheet" href="./assets/css/main.css" />
  <noscript><link rel="stylesheet" href="./assets/css/noscript.css" /></noscript>
  <title>TTS</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    #mainTitle {animation: mark 1s infinite; color: white;}
    @keyframes mark {
      to{color: #7ec3ee;}
    }

    #ppt {border: 1px solid black; margin-top: 10px;}
    #ppt > img {width: 90%;}
  </style>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

  <!-- Header -->
  <header id="header" class="alt">
    <span class="logo"><img src="images/gu.png" alt="" /></span>
    <h1 id="mainTitle"><a href="index.jsp" style="text-decoration: none;">File reading program using TTS</a></h1>
    <p style="color: white;">2022 GU Capstone Design Team.MTB<br>
      powered by HTML5UP
    </p>
  </header>

  <!-- Nav -->
  <nav id="nav">
    <ul>
      <li><a href="#intro" class="active" style="text-decoration: none; color: darkgrey;">doc, hwp, Etc Page</a></li>
    </ul>
  </nav>

  <!-- Main -->
  <div id="main">

    <!-- Introduction -->
    <section id="intro" class="main special" style="border-bottom: 1px solid darkgray;">
      <div class="spotlight">
        <div class="content">
          <header class="major">
            <h2>doc, hwp, Etc</h2>
          </header>
        </div>
      </div>
      <div class="row aln-center">
        <audio src="mp3Files/<% out.print(request.getParameter("fileName")); %>" controls type="audio/mp3"></audio>
      </div>
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
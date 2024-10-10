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
	<style>
		.server {width: 220px; height: 220px;}
		#mainTitle {animation: mark 1s infinite}
		@keyframes mark {
			to{color: #7ec3ee;}
		}
		#nav ul li a {text-decoration: none; color: gray;}
		dd {color: white;}
		.spinner-border {
			position: absolute;
			top: 50%;
			left: 50%;
			z-index: 1;
			width: 3rem;
			height: 3rem;
		}
	</style>
	<script>
		function showLoading(){

			var maskHeight = $(document).height();
			var maskWidth = window.document.body.clientWidth;

			var mask = "<div id='mask' style='position: absolute; z-index: 1000; background-color: #000000; left: 0; top: 0;'></div>";

			$('body')
					.append(mask)

			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight,
				'opacity' : '0.3'
			});
			$("#loading").show();
		}
	</script>
</head>
<body class="is-preload">
<div class="spinner-border" role="status" style="display: none;" id="loading">
	<span class="sr-only">Loading...</span>
</div>
<!-- Wrapper -->
<div id="wrapper">

	<!-- Header -->
	<header id="header" class="alt">
		<span class="logo"><img src="images/gu.png" alt="" /></span>
		<h1 id="mainTitle" style="text-decoration: none; color: white;">File reading program using TTS</h1>
		<p style="color: white;">2022 GU Capstone Design Team.MTB<br>
			powered by HTML5UP
		</p>
	</header>

	<!-- Nav -->
	<nav id="nav">
		<ul>
			<li><a href="#intro" class="active">File Upload</a></li>
			<li><a href="#first">Introduction</a></li>
			<li><a href="#second">Technology</a></li>
			<li><a href="#cta">Project Management</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<div id="main">

		<!-- Introduction -->
		<section id="intro" class="main special">
			<div class="spotlight">
				<div class="content">
					<header class="major">
						<h2>File Upload Here!!!</h2>
					</header>
				</div>
			</div>

			<div class="row aln-center">
				<form action="parsing.jsp" method="post" enctype="multipart/form-data" class="container-md">
					<input id="file" class="box file width " type="file" name="uploadFile">
					<input style="position: relative; top: 70px;" type="submit" value="enter" onclick="showLoading()">
				</form>
			</div>
			<br><br><br><br><br>
		</section>

		<!-- First Section -->
		<section id="first" class="main special">
			<header class="major">
				<h2>Project Introduce</h2>
				<h3>Web Server</h3>
			</header>
			<ul class="features">
				<li>
					<img class="icon solid major style1 fa-code server" src="images/httpd.png">
					<h3>Apache httpd</h3>
					<p>
						Server Version : Apeche/2.4.6<br>
						Server Built : Mar 24 2022 14:58:21<br>
						Operating System : Linux/CentOS
					</p>
				</li>
				<li>
					<img class="icon major style3 fa-copy server" src="images/tomca.png">
					<h3>Apache Tomcat</h3>
					<p>
						Apache Tomcat Version 9.0.8<br>
						JAVA_VERSION 1.8.0_333<br>
					</p>
				</li>
				<li>
					<img class="icon major style5 fa-gem server" src="images/flask.png">
					<h3>Flask</h3>
					<p>
						Flask Version 2.0.3<br>
						Python Version 3.6.8<br>
						Werkzeug Version 2.0.3
					</p>
				</li>
			</ul>
			<footer class="major">
				<ul class="actions special">
					<li><a href="generic.jsp" class="button">Project Diagram</a></li>
				</ul>
			</footer>
		</section>

		<!-- Second Section -->
		<section id="second" class="main special">
			<header class="major">
				<h2>Techlology</h2>
				<p>Technology used in this project</p>
			</header>
			<ul class="statistics">
				<li class="style1">
					<span class="icon solid fa-code-branch"></span>
					<strong>JAVA</strong> Language
				</li>
				<li class="style2">
					<span class="icon fa-folder-open"></span>
					<strong>Python</strong> Language
				</li>
				<li class="style3">
					<span class="icon solid fa-signal"></span>
					<strong>Bootstrap</strong> Framework
				</li>
				<li class="style4">
					<span class="icon solid fa-laptop"></span>
					<strong style="font-size: 35px;">Raspberry Pi</strong> H/W Platform
				</li>
				<li class="style5">
					<span class="icon fa-gem"></span>
					<strong style="font-size: 40px;">Apache POI</strong> Library
				</li>
			</ul>
			<p class="content"></p>
			<footer class="major">
				<ul class="actions special">
					<li><a href="generic.jsp" class="button">Project Diagram</a></li>
				</ul>
			</footer>
		</section>

		<!-- Get Started -->
		<section id="cta" class="main special">
			<header class="major">
				<h2>Project Management</h2>
			</header>
			<footer class="major">
				<ul class="actions special">
				<div style="width: 50%; margin: 10px;">
					<h2 id="github" style="font-weight: bolder;">
						Github
					</h2>
					<img src="images/github.png" alt="GitHub" style="width: 100%; height: 90%; border: darkgray 1px solid;">
					<li><a href="https://github.com/qnffnrl/gucapstone" class="button primary" style="font-weight: bolder">Learn More</a></li>
				</div>

				<div style="width: 50%; margin: 10px; position: relative;">
					<h2 id="naver" style="font-weight: bolder;">
						Naver Cafe
					</h2>
					<iframe src="https://cafe.naver.com/riskers" allowfullscreen style="width: 100%; height: 90%; border: darkgray 1px solid;"></iframe>
					<li><a href="https://cafe.naver.com/riskers" class="button primary" style="font-weight: bolder">Learn More</a></li>
				</div>
				</ul>

			</footer>
			<br><br><br>
		</section>

	</div>

	<!-- Footer -->
	<footer id="footer">
		<section>
			<h2 style="color: white;">Summary</h2>
			<p style="color: white;"><u>A program that reads the contents of files such as PPT, PPTX, DOC, DOCX, PDF, and HWP, Etc frequently used in daily life using TTS.</u> Also, in the case of a file in the same format as PowerPoint, the slide of the file is captured and displayed on the homepage, and automatically scrolls or turns over the slide in synchronization with the reading voice.</p>
			<ul class="actions">
				<li><a href="generic.jsp" class="button">Learn More</a></li>
			</ul>
		</section>
		<section>
			<h2 style="color: white;">Info</h2>
			<dl class="alt">
				<dt>Address</dt>
				<dd>Gwangju University &bull; Hyoduk-ro 277 Gwang Ju &bull; Republic Of Korea</dd>
				<dt>Phone</dt>
				<dd>000-0000-000</dd>
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
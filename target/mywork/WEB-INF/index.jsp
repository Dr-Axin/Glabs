<%@page import="entity.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>G labs</title>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		body {
			overflow: hidden;
		}

		.dark {
			position: absolute;
			top: 10%;
			left: 31%;
		}
	</style>
	<link href="数字雨css/font.css" rel="stylesheet">
	<link rel="stylesheet" href="数字雨css/style.css">
	<link rel="stylesheet" href="数字雨css/style-search.css" media="screen" type="text/css" />
	<link rel="stylesheet" href="菜单css/reset.css">
	<link rel="stylesheet" href="菜单css/style.css">
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script>
		function c() {
			location.href = "http://www.baidu.com/s?wd=" + $("#input").val();
			//jQuery实现
		}
	</script>
</head>

<body>
	<img src="img/bai.png"
			style="width:100px; height:80px;position: absolute; top:3%;left:1%" />
	<!--logo、搜索栏 -->
	<div><img src="img/G(2).png" width="500px" height="380px" class="dark" /></div>

	<canvas id="canvas" width="1280" height="1024"> 您的浏览器不支持canvas标签，请您更换浏览器
	</canvas>
	<script src="数字雨js/word.js"></script>
	<p id="offscreen-text" class="offscreen-text"></p>
	<p id="text" class="text"></p>

	<div id="d" class="webdesigntuts-workshop">
		<span>
			<input class="input" id="input" type="search" placeholder="请输入您要搜索的内容" />
			<button class="text-workshop" onclick="c();">好嗨哦</button>
		</span> </div>
	<!--菜单栏-->
	<div style="height:2000px;"></div>

	<div id="cd-nav">
		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>

		<nav id="cd-main-nav">
			<ul>
				<li><a href="toLogin.do">Login</a></li>
				<li><a href="toRegist.do">Regist</a></li>

			</ul>
		</nav>
	</div>

	<script src="菜单/jquery-2.1.1.js"></script>
	<script src="菜单/main.js"></script>
</body>

</html>
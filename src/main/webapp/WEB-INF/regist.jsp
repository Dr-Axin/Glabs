<%@page import="entity.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">		
	<meta http-equiv="Cache-Control" content="no-transform" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>注册</title>
	<link rel="stylesheet" media="all" href="登录注册css/main.css" />
</head>

	<body class="align">
		<div class="site__container">
			<div class="grid__container">
				<img class="logo" src="img/G.png" />
				<%Admin a =(Admin)request.getAttribute("admin"); %>
					<form _lpchecked="1" accept-charset="UTF-8" action="regist.do" class="form form--login" method="post">
						<div class="form__field">
							<input autofocus="true" class="form__input" id="login__name" name="Name" placeholder="用户名" required="" type="text" />
						</div>
						<div class="form__field">
							<input autocomplete="off" class="form__input" id="login__password" name="Password" placeholder="密码 " required="" type="text" />
                        </div>
                        <div class="form__field">
							<input autocomplete="off" class="form__input" id="login__email" name="Email" placeholder="邮箱" required="" type="text" />
                        </div>
                        <div class="form__field">
							<input autocomplete="off" class="form__input" id="login__tel" name="Telephone" placeholder="电话号码 " required="" type="text" />
						</div>
						<div class="form__field">							
							<input type="submit" value="注 册" />
						</div>
					</form>
					
			</div>
		</div>
		<!----背景效果---->
	<canvas id="Mycanvas" style="position:fixed;top:0;left:0;z-index:-1"></canvas>
	<script>
		//定义画布宽高和生成点的个数
		var WIDTH = window.innerWidth, HEIGHT = window.innerWidth, POINT = 45;
		
		var canvas = document.getElementById('Mycanvas');
		canvas.width = WIDTH,
		canvas.height = HEIGHT;
		var context = canvas.getContext('2d');
		context.strokeStyle = 'rgba(255,255,255,0.1)',
		context.strokeWidth = 1,
		context.fillStyle = 'rgba(255,255,255,0.1)';
		var circleArr = [];

		//线条：开始xy坐标，结束xy坐标，线条透明度
		function Line (x, y, _x, _y, o) {
			this.beginX = x,
			this.beginY = y,
			this.closeX = _x,
			this.closeY = _y,
			this.o = o;
		}
		//点：圆心xy坐标，半径，每帧移动xy的距离
		function Circle (x, y, r, moveX, moveY) {
			this.x = x,
			this.y = y,
			this.r = r,
			this.moveX = moveX,
			this.moveY = moveY;
		}
		//生成max和min之间的随机数
		function num (max, _min) {
			var min = arguments[1] || 0;
			return Math.floor(Math.random()*(max-min+1)+min);
		}
		//绘制原点
		function drawCricle (cxt, x, y, r, moveX, moveY) {
			var circle = new Circle(x, y, r, moveX, moveY)
			cxt.beginPath()
			cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
			cxt.closePath()
			cxt.fill();
			return circle;
		}
		//绘制线条
		function drawLine (cxt, x, y, _x, _y, o) {
			var line = new Line(x, y, _x, _y, o)
			cxt.beginPath()
			cxt.strokeStyle = 'rgba(255,255,255,'+ o +')'
			cxt.moveTo(line.beginX, line.beginY)
			cxt.lineTo(line.closeX, line.closeY)
			cxt.closePath()
			cxt.stroke();

		}
		//初始化生成原点
		function init () {
			circleArr = [];
			for (var i = 0; i < POINT; i++) {
				circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
			}
			draw();
		}

		//每帧绘制
		function draw () {
			context.clearRect(0,0,canvas.width, canvas.height);
			for (var i = 0; i < POINT; i++) {
				drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
			}
			for (var i = 0; i < POINT; i++) {
				for (var j = 0; j < POINT; j++) {
					if (i + j < POINT) {
						var A = Math.abs(circleArr[i+j].x - circleArr[i].x),
							B = Math.abs(circleArr[i+j].y - circleArr[i].y);
						var lineLength = Math.sqrt(A*A + B*B);
						var C = 1/lineLength*7-0.009;
						var lineOpacity = C > 0.03 ? 0.03 : C;
						if (lineOpacity > 0) {
							drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i+j].x, circleArr[i+j].y, lineOpacity);
						}
					}
				}
			}
		}

		//调用执行
		window.onload = function () {
			init();
			setInterval(function () {
				for (var i = 0; i < POINT; i++) {
					var cir = circleArr[i];
					cir.x += cir.moveX;
					cir.y += cir.moveY;
					if (cir.x > WIDTH) cir.x = 0;
					else if (cir.x < 0) cir.x = WIDTH;
					if (cir.y > HEIGHT) cir.y = 0;
					else if (cir.y < 0) cir.y = HEIGHT;
					
				}
				draw();
			}, 16);
		}

	</script>
	</body>
</html> --%>




<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>regist</title>

<link rel="stylesheet" href="highlight_css/style.css">
<script src="highlight_js/jrj6out.js"></script>
<script>try{Typekit.load({ async: false });}catch(e){}</script>
<script src="highlight_js/prefixfree.min.js"></script>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<link rel="stylesheet" media="all" href="登录注册css/main.css" />
	<script>
		function c() {
			location.href = "http://www.baidu.com/s?wd=" + $("#input").val();
			//jQuery实现
		}
	</script>

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

</head>

<body>

	
<div class="x-mark">
	<div class="container">
		<div class="left"></div>
		<div class="right"></div>
	</div>
</div>
<div class="intro-container">
	
	<h1 class="th1">G labs </h1>
	<h2 class="th1">嘿，老弟玩儿游戏吗？</h2>

	<div class="button shift-camera-button">
		<div class="border">
			<div class="left-plane"></div>
			<div class="right-plane"></div>
		</div>	
		<div class="text">To The Stars</div>
	</div>
</div>

<div class="sky-container" style="position: absolute; top:0%;">
	<div class="text-right sky-container__left">	
		<div class="site__container">
			<div class="grid__container">
				<img class="logo" src="img/G.png" />
				<%Admin a =(Admin)request.getAttribute("admin"); %>
					<form _lpchecked="1" accept-charset="UTF-8" action="regist.do" class="form form--login" method="post">
						<div class="form__field">
							<input autofocus="true" class="form__input" id="login__name" name="Name" placeholder="用户名" required="" type="text" />
						</div>
						<div class="form__field">
							<input autocomplete="off" class="form__input" id="login__password" name="Password" placeholder="密码 " required="" type="text" />
                        </div>
                        <div class="form__field">
							<input autocomplete="off" class="form__input" id="login__email" name="Email" placeholder="邮箱" required="" type="text" />
                        </div>
                        <div class="form__field">
							<input autocomplete="off" class="form__input" id="login__tel" name="Telephone" placeholder="电话号码 " required="" type="text" />
						</div>
						<div class="form__field">							
							<input type="submit" value="注 册" />
						</div>
					</form>
					
			</div>
		</div>
	</div>
</div>


<script src='highlight_js/jquery.min.js'></script>
<script src='highlight_js/TweenMax.min.js'></script>
<script src='highlight_js/three.min.js'></script>
<script src="highlight_js/index.js"></script>


</body>
</html>

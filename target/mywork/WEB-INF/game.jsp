<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>被逼无奈404</title>
<link rel="stylesheet" href="zhonglihezi-css/lanrenzhijia.css">
<script src="zhonglihezi-js/lanrenzhijia.js"></script>
<script src="zhonglihezi-js/lanrenzhijia2.js"></script>
</head>
	<style type="text/css">
		body{
			background: #F7FAFC;
			overflow: hidden;
			background: #fff;
			}
	</style>
<body>
<canvas id="screen">被逼无奈404</canvas>
<div id="textures"style="position: absolute; top:1px;">
	<img src="images/caisse_bois_frag3.jpg" alt="">
	<img src="images/caisse_explosive_f2.jpg" alt="">
	<img src="images/caisse_export.jpg" alt="">
	<img src="images/caisse_metal_02.jpg" alt="">
	<img src="images/caisse_bois_frag3.jpg" alt="">
	<img src="images/caisse_jurancon_face1.jpg" alt="">
	<img src="images/caisse_jurancon_face2.jpg" alt="">
	<img src="images/miam-fruit2.jpg" alt="">
	<img src="images/caisse_orange_face1.jpg" alt="">
</div>
<img id="blade" class="textures" src="images/caisse_coke_f2.jpg" alt=""> 
<div style="text-align:center;clear:both">
</div>
<!----背景效果---->
	<canvas id="Mycanvas"></canvas>
	<script>
		//定义画布宽高和生成点的个数
		var WIDTH = window.innerWidth, HEIGHT = window.innerWidth, POINT = 45;
		
		var canvas = document.getElementById('Mycanvas');
		canvas.width = WIDTH,
		canvas.height = HEIGHT;
		var context = canvas.getContext('2d');
		context.strokeStyle = 'rgba(0,0,0,0.2)',
		context.strokeWidth = 1,
		context.fillStyle = 'rgba(0,0,0,0.1)';
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
		// 绘制原点
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
			cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
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

		//调用执行
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
</html>
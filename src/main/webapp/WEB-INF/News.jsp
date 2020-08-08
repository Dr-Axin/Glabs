<%@page import="entity.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>News</title>
	<link rel="stylesheet" type="text/css" href="随机连线style.css" media="all" />
	<link rel="stylesheet" href="菜单css/reset.css"> 
	<link rel="stylesheet" href="菜单css/style.css">
	<link rel="stylesheet" href="分享css/baguetteBox.min.css">
	<link rel="stylesheet" href="分享css/thumbnail-gallery.css">
	<link rel="stylesheet" href="轮播图css/jquery.css">
	<style type="text/css">
		body{
			text-align: center;
			background: #F7FAFC;
			background: #24292e;
			height:1000px;
			width:900px;
			}
		.jq22-demo{ text-align: center; margin-top: 30px; }
		.jq22-demo a{ padding-left: 20px; padding-right: 20px; }
				.dark {
			position: absolute;
			top: 10%;
			left: 31%;
		}

		.btn_start{
			border: 0px;
			background-color: rgba(0, 0, 0, 0);
			color: #e84a64;		
			font-size: 22px;
			opacity: 1;
    		padding: .4em;
    		margin-left: 1.6em;
    		border-bottom: none;

		}
	</style>
</head>
<body>
	

	<a  href="Chrome/index.jsp"><img src="img/bai.png"  style="width:100px; height;40px;position: absolute; top:4%;left:1%"/></a>
	
	<!--------菜单栏------------------------------------------------------------------------------------------------>
	<div ></div>

	<div id="cd-nav">
		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>

		<nav id="cd-main-nav">
		<ul style="font-size: 130%; ">
			<li><a href="userHome.do">Home</a></li>
				<li><a href="News.do">News</a></li>
				<li><input type="button" value="Personal" class="btn_start" onclick="location.href='toUserData.do?name=<%=request.getSession().getAttribute("username")%>';" /></li>
			</ul>
		</nav>
	</div>

	<script src="菜单js/jquery-2.1.1.js"></script>
	<script src="菜单js/main.js"></script> 	

	<div><a  href="Chrome/index.jsp"><img src="img/G(2).png" width="600px" height="440px" style="position: absolute; top:-10%;left:28%"/></div>
	
		
	<!----轮播图------------------------------------------------------------------------------------------------------>

	<div class="content-part part-tese">
	<div class="gallery_container">
		<div class="gallery_wrap threeD_gallery_wrap" style="margin-left: -360px; margin-top: -260px;">
			<div href="javascript:;" class="gallery_item threeD_gallery_item gallery_left_middle">
				<img src="轮播图/1.jpg" class="show">
				<div class="line-t">
				</div>
				<div class="line-r">
				</div>
				<div class="line-b">
				</div>
				<div class="line-l">
				</div>
			</div>
			<div href="javascript:;" class="gallery_item threeD_gallery_item front_side">
				<img src="轮播图/2.jpg" class="show">
				<div class="line-t">
				</div>
				<div class="line-r">
				</div>
				<div class="line-b">
				</div>
				<div class="line-l">
				</div>
			</div>
			<div href="javascript:;" class="gallery_item threeD_gallery_item gallery_right_middle">
				<img src="轮播图/29.jpg" class="show">
				<div class="line-t">
				</div>
				<div class="line-r">
				</div>
				<div class="line-b">
				</div>
				<div class="line-l">
				</div>
			</div>
			<div href="javascript:;" class="gallery_item threeD_gallery_item gallery_out">
				<img src="轮播图/4.jpg" class="show">
				<div class="line-t">
				</div>
				<div class="line-r">
				</div>
				<div class="line-b">
				</div>
				<div class="line-l">
				</div>
			</div>
		</div>
		<a class="prev" href="javascript:;"></a> <a class="next" href="javascript:;"></a>
	</div>
</div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> 
<script src="轮播图js/jquery.js"></script> 
<script>
	$(function(){
		$('.content-part.part-tese').addClass('show');
		$('.gallery_container').gallery_slider({imgNum: 4});
	})
	</script>
	<!------------------------------------------------------------------------------------------------------>
	<!------------游戏分享---------------------------------------------------------------------------->
	<div class="htmleaf-container">
		<div class="container gallery-container">

		    <div class="tz-gallery">

		        <div class="row">

		            <div class="col-sm-6 col-md-4" style="position: absolute; top:900px;left:100px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://heroes.blizzard.cn/landing">
		                        <img src="img/fengbao.jpg" alt="风暴英雄">
		                    </a>
		                    <div class="caption">
		                        <h3>风暴英雄</h3>
		                        <p>《风暴英雄》是暴雪出品的一款免费在线团队竞技（MOBA）游戏，它将颠覆你所认识的MOBA.战斗的基础依然相似：两支队伍、两个基地、还有中间的战场。但这也是仅有的相似之处。</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-6 col-md-4"style="position: absolute; top:900px;left:500px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://war3.blizzard.cn/home">
		                        <img src="img/moshouzhengb.jpg" alt="魔兽争霸">
		                    </a>
		                    <div class="caption">
		                        <h3>魔兽争霸</h3>
		                        <p>《魔兽争霸》是暴雪娱乐公司开发的角色扮演即时战略游戏系列，魔兽争霸在世界游戏排名一直排名在前列，魔兽争霸是一款即时战略性游戏。</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-6 col-md-4"style="position: absolute; top:900px;left:900px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://hs.blizzard.cn/landing">
		                        <img src="img/lushi.jpg" alt="炉石传说">
		                    </a>
		                    <div class="caption">
		                        <h3>炉石传说</h3>
		                        <p>《炉石传说：魔兽英雄传》是一款由暴雪娱乐开发的集换式卡牌游戏。中国大陆地区的独家运营由网易公司代理。游戏背景设定于暴雪的魔兽系列，共九位魔兽中的角色作为九种不同的职业。而玩家要做的，就是根据自己现有的卡牌组建合适的卡组，指挥英雄，驱动随从，施展法术，与游戏好友或素不相识的对手一决高下。</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-6 col-md-4"style="position: absolute; top:1400px;left:100px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://d3.blizzard.cn/home">
		                        <img src="img/anhei.jpg" alt="暗黑破坏神">
		                    </a>
		                    <div class="caption">
		                        <h3>暗黑破坏神</h3>
		                        <p>《暗黑破坏神》是1996年暴雪公司推出的一款动作RPG经典游戏系列，2000年《暗黑破坏神2》上市，2012年5月《暗黑破坏神3》上市（除中国大陆），2015年4月《暗黑破坏神3》进入中国大陆。</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-6 col-md-4"style="position: absolute; top:1400px;left:500px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://sc.blizzard.cn/home">
		                        <img src="img/xingjizhengba.jpg" alt="星际争霸">
		                    </a>
		                    <div class="caption">
		                        <h3>星际争霸</h3>
		                        <p>《星际争霸》（英语：StarCraft）是暴雪娱乐制作发行的一款即时战略游戏。这是星际争霸系列游戏的第一部作品，于1998年3月31日正式发行。游戏拥有3部资料片，但是正式发行的只有《母巢之战》。其续作《星际争霸II：自由之翼》已于2010年7月27日发行。</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-6 col-md-4"style="position: absolute; top:1400px;left:900px;">
		                <div class="thumbnail">
		                    <a class="lightbox" href="http://ow.blizzard.cn/home">
		                        <img src="img/shouwang.jpg" alt="守望先锋">
		                    </a>
		                    <div class="caption">
		                        <h3>守望先锋</h3>
		                        <p>《守望先锋》是由暴雪娱乐公司开发的一款第一人称射击游戏，于2016年5月24日全球上市，中国大陆地区由网易公司代理。游戏以未来地球为背景，讲述人类、守望先锋成员和智能机械的恩怨纠葛。游戏现有28位英雄(截止到2018年7月25日 [2]  )，每一位英雄都有各自标志性的武器和技能。</p>
		                    </div>
		                </div>
		            </div>
		        </div>

		    </div>

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
</html>


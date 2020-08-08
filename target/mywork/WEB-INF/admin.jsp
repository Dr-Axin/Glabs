<%@page import="entity.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>admin</title>
    <link type="text/css" rel="stylesheet" media="all" href="管理员css/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="管理员css/global_color.css" />
    <script language="javascript" type="text/javascript">
        //排序按钮的点击事件
        function sort(btnObj) {
            if (btnObj.className == "sort_desc")
                btnObj.className = "sort_asc";
            else
                btnObj.className = "sort_desc";
        }

        //启用
        function startFee() {
            window.location.href="finddata.html";
        }
        //删除
        function deleteFee() {
            var r = window.confirm("确定要删除此用户吗吗？");
            document.getElementById("operate_result_info").style.display = "block";
        }
    </script>
</head>
<body>
    <img class="img_bg" src="img/G.png" alt=""  height="200" >
<div id="main">
    <form action="" method="">
        <!--启用操作的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="img/close.png" onclick="this.parentNode.style.display='none';" />
            	删除成功！
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                	<th>ID</th>
                    <th>username</th>
                    <th>password</th>
                    <th class="width200">Email</th>
                    <th class="width100">Telephone</th>
                    <th class="width200">Createtime</th>
                    <th>Admin</th>
                </tr>
                <% 			//获取作用域ad中的值
							List<Admin> admin = (List<Admin>)request.getAttribute("ad");
                			//增强型循环
							for(Admin a:admin){
					%>
                        <tr>
                        	<td><%=a.getId()%></td>
                        	<td><a href="fee_detail.html"><%=a.getName()%></a></td>
                        	<td><%=a.getPassword()%></td>
                        	<td><%=a.getEmail()%></td>
                        	<td><%=a.getTelephone()%></td>
                        	<td><%=a.getIntime()%></td>
                        	<td>                                
                              <img src="img/start.png"><input type="button" value="查看" class="btn_start" onclick="location.href='toFindData.do?name=<%=a.getName()%>';" />
                        	  <img src="img/delete.png"><input type="button" value="删除" class="btn_delete" onclick="location.href='delete.do?id=<%=a.getId() %>';" />
                       		</td> 
                	<%} %>
            </table>
        </div>
        <!--分页-->
        <div id="pages">
            <a href="#">上一页</a>
            <a href="#" class="current_page">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">下一页</a>
        </div>
    </form>
</div>
<!--主要区域结束-->

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

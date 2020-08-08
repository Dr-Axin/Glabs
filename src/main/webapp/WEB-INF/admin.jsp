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
<!--     <img class="img_bg" src="img/G.png" alt=""  height="200" > -->
<div id="main"style="position: absolute; top:18%;left:15%;background:rgba(255,255,254,.3);">
    <form action="" method="" style="background:rgba(0,0,0,.0);">
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


<!----背景效果---->
	<script>
var canvas = document.createElement('canvas')
document.getElementsByTagName('body')[0].appendChild(canvas)
var ctx = canvas.getContext('2d')

var numParticles = 140

var bg = [2, 2, 2]
var cols = ['#ff0000', '#ff0000', '#ff0000', '#ff0000', '#ff0000', '#ff9900', '#ffffff', '#990000']
// var cols = ['#FF5722', '#FF9800', '#FF9800', '#FF9800', '#FF9800', '#B71C1C', '#00BCD4', '#00BCD4', '#009688']

setup()
window.addEventListener('resize', setup)

function setup() {
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight
  ctx.beginPath();
  ctx.rect(0, 0, canvas.width, canvas.height)
  ctx.fillStyle = `rgba(${bg[0]}, ${bg[1]}, ${bg[2]}, ${1})`
  ctx.fill()
}

var step = 0

var mouse = {
  x: canvas.width/2,
  y: canvas.height/2
}
document.onmousemove = function(e){
  mouse = {x:e.pageX, y:e.pageY}
}

setInterval(animate, 1000/30)
// window.requestAnimationFrame(animate);
function animate() {
  fade(0.34)
  draw()
  // window.requestAnimationFrame(function(){animate()})
}

function fade(amt) {
  ctx.beginPath();
  ctx.rect(0, 0, canvas.width, canvas.height)
  ctx.fillStyle = `rgba(${bg[0]}, ${bg[1]}, ${bg[2]}, ${amt})`
  ctx.fill()
}

function Particle () {
  this.pos = {
    x: Math.random() * canvas.width * 0.1 + canvas.width * 0.45,
    y: Math.random() * canvas.height * 0.1 + canvas.height * 0.45
  }
  this.r = 1
  this.speed = 22
  this.hue = [44, 36, 36, 24, 14, 4, 24, 24][Math.floor(Math.random()*7)]
  this.step = Math.random() * 400
  this.vx = Math.random() * this.speed/4 - this.speed/8
  this.vy = Math.random() * this.speed/4 - this.speed/8
  this.colIndex = Math.floor(Math.random()*cols.length)
  this.history = []
  this.update = function () {
    //////////////////////////////////////
    this.step ++
    this.step %= 400
    if (this.history.length > 5){
      this.history.shift()
    }
    this.pos.x += this.vx
    this.pos.y += this.vy
    this.vx = this.vx * 0.8 + (Math.random() * this.speed * 2 - this.speed) * 0.2
    this.vy = this.vy * 0.8 + (Math.random() * this.speed * 2 - this.speed) * 0.2
    
    // mouse dist
    // var dx = mouse.x - this.pos.x 
    // var dy = mouse.y - this.pos.y 
    if(this.step > 325 || (this.step > 100 && this.step < 190) ) {
      var m = Math.min(canvas.height, canvas.width) * 0.3
      var p = Math.PI * 2 * (step + this.step * 0.01) / 180
      this.vx = (Math.cos(p) * m - this.pos.x + canvas.width/2) * 0.016 + this.vx * 0.97
      this.vy = (Math.sin(p) * m - this.pos.y + canvas.height/2) * 0.016 + this.vy * 0.97
      //mouse
      // this.vx = this.vx * 0.9 + dx * 0.02
      // this.vy = this.vy * 0.9 + dy * 0.02
      // this.vx = Math.min(this.vx,  4.0)
      // this.vx = Math.max(this.vx, -4.0)
      // this.vy = Math.min(this.vy,  4.0)
      // this.vy = Math.max(this.vy, -4.0)
      // center
      // this.vx = this.vx * 0.9 + (canvas.width/2 - this.pos.x ) * 0.002
      // this.vy = this.vy * 0.9 + (canvas.height/2 - this.pos.y ) * 0.002
    }
    
//     if(this.step > 100 && this.step < 140) {
//       //mouse
//       var d = dx * dx + dy * dy
//       if (d < (canvas.height/8 * canvas.height/8)){
//         this.vx = this.vx * 0.9 - (mouse.x - this.pos.x ) * 0.01
//         this.vy = this.vy * 0.9 - (mouse.y - this.pos.y ) * 0.01
//       }
//       // center
//       // this.vx = this.vx * 0.9 + (canvas.width/2 - this.pos.x ) * 0.002
//       // this.vy = this.vy * 0.9 + (canvas.height/2 - this.pos.y ) * 0.002
//     }
    
    var speed = Math.min(Math.abs(this.vx) + Math.abs(this.vy), 50) / 50
    //////////////////////////////////////
    if (this.history.length > 4){
      ctx.beginPath()
      // ctx.arc(this.pos.x ,this.pos.y , this.r, 0, 2 * Math.PI)
      ctx.moveTo(this.pos.x ,this.pos.y)
      for (var i = this.history.length-1; i >= 0;  i--){
        ctx.lineTo(this.history[i].x ,this.history[i].y)
      }
      ctx.fillStyle = `hsla(${this.hue},${99}%,${speed*70 + 30}%,${speed*0.3+0.7})`
      // ctx.strokeStyle = `hsla(${Math.sin( this.step / 300) * 70 + 70},${99}%,${50}%,0.5)`
      // ctx.fillStyle = cols[this.colIndex] 
      // ctx.strokeStyle = cols[this.colIndex] 
      ctx.fill()
      ctx.lineWidth = 1
      ctx.lineJoin = "round"
      // ctx.closePath()
      // ctx.stroke()
    }
    //////////////////////////////////////
    if (this.pos.x > canvas.width || this.pos.x < 0 || this.pos.y > canvas.height || this.pos.y < 0) {
      delete this.pos
      delete this.history
      return false;
    }
    this.history.push({
      x: this.pos.x,
      y: this.pos.y
    })
    return true;
  } 
}

var particles = [new Particle()]


function draw() {
  step ++
  step %= 180
  
  if (particles.length < numParticles) {
    particles.push(new Particle())
  }
  
  particles = particles.filter(function (p){
    return p.update()
  })
  
}
</script>






</body>
</html>

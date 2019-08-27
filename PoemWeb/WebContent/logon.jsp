<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>logon</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<style type="text/css">

.imgbox{float: left;position: relative; left:70px;width:1100px;margin:10px;height:500px;}
.imgbox img{width:1100px;height:500px;}
.imgbox ul{list-style-type:none;margin:0px;padding:0px;}
.imgbox ul li{display:none;}
.title_bg{z-index:1;background-color:#eee;filter:alpha(opacity=30);-moz-opacity:0.3;opacity:0.3;}
.title{z-index:2;color:#FFF;text-indent:10px;font-size:14px;line-height:40px;}
.pager{z-index:3;}
.common{position:relative;height:40px;margin-top:-43px;}
.pager ul{margin-top:5px;}
.pager ul li{float:right;color:#FFF;font-size:12px;display:block;border:2px solid #aaa; border-radius:15px;width:15px;height:15px;margin-right:4px;margin-top:5px;text-align:center;line-height:15px;background-color:#333;cursor:pointer;}
</style>
</head>
	
<body>
  <header>
    <ul>
      <li class="banner">诗与远方</li>
      <li class="search"><form><input type="search" placeholder="请输入关键词..."></form></li>
    </ul>
    <nav>
      <ul>
        <li><a href="index.jspl">首页</a></li>
		<li><a href="index.jsp">藏诗苑</a></li>
        <li><a href="index.jsp">斗诗台</a></li>
        <li><a href="index.jsp">观影阁</a></li>
		<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
		<li class="active"><a href="logon.html" style="color: #090505">登录/</a></li>
        <li><a href="logon.jsp" style="color: #090505">注销</a></li>
      </ul>
    </nav>
  </header>

<div class="imgbox">
    <!--图片列表，除第一张显示外，其余隐藏-->
    <ul>
        <li style="display: block;" title="网站名称"><a href="#">
            <img src="tuku/04.jpg" /></a></li>
        <li title="古诗"><a href="#">
            <img src="tuku/03.jpg" /></a></li>
        <li title="古诗"><a href="#">
            <img src="tuku/09.jpg" /></a></li>
        <li title="古诗"><a href="#">
            <img src="tuku/10.jpg" /></a></li>
    </ul>
    <!--图片标题背景-->
    <div class="title_bg common"></div>
    <!--图片标题区-->
    <div class="title common"></div>
    <!--图片序号区-->
    <div class="pager common">
      <ul>
          <li>4</li>
          <li>3</li>
          <li>2</li>
          <li style="background:#e60012;">1</li>
      </ul>
    </div>
  </div> 
  <script>
     $(document).ready(function () {
            (new CenterImgPlay()).Start();
        });
        function CenterImgPlay() {
            this.list = $(".imgbox").children(":first").children();
            this.indexs = [];
            this.length = this.list.length;
            //图片显示时间
            this.timer = 3000;
            this.showTitle = $(".title");

            var index = 0, self = this, pre = 0, handid, isPlay = false, isPagerClick = false;

            this.Start = function () {
                this.Init();
                //计时器，用于定时轮播图片
                handid = setInterval(self.Play, this.timer);
            };
            //初始化
            this.Init = function () {
                var o = $(".pager ul li"), _i;

                for (var i = o.length - 1, n = 0; i >= 0; i--, n++) {
                    this.indexs[n] = o.eq(i).click(self.PagerClick);
                }
            };
            this.Play = function () {
                isPlay = true;
                index++;
                if (index == self.length) {
                    index = 0;
                }
                //先淡出，在回调函数中执行下一张淡入
                self.list.eq(pre).fadeOut(300, "linear", function () {
                    var info = self.list.eq(index).fadeIn(500, "linear", function () {
                        isPlay = false;
                        if (isPagerClick) { handid = setInterval(self.Play, self.timer); isPagerClick = false; }
                    }).attr("title");
                    //显示标题
                    self.showTitle.text(info);
                    //图片序号背景更换
                    self.indexs[index].css("background-color", "#e60012");
                    self.indexs[pre].css("background-color", "#333");

                    pre = index;
                });
            };
            //图片序号点击
            this.PagerClick = function () {
                if (isPlay) { return; }
                isPagerClick = true;

                clearInterval(handid);

                var oPager = $(this), i = parseInt(oPager.text()) - 1;

                if (i != pre) {
                    index = i - 1;
                    self.Play();
                }
            };
        };
  </script>
<div style="float:left;margin-top:10px; margin-left:80px; background-color: #EBEEEB;width: 255px;height: 497px;">
	<ul>
		<br> 
		<br>
		<form id ="loginForm" name="loginForm" action="successlogon.jsp">
		<p style="font-family: Segoe;font-size: 30px;color: #000000;" >快速登录</p>
		<br>
			<p>用户名:
 			 <input type="text" name="username">
			</p>
			<br>
			<p>密&nbsp; 码&nbsp; :
  			<input type="password" name="password">
			</p>
			<br>
			<p>&nbsp; &nbsp; &nbsp; &nbsp; </p>
            <input value="登录" type ="submit"/>

          </form>
	</ul>
	<a href="register.jsp" style="position: relative;margin-left:100px;">没账号？立即注册</a>
</div>
<footer style="float:left;text-align: inherit">website &copy; 2019 the nine team</footer>
</body>
</html>

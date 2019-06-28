<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<style>


body, ul, li{
    margin:0;
    padding:0;
    list-style:none;
}
table.center {margin-left:auto; margin-right:auto;}
.top-bar a{
    text-decoration:none;
    color:lightgray;
}

.top-bar>ul>li>a{
    font-size:20px;
}
.top-bar>ul>li>ul>li>a{
    font-size:14px;
    padding:15px;
 }

.top-bar::after {
    content:"";
    position:absolute;
    top:100%;
    width:100%;
    left:0;
    height:50px;
    background-color:rgba(0,0,0,0.5);
    display:none;
    border-top:1px solid white;
}

.top-bar:hover::after {
    display:block;
}

.top-bar ul ul{
    display:none;
    position:absolute;
    min-width:1300px;
    z-index:2;
}

.top-bar li:hover ul{
    display:block;
}

.top-bar > ul{
    display:inline-block;
}
.top-bar > ul > li{
    display:inline-block;
}


.top-bar{
    text-align:left;
    background:rgba(0,0,0,0.5);
    position:absolute;
    top:0;
    left:0;
    width:100%;
    min-width:1200px;
}


.top-bar ul> li> a{
    padding:30px 25px;
    display:block;
}
.top-bar>ul li:hover>a{
    color:white;
    
}
.top-bar>ul li>ul>li>a {
    border-top:3px solid rgba(0,0,0,0);
}

.top-bar>ul li>ul>li:hover>a{
    border-top-color:white;
}
.top-bar>ul>li>ul>li{
    float:left;
}
.top-bar>ul>li>ul::after{
    content:"";
    display:block;
    clear:both;
}
.top-logo{
    content:"";
    display:block;
    clear:both;
}
.top-logo>img{
    float:left;
    margin-top:8px;
    margin-left:25px;
}

.top-right{
    float:right;
}
.top-right>ul>li{
    display:inline-block;
}
.top-right>ul li:hover>a{
    color:white;
}
.top-right>ul>li>a{
    font-size:14px;
    padding-left:5px;
}

/*메인배경*/
.main-back {
    padding-top:150px;
    min-width:1200px;
    background-position:center;
    background-image:"img/visual.jpg";
    background-repeat:no-repeat;
    background-size:1903px 774px;
    box-sizing:border-box;
    color:white;
    text-align:center;
}
.main-back a {
    text-decoration:none;
    color:inherit;
}

.main-back > ul > li:first-child{
    color:white;
    font-size:50px;
    letter-spacing:-5px;
    margin-top:10px;
    
}
.main-back > ul > li:last-child{
    display:inline-block;
    font-size:17px;
    margin-top:25px;
    color:lightgray;
}

.main-back > div {
    border:0px solid white;
    display:inline-block;
    margin-top:100px;
    padding:15px 0px;
    overflow:hidden;
    border-radius:30px;
}
.main-back > div > a{
    padding:15px 55px;
    background-color:white;
    font-size:17px;
    color:black;
}
.main-back > div > a:hover {
    background-color:darkred;
    color:pink;
}
.main-back2 > .back1{
    background-image:"img/visual.jpg";
    width:50%;
    heigth:226px;
    min-width:600px;
    padding:60px;
    background-position:center;
    box-sizing:border-box;
}
.main-back2>.back1 > ul > li:first-child{
    color:white;
    font-size:19px;
    letter-spacing:-1px;
}

</style>
</head>
<body>
<!--상단바-->
<div class="top-bar">


			<ul>
                <li><a href="${pageContext.request.contextPath}/customermainform.do">Home</a>
    			<li><a href="${pageContext.request.contextPath}/customerstorelist.do">주문</a></li>
                </li>
                <li><a href="${pageContext.request.contextPath}/customerinfoedit.do">User Name</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/mymenu.do">나만의 메뉴</a></li>
                        <li><a href="${pageContext.request.contextPath}/orderlist.do">주문 내역</a></li> 
                    </ul>
                </li>
   
            </ul>
            
            
    <div class="top-right">
        <ul>
            <li><a href="${pageContext.request.contextPath}/customerstorelist.do">주변 매장</a></li>
                <li><a href="${pageContext.request.contextPath}/customerlogin.do">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/customerlogin.do">Logout</a></li>
                <li><a href="${pageContext.request.contextPath}/cartmng.do">장바구니</a></li>
            <li><a href="#"><img style="position:relative; top:4px;" src="http://hongsi.x-y.net/2017_ui8/yjh/img/snb_hbr.gif" alt=""></a></li>
        </ul>

    </div>
</div>

<!--메인배경-->
<div class="body">
    <div class="main-back">
        

    </div>
    
</div>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="UTF-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<link href="./Resources/css/ihover.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
	
	<script src="common.js"></script>
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	h1 {
		text-align: center;
	}
	.search {
	text-align: center;
	}
	</style>
	<script>
	$(document).ready(function(){

		var scOffset = $( '.navbar-Menu' ).offset();
		$( window ).scroll( function() {
		if ( $( document ).scrollTop() > scOffset.top ) {
		$( '.navbar' ).addClass( 'navbar-fixed-top' );
		}
		else {
		$( '.navbar' ).removeClass( 'navbar-fixed-top' );
		}
		});
		
		var url = "chk_login.do";
	 	
		ajaxGet(url,function(rt){
	 			
	 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
	 if(rt =="10002"){ 
		$("#login_nav").hide();				$("#non_login_nav").show();
	}
	 					
	 // 로그인 시 : rt값 -> user_name
	else if(rt!=""){ 
	$("#login_nav").show();
	$("#non_login_nav").hide(); 
	$("#user_name").text(rt+"님이 로그인하셨습니다.");
		}
	 });	
		});

	</script>

</head>
<body>	

<section class="hero">
		<header>
			<div class="wrapper">
				<!-- <a href="#"><img src="./Resources/img/logo.png" class="logo" alt="" titl=""/></a> -->
				<a href="#" class="logo" alt="" titl="">Multi Space</a>
				<nav class="navbar navbar-default">

					<div id="navbar" class="navbar-collapse collapse navbar-Menu ">

						<ul class="nav navbar-nav ">
							<li><a href="space_home.do">공간</a></li>
							<li><a href="club_home.do">모임</a></li>
							<li><a href="community_list.do">커뮤니티</a></li>
							<li><a href="event_user_list.do">이벤트</a></li>
							<li><a href="notice_list.do">공지사항</a></li>
							<li><a href="faq_list.do">FAQ</a></li>
							<li><a href="admin_main.do">관리자</a></li>
						</ul>
		

						<ul id="login_nav" class="nav navbar-nav navbar-right">
							<li><a href="#" id="user_name"></a></li>
							<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
							<li><a href="home_logout.do">로그아웃</a></li>
						</ul>

						<ul id="non_login_nav" class="nav navbar-nav navbar-right">
							<li><a href="home_moveLoginPage.do">로그인</a></li>
						</ul>


					</div>
				</nav>
			</div>
		</header><!--  end header section  -->


	</section><!--  end hero section  -->


<!-- nav -->
<div class="container">
<h1>Event Board</h1>
	<form action="event_user_list.do" class="search">
		<select name="eve_option">
			<option value="0">선택하세요</option>
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">제목+내용</option>
		</select>
		<input type="text" name="eve_key" placeholder="찾을 내용을 입력하세요"/>
		<input type="submit" value="search">	
	</form>		
	
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<jl:forEach var="vo" items="${rl}">
			<li>
			<div class="ih-item square colored effect6 from_top_and_bottom"><a href="event_user_read.do?eve_no=${vo.eve_no}">
			<div class="img"><img src="thumbnail/${vo.eve_thumb_img}" alt="img"></div>
			<div class="info">
				<h3>${vo.eve_no}. ${vo.eve_title}</h3>
				<p><span class="property_size">${vo.eve_content}</span></p>
			</div></a>
		</div>
		<a href="event_user_read.do?eve_no=${vo.eve_no}">
		<div class="property_details">
			<h1>Event #${vo.eve_no}<br/>${vo.eve_title}</h1>
			<h2>${vo.the_time} </h2>
		</div></a>
			</li>
			</jl:forEach>
			</ul>
		</div>
	</section>
</div>
</body>
</html>




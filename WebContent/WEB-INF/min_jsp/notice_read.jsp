<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="common.js"></script>
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		.jumbotron{
			text-align:center;
		}
		.container{
			height : 50px;
		}
		.content{
			height : 100px;
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
		 			
		 // �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
		 if(rt =="10002"){ 
			$("#login_nav").hide();				$("#non_login_nav").show();
		}
		 					
		 // �α��� �� : rt�� -> user_name
		else if(rt!=""){ 
		$("#login_nav").show();
		$("#non_login_nav").hide(); 
		$("#user_name").text(rt+"���� �α����ϼ̽��ϴ�.");
			}
		 });
		});
	</script>
</head>
<body>
	<div class="jbTitle">
	<h1>Multi Space</h1>
</div>

<!-- Fixed navbar -->
<nav class="navbar navbar-default ">
	<div class="container">
	 <div class="navbar-header">
	   <a class="navbar-brand" href="main.html">multi space</a>
	 </div>

 <div id="navbar" class="navbar-collapse collapse navbar-Menu ">
	<ul class="nav navbar-nav ">
 	 <li><a href="space_home.do">����</a></li>
	 <li><a href="club_home.do">����</a></li>
	 <li><a href="community_list.do">Ŀ�´�Ƽ</a></li>
	 <li><a href="event_user_list.do">�̺�Ʈ</a></li>	
	 <li><a href="notice_list.do">��������</a></li>
	 <li><a href="faq_list.do">FAQ</a></li>			
	 <li><a href="admin_main.do">������</a></li>			
	</ul>
			
<ul id="login_nav" class="nav navbar-nav navbar-right">
<li><a href="#" id="user_name"></a></li>
	<li><a href="mypage_moveMypageMainPage.do">����������</a></li>
	<li><a href="home_logout.do">�α׾ƿ�</a></li>	
</ul>
	<ul id="non_login_nav" class="nav navbar-nav navbar-right">
	     <li><a href="#">�α���</a></li>		
	</ul>

	   </div>
	</div>
</nav>
<!-- nav -->
	<div id="i" class="jumbotron panel-primary">
		<h1>��������</h1>
	</div>
	<div class="container">
		<div class="title">
			<label>����:</label>
			<span>${vo.notice_title}</span><br>
		</div>
		
		<div class="content">
			<label>����</label><br/>
			<span>${vo.notice_content}</span><br/>
		</div>
	
		<form action="notice_list.do" method="post">
			<input type="submit" value="�۸��"/>
		</form>
		
	</div>
</body>
</html>
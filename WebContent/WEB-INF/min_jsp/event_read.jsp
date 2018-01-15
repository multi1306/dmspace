<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

		


<!DOCTYPE html>
<html>
<head>	
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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




		});

	</script>


</head>


<body>	
			<!-- Fixed navbar -->
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


		<form method="POST" action="event_mod.do" >
			���� :<input type="text" name="eve_title" value="${text.eve_title}" readonly /><br/>
			���� :<textarea name="eve_content" rows="7" cols="40" readonly >${text.eve_content}</textarea><br/>
				<input type="hidden" name="eve_no" value="${text.eve_no}" />
				<img src="thumbnail/${text.eve_thumb_img}" height="100" width="100"/><br/>
			<input type="submit" value="����" />
			<input type="button" value="����" onclick= "window.location.href='event_del2.do?eve_no=${text.eve_no}'">
			<input type="button" value="���" onclick= "window.location.href='event_list.do'">
		</form>
</body>
</html>
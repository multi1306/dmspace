<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

iframe {
	display: block;
	border: none;
	width: 100%;
	height: 1000px;
	align:center;
}


ul {
	display: inline;
	list-style-type: none;
	margin: 0;
	padding: 0;
	height: 100%;
	
}

li a {
	font-weight: bold;
	display: block;
	color: green;
	padding: 8px 16px;
	text-decoration: none;
}


li a:hover {
	background-color: green;
	color: green;
}



</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
		
	/* ************************** top_nav - ��ܰ��� ************************** */	
		
		var scOffset = $('.navbar-Menu').offset(); //top_nav�� ���� ��ǥ ����.
		
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top+50) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});

	/* ************************** top_nav - �α��� ************************** */	
		var url = "chk_login.do";
 		ajaxGet(url,function(rt){
 			
 				// �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
 				if(rt =="10002"){ 
					$("#login_nav").hide();
					$("#non_login_nav").show();
				}
 					
 				// �α��� �� : rt�� -> user_name
				else if(rt!=""){ 
					$("#login_nav").show();
					$("#non_login_nav").hide();
					$("#user_name").text(rt+"���� �α����ϼ̽��ϴ�.");
				}
 			});	
		
 		
 	/* ************************** ������ ************************** */	
 		
 		
		$("#receiveMessageBox").hide();
		$("#sendMessageBox").hide();
		$("#sendMessage").hide();
		
		$("#message_nav").on("click",function(e){
			if($("#receiveMessageBox").css("display") == "none"){
				$("#receiveMessageBox").show();
				$("#sendMessageBox").show();
				$("#sendMessage").show();
			} else {
				$("#receiveMessageBox").hide();
				$("#sendMessageBox").hide();
				$("#sendMessage").hide();
			}
		});
		
		
	});

	</script>
</head>
<body>


<div class="jbTitle">
      <h1>Site Title</h1>
</div>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default">

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
					<li><a href="home_moveLoginPage.do">�α���</a></li>				
				</ul>

				
			</div>
		</div>
	</nav>
	<!--/.nav-collapse -->




<div class="container-fluid">

	
	<div class="row">
			<div class="col-sm-2">
				<ul class="nav">
					<li class="active"><a data-toggle="tab" href="#myInfo">[��
							����]</a></li>
					<li><a data-toggle="tab" href="#myBooking">���� ����</a></li>
					<li><a data-toggle="tab" href="#myBookmark">���ã��</a></li>
					<li><a data-toggle="tab" href="#myQna">Q&A</a></li>
					<li><a data-toggle="tab" href="#myClub">�� ����</a></li>
					<li><a data-toggle="tab" href="#myReview">�� �ı�</a></li>
					<li><a data-toggle="tab" id="message_nav" href="#myReceiveMessageBox">���� ��</a></li>
						
					<ul class="sub_message_nav">
						<li id="receiveMessageBox" class="active"><a
							data-toggle="tab" href="#myReceiveMessageBox">���� ������</a></li>
						<li id="sendMessageBox"><a data-toggle="tab" href="#mySendMessageBox">���� ������</a></li>
						<li id="sendMessage"><a data-toggle="tab" href="#mySendMessage">���� ������</a></li>
					</ul>

					<li><a data-toggle="tab" href="#sellerWrite">[�Ǹ���]</a></li>
					<li><a data-toggle="tab" href="#sellerWrite">�� ��</a></li>
					<li><a data-toggle="tab" href="#sellerAllChart">��ü ���</a></li>

				</ul>
			</div>


	<div class="tab-content col-sm-10" >
		<div id="myInfo"  class="tab-pane active fade in">	
			<iframe src="myinfo_ckpass.do"  align="center"></iframe>
		</div>
		<div id="myBooking" class="tab-pane fade">
			<iframe src="mypage_moveMypageBookingPage.do"  align="center"></iframe>
		</div>
		<div id="myBookmark"   class="tab-pane fade">
			<iframe src="bookmark_findAll.do"  align="center"></iframe>
		</div>
		<div id="myQna"   class="tab-pane fade">
			<iframe src="mypage_moveMypageQnAPage.do"  align="center"></iframe>
		</div>
		<div id="myClub"   class="tab-pane fade">
			<iframe src="myclub_findAll.do"  align="center"></iframe>
		</div>
		<div id="myReview"   class="tab-pane fade">
			<iframe src="mypage_review_findAll.do"  align="center"></iframe>
		</div>
		<div id="myReceiveMessageBox"   class="tab-pane fade">
			<iframe src="mypage_moveMypageReceiveMessagePage.do"  align="center"></iframe>
		</div>
		<div id="mySendMessageBox"   class="tab-pane fade">
			<iframe src="mypage_moveMypageSendMessagePage.do"  align="center"></iframe>
		</div>
		<div id="mySendMessage"   class="tab-pane fade">
			<iframe src="mypage_moveMypageWriteMessagePage.do"  align="center"></iframe>
		</div>
		
		<!-- **************** ����������-�Ǹ��� *************** -->
		
		<div id="sellerWrite"   class="tab-pane fade">
			<iframe src="myhost_findAll.do"  align="center"></iframe>
		</div>
		
		<div id="sellerAllChart"   class="tab-pane fade">
			<iframe src=""  align="center"></iframe>
		</div>
	</div>
	
	</div>

</div>
</body>
</html>

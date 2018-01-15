<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ��ҿ� -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.jumbotron {
	background-color: orange;
}

.FAQ {
	color: white;
	text-align: center;
}

.table {
	text-align: center;
	border-color: green;
}

.ask {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="common.js" type="text/javascript"></script>

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
	
	<div class="jumbotron">
		<div class="FAQ">
			<h1>F A Q</h1>
		</div>
	</div>

	<%-- �Ǵ����̺�<table border="1" class="table table-hover" >
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>CONTENT</th>
		</tr>
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.faq_no}</td>
				<td>${vo.faq_title}</td>
				<td>${vo.faq_content}</td>
			</tr>
		</jl:forEach>
	</table> --%>



	<div class="container">
		<h2>FAQ Board</h2>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<jl:forEach var="vo" items="${rl}">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#${vo.faq_no}" aria-expanded="true"
								aria-controls="collapseOne">${vo.faq_no} . ${vo.faq_title} </a>
						</h4>
					</div>
					<div id="${vo.faq_no}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">${vo.faq_content}</div>
					</div>
				</div>
			</jl:forEach>
		</div>

		<div class="ask">
			<a href="o2oQnA_add.do">
				<input class="btn btn-success" type="button" value="ASK">
			</a>
			
		</div>
		
	</div>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
		
		$(".s_msg_no").on("click",function(e){
			$("#i_msg_no").attr("value",$(this).attr("i"));
			msg_no = $("#i_msg_no").val();
			
			location.href="mypage_moveMypageSendMessageRead.do?msg_no=" + msg_no;		
		});
		
		});

	</script>
</head>
<body>
	<table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<th width="100">�޴»��</th>
			<th width="200">����</th>
			<th width="200">��¥</th>
		</tr>
		<jl:forEach var="SendMessage" items="${sendMessage}">
			<tr>
				<td>${SendMessage.receive_user_id}</td>
				<td><span class="s_msg_no" i="${SendMessage.msg_no}" >${SendMessage.msg_content}</span>
					<input id="i_msg_no" type="hidden" name="msg_no" />
				</td>
				<td>${SendMessage.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
</body>
</html>
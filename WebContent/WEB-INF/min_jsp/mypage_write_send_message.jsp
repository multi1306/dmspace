<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		
		
		/* ************************** select_club�� �⺻�� ************************** */	
		
		var club_no_1 = $("#select_club").val();
		if(club_no_1=="1"){
			$('#select_club_member').empty();	
			 url = "mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no_1;
			 ajaxGet(url,function(rt){
				 var user_club_member = window.eval("("+rt+")");
				 for( var i = 0 ; i < user_club_member.data.length ; i++ ){
					    var option = $("<option value="+user_club_member.data[i]+">"+user_club_member.data[i]+"</option>");
		                $('#select_club_member').append(option);
				 } 
			 });
		}
		
		/* ************************** select_club�� ���ð� ************************** */	
		$("#select_club").change(function(){
			 club_no = $(this).val();	
			 $('#select_club_member').empty();	
			 url = "mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no;
			 
			 ajaxGet(url,function(rt){
				 var user_club_member = window.eval("("+rt+")");
				 for( var i = 0 ; i < user_club_member.data.length ; i++ ){
					    var option = $("<option value="+user_club_member.data[i]+">"+user_club_member.data[i]+"</option>");
		                $('#select_club_member').append(option);
				 } 
			 });
		});		

		/* ************************** ���� ������ ��ư Ŭ���� ************************** */	
		$("#submitBtn").on("click",function(e){
			
			var sel_receive_user_id = $("#select_club_member option:selected").val();
			$("#i_receive_user_id").attr("value",sel_receive_user_id);
			
		    var formMData = $("#form_sendMessage").serialize();	
		       $.ajax({
			           type : "POST",
			           url : "mypage_sendMessage.do",
			           data : formMData,
			           success   : function(rt) {
			             	if(rt=="30003"){
			             		$("#messageModal").modal('show');         		
			             	}
						 },
					   error : function(xhr, option, error){
						   alert(error);
			            }
			        }); 
		});// end function
		
		
		$("#move_sendMessageBox").on("click",function(e){
			location.href="mypage_moveMypageSendMessagePage.do";
		})
				
		
	}); //end$(document)
	
	
	
	</script>
</head>
<body>

			
	<form id="form_sendMessage">

		<label> ���� </label> 
		
		<select name="club_list" id="select_club" >
			<jl:forEach var="User_clubInfo" items="${user_clubInfo}">
				<a class="aclass" clubno="${User_clubInfo.club_no}">sujin</a>
				<option value="${User_clubInfo.club_no}">${User_clubInfo.club_name}</option>
			</jl:forEach>
		</select> <br/>
		
		<label> �޴»�� </label> 
		
		<select name="club_member_list" id="select_club_member">
		
		</select> <br/>
		
		
		<label>���� ����</label>
		<input type="text" name="msg_content" id="i_msg_content"/>
		<input type="hidden" name="receive_user_id" id="i_receive_user_id"/>
	</form>
		<button class="btn btn-info"  id="submitBtn">���� ������</button>
						
						
						
						
	<!-- ************************** messageModal ************************** --> 
	<div id="messageModal" class="modal " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">������ ���������� ���������ϴ�.</div>
				<div class="modal-footer">
					<button class="btn btn-default" id="move_sendMessageBox">���������� ����</button>
					<button class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div> 



</body>
</html>
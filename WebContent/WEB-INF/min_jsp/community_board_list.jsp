<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.commask {
	text-align: center;
}
</style>

<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		$("#write").on("click",function(){
			var user_id = $(this).attr("xyz");
			if(user_id != ""){
				location.href="community_board_add.do";
			} else{
			$("#addwrite").modal("show");
				
			}
		});
		
		$("#success").on("click",function(){
			
			parent.location.href="home_moveLoginPage.do";
			
		});
	});

</script>
</head>
<body>

	${user_id} �� ȯ���մϴ�
	<jl:if test="${user_id ne ''}">
		<a href="community_board_mytext.do"> <input type="button" value="�������ۺ���" /></a>
	</jl:if>

	<form id="textserch" action="community_board_serch.do" name="frm">
		<select name="commserch_option">
			<option value="0">�������ּ���</option>
			<option value="1">����</option>
			<option value="2">����</option>
			<option value="3">����+����</option>
			<option value="4">�ۼ���</option>
		</select> �˻� : <input type="text" name="commserch_content"> <input
			type="submit" value="�˻�">
	</form>

	<table class="table table-hover">
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>TIME</th>
			<th>ID</th>
			<th>VIEW</th>
			<th>LIKE</th>
			<jl:forEach var="vo" items="${rl}">
				<tr>
					<td>${vo.com_board_no}</td>
					<td><a
						href="community_board_read.do?com_board_no=${vo.com_board_no}">${vo.com_board_title}</a></td>
					<td>${vo.the_time}</td>
					<td>${vo.user_id}</td>
					<td>${vo.view_count}</td>
					<td>${vo.recom_count}</td>
				</tr>

			</jl:forEach>
	</table>
	
<!-- �۾��� ��ư-->
	<div class="commask">
	<input class="btn btn-primary btn-lg" type="button" value="�۾���" id="write" xyz="${user_id}" />
	</div>
	
	<!-- ����� -->
	<div class="modal fade" id="addwrite" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">�α����� ���� ���ּ���</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					<button type="button" class="btn btn-primary" id="success">Ȯ��</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
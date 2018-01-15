<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.commask{
text-align: center;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<body>
admin_community_board_list.jsp �����Խ��� ���⿡�� ���� ����Ʈ�� �ҷ��ɴϴ� 
<br>


<table class="table table-hover">
<tr>


<th>NO</th>
<th>TITLE</th>
<th>TIME</th>
<th>ID</th>
<th>VIEW</th>
<th>LIKE</th>
<jl:forEach var="vo" items="${ls}">
<tr>
<td>${vo.com_board_no}</td>
<td><a href="admin_community_board_read.do?com_board_no=${vo.com_board_no}">${vo.com_board_title}</a></td>
<td>${vo.the_time}</td>
<td>${vo.user_id}</td>
<td>${vo.view_count}</td>
<td>${vo.recom_count}</td>
</tr>

</jl:forEach>

</table>

	<div class="commask">
			<a href="admin_community_board_add.do">
				<input class="btn btn-success" type="button" value="�۾���">
			</a>
			
		</div>
<br/>
<br/>

<form id="textsearch" action="admin_community_board_search.do">
	<select name="commsearch_option">
		<option value="0">�������ּ���</option>
		<option value="1">����</option>
		<option value="2">����</option>
		<option value="3">���� + ����</option>
		<option value="4">�ۼ���</option>
	</select>
	�˻� : <input type="text" name="commsearch_content">
	<input type="submit" value="�˻�">
</form>

</body>
</html>
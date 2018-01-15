<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	.jumbotron{
		text-align:center;
	}
	th, td {
		text-align: center;
	}
	</style>
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	<table border="1" cellspacing="0" cellpadding="8" class="table table-hover">
		<tr>
			<th width="40">QnA��ȣ</th>
			<th>����</th>
			<th width="200">����</th>
			<th>��ȸ��</th>
			<th>��¥</th>
		</tr>
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.com_qna_no}</td>
				<td>${vo.user_id}</td>
				<td><a href="admin_community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
				<td>${vo.view_count}</td>
				<td>${vo.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
		<form action="admin_community_qna_add.do" method="post">
			<input type="submit" value="�۾���" class="btn btn-success" type="button"/>
		</form>
	<br>
	<br>
	<form id="textsearch" action="admin_community_qna_search.do">
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
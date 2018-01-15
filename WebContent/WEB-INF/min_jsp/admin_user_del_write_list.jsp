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

.form-group {
	text-align: center;
}

.jumbotron {
	text-align: center;
}

.btn {
	text-align: center;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>


</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>Ż�� ��Ų ���� ����Ʈ ����(�Ǹ��� ����)</h1>
	</div>
	
	<table border="1">
		<tr>
			<td>��ȣ</td>
			<td>���� ID</td>
			<td>���� �̸�</td>
			<td>�̸���</td>
			<td>�ۼ� ���� ����</td>
			<td>�ۼ� ���� ����</td>
			<td>�ۼ� ���� �ð�</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td>${vo.writing_no}</td>
				<td>${vo.user_id}</td>
				<td>${vo.user_name}</td>
				<td>${vo.email}</td>
				<td>${vo.subject}</td>
				<td>${vo.mail_content}</td>
				<td>${vo.the_time}</td>
			</tr>
		</jl:forEach>
	
	</table>
	
</body>
</html>
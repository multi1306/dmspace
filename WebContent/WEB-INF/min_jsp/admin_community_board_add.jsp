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



</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>�����Խ��� �۾��� ����</h1>
	</div>
	<form action="admin_community_board_add2.do" class="form-group" method="POST" name="frm">
		���� : <input type="text" name="com_board_title" size="30" /> <br>
		���Ӹ� : <select name="com_board_type">
			<option value="����">�����ϼ���</option>
			<option value="����">����</option>
			<option value="����">����</option>
			<option value="���">���</option>
			<option value="����">������</option>
			<option value="����">����</option>
		</select> <br>
		
		����:
		<textarea name="com_board_content" rows="10" cols="60"></textarea>
		<br> 
		<input class="btn btn-success" type="submit" value="���" />
		<input type="button"class="btn btn-success" id="cancel" value="���"/>
	</form>
	


</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${user_id}
	<h3>�Ǹ��� ��� form</h3>
	<form action="myhost_addhost.do" method="POST">
		<input type="hidden" name="user_id" value="${user_id}"/>
		<table border="1">
			<tr>
				<td>��ǥ��</td>
				<td><input type="text" name="host_name"/></td>
			</tr>
			<tr>
				<td>����ڹ�ȣ</td>
				<td><input type="text" name="crn"/></td>
			</tr>
			<tr>
				<td>ȸ���ּ�</td>
				<td><input type="text" name="zipcode"/></td>
			</tr>
			<tr>
				<td>�Աݰ���</td>
				<td><input type="text" name="host_account"/></td>
			</tr>
		</table>
		<input type="submit" value="����ϱ�"/>
		<input type="reset" value="����ϱ�"/>
	</form>
	
</body>
</html>
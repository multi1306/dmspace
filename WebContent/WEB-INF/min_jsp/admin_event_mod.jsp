<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

		
<!DOCTYPE html>    
<html>
<head>
	
</head>
<body>
	<form method="POST" action="admin_event_mod2.do" enctype="multipart/form-data">
	제목: <input type="text" name="eve_title" value="${text.eve_title}"/> <br/>
	내용: <textarea name="eve_content" rows="7" cols="40"> ${text.eve_content}</textarea> <br/>
	<input type="hidden" name="eve_no" value="${text.eve_no}">
	
	썸네일 업로드: <input type="file" name="eve_thumb_img" /> <br/>
		<input type="submit" value="등록"/>
		<input type="button" value="취소" onclick="window.history.back()"/>
	</form>
</body>
</html>
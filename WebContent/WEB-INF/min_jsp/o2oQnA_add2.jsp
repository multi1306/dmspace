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

.jumbotron {
	text-align: center;
}

.button {
	text-align: center;
}
.t1 {
	text-align: right;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="faq_list.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>1:1 문의하기</h1>
	</div>
	
	<div class="container">
		<form action="admin_o2oQnA_add.do" class="form-group" method="POST" name="frm">
			<table>
			<tr>
				<td class="t1"><strong>제목 : </strong></td> 
				<td><input type="text" name="o2o_title" size="30" /></td>
			<tr>
			<tr>
				<td class="t1"><strong>이메일 :</strong></td> 
				<td><input type="text" name="o2o_email" size="30" /></td>
			</tr>
			<tr>
				<td class="t1"><strong>핸드폰번호 :</strong></td> 
				<td><input type="text" name="o2o_phone" size="30" /></td>
			</tr>
			<tr>
				<td class="t1"><strong>서비스분류 :</strong></td> 
				<td><select name="o2o_type">
						<option value="선택">선택하세요</option>
						<option value="회원">회원</option>
						<option value="예약 및 결제">예약 및 결제</option>
						<option value="취소 및 환불">취소 및 환불</option>
						<option value="기타">기타</option>
					</select>
			</td>
			<tr>
			<td class="t1"><strong>문의내용 :</strong></td>
			<td>
			<textarea placeholder="문의 내용을 입력하세요."  name="o2o_content" rows="10" cols="60"></textarea>
			</td>
			</tr>
			<tr>
			<td></td>
			<td class="button">
			<a href="faq_list.do"><input type="button"class="btn btn-success" id="cancel" value="취소하기"/></a>
			<input class="btn btn-success" type="submit" value="문의하기" />
			</tr>
		</table>
		</form>
	</div>


</body>
</html>
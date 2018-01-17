<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<br>

	<form id="textsearch" action="admin_clubs_search.do">
		<select name="search_option">
			<option value="0">검색할 것을 선택해주세요</option>
			<option value="1">모임 이름</option>
			<option value="2">모임장 유저 ID</option>
			<option value="3">모임 최대 인원</option>
			<option value="4">모임 생성 날짜 시간</option>
		</select> &nbsp;<input type="text" name="search_content"> <input
			type="submit" value="검색">
	</form>
	<br>


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">자유게시판</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>모임 이름</td>
								<td>모임장 유저 ID</td>
								<td>모임 이미지</td>
								<td>모임 최대 인원</td>
								<td>모임 생성 날짜/시간</td>
								<td>모임 삭제 하기</td>
							</tr>
						</thead>
						<jl:forEach var="vo" items="${ls}">
							<tr>
								<td><a href="admin_club_detail.do?club_no=${vo.club_no}">${vo.club_name}</a></td>
								<td>${vo.user_id}</td>
								<td><img src="club_thumb_images/${vo.club_thumb_img}"
									style="width: 128px; height: 128px;" /></td>
								<td>${vo.max_member}</td>
								<td>${vo.create_time}</td>
								<td><a href="admin_club_remove.do?club_no=${vo.club_no}">삭제</a></td>
							</tr>
						</jl:forEach>
					</table>


				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<!-- jQuery -->
	<script src="./Resouces_admin/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./Resouces_admin/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./Resouces_admin/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="./Resouces_admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../Resouces_admin/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>
</html>


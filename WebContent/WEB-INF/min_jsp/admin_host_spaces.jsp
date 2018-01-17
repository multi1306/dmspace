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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">판매자 리스트</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>사업자 등록 번호</th>
								<th>공간 이름</th>
								<th>공간 내용</th>
								<th>공간 썸브네일 이미지</th>
								<th>오픈 시간</th>
								<th>클로즈 시간</th>
								<th>가격</th>
								<th>최대 인원</th>
								<th>최소 인원</th>
								<th>공간 번호</th>
								<th>주소</th>
								<th>공간 카테고리</th>
								<th>장소 카테고리</th>
								<th>생성일</th>
							</tr>
							</thead>
							<jl:forEach var="vo" items="${ls}">
								<tr>
									<td>${vo.crn}</td>
									<td>${vo.space_title}</td>
									<td>${vo.space_content}</td>
									<td><a href="space_detail.do?space_no=${vo.space_no}"><img
											src="thumbnail/${vo.space_thumb_img}"
											style="width: 128px; height: 128px;"></img></a></td>
									<td>${vo.open_time}</td>
									<td>${vo.close_time}</td>
									<td>${vo.price}</td>
									<td>${vo.max_people}</td>
									<td>${vo.min_people}</td>
									<td>${vo.space_call}</td>
									<td>${vo.zipcode}</td>
									<td>${vo.s_category_no}</td>
									<td>${vo.l_category_no}</td>
									<td>${vo.the_time}</td>
								</tr>
							</jl:forEach>
					</table>
					<!-- /.table-responsive -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<!-- jQuery -->
	<script src="../Resouces_admin/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../Resouces_admin/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../Resouces_admin/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="../Resouces_admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="../Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="../Resouces_admin/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../Resouces_admin/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
</body>
</html>
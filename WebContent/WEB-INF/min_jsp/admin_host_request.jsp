<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            판매자 신청 리스트
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                    <th>유저 ID</th>
									<th>호스트 이름</th>
									<th>신청 정보 확인하기</th>
									<th>참고사항(거절 사항)</th>
									</tr>
								 </thead>
								 
								<jl:forEach var="vo" items="${ls}">
									<tr>
										<td><a href="admin_host_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
										<td>${vo.host_name}</td>
										<td><a href="admin_host_request_view.do?crn=${vo.crn}">정보 확인 하기</a></td>
										<td>${vo.etc}</td>
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

<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script>

$(document).ready(function() {

		//�ۻ���
		$("#btnDel").on("click",function(){
			$("#deltext").modal("show");
			$("#delsuccess").on("click",function(){
				$("#deltext").modal("hide");
				$("#modaldel").modal("show");
				$("#modaldel").on("hidden.bs.modal",function(){
					$("#textDelform").submit();
				});  
			});
		});
		//�ۻ�����
	
	
		//��� ����
	    $("#btnClose").on("click",function(){
	    	$("#repleModal").modal("hide");
	    });
	    

		$(".modReple").on("click", function() {
			$("#com_board_reple_no").val($(this).attr("xyz"));
			$("#content").val($("#" + $(this).attr("abcd")).text());
			$("lblcontent").text("�۹�ȣ :" + $(this).attr("xyz"));
			$("#repleModal").modal("show");
			
			$("#btnMod").on("click",function(){
				$("#repleModal").modal("hide");
				$("#modalmod").modal("show");
				
				$("#modalmod").on("hidden.bs.modal",function(){
					$("#reple_form").submit();
				});
				
			});
		});

	    $(".abcd").on("click",function(e){
	           alert();
	    });
	  //��� ������
	    
		
    
		//��ۻ���
		$(".delRe").on("click",function(){
			
	 			var com_board_reple_no = $(this).attr("aa");
				var com_board_no = $(this).attr("bb");
				$("#mohead").html("<div class='modal-title'align='center'><h4>��ۻ���</h4></div>");
				$("#mobody").html("<h3>����� �����Ͻðڽ��ϱ�?</h3>");
				$("#ft").html("<button type='button' class='btn btn-default' id='modal-btn-Yes'>Ȯ��</button>"+
						"<button type='button' class='btn btn-primary' id='modal-btn-No'>���</button>");
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					location.href="community_board_repledel.do?com_board_reple_no="+com_board_reple_no+"&com_board_no="+com_board_no;
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal("hide");
				}); 
		});

				$("#modal-btn-Yes").on("click",function(){
					$("#mohead").html("<div class=div class='modal-title'align='center'><h4>��ۻ����Ϸ�</h4></div>");
					$("ft").html("<button type='button' class='btn btn-default' id='modal-btn-Yes'>Ȯ��</button>");
					
				});
		//��ۻ�����
	
		
		
		//��õ
		$("#btnrecom").on("click",function(){
			var dc = "?dc=" + new Date().getTime();
			ajaxGet("community_board_recom.do" + dc	+ "&user_id=aav&com_board_no=${vo.com_board_no}", 
					function(rt) {
				if (rt == -1) {
					$("#modalrecom").modal("show");
				} 
				else {e("recomCount").innerHTML = rt;}
			});
		});
		//��õ��
	
});

</script>


</head>
<body>
	<div class="jumbotron" style="background-color: green"> 
		<h1>�����Խ��� �ۺ��� </h1>
	</div>
	<table class="table ">
<!--  �����̺�-->
		<tr>
			<td >NO : ${vo.com_board_no} </td>
			
			<td colspan="2"> ���� : ${vo.com_board_title}</td>
			
		</tr>
		
		<tr>
			<td >ID : ${vo.user_id} </td>
			<td colspan="2">VIEW : ${vo.view_count} LIKE : <div id="recomCount">${vo.recom_count}</div></td>
		</tr>
		
		<tr>
			<td colspan="3">${vo.com_board_content}</td>
		</tr>
		<tr>
		<td colspan="6" align="center"></td>
		</tr>
<!-- ������̺� -->
		<tr>
			<th>NO</th>
			<th>CONTENT</th>
			<th>TIME</th>
			<th>USERID</th>

		</tr>

		<jl:forEach var="vo2" items="${rl}">
		<tr>
			<td>${vo2.com_board_reple_no}</td>
			<td> <span id="rb_${vo2.com_board_reple_no}"> ${vo2.com_board_reple_content} </span>
														
			<jl:if test="${user_id eq vo2.user_id}"> 
 			 <input type="button" class="modReple" value="����" abcd="rb_${vo2.com_board_reple_no}" xyz="${vo2.com_board_reple_no}" />	</jl:if>
			
			<jl:if test="${vo2.user_id eq user_id}"> 
			<input type="button" class="delRe" value="����" aa="${vo2.com_board_reple_no}" bb="${vo2.com_board_no}"/> </jl:if>
			
			 </td>
		</tr>
		</jl:forEach>
	</table>


<!--  �ۼ���-->
	<form action="community_board_mod.do" method="POST">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="com_board_title" value="${vo.com_board_title}" /> 
		<input type="hidden" name="user_id" value="${vo.user_id}" /> 
		<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
		<jl:if test="${vo.user_id eq user_id}"><input type="submit" id="mod"  class="btn btn-primary" value="�� �����ϱ�" />
		</jl:if>
	</form>
<!--  �ۼ����� -->	


<!--  �ۻ���-->	
	<form action="community_board_del.do" method="POST" id="textDelform">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<jl:if test="${vo.user_id eq user_id}"><input type="button" id="btnDel" class="btn btn-primary" value="�� �����ϱ�" />
		</jl:if>
	</form>
<!--  �ۻ����� -->	
	
	
<!-- ��õ��ư -->
	<input type="button" id="btnrecom"  class="btn btn-primary" value="��õ��ư" />
	
<!--  ����߰� -->
	<form action="community_board_addreple.do" method="POST">
	���: <input type="text" name="com_board_reple_content" size="30"/> 
	<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/> 
	<input type="hidden" name="user_id" value="${vo.user_id}" /> 
	<input type="submit" class="btn btn-primary" value="��۴ޱ�!" />
	</form>
<!--  ����߰��� -->	
	
<!-- ��޺κ� -->

<!-- ���ü�������� -->
	<form method="POST" action="community_board_replemod.do" id="reple_form">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_board_no" value="${vo.com_board_no}"
				name="com_board_no" /> <input id="com_board_reple_no" type="hidden" name="com_board_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_board_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<input type="button" class="btn btn-primary btn-sm" id="btnMod" value="����"/>
						<input type="button" class="btn btn-primary btn-sm" id="btnClose" value="�ݱ�"/>
					</div>
				</div>
			</div>
		</div>
	</form>
<!-- ���ü����������-->


<!-- ���ø�޼�����ư_���â -->
	<div class="modal fade" id="modalmod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">����� �Ǹ��� ����� �����Ǿ����ϴ� !</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				
				</div>
			</div>
		</div>
	</div>
<!-- ���ø�޼�����ư_���â�� -->

<!-- ���â ����-->
<form id="frm" method="post" action="club_mod_board_reple.do">
		<div id="modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"></div>
					<div id="mobody" class="modal-body" align="center"></div>
					<div id="ft" class="modal-footer"></div>
				</div>
			</div>
		</div>
	</form>
<!-- ���â ���ó�-->	

	
<!-- ��õ���â -->
	<div class="modal fade" id="modalrecom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">���� �̹� ��õ�ϼ̽��ϴ�</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
<!-- ��õ���â�� -->
	

<!-- �ۻ�����޺κ� -->

<!-- �ۻ�������� -->

<div class="modal fade" id="deltext" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">���� ������ ������ �����Ͻðڽ��ϱ�?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					<button type="button" class="btn btn-primary" id="delsuccess">Ȯ��</button>
				</div>
			</div>
		</div>
</div>
	
<!-- �ۻ��������-->


<!-- �ۻ��� ��� Ȯ�� �� -->
	<div class="modal fade" id="modaldel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">�ÿ��ϰ� �����Ǿ����ϴ�</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- �ۻ��� ��� Ȯ�� ���� -->



</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<script type="text/javascript" src="common.js"></script>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	function chkAgr() {
		//checkbox�� check���¸� ���ͼ� �ϳ��� üũ���� �ʾҴٸ� ���â
		var obj = document.agreeFrm;
		var ag1 = obj.agree1.checked; //true //false
		var ag2 = obj.agree2.checked;

		if (!ag1) {
			alert("�̿����� �������ּ��� !!");
			return;
		}

		if (!ag2) {
			alert("�������� Ȱ�뿡 �������ּ��� !!");
			return;
		}

		location.href = "home_user_join.do";
	}

	$(document).ready(function() {

		var scOffset = $('.navbar-Menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});

		var url = "chk_login.do";
		ajaxGet(url, function(rt) {

			// �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
			if (rt == "10002") {
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}

			// �α��� �� : rt�� -> user_name
			else if (rt != "") {
				$("#login_nav").show();
				$("#non_login_nav").hide();
				$("#user_name").text(rt + "���� �α����ϼ̽��ϴ�.");
			}
		});

	});
</script>


<body>

	<div class="jbTitle">
		<h1>Multi Space</h1>
	</div>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default ">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.html">multi space</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse navbar-Menu ">
			<ul class="nav navbar-nav ">
				<li><a href="space_home.do">����</a></li>
				<li><a href="club_home.do">����</a></li>
				<li><a href="community_list.do">Ŀ�´�Ƽ</a></li>
				<li><a href="event_user_list.do">�̺�Ʈ</a></li>
				<li><a href="notice_list.do">��������</a></li>
				<li><a href="faq_list.do">FAQ</a></li>
				<li><a href="admin_main.do">������</a></li>
			</ul>

			<ul id="login_nav" class="nav navbar-nav navbar-right">
				<li><a href="#" id="user_name"></a></li>
				<li><a href="mypage_moveMypageMainPage.do">����������</a></li>
				<li><a href="home_logout.do">�α׾ƿ�</a></li>
			</ul>

			<ul id="non_login_nav" class="nav navbar-nav navbar-right">
				<li><a href="#">�α���</a></li>
			</ul>

		</div>
	</div>
	</nav>
	<!-- nav -->
	<div class="container">
		<div class="wrap">
			<div class="header">
				<div id="header_container"></div>
				<div id="navi_bar"></div>
			</div>

			<div id="container">

				<div id="agree">
					<form name="agreeFrm">
						<div
							style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
							<p style="margin: 10px;">1. MultiSpace Ȩ������(���� Ȩ�������� ��)��
								MultiSpace���� ��ϴ� �����뿩�� ���ͳ� ���� ����Ʈ�Դϴ�. Ȩ�������� ȸ������ �����Ͻô� �е��� ȸ��
								��ü�� ���� ����ȸ�� Ȥ�� ����ȸ������ �����Ͻ� �� ������, �����Ͻ� ȸ���鲲�� Ȩ���������� �����ϴ� ���� ��
								����� �̿��Ͻ� �� �ֽ��ϴ�. ����� �������� �����Ͻø� �� ����� �����ϴ� ������ �����ϸ� ȸ�������� �Ͻ� ��
								�ְ� �˴ϴ�.</p>
							<p style="margin: 10px;">2. ȸ���� ���� Ȩ�������� ȸ���� ����ȸ������ �����˴ϴ�.</p>
							<p style="margin: 10px;">��. ����ȸ�� - ����ȸ���� ȸ�����Խ�û���� �ۼ��� ����
								����ڷμ� Ȩ�������� ���񽺸� ����� �� �ֽ��ϴ�. - ����ȸ���� ������û�� ��뺸�������� �����ϸ� ��뺸��������
								������ �� �ֽ��ϴ�. - Ȩ�������� ����ȸ������ ��ϴ� ������ ȸ����å�� �����Ͽ� �������� ȸ��ü�踦 �����մϴ�.
								- ���� Multi Space �� �̿��ϱ� ���ؼ��� Multi Space�� ���ؼ��� ȸ�������� �Ͽ��� �ϸ�,
								ȸ�������� �Ͻø� Multi Space���� ȸ������ ��ϵ˴ϴ�. - ������ ���ؿ� ���Ͽ� ȸ�� �ڰ��� ���� �Ǵ�
								�Ҹ�˴ϴ�.</p>
							<p style="margin: 10px;"></p>
							<p style="margin: 10px;">
								3.ȸ���������<br /> ȸ�� ���� �� �ۼ��ϴ� ��� ȸ�� �������� Ȩ�������� ���� ������ �ʿ��� ��츦
								�����ϰ�, �ٸ� �������� ������ �ʽ��ϴ�. ���������� �����Ͽ��� ��� �߻��ϴ� �������� å������ ������,
								Ȩ�������� ���� ���� ��ġ�� ���� �� �ֽ��ϴ�. ���� ȸ�������� �������� ������ ����������, �̸��� ID,
								�ֹε�Ϲ�ȣ, ����ڵ�Ϲ�ȣ �� ������ ������ ������ ��Ģ������ �Ұ����ϹǷ� �ۼ��� �����ؾ� �մϴ�.
							</p>
							<p style="margin: 10px;">
								4. Ȩ�������� ��ȸ�� ����<br /> ��. Ȩ�������� ȸ���� ������ ���񽺸� ������ �� �ֽ��ϴ�.<br /> -
								�����뿩<br /> - Ŀ�´�Ƽ ��� �� ����<br /> - �������<br /> - ���ǰԽ���<br /> ��. ����
								���񽺸� �ޱ� ���ؼ��� ����� �α����� �ϼž� �մϴ�.<br /> ��. Ȩ�������� ���񽺴� ���������� �߰� ������
								���̸�, �Ұ����� ������ ���� ������ ������ �����ϰų� �ߴ��� �� �ֽ��ϴ�.<br /> ��. ���񽺰� ����ǰų�
								�ߴܵǴ� ��� ȸ������ Ȩ�������� ���ؼ� �����մϴ�.<br />
							</p>
							<p style="margin: 10px;">
								5. ȸ��� ���� �� ȣ�� �ش��ϴ� �̿��� ��û�� ���Ͽ��� �̸� �³����� �ƴ� �մϴ�.<br /> ��. �ٸ�
								����� ���Ǹ� ����Ͽ� ��û�Ͽ��� ��<br /> ��. ������ �Ǹ����� ��û���� �ʾ��� ��<br /> ��. �̿� ���
								��û���� ������ ������ �����Ͽ��� ��<br /> ��. ��ȸ�� �ȳ�� ���� Ȥ�� ��ǳ����� ������ �������� ��û�Ͽ���
								�� 6. ID�� ��й�ȣ<br /> ��. ID�� ��й�ȣ�� ���� ��� ����å���� �̿��ڿ��� �ֽ��ϴ�. �̿��ڿ���
								�ο��� ID �� ��й�ȣ�� ������Ȧ, ������뿡 ���Ͽ� �߻��ϴ� ��� ����� ���� å���� �̿��ڿ��� �ֽ��ϴ�.
								�ڽ��� ID�� �����ϰ� ���� ��� �̿��ڴ� �ݵ�� Ȩ������ �������Ϳ��� ��ȭ�� �̸���( 1588-3357 /
								webmaster@multicampus.co.kr)�� �� ����� �뺸�ؾ� �մϴ�.<br /> ��. ��й�ȣ�� ������
								������ �ؼ��Ͽ� ��û�Ͽ��� �մϴ�.<br /> - 6�� �̻����� �����ϼž� �մϴ�.<br /> - �����ڿ� ���ڸ�
								ȥ���ϼž� �մϴ�.<br /> - ID�� ���Եǰų� �������� �ʾƾ� �մϴ�.<br /> - ������ ���ڰ� 4ȸ �̻�
								���ӵǾ�� �ȵ˴ϴ�.<br /> - �� ������ ��� ���׿� ���յǾ�� �������� ȸ�������� �Ͻ� �� �ֽ��ϴ�.<br />
							</p>
							<p style="margin: 10px;">
								7. ȸ���� �Խù� ����<br /> Ȩ������ ���񽺿� ȸ���� �Խ��ϰų� ����� ���빰�� ���� ���׿� �ش�ȴٰ�
								�ǴܵǴ� ��쿡 ���� ���� ���� ������ �� �ֽ��ϴ�. ��. Ÿ���� ����ϰų� �߻������ ���� �� ��ü�� ����
								�ջ��Ű�� ������ ��� ��. �������� �� ��ǳ��ӿ� ���ݵǴ� ������ ��� ��. ������ ������ ���յȴٰ� �����Ǵ�
								������ ��� ��. Ÿ���� ���۱� �� ��Ÿ�� �Ǹ��� ħ���ϴ� ������ ��� ��. ��Ÿ ���� �����̳� ȸ�翡�� ����
								������ ����Ǵ� ������ ���
							</p>
							<p style="margin: 10px;">
								9. ����� ����<br /> Multi Space�� �� ����� ������ �� ������ ����� ����� ���� ȭ�鿡
								�����ϰų� ��Ÿ �ٸ� ������� �̿��ڿ��� ���������ν� ȿ���� �߻��մϴ�.
							</p>
							<p style="margin: 10px;">
								10. ��� �� ��Ģ<br /> �� ����� ��õ��� ���� ������ ������ű⺻��, ������Ż���� �� ��Ÿ ���ù�����
								������ ���մϴ�. �� ����� 2017�� 10�� 22�Ϻ��� �����մϴ�
							</p>

						</div>
						<div style="margin-top: 5px; margin-bottom: 10px">
							<input type="checkbox" name="agree1" /> �̿� ����� �����մϴ�.
						</div>

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									�����ϴ� ����/����� ���� �����ϴ� �������� �׸��� ������ �����ϴ�.<br /> - �⺻ �������� ���� <br />
									�̸�, �ֹε�Ϲ�ȣ<br /> �α��� ID, ��й�ȣ<br /> ������ȭ��ȣ, �����ּ�, �޴���ȭ��ȣ<br />
									�̸���, �̸��� ���ſ���<br />
								</p>
								<p style="margin: 10px;">
									- ������/���� �̿��� ���� ����<br /> ȸ���, �μ�/��å, ȸ����ȭ��ȣ, �ֹε�Ϲ�ȣ<br />
								</p>
								<p style="margin: 10px;">
									- ���� �̿� �� �߻��Ǵ� ����<br /> ���� �̿���, ���ӷα�, ��Ű<br /> ������ܿ� ����
									��Ͽ���(����), ������<br />
								</p>

							</div>

						</div>
						<br />

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									Multi Space�� ������ ���������� ������ ������ ���� Ȱ���մϴ�.<br /> - ���� ������ ���� ���
									���� �� ���� ������ ���� ������� ����<br /> �н�����, ������ ����, ���� �� ��� ����, ��ǰ��� �Ǵ�
									û���� �� �߼�<br /> - ȸ�� ����<br /> ȸ���� ���� �̿뿡 ���� ����Ȯ��, ���� �ĺ�, �ҷ�ȸ����
									���� �̿� ������<br /> ���ΰ���� ����, ���� �ǻ� Ȯ��, ����Ȯ��, �Ҹ�ó�� �� �ο�ó��, �������� ����<br />
									- ������ �� ���� Ȱ��<br /> �ű� ����(��ǰ) ���� �� Ưȭ, �̺�Ʈ �� ���� ���� ����,
									�α�������� Ư���� ����<br /> ���� ���� �� ���� ����, ���� �� �ľ� �Ǵ� ȸ���� ���� �̿뿡 ����
									��� <br /> - ��뺸�� ������ �뵿�� �Ű� <br /> ȸ���� ��û�� ������ ��뺸�� ��� ������ ���
									��뺸�� ȯ���� ������ �뵿�ο� �Ű��ϰ� �˴ϴ�.<br />
								</p>

							</div>

						</div>
						<br />

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									��Ģ������, �������� ���� �� �̿������ �޼��� �Ŀ��� �ش� ������ ��ü ���� �ı��մϴ�.<br /> ��, ������
									������ ���ؼ��� �Ʒ��� ������ ����� �Ⱓ ���� �����մϴ�. <br />
								</p>
								<p style="margin: 10px;">
									���� �׸� : �̸�, ���� ��ȭ��ȣ, �����ּ�, �޴���ȭ��ȣ, �̸���, ȸ���, �μ�, ��å, ȸ����ȭ��ȣ,
									�ֹε�Ϲ�ȣ<br /> ���� �ٰ� : ��뺸�� ȯ�� ������ ����<br /> ���� �Ⱓ : 3�� <br />
								</p>
								<p style="margin: 10px;">
									�׸��� ��������� ������ ���Ͽ� ������ �ʿ䰡 �ִ� ��� ȸ��� �Ʒ��� ���� ������ɿ��� ���� ������ �Ⱓ ����
									ȸ�������� �����մϴ�.<br /> 1) ��Ÿ ���ɿ� ���� �����Ⱓ/����� �ȳ�<br /> - ��� �Ǵ� û��öȸ
									� ���� ��� : 5�� (���ڻ�ŷ� ����� �Һ��� ��ȣ�� ���� ����)<br /> - ��ݰ��� �� ��ȭ ����
									���޿� ���� ��� : 5�� (���ڻ�ŷ� ����� �Һ��� ��ȣ�� ���� ����)<br /> - �Һ����� �Ҹ� �Ǵ�
									����ó���� ���� ��� : 3�� (���ڻ�ŷ� ����� �Һ��� ��ȣ�� ���� ����)<br /> - ����Ȯ�ο� ���� ���
									���� ���� : ������� �̿����� �� ������ȣ � ���� ���� ���� �Ⱓ : 6���� <br /> - �湮�� ����
									��� ���� ���� : ��� ��� ��ȣ�� ���� �Ⱓ : 3����<br />
								</p>

							</div>

						</div>
						<div style="margin-top: 5px; margin-bottom: 10px">
							<input type="checkbox" name="agree2" /> �������� ���� �� �̿� ����� �����մϴ�.
						</div>

						<input type="button" onclick="chkAgr()" value="�����ϱ�" /> <input
							type="button" onclick="cancelAgr()" value="���" />
					</form>

				</div>
			</div>
		</div>
	</div>
<body>

</body>
</html>

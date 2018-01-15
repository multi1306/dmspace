package multi.club.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;
import main.vo.MessageVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.club.vo.Club_applyVO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_board_repleVO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_notice_repleVO;
import multi.club.vo.Club_searchVO;

public class ClubDAO_fakeImpl implements ClubDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	//���� ��ü ����Ʈ ���
	@Override
	public List<ClubVO> club_findAll() throws Exception {
		return sqlSession.selectList("club.club_findAll");
	}

	//���� ����ϱ�
	@Override
	public int club_add_page_submit(ClubVO pvo) throws Exception {
		return sqlSession.update("club.club_add_page_submit",pvo);
	}

	//���� �� ��ȸ
	@Override
	public ClubVO club_find_detail(ClubVO pvo) throws Exception {
		ClubVO vo = sqlSession.selectOne("club.club_find_detail",pvo); 
		vo.setUser_count(pvo.getUser_count());
		return vo;
	}
	
	//���� �� ��ȸ_���� ��� ��ȸ
	@Override
	public List<SpaceVO> club_find_detail_space(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_detail_space",pvo);
	}

	//���� ��û
	@Override
	public int club_add_apply(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_add_apply",pvo);
	}

	//������ select
	@Override
	public String club_find_master(ClubVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_master",pvo);
	}
	
	//���� Ŀ�´�Ƽ�� ������ ȸ�� ����Ʈ ��ȸ
	@Override
	public List<UserVO> club_find_community_user(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_user",pvo);
	}

	//���� ��û�� ����Ʈ ��ȸ
	@Override
	public List<Club_applyVO> club_find_apply(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_apply",pvo);
	}
		
	//���� �������� ��ȸ
	@Override
	public List<Club_noticeVO> club_findAll_notice(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club_notice.club_findAll_notice",pvo);
	}

	//���� �������� ���
	@Override
	public int club_add_community_notice_submit(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_add_community_notice_submit",pvo);
	}

	//���� Ŀ�´�Ƽ �� ��ȸ
	@Override
	public List<Club_boardVO> club_findAll_board(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club_board.club_findAll_board",pvo);
	}

	//���� �������� ������ ��ȸ
	@Override
	public Club_noticeVO club_find_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.selectOne("club_notice.club_find_notice_detail",pvo);
	}

	//���� �������� �� ����
	@Override
	public int club_mod_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_mod_notice_detail",pvo);
	}

	//���� �������� ����
	@Override
	public int club_del_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_del_notice_detail",pvo);
	}

	//���� ���������� ���� ���
	@Override
	public int club_add_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_add_notice_reple",pvo);
	}

	//���� ���������� ���� ����Ʈ ��ȸ
	@Override
	public List<Club_notice_repleVO> club_find_notice_reple(Club_noticeVO pvo) throws Exception {
		return sqlSession.selectList("club_notice.club_find_notice_reple",pvo);
	}

	//���� ���������� ���� ����
	@Override
	public int club_del_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_del_notice_reple",pvo);
	}

	//���� ���������� ���� ����
	@Override
	public int club_mod_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_mod_notice_reple",pvo);
	}

	//���� Ŀ�´�Ƽ �Խ��� ������ ��ȸ
	@Override
	public Club_boardVO club_find_board_detail(Club_boardVO pvo) throws Exception {
		return sqlSession.selectOne("club_board.club_find_board",pvo);
	}

	//���� Ŀ�´�Ƽ �Խ��� ����
	@Override
	public int club_mod_board_detail(Club_boardVO pvo) throws Exception {
		return sqlSession.update("club_board.club_mod_board_detail",pvo);
	}

	//���� Ŀ�´�Ƽ �Խ��� �� ����
	@Override
	public int club_del_board(Club_boardVO pvo) throws Exception {
		return sqlSession.delete("club_board.club_del_board_detail",pvo);
	}

	//���� Ŀ�´�Ƽ�� ���� ��ȸ
	@Override
	public List<Club_board_repleVO> club_find_board_reple(Club_boardVO pvo) throws Exception {
		return sqlSession.selectList("club_board.club_board_reple",pvo);
	}

	//���� Ŀ�´�Ƽ�� ��� ���
	@Override
	public int club_add_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_add_board_reple",pvo);
	}

	//���� Ŀ�´�Ƽ�� ��� ����
	@Override
	public int club_del_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_del_board_reple",pvo);
	}

	//���� Ŀ�´�Ƽ�� ��� ����
	@Override
	public int club_mod_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_mod_board_reple",pvo);
	}

	//���� Ŀ�´�Ƽ�� �� �ۼ�
	@Override
	public int club_add_community_board_submit(Club_boardVO pvo) throws Exception {
		return sqlSession.update("club_board.club_add_community_board",pvo);
	}

	//���� ��û�� ����
	@Override
	public int club_apply_agree(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_apply_agree",pvo);
	}

	//���� ��û�� ����
	@Override
	public int club_apply_disagree(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_apply_disagree",pvo);
	}

	//���� ������
	@Override
	public int club_add_message(MessageVO pvo) throws Exception {
		return sqlSession.update("club.club_add_message",pvo);
	}

	//��û�� ��û ���� ��ȸ
	@Override
	public Club_applyVO club_find_apply_detail(Club_applyVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_apply_detail",pvo);
	}

	//���� ī�װ� �˻�
	@Override
	public List<Map<Integer, Object>> club_find_l_category() throws Exception {
		return sqlSession.selectList("club.club_find_lcategory");
	}

	//�оߺ� ī�װ� �˻�
	@Override
	public List<Map<Integer, Object>> club_find_c_category() throws Exception {
		return sqlSession.selectList("club.club_find_ccategory");
	}

	//�˻� ���
	@Override
	public List<ClubVO> club_search(Club_searchVO pvo) throws Exception {
		return sqlSession.selectList("club.club_search",pvo);
	}

	// ������ �������� �� �ִ��� ��ȸ.
	@Override
	public User_clubVO club_find_user_byId(User_clubVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_user_byId",pvo);
	}

	// ������ ������ Ż�� �� ��
	@Override
	public int club_del_user(User_clubVO pvo) throws Exception {
		return sqlSession.update("club.club_del_user",pvo);
	}

	// ������ ��ü��ų��
	@Override
	public int club_del_club(User_clubVO pvo) throws Exception {
		return sqlSession.update("club.club_del_club",pvo);
	}

	// ���� ȸ�� ����
	@Override
	public int club_user_release(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_user_release",pvo);
	}

}

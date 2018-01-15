package multi.space.dao;

import java.util.List;
import java.util.Map;

import main.vo.BookmarkVO;
import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.space.vo.Space_searchVO;

public interface SpaceDAO {
	
	//�׽�Ʈ��
	public String sysdate() throws Exception;
	
	//���� ��ü ����Ʈ �ҷ�����
	public List<SpaceVO> find_space_all() throws Exception; 
	
	//���� �߰�
	public Integer add_space(SpaceVO vo) throws Exception;
	
	//���� ����
	public Integer del_space_by_space_no(SpaceVO vo) throws Exception;
	
	//���� �ϳ� �ҷ�����
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception;
	
	//���� �˻��ϰ� ������ ���� Ŭ�� �ҷ�����
	public List<ClubVO> find_user_club(String user_id) throws Exception;
	
	//���� �Ǹ��� ���� �ҷ�����
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception;
	
	//L_CATEGORY ��ü �ҷ�����
	public List<Map<Integer,String>> find_l_category() throws Exception;
	
	//S_CATEGORY ��ü �ҷ�����
	public List<Map<Integer,String>> find_s_category() throws Exception;
	
	//�ϳ��� SPACE���� S_CATEOGRY �ҷ�����
	public String find_s_category_by_space_no(SpaceVO vo) throws Exception;
	
	//���� search
	public List<SpaceVO> search_space(Space_searchVO vo) throws Exception;
	
	//���� ����
	public Integer mod_space(SpaceVO space) throws Exception;	
}


package multi.event.dao;

import java.util.List;

import main.vo.EventVO;
import multi.event.vo.Event_searchVO;


/*	DAO �� �������̽��� �����Ѵ�.
 	SELECT �� find , INSERT �� add, DELETE �� del, 
 	By ���Ŀ��� WHERE ������ ����Ѵ�.
 	throws Exception �Ǵ� throws RuntimeException ���� ����
 	
 	������ mod ���ξ ���δ� ( ���������δ� + 1 ������ inc ������ )
*/

public interface EventDAO {
	public List<EventVO> findAll() throws Exception;
	public int add( EventVO pvo ) throws Exception;
	public int delByPK(EventVO pvo) throws Exception;
	
	public EventVO getByPK( int pk) throws Exception;
	
	public int mod(EventVO pvo) throws Exception;
	
	public List<EventVO> search(Event_searchVO svo) throws Exception;
}






	
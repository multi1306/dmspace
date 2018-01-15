package multi.mypage.mybookmark.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.BookmarkVO;
import main.vo.SpaceVO;

public class BookmarkDAO_MybatisProcImpl implements BookmarkDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<SpaceVO> bookmarkFindAll(String user_id) {
		
		return sqlSession.selectList("bookmark.p_bookmark_findall",user_id);
	}

	@Override
	public int bookmarkDel(int space_no) {
		return sqlSession.delete("bookmark.p_bookmark_del",space_no);
	}
	
	
	

}

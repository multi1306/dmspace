package multi.space.dao;

import main.vo.BookmarkVO;

public interface BookmarkDAO {
	//�ϸ�ũ �߰�
	public Integer add_bookmark(BookmarkVO bookmark) throws Exception;
	public BookmarkVO find_bookmark(BookmarkVO bookmark) throws Exception;
	public Integer del_bookmark(BookmarkVO bookmark) throws Exception;
}

package multi.admin.dao;
 
import java.util.List; 

import main.vo.UserVO;
import multi.admin.vo.Admin_User_Del_EmailVO;

public interface Admin_UserDAO {
	public List<UserVO> user_findAll() throws Exception;
	public UserVO user_check( UserVO uvo ) throws Exception;
	public UserVO user_del( Admin_User_Del_EmailVO uvo ) throws Exception;
	public int user_modify(UserVO uvo) throws Exception;
	public List<Admin_User_Del_EmailVO> removed_users()throws Exception;
}

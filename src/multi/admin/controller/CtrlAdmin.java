package multi.admin.controller;
 
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.RequestMapping;
import main.vo.UserVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.home.login.dao.UserDAO;


/* 
�ɹ� ����
�Ǹ��� ����
��ǰ ����
���� ����
Ŀ�´�Ƽ ����
�������� ����
�̺�Ʈ ����
FAQ ����
1:1 ����
 */

@Controller
public class CtrlAdmin {
	@Autowired	@Qualifier("home_login_UserDAO")
	private UserDAO UserDAO = null;
	
	@Autowired @Qualifier("admin_UserDAO")
	private Admin_UserDAO admin_UserDAO = null;
	
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;
	
	@Autowired @Qualifier("admin_SpaceDAO")
	private Admin_SpaceDAO admin_SpaceDAO = null;
	
	@Autowired @Qualifier("admin_ClubDAO")
	private Admin_ClubDAO admin_ClubDAO = null;
	
	@Autowired @Qualifier("admin_NoticeDAO")
	private Admin_NoticeDAO admin_NoticeDAO = null;
	
	@Autowired @Qualifier("admin_FaqDAO")
	private Admin_FaqDAO admin_FaqDAO = null;
	
	@Autowired @Qualifier("admin_o2oQnADAO")
	private Admin_o2oQnADAO admin_o2oQnADAO = null;

	// ���� ���� ������(iframe���� �̷����)
	@RequestMapping("/admin_main.do")
	public ModelAndView admin_main( @CookieValue("user_id") String user_id, 
			HttpServletRequest request) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_main");
		mnv.addObject("user_id", user_id);
		if ( !user_id.equals("admin") ){
			mnv.setViewName("redirect:/main.html");
			request.logout();
		}
		
		UserVO userInfo = UserDAO.find_userInfo(user_id);
		mnv.addObject("user_name", userInfo.getUser_name());
		return mnv;
	}
}
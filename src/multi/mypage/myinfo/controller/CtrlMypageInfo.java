package multi.mypage.myinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.UserVO;
import multi.mypage.myinfo.dao.MyInfoDAO;
import multi.mypage.myinfo.dao.UserDAO;

/**
 * @author sb
 * ���������� ������
 */
@Controller
public class CtrlMypageInfo {
	
	@Autowired @Qualifier("myInfoDAO")
	private MyInfoDAO myInfoDAO = null;
	
	@Autowired	@Qualifier("mypage_myinfo_UserDAO")
	private UserDAO UserDAO = null;
	

	@RequestMapping("/mypage_moveMypageMainPage.do")
	public ModelAndView moveMypageMainPage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_main");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("user_name", userInfo.getUser_name());
			mnv.addObject("top_nav_code", "20000");
			return mnv;
		} else {
			return null;
		}

	}
	
	//���������� ������ passwd Ȯ��
	@RequestMapping("/myinfo_ckpass.do")
	public ModelAndView ckpasswd() throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_ckpass");
		
		return mnv;
	}
	
	//ȸ������ ����
	@RequestMapping("/mypage_mod_user.do")
	public ModelAndView modUser(@CookieValue("user_id")String user_id,@ModelAttribute UserVO uvo) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		
		uvo.setUser_id(user_id);
		int r = myInfoDAO.ckpass(uvo);
		
		if(r==0){
			mnv.setViewName("myinfo_fail");
		} else if( r==1){
			mnv.setViewName("myinfo_mod_form");
			UserVO rvo = myInfoDAO.find_user(user_id);
			String phone_cen = rvo.getPhone().substring(3,7);
			String phone_end = rvo.getPhone().substring(7);
			String email = rvo.getEmail().substring(0, rvo.getEmail().indexOf("@"));
			mnv.addObject("phone_cen", phone_cen);
			mnv.addObject("phone_end", phone_end);
			mnv.addObject("email", email);
			mnv.addObject("nickname", rvo.getNickname());
			mnv.addObject("rvo", rvo);
		}
		
		return mnv;
	}
	
	//ȸ������ ���� dao
	@RequestMapping("/myinfo_mod_user2.do")
	public String modUser2(@ModelAttribute UserVO uvo,
			@RequestParam(value = "home") String r,
			@RequestParam(value="num") String num, 
			@RequestParam(value = "phone_cen") String phone_cen,
			@RequestParam(value = "phone_end") String phone_end,
			@RequestParam(value = "phone") String home) throws Exception{
		
		String e = uvo.getEmail()+"@"+r;
		uvo.setEmail(e);
		String phone = num + phone_cen + phone_end;
		uvo.setPhone(phone);
	
		myInfoDAO.mod_user(uvo);
		return "redirect:/myinfo_complete.do";
	}
	
	//ȸ���������� �Ϸ�
	@RequestMapping("/myinfo_complete.do")
	public ModelAndView myinfo_complete(@CookieValue("user_id") String user_id) throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_complete");
		
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//ȸ������ ����
	@RequestMapping("/myinfo_delete.do")
	public String myinfo_delete(@CookieValue("user_id") String user_id) throws Exception{
		
		myInfoDAO.del_user(user_id);
		
		return "redirect:/myinfo_del_complete.do?co="+1001;
	}
	
	//ȸ������ ���� Ȯ�� ������
	@RequestMapping("/myinfo_del_complete.do")
	public ModelAndView myinfo_del_complete(@RequestParam("co") String co) throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_del_complete");
		mnv.addObject("co", co);
		
		return mnv;
	}
	
	
	
}

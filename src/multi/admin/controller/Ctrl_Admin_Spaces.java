package multi.admin.controller;
 
import java.util.List; 
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import main.vo.Community_boardVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

/* 
��ǰ ����

��ǰ ���� ����Ʈ ������
��ҿ� ���� �Ǹ��� ���� Ȯ�� ������
 */

@Controller
public class Ctrl_Admin_Spaces {
	@Autowired @Qualifier("admin_SpaceDAO")
	private Admin_SpaceDAO admin_SpaceDAO = null;
	
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;

	// ��ǰ ���� ����Ʈ ������
	@RequestMapping("/admin_spaces.do")
	public ModelAndView admin_space( @ModelAttribute SpaceVO svo,@ModelAttribute  Admin_searchVO  pvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_spaces");
		List<SpaceVO> ls = admin_SpaceDAO.host_spaces_search(pvo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	// ��ҿ� ���� �Ǹ��� ���� Ȯ�� ������
	@RequestMapping("/admin_host_spaces.do")
	public ModelAndView admin_host_spaces( @ModelAttribute SpaceVO svo, @ModelAttribute HostVO hvo  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_spaces");
		List<SpaceVO> ls = admin_SpaceDAO.findHostPlaces(svo);
		mnv.addObject("ls", ls);
		mnv.addObject("host_name", hvo.getHost_name());
		return mnv;
	}
	
	@RequestMapping("/admin_spaces_search.do")
	public ModelAndView admin_spaces_search(@ModelAttribute  Admin_searchVO  pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_spaces_search");
		List<SpaceVO> ls = admin_SpaceDAO.host_spaces_search(pvo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	@RequestMapping("/admin_spaces_search2.do")
	public ModelAndView admin_spaces_search2(@ModelAttribute  Admin_searchVO  pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_spaces_search2");
		List<SpaceVO> ls = admin_SpaceDAO.host_spaces_search2(pvo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	// Ư�� ���� ������ �̿�. �����̷�Ʈ �� ���� ����Ʈ Ȯ�� ������
	@RequestMapping("/admin_space_remove.do")
	public ModelAndView admin_space_remove( @ModelAttribute SpaceVO svo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_SpaceDAO.removeSpace(svo);
		mnv.setViewName("redirect:/admin_spaces.do");
		return mnv;
	}
	
	// Ư�� ����� ��ȣ�� ���� ������ Ȯ�� �ϴ� ������
	@RequestMapping("/admin_space_crn_check.do")
	public ModelAndView admin_host_space_rooms( @ModelAttribute SpaceVO svo, @ModelAttribute HostVO hvo  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_space_crn_check");
		HostVO vo = admin_SpaceDAO.space_crn_check(svo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	
}
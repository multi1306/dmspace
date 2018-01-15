package multi.club.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import main.vo.ClubVO;
import multi.club.dao.ClubDAO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_notice_repleVO;

@Controller
public class CtrlClub_notice {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//���� Ŀ�´�Ƽ �������� �ۼ� ������ ȣ��
	@RequestMapping("/club_add_community_notice.do")
	public ModelAndView club_add_community_notice(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_community_notice");
		mnv.addObject("club_no", pvo.getClub_no());
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	//���� Ŀ�´�Ƽ �������� �ۼ�
	@RequestMapping("/club_add_community_notice_submit.do")
	@ResponseBody
	public String club_add_community_notice_submit(HttpServletRequest request) throws Exception {
		Club_noticeVO pvo = new Club_noticeVO();
		pvo.setC_notice_title(request.getParameter("c_notice_title"));
		pvo.setC_notice_content(request.getParameter("c_notice_content"));
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setUser_id(request.getParameter("user_id"));
		
		try{
			clubDAO.club_add_community_notice_submit(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//���� Ŀ�´�Ƽ �������� ������ ������ ȣ��
	@RequestMapping("/club_notice_detail.do")
	public ModelAndView club_notice_detail(@CookieValue("user_id") String user_id, @ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_notice_detail");
		//�������� ������ ��ȸ
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		
		//���� ����Ʈ ��ȸ
		List<Club_notice_repleVO> reVO = clubDAO.club_find_notice_reple(pvo);

		mnv.addObject("vo", vo);
		mnv.addObject("reVO", reVO);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//���� �������� ���� ������ ȣ��
	@RequestMapping("/club_mod_notice_detail.do")
	public ModelAndView club_mod_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_mod_notice_detail");
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	//���� �������� ����
	@RequestMapping("/club_mod_notice_detail_submit.do")
	@ResponseBody
	public String club_mod_notice_detail_submit(HttpServletRequest request) throws Exception {
		Club_noticeVO pvo = new Club_noticeVO();
		pvo.setC_notice_no(BeanUtil.pInt(request.getParameter("c_notice_no")));
		pvo.setC_notice_title(request.getParameter("c_notice_title"));
		pvo.setC_notice_content(request.getParameter("c_notice_content"));
		try{
			clubDAO.club_mod_notice_detail(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//���� �������� ����
	@RequestMapping("/club_del_notice_detail.do")
	@ResponseBody
	public String club_del_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		try{
			clubDAO.club_del_notice_detail(pvo);
			return "ok";
			
		}catch(Exception e){
			return "no";
		}
	}
	
	//���� Ŀ�´�Ƽ �������� ��� �ۼ�
	@RequestMapping("/club_add_notice_reple.do")
	public String club_add_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		clubDAO.club_add_notice_reple(pvo);
		return "redirect:/club_notice_detail.do?c_notice_no="+pvo.getC_notice_no();
	}
	//���� Ŀ�´�Ƽ �������� ��� ����
	@RequestMapping("/club_del_notice_reple.do")
	@ResponseBody
	public String club_del_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		try{
			clubDAO.club_del_notice_reple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//���� Ŀ�´�Ƽ �������� ��� ����
	@RequestMapping("/club_mod_notice_reple.do")
	@ResponseBody
	public String club_mod_notice_reple(HttpServletRequest request) throws Exception {
		Club_notice_repleVO pvo = new Club_notice_repleVO();
		pvo.setC_notice_reple_no(BeanUtil.pInt(request.getParameter("c_notice_reple_no")));
		pvo.setC_notice_reple_content(request.getParameter("c_notice_reple_content"));
		try{
			clubDAO.club_mod_notice_reple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
}

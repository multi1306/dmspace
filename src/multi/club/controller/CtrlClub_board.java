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
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_board_repleVO;
import multi.club.vo.Club_notice_repleVO;

@Controller
public class CtrlClub_board {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
		//���� Ŀ�´�Ƽ �Խ��� �ۼ� ������ ȣ��
		@RequestMapping("/club_add_community_board.do")
		public ModelAndView club_add_community_board(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_add_community_board");
			mnv.addObject("club_no", pvo.getClub_no());
			mnv.addObject("user_id", user_id);
			return mnv;
		}
		//���� Ŀ�´�Ƽ �Խ��� �� �ۼ�
		@RequestMapping("/club_add_community_board_submit.do")
		@ResponseBody
		public String club_add_community_board_submit(HttpServletRequest request) throws Exception {
			Club_boardVO pvo = new Club_boardVO();
			pvo.setC_board_title(request.getParameter("c_board_title"));
			pvo.setC_board_content(request.getParameter("c_board_content"));
			pvo.setC_board_subject(request.getParameter("c_board_subject"));
			pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
			pvo.setUser_id(request.getParameter("user_id"));
			
			try{
				clubDAO.club_add_community_board_submit(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}
		
		//���� Ŀ�´�Ƽ �Խ��� ������ ������ ȣ��
		@RequestMapping("/club_board_detail.do")
		public ModelAndView club_board_detail(@CookieValue("user_id") String user_id, @ModelAttribute Club_boardVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_board_detail");
			Club_boardVO vo = clubDAO.club_find_board_detail(pvo);
			List<Club_board_repleVO> reVO = clubDAO.club_find_board_reple(pvo);
			mnv.addObject("vo", vo);
			mnv.addObject("reVO", reVO);
			mnv.addObject("user_id", user_id);
			return mnv;
		}
		//���� Ŀ�´�Ƽ �Խ��� ���� ������ ȣ��
		@RequestMapping("/club_mod_board_detail.do")
		public ModelAndView club_mod_board_detail(@ModelAttribute Club_boardVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_mod_board_detail");
			Club_boardVO vo = clubDAO.club_find_board_detail(pvo);
			mnv.addObject("vo", vo);
			return mnv;
		}
		//���� Ŀ�´�Ƽ �Խ��� ���� �۾�
		@RequestMapping("/club_mod_board_detail_submit.do")
		@ResponseBody
		public String club_mod_board_detail_submit(HttpServletRequest request) throws Exception {
			Club_boardVO pvo = new Club_boardVO();
			pvo.setC_board_no(BeanUtil.pInt(request.getParameter("c_board_no")));
			pvo.setC_board_title(request.getParameter("c_board_title"));
			pvo.setC_board_content(request.getParameter("c_board_content"));
			try {
				clubDAO.club_mod_board_detail(pvo);
				return "ok";
			} catch (Exception e) {
				return "no";
			}
		}
		
		//���� Ŀ�´�Ƽ �Խ��� �� ����
		@RequestMapping("/club_del_board_detail.do")
		@ResponseBody
		public String club_del_board_detail(@ModelAttribute Club_boardVO pvo) throws Exception {
			try{
				clubDAO.club_del_board(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}

		//���� Ŀ�´�Ƽ �Խ����� ��� ���
		@RequestMapping("/club_add_board_reple.do")
		public String club_add_board_reple(@ModelAttribute Club_board_repleVO pvo) throws Exception {
			clubDAO.club_add_board_reple(pvo);
			return "redirect:/club_board_detail.do?c_board_no="+pvo.getC_board_no();
		}
		
		//���� Ŀ�´�Ƽ �Խ����� ��� ����
		@RequestMapping("/club_del_board_reple.do")
		@ResponseBody
		public String club_del_board_reple(@ModelAttribute Club_board_repleVO pvo) throws Exception {
			try{
				clubDAO.club_del_board_reple(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}

		//���� Ŀ�´�Ƽ �Խ����� ��� ����
		@RequestMapping("/club_mod_board_reple.do")
		@ResponseBody
		public String club_mod_board_reple(HttpServletRequest request) throws Exception {
			Club_board_repleVO pvo = new Club_board_repleVO();
			pvo.setC_board_reple_no(BeanUtil.pInt(request.getParameter("c_board_reple_no")));
			pvo.setC_board_reple_content(request.getParameter("c_board_reple_content"));
			try{
				clubDAO.club_mod_board_reple(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}
}

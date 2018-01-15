package multi.club.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.ClubVO;
import main.vo.MessageVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.club.dao.ClubDAO;
import multi.club.service.BoardPager;
import multi.club.vo.Club_applyVO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_searchVO;

@Controller
public class CtrlClub {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//���� ������ ȣ��
	@RequestMapping("/club_home.do")
	public ModelAndView club_home(@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_home");
		List<ClubVO> pvo = clubDAO.club_findAll();
		List<Map<Integer, Object>> lmap = clubDAO.club_find_l_category();
		List<Map<Integer, Object>> cmap = clubDAO.club_find_c_category();
		mnv.addObject("lmap", lmap);
		mnv.addObject("cmap", cmap);
		mnv.addObject("pvo", pvo);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//���� ����Ʈ ������ ȣ��
	@RequestMapping("/club_list.do")
	public ModelAndView club_list(@ModelAttribute Club_searchVO svo, @RequestParam("curPage") String curPage ,@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_list");
		// start, end�̿��ؼ� ������ �̾ƿ��� 
		System.out.println(svo.getSearch_content());
		List<ClubVO> vo = clubDAO.club_search(svo);
		// ������ ���ڵ��� ���� ���
		int count = vo.size();
		
		// ������ ������ ���� ó��
		PaginationDTO pz = new PaginationDTO().init(curPage, vo.size());
		svo.setStart(pz.getSkip());
		/*// ������ ������ ���� ó��(�����Ѱ�)
		BoardPager boardPager = new BoardPager(count, curPage);
		svo.setStart(boardPager.getPageBegin());*/
		vo = clubDAO.club_search(svo);
		
		// ������ �ʿ� ����
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo); // vo ����
		map.put("count", count); // ���ڵ� ����
		map.put("pz", pz);
		map.put("svo", svo);
		mnv.addObject("map", map);
		
		return mnv;
	}
	
	//���� ��� ������ ȣ��
	@RequestMapping("/club_add_page.do")
	public ModelAndView club_add_page(@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_page");
		List<Map<Integer, Object>> lmap = clubDAO.club_find_l_category();
		List<Map<Integer, Object>> cmap = clubDAO.club_find_c_category();
		mnv.addObject("lmap", lmap);
		mnv.addObject("cmap", cmap);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	//���� ��û
	@RequestMapping("/club_apply.do")
	@ResponseBody
	public String club_apply(HttpServletRequest request) throws Exception {
		Club_applyVO pvo = new Club_applyVO();
		pvo.setUser_id(request.getParameter("user_id"));
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setApply_content(request.getParameter("apply_content"));
		clubDAO.club_add_apply(pvo);
		return String.valueOf(pvo.getFlag());
	}
	
	//���� ��� ����
	@RequestMapping("/club_add_page_submit.do")
	public String club_add_submit(HttpServletRequest request) throws Exception {
		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
	    int sizeLimit = 1024*1024*15;
	    MultipartRequest mpr = new MultipartRequest(request,savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	      
	    ClubVO pvo = new ClubVO();	      
	    pvo.setClub_name(mpr.getParameter("club_name"));
	    pvo.setClub_title(mpr.getParameter("club_title"));
	    pvo.setMax_member(Integer.parseInt(mpr.getParameter("max_member")));
	    pvo.setClub_content(mpr.getParameter("club_content"));
	    pvo.setClub_thumb_img(mpr.getFilesystemName("club_thumb_img"));
	    pvo.setL_category_no(Integer.parseInt(mpr.getParameter("l_category_no")));
	    pvo.setC_category_no(Integer.parseInt(mpr.getParameter("c_category_no")));
	    pvo.setUser_id(mpr.getParameter("user_id"));
		
		clubDAO.club_add_page_submit(pvo);
		
		return "redirect:/club_home.do";
	}
	
	//���� ������ ������ ȣ��
	@RequestMapping("/club_detail.do")
	public ModelAndView club_detail(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo, @RequestParam("flag") int flag ) throws Exception {
		ModelAndView mnv = new ModelAndView("club_detail");
		
		ClubVO vo = clubDAO.club_find_detail(pvo);
		List<SpaceVO> sVO = clubDAO.club_find_detail_space(pvo);
		Club_applyVO club_apply = new Club_applyVO();
		club_apply.setClub_no(pvo.getClub_no());
		club_apply.setUser_id(user_id);
		Club_applyVO club_applyVO = clubDAO.club_find_apply_detail(club_apply);
		mnv.addObject("vo", vo);
		mnv.addObject("sVO", sVO);
		mnv.addObject("flag", club_apply.getFlag());
		mnv.addObject("club_applyVO", club_applyVO);
		mnv.addObject("user_id", user_id);
		
		return mnv;
	}
	
	//���� Ŀ�´�Ƽ ������ ȣ��
	@RequestMapping("/club_community.do")
	public ModelAndView club_community(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo, @RequestParam("flag") int flag) throws Exception {
		ModelAndView mnv = new ModelAndView("club_community");
		ClubVO vo = clubDAO.club_find_detail(pvo);
		String master = clubDAO.club_find_master(pvo);
		List<Club_noticeVO> noticeVO = clubDAO.club_findAll_notice(pvo);
		List<Club_boardVO> boardVO = clubDAO.club_findAll_board(pvo);
		List<UserVO> userVO = clubDAO.club_find_community_user(pvo);
		List<Club_applyVO> applyVO = clubDAO.club_find_apply(pvo);

		mnv.addObject("vo", vo);
		mnv.addObject("master", master);
		mnv.addObject("noticeVO", noticeVO);
		mnv.addObject("boardVO", boardVO);
		mnv.addObject("userVO", userVO);
		mnv.addObject("applyVO", applyVO);
		mnv.addObject("flag", flag);
		mnv.addObject("user_id", user_id);

		return mnv;
	}
	//���� ��û�� ����
	@RequestMapping("/club_apply_agree.do")
	@ResponseBody
	public String club_apply_agree(@ModelAttribute Club_applyVO pvo, HttpServletRequest request) throws Exception {
		try{
			pvo.setApply_content(request.getParameter("club_name")+"���ӿ� ���ԵǼ̽��ϴ�");
			clubDAO.club_apply_agree(pvo);
			return String.valueOf(pvo.getFlag());
		}catch(Exception e){
			return "10003";
		}
	}
	//���� ��û�� ����
	@RequestMapping("/club_apply_disagree.do")
	@ResponseBody
	public String club_apply_disagree(HttpServletRequest request) throws Exception {
		Club_applyVO pvo = new Club_applyVO();
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setUser_id(request.getParameter("user_id"));
		pvo.setEtc(request.getParameter("club_name")+" Ŭ������ ���� ���Ͽ����ϴ�.");
		try{
			clubDAO.club_apply_disagree(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//���� Ż��_����
	@RequestMapping("/club_del_user.do")
	public String club_del_user(@ModelAttribute User_clubVO pvo) throws Exception {
		clubDAO.club_del_user(pvo);
		return "redirect:/club_home.do";
	}
	
	//���� ��ü
	@RequestMapping("/club_del_club.do")
	public String club_del_club(@ModelAttribute User_clubVO pvo) throws Exception {
		clubDAO.club_del_club(pvo);
		return "redirect:/club_home.do";
	}
	
	//���� ������ �˾� ����
	@RequestMapping("/club_message_popup.do")
	public ModelAndView club_message_popup(@ModelAttribute MessageVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_message_popup");
		mnv.addObject("vo", pvo);
		return mnv;
	}
	//���� ������ �˾� ����
	@RequestMapping("/club_add_message.do")
	public ModelAndView club_add_message(@ModelAttribute MessageVO pvo) throws Exception {
		clubDAO.club_add_message(pvo);
		ModelAndView mnv = new ModelAndView("club_message_success");
		return mnv;
	}
	//���� ȸ�� ����
	@RequestMapping("/club_user_release.do")
	@ResponseBody
	public String club_user_release(@ModelAttribute Club_applyVO pvo, HttpServletRequest request) throws Exception {
		try{
			pvo.setApply_content(request.getParameter("club_name")+"���� ����Ǽ̽��ϴ�.");
			clubDAO.club_user_release(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}

}
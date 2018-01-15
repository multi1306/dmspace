package multi.mypage.mybookmark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import main.vo.BookmarkVO;
import main.vo.SpaceVO;
import multi.mypage.mybookmark.dao.BookmarkDAO;

/**
 * @author sb
 * ���������� ���ã��
 */
@Controller
public class CtrlMypageBookmark {
	
	@Autowired @Qualifier("bookmarkDAO")
	private BookmarkDAO bookmakrDAO;
	
	//���ã�� by user_id
	@RequestMapping("/bookmark_findAll.do")
	public ModelAndView findBookmark(@CookieValue("user_id") String user_id) throws Exception{
		
		ModelAndView mnv = new ModelAndView("bookmark_findAll2");
		List<SpaceVO> rl = bookmakrDAO.bookmarkFindAll(user_id);
		mnv.addObject("rl", rl);
		return mnv;
	}
	
	//���ã�� ����
	@RequestMapping("/bookmark_del.do")
	@ResponseBody
	public String delBookmark(HttpServletRequest request){
		String[] r = request.getParameterValues("check");
		Integer m = 0;
		if(r != null){
			for(String ab : r){
				m = Integer.parseInt(ab);
				bookmakrDAO.bookmarkDel(m);
			}
			return "321";
			
		}else{
			return "error";
		}
	}
}

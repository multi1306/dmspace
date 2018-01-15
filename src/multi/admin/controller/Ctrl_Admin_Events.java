package multi.admin.controller;
 
import java.util.List; 

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.EventVO;
import multi.admin.dao.Admin_EventDAO;


@Controller
public class Ctrl_Admin_Events {
	
	@Autowired @Qualifier("admin_EventDAO")
	private Admin_EventDAO admin_EventDAO = null;
	
	// �̺�Ʈ ����Ʈ ������
	@RequestMapping("/admin_event_list.do")
	public ModelAndView textList() throws Exception {
		List<EventVO> rl = admin_EventDAO.findAll();
		ModelAndView mnv = new ModelAndView("admin_event_list");
		mnv.addObject("rl",rl);
		return mnv;
	}
	
	// �̺�Ʈ ��� �Լ�
	@RequestMapping("/admin_event_add2.do")
	public ModelAndView admin_event_add2(HttpServletRequest request) throws Exception{
		ModelAndView mnv = new ModelAndView("redirect:/admin_event_list.do");

		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");
		vo.setEve_title(eve_title); vo.setEve_content(eve_content); vo.setEve_thumb_img(eve_thumb_img);
		admin_EventDAO.add(vo);
		return mnv;
	}
	
	@RequestMapping("/admin_event_add.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView textadd() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_event_add"); 
		return mnv;	
	}
	
	//  TextVO pvo �� ���� 
	
	// �̺�Ʈ ���� 
	@RequestMapping("/admin_event_del2.do")
	public String textdel2(@ModelAttribute EventVO pvo) throws Exception {
		admin_EventDAO.delByPK(pvo);
		return "redirect:/admin_event_list.do";
	}
	
	// �̺�Ʈ �о���� ������
	@RequestMapping("/admin_event_read.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView textread2(@RequestParam("eve_no") int pk) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_event_read"); 
		EventVO text = admin_EventDAO.getByPK(pk);
		mnv.addObject("text", text );
		return mnv;	
	}
	
	// �̺�Ʈ ����������
	@RequestMapping("/admin_event_mod.do")
	public ModelAndView textmod(@ModelAttribute EventVO pvo) throws Exception{
		ModelAndView mnv = new ModelAndView("admin_event_mod");
		mnv.addObject("text", pvo);
		return mnv;
		//@RequestParam("textNo") text_list.do?textNo=1 ���⿡ �Ѿ���� ������
	}
	
	

	@RequestMapping("/admin_event_mod2.do")
	public ModelAndView admin_event_mod2(HttpServletRequest request) throws Exception{
		
		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		int sizeLimit = 1024*1024*15;
		System.out.println(savePath);
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();

		Integer eve_no = Integer.parseInt(mpr.getParameter("eve_no"));
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");

		vo.setEve_no(eve_no);
		vo.setEve_title(eve_title); 
		vo.setEve_content(eve_content); 
		vo.setEve_thumb_img(eve_thumb_img); 
		
		admin_EventDAO.mod(vo);
		
		ModelAndView mnv = new ModelAndView("redirect:/admin_event_read.do?eve_no=" + eve_no);
		return mnv;
	}

}

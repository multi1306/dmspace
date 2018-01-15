package multi.admin.controller;
 
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.MessageVO;
import multi.admin.dao.Admin_MessageDAO;


/* 
�޽��� ����

// �޽��� ������ �ۼ� ������
Ư�� ���� ������ �̿�. �����̷�Ʈ �� ���� ����Ʈ Ȯ�� ������
Ư�� ���� ������ Ȯ���ϴ� ������
 */

@Controller
public class Ctrl_Admin_Message {
	@Autowired @Qualifier("admin_MessageDAO")
	private Admin_MessageDAO admin_MessageDAO = null;
	
	// �޽��� ������ �ۼ� ������
	@RequestMapping("/admin_message_write.do")
	public ModelAndView admin_message_write( ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_write");
		
		return mnv;
	}
	
	// �޽��� ������
	@RequestMapping("/admin_writing_message.do")
	public ModelAndView admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_MessageDAO.writing_message(mvo);
		mnv.setViewName("redirect:/admin_message_write.do");
		
		return mnv;
	}

	@RequestMapping("/admin_message_read_get.do")
	public ModelAndView admin_message_read_get( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_get");
		List<MessageVO> ls = admin_MessageDAO.findAllGetMessages();
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	@RequestMapping("/admin_message_read_to.do")
	public ModelAndView admin_message_read_to( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_to");
		List<MessageVO> ls = admin_MessageDAO.findToGetMessages();
		mnv.addObject("ls", ls);
		return mnv;
	}
}
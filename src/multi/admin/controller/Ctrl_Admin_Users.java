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
import main.vo.HostVO;
import main.vo.O2OQnAVO;
import main.vo.UserVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.mail.EmailUtility;
import multi.admin.vo.Admin_User_Del_EmailVO;


/* 
�ɹ� ����

���� ����Ʈ ������
Ư�� ���� Ŭ���� Ȯ�� ������
Ư�� ���� ����. �����̷�Ʈ ���� ����Ʈ ������
���� ���� ���� ������. Ư�� ���� ���� �ҷ���
���� ���� ���� ���������� ���� ���� ���� �Ϸ� ��. �����̷�Ʈ ���� ����Ʈ ������.
���� ��� ������. �̱���. ���� �ϳ� ��ü
 */

@Controller
public class Ctrl_Admin_Users {
	@Autowired @Qualifier("admin_UserDAO")
	private Admin_UserDAO admin_UserDAO = null;
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;
	
	// ���� ����Ʈ ������
	@RequestMapping("/admin_users.do")
	public ModelAndView admin_users() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_users");
		List<UserVO> ls = admin_UserDAO.user_findAll();
		mnv.addObject("ls", ls);
		return mnv;
	}
	// Ư�� ���� Ŭ���� Ȯ�� ������
	@RequestMapping("/admin_user_check.do")
	public ModelAndView admin_user_check( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_check");
		UserVO vo = admin_UserDAO.user_check(uvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	
	// ���� ���� ���� ������. Ư�� ���� ���� �ҷ���
	@RequestMapping("/admin_user_mod.do")
	public ModelAndView admin_user_mod( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_mod");
		UserVO vo = admin_UserDAO.user_check(uvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// ���� ���� ���� ���������� ���� ���� ���� �Ϸ� ��. �����̷�Ʈ ���� ����Ʈ ������.
	@RequestMapping("/admin_user_mod2.do")
	public ModelAndView admin_user_mod2( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_UserDAO.user_modify(uvo);
		mnv.setViewName("redirect:/admin_users.do");
		return mnv;
	}
	// Ư�� ���� ������ �̸��Ϸ� Ż�� ���� �ۼ��ϴ� ������
	@RequestMapping("/admin_user_del_write.do")
	public ModelAndView admin_user_del_write( @ModelAttribute Admin_User_Del_EmailVO uvo, @ModelAttribute HostVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_del_write");
		UserVO vo = null;
		try {
			if ( hvo.getCrn() != null || hvo.getCrn().equals("") ){
				System.out.println("admin_user_del_write for host.do");
				vo = admin_HostDAO.host_user_check(hvo);
				uvo.setUser_id(vo.getUser_id());
				uvo.setUser_name(vo.getUser_name());
				uvo.setEmail(vo.getEmail());
				mnv.addObject("vo", uvo);
			}
		} catch ( Exception e) {
			System.out.println("admin_user_del_write for user.do");
			mnv.addObject("vo", uvo);
		}
		return mnv;
	}
	@RequestMapping("/admin_user_del.do")
	public ModelAndView admin_user_del( @ModelAttribute Admin_User_Del_EmailVO uvo  ) throws Exception {
		ModelAndView mnv = new ModelAndView();
        String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "multipro2018@gmail.com";
        String password = "rmfnpdlxm2";

        String customer_email = uvo.getEmail();
        String admin_subject = uvo.getSubject();
        String admin_opinion = uvo.getMail_content();
        
        String subject = "�ȳ��ϼ��� ��Ƽ �����̽��Դϴ�." + admin_subject;
        String message = admin_opinion +"\n\n\n\n �׻� ��Ƽ �����̽��� �̿��� �ּż� �����߽��ϴ�.\n"
        				+ "\n�������� �߽� �����Դϴ�."
        				+ "\n\n�����մϴ�.";
        
        String result_message = null;
        try {
        	admin_UserDAO.user_del(uvo);
            EmailUtility.sendEmail(host, port, mailFrom, password, customer_email, subject,
            		message);
            result_message = "The e-mail was sent successfully";
            uvo.setMail_content(message);
            //admin_UserDAO.user_del(uvo);
        } catch (Exception e) {
            e.printStackTrace();
            result_message = "There were an error: " + e.getMessage();
        }
        
        mnv.setViewName("redirect:/admin_user_del_write_status.do?message="+result_message);
		return mnv;
	}
	
	// �̸��Ϸ� ������ ���������� ���������� Ȯ�� �ϴ� ������
	@RequestMapping("/admin_user_del_write_status.do")
	public ModelAndView admin_user_del_write_status( @RequestParam("message")String message  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_del_write_status");
		mnv.addObject("message", message);
		return mnv;
	}
	// ������ ���� ����Ʈ���� ���� ������
	@RequestMapping("/admin_user_del_write_list.do")
	public ModelAndView admin_user_del_write_list() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_del_write_list");
		List<Admin_User_Del_EmailVO> ls = admin_UserDAO.removed_users();
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	
	// ���� ��� ������. �̱���. ���� �ϳ� ��ü
	@RequestMapping("/admin_user_stastic.do")
	public ModelAndView admin_user_stastic() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_stastic");
		return mnv;
	}
	
}
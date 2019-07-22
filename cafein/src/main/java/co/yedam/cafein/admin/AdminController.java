package co.yedam.cafein.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.cafein.admin.login.AdminLoginService;
import co.yedam.cafein.vo.AdminVO;

@Controller
public class AdminController {
	@Autowired
	AdminLoginService adminLoginService;
	// 관리자 메인 화면
	@RequestMapping("adminmainform.do")
	public String adminMainForm() {
		return "admin/main";
	}
	
	// 관리자 로그인 화면
	@RequestMapping("adminlogin.do")
	public String adminlogin() {
		return "admin/login";
	}
	//관리자 로그인 처리
	@RequestMapping("adminloginresult.do")
	public String adminLoginResult(AdminVO vo, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		AdminVO admin = adminLoginService.getAdmin(vo);
		PrintWriter out = response.getWriter();
		if(admin == null) {
			out.println("<script>alert('입력하신 아이디와 비밀번호를 다시 확인해주세요.');</script>");
			out.flush();
			return "admin/login";
		}else {
			System.out.println("not null");
			session.setAttribute("aId", admin.getaId());
			System.out.println(session.getAttribute("aId"));
			return "admin/main";
		}
	}
	
	
	// 매장 로그아웃
	@RequestMapping("adminlogout.do")
	public String logout(HttpSession session) {
		
		String aId = (String) session.getAttribute("aId");
		
		if(aId != null) {
			System.out.println("관리자 로그아웃");
			session.removeAttribute("aId");			
		}
		
		return "admin/logout";
	}
		
}

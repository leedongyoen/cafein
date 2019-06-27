package co.yedam.cafein.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
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
}

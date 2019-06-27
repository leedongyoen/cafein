package co.yedam.cafein.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	// 관리자 메인 화면
		@RequestMapping("adminMainForm.do")
		public String adminMainForm() {
			return "admin/main";
		}
}

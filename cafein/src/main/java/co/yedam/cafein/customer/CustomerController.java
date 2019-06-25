package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

	// 메인화면으로
	@RequestMapping("mainForm.do")
	public String mainForm() {
		return "customer/main";
	}
	
	// 자주 이용한 매장
	@RequestMapping("likestorelist.do")
	public String likestorelist() {
		return "customer/likestorelist";
	}

}

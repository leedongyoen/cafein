package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.org.glassfish.gmbal.ManagedAttribute;

@Controller
public class CustomerController {
	   
	//고객 로그인
	@RequestMapping("customerloginForm.do")
	public String login() {
		return "customer/login";
		
	}
	//고객 회원가입
	@RequestMapping("customerjoinForm.do")
	public String join() {
		return "customer/join";
		
	}
	//ID/PW 찾기
	@RequestMapping("customerfindidpwForm.do")
	public String findidpw() {
		return "customer/findidpw";
		
	}
	//고객 회원정보 수정
	@RequestMapping("customerinfoeditForm.do")
	public String infoedit() {
		return "customer/infoedit";
		
	}
}

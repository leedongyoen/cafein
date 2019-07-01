package co.yedam.cafein.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.org.glassfish.gmbal.ManagedAttribute;

@Controller
public class CustomerController {
	   
	//고객 로그인
	@RequestMapping("customerlogin.do")
	public String login() {
		return "customer/login";
		
	}
	//고객 회원가입
	@RequestMapping("customerjoin.do")
	public String join() {
		return "customer/join";
		
	}
	//ID/PW 찾기
	@RequestMapping("customerfindidpw.do")
	public String findidpw() {
		return "customer/findidpw";
		
	}
	//고객 회원정보 수정
	@RequestMapping("customerinfoedit.do")
	public String infoedit() {
		return "customer/infoedit";
		
	}
	
	// 카카오 로그인
	@RequestMapping(value = "kakaologin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest requset, HttpServletRequest httpServlet) {
		System.out.println("kakao login code : " + code);
		
		// 리턴 수정하기
		return null;
		
	}
}

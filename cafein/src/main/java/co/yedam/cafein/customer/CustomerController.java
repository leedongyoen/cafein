package co.yedam.cafein.customer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;

import co.yedam.cafein.customer.login.CustomerLoginService;
import co.yedam.cafein.customer.info.CustomerInfoService;
import co.yedam.cafein.customer.login.KakaoRestAPI;
import co.yedam.cafein.vo.CustomerVO;


@Controller
public class CustomerController {
	@Autowired
	CustomerLoginService customerLoginService;
	CustomerInfoService customService;
	  
	//고객 로그인
	@RequestMapping("customerinfoedit.do")
	public String customerinfoedit(@ModelAttribute("customer") CustomerVO vo) {
		return "customer/infoedit";
		
	}
	
	//고객 로그인
	@RequestMapping("customerlogin.do")
	public String login(@ModelAttribute("customer") CustomerVO vo) {
		return "customer/login";
		
	}
	// 고객 로그인 처리
	@RequestMapping("customerloginresult.do")
	public String loginResult(CustomerVO vo, HttpSession session, Model model) {
		
		CustomerVO customer = customerLoginService.getCustomer(vo);
		if(customer == null) {
			return "customer/login";
		} else {
			session.setAttribute("cId", customer.getcId());
			
			return "customer/main";
		}

	}
	
	// 고객 로그아웃 
	@RequestMapping("customerlogout.do")
	public String logout(HttpSession session) {
		
		Object ob = session.getAttribute("cId");
		
		if(ob != null) {
			
			session.removeAttribute("cId");
			session.removeAttribute("customer");
			session.invalidate();
		}
	
		return "customer/logout";
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
	
	
	// 카카오 로그인
	@RequestMapping(value = "/logininfo", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session)
	{
		System.out.println("카카오 로그인 할 때 임시 코드값 : " + code);
		System.out.println("카카오 로그인 후 결과값");
		
		// kakao rest api 객체 선언
		KakaoRestAPI kakao = new KakaoRestAPI();
		// 결과값을 node에 담아줌
		JsonNode node = kakao.getAccessToken(code);
		// 결과값 출력
		System.out.println("=======================================\n node : "+node);
		// 노드 안에 있는 access_token 값을 꺼내 문자열로 변환
		String token = node.get("access_token").toString();
		session.setAttribute("token", token);
		
		// 리턴 수정하기
		return "customer/logininfo";
		
	}
	
	// 카카오 로그아웃
	@RequestMapping(value = "/logout", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
		KakaoRestAPI kakao = new KakaoRestAPI();
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = kakao.Logout(session.getAttribute("token").toString());
        //결과 값 출력
        System.out.println("로그아웃 후 반환되는 아이디 : " + node.get("id"));
        return "customer/main";
    } 
	

}

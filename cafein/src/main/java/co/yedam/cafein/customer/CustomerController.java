package co.yedam.cafein.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
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
	public String loginResult(CustomerVO vo, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		
		CustomerVO customer = customerLoginService.getCustomer(vo);
		PrintWriter out = response.getWriter();
		
		if(customer == null) {
			out.println("<script>alert('입력하신 아이디와 비밀번호를 다시 확인해주세요.');</script>");
			out.flush();
			return "customer/login";
		} else {
			session.setAttribute("cId", customer.getcId());
			// 가입경로를 알기위해 세션에 담음(로그아웃시 필요!)
			session.setAttribute("cJoin", customer.getcJoin());
			return "customer/main";
		}

	}
	
	// 고객 로그아웃 & 카카오 로그아웃
	@RequestMapping("customerlogout.do")
	public String logout(HttpSession session) {
		
		String cJoin = (String) session.getAttribute("cJoin");
		System.out.println("가입 경로 : "+cJoin);
		
		if(cJoin.equals("web")) {
			System.out.println("일반 로그아웃");
			session.removeAttribute("cId");
			session.removeAttribute("cJoin");
		} else if(cJoin.equals("kakao")) {
			System.out.println("카카오 로그아웃");
			KakaoRestAPI kakao = new KakaoRestAPI();
			kakao.kakaoLogout((String)session.getAttribute("cId"));
			session.removeAttribute("cId");
			session.removeAttribute("cJoin");
			
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
	@RequestMapping(value = "/kakaologin", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session, CustomerVO vo)
	{
		KakaoRestAPI kakao = new KakaoRestAPI();
		String access_token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_token);
		String kakaoId = (String) userInfo.get("kakaoId");
		String kakaoName = (String) userInfo.get("nickname");
		
		vo.setcId(kakaoId);
		
		System.out.println("-----------------------------------------\n kakao id : " + kakaoId);
		CustomerVO customer = customerLoginService.getKakaoCustomer(vo);
		System.out.println("customer : "+customer);
		
		if(customer == null) {
			vo.setcId(kakaoId);
			vo.setcName(kakaoName);
			customerLoginService.insertCustomerKakao(vo);
			
		}
		// 닉네임 존재 시 세션에 해당 아이디 등록
		session.setAttribute("cId", userInfo.get("kakaoId"));
		session.setAttribute("cJoin", customer.getcJoin());

		return "customer/main";
		
	}

}

package co.yedam.cafein.customer;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;


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
	@RequestMapping(value = "/customerlogin", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session)
	{
		System.out.println("카카오 로그인 할 때 임시 코드값 : " + code);
		System.out.println("카카오 로그인 후 결과값");
		

		// kakao rest api 객체 선언
		KakaoRestAPI kakao = new KakaoRestAPI();
		// 결과값을 node에 담아줌
		JsonNode node = kakao.getAccessToken(code);
		// 결과값 출력
		System.out.println(node);
		// 노드 안에 있는 access_token 값을 꺼내 문자열로 변환
		String token = node.get("access_token").toString();
		session.setAttribute("token", token);
		System.out.println("token : " + token);
		// 리턴 수정하기
		return "customer/logininfo";
		
	}
}

package co.yedam.cafein.customer;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.cafein.customer.login.CustomerLoginDAO;
import co.yedam.cafein.customer.login.CustomerLoginService;
import co.yedam.cafein.customer.info.CustomerInfoService;
import co.yedam.cafein.customer.join.CustomerJoinDAO;
import co.yedam.cafein.customer.join.CustomerJoinService;
import co.yedam.cafein.customer.login.KakaoRestAPI;
import co.yedam.cafein.google.TempKey;
import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.NaverLoginVO;

@Controller
public class CustomerController {

	private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	private CustomerJoinDAO customerJoinDAO;
	private CustomerLoginDAO loginDAO;
	
	@Autowired
	CustomerLoginService customerLoginService;

	@Autowired
	CustomerInfoService customService;

	@Autowired
	CustomerJoinService customerjoinService;

	private void setNaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}

	// 고객 정보
	@RequestMapping("customerinfoedit.do")
	public String customerinfoedit(@ModelAttribute("customer") CustomerVO vo) {
		return "customer/infoedit";

	}

	// 고객 로그인
	@RequestMapping("customerlogin.do")
	public String login(@ModelAttribute("customer") CustomerVO vo) {
		return "customer/login";

	}

	// 고객 로그인 처리
	@RequestMapping("customerloginresult.do")
	public String loginResult(CustomerVO vo, HttpSession session, Model model, HttpServletResponse response)
			throws IOException {

		CustomerVO customer = customerLoginService.getCustomer(vo);
		PrintWriter out = response.getWriter();

		if (customer == null) {
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

	// 고객 로그아웃 & 카카오 로그아웃 & 네이버 로그아웃
	@RequestMapping("customerlogout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		String cJoin = (String) session.getAttribute("cJoin");
		System.out.println("가입 경로 : " + cJoin);

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int j = 0; j < cookies.length; j++) {
				System.out.println("cookie name : " + cookies[j].getName());
				System.out.println("cookie value : " + cookies[j].getValue());
				System.out.println("cookie path : " + cookies[j].getPath());
				System.out.println("cookie maxage : " + cookies[j].getMaxAge());
			}
		}

		if (cJoin.equals("web")) {
			System.out.println("일반 로그아웃");
			session.removeAttribute("cId");
			session.removeAttribute("cJoin");
		} else if (cJoin.equals("kakao")) {

			System.out.println("kakao logout token : " + session.getAttribute("token"));

			System.out.println("카카오 로그아웃");
			KakaoRestAPI kakao = new KakaoRestAPI();
			kakao.kakaoLogout((String) session.getAttribute("token"));
			session.removeAttribute("cId");
			session.removeAttribute("cJoin");
			session.removeAttribute("token");

		} else if (cJoin.equals("naver")) {
			System.out.println("네이버 로그아웃");
			session.removeAttribute("cId");
			session.removeAttribute("cJoin");

			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);
				cookies[i].setPath("/");
				response.addCookie(cookies[i]);
			}
		}

		return "customer/logout";
	}

	// 고객 회원가입 페이지
	@RequestMapping("customerjoinForm.do")
	public String insertJoinForm() {
		return "customer/join";
	}

	// 고객 회원가입 insert
	@RequestMapping(value = "/customerjoin.do", method = RequestMethod.POST)
	public String insertJoin(CustomerVO vo) {
		System.out.println(vo);
		int n = customerjoinService.insertJoin(vo);
		ModelAndView mv = new ModelAndView();
		if (n == 1) {
			return ("customer/login");
		} else {
			return ("customer/join");
		}
		// return mv;

	}

	// ajax 회원가입 id 체크를 할 컨트롤러
	@RequestMapping(value = "/getcustomerjoin/{cId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idCheck(@PathVariable("cId") String cId) {
		CustomerVO vo = new CustomerVO();
		vo.setcId(cId);
		System.out.println("================" + vo.getcId());
		int n = customerjoinService.idCheck(vo);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("cnt", n);
		return map;
	}

	//랜덤함수를 발생 시키는 메소드
		public String RandomNum() {
			StringBuffer buffer = new StringBuffer();
			for (int i = 0; i<=5; i++) {
				int n  = (int) (Math.random()*10);
				buffer.append(n);
			}
			return buffer.toString();
		}
		
	//이메일 보내는 메소드
	@RequestMapping(value="sendmail.do")
	public String sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "<관리자>인증번호 입니다.";
		String from = "bnghty22@gmail.com"; // 보내는 메일
		String to = "bnghty5798@naver.com"; //받는 메일
		
		authNum = RandomNum();	
		
		CustomerVO vo = new CustomerVO();
		
		vo.setAuthNum(authNum);
		System.out.println(vo.getAuthNum());
		
		customerjoinService.authKey(authNum);
		String content = "인증번호 " + authNum + "";

		final String username = "bnghty22@gmail.com"; // change accordingly
		final String password = "epcbehreqclmmugq"; // change accordingly

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);
		
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			System.out.println("성공적으로 메일이 보내졌습니다.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return "customer/emailauth";
		
	}
	// 회원가입 인증번호 인증키를 체크할 컨트롤러 
	@RequestMapping(value = "/getauthjoin/{authNum}", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> authkeyCheck(@PathVariable("authNum") String authNum) {
		CustomerVO vo = new CustomerVO();
		vo.setAuthNum(authNum);
		System.out.println("================" + vo.getAuthNum());
		int n = customerjoinService.authkeyCheck(vo);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("cnt", n);
		return map;
	}
	
	//ID/PW 찾기
	@RequestMapping("customerfindidpw.do")
	public String findidpw() {
		return "customer/findidpw";

	}
	
	//회원의 아이디를 찾을 컨트롤러.
	@RequestMapping(value="idfind.do")
	public String idFind(CustomerVO vo, String cId, String cTel, String cName, HttpServletRequest requset) {
		String host = "smtp.gmail.com";
		String subject = "<관리자>회원님의 아이디 발송 입니다.";
		String from = "bnghty22@gmail.com"; // 보내는 메일
		String to = "bnghty5798@naver.com"; //받는 메일
	//	String Id = requset.getParameter("cId");
	
		vo.setcName(cName);
		vo.setcTel(cTel);
		vo.setcId(cId);

		vo = customerLoginService.idFind(vo);
		
		System.out.println(vo.getcName());
		System.out.println(vo.getcTel());
		System.out.println(vo.getcId());
		
		String content = "회원님의 아이디는 " + vo.getcId() + " 입니다.";

		final String username = "bnghty22@gmail.com"; // change accordingly
		final String password = "epcbehreqclmmugq"; // change accordingly

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);
		
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			System.out.println("성공적으로 메일이 보내졌습니다.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return "customer/login";
		
	}
	
	//비밀번호 찾기 컨트롤러 
	@RequestMapping(value="pwfind.do")
	public String pwFind(CustomerVO vo, String cId, String cTel, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "<관리자>----임시 비밀번호 발송-----";
		String from = "bnghty22@gmail.com"; // 보내는 메일
		String to = "bnghty5798@naver.com"; //받는 메일
		
		authNum = RandomNum();	
		vo.setcPw(authNum);
		System.out.println(vo);

		customerLoginService.pwFind(vo);
		
		System.out.println(vo.getcId());
		System.out.println(vo.getcTel());
	//	customerjoinService.authKey(authNum);
	//	customerjoinService.authKey(authNum);	

		
		String content = "임시비밀번호  =" + authNum + "";

		final String username = "bnghty22@gmail.com"; // change accordingly
		final String password = "epcbehreqclmmugq"; // change accordingly

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);
		
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			System.out.println("성공적으로 메일이 보내졌습니다.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return "customer/login";
		
		
	}

	// 카카오 로그인
	@RequestMapping(value = "/kakaologin", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session, CustomerVO vo) {
		KakaoRestAPI kakao = new KakaoRestAPI();
		String access_token = kakao.getAccessToken(code);

		System.out.println("kakao login access_token : " + access_token);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_token);
		String kakaoId = (String) userInfo.get("kakaoId");
		String kakaoName = (String) userInfo.get("nickname");

		vo.setcId(kakaoId);

		System.out.println("-----------------------------------------\n kakao id : " + kakaoId);
		CustomerVO customer = customerLoginService.getKakaoCustomer(vo);
		System.out.println("kakao customer : " + customer);

		if (customer == null) {
			vo.setcId(kakaoId);
			vo.setcName(kakaoName);
			customerLoginService.insertCustomerKakao(vo);

		}

		customer = customerLoginService.getKakaoCustomer(vo);

		// 세션에 아이디와 가입경로, 토큰 등록
		session.setAttribute("cId", customer.getcId());
		session.setAttribute("cJoin", customer.getcJoin());
		session.setAttribute("token", access_token);
		return kakaoName;

		

	}

	// 네이버 로그인
	@RequestMapping(value = "naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session, NaverLoginVO naverLoginVO) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버 : " + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "redirect:" + naverAuthUrl;

	}

	// 네이버 로그인 처리
	@RequestMapping(value = "naverloginresult.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			NaverLoginVO naverLoginVO, CustomerVO vo) throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);

		System.out.println("token : " + oauthToken);

		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginVO.getUserProfile(oauthToken);

		model.addAttribute("result", apiResult);
		System.out.println("-------------------------------------------------\n result : " + apiResult);

		// json 형태의 apiResult를 map으로 읽고 map안에 있는 배열을 다시 꺼내서 읽는다
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> mapResult = new HashMap<String, Object>();
		mapResult = mapper.readValue(apiResult, new TypeReference<Map<String, Object>>() {
		});
		Map<String, Object> response = (Map<String, Object>) mapResult.get("response");

		System.out.println("id : " + response.get("id") + ", name : " + response.get("name") + ", email : "
				+ response.get("email"));

		vo.setcId((String) response.get("email"));
		CustomerVO customer = customerLoginService.getNaverCustomer(vo);
		System.out.println("naver customer : " + customer);

		if (customer == null) {
			vo.setcId((String) response.get("email"));
			vo.setcName((String) response.get("name"));
			customerLoginService.insertCustomerNaver(vo);
		}

		customer = customerLoginService.getNaverCustomer(vo);
		System.out.println("가입 경로 : " + customer.getcJoin());

		// 세션에 아이디와 가입경로 등록
		session.setAttribute("cId", customer.getcId());
		session.setAttribute("cJoin", customer.getcJoin());

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "customer/main";
	}

}

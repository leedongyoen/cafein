package co.yedam.cafein.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.cafein.store.info.StoreInfoService;
import co.yedam.cafein.store.login.StoreLoginService;
import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.StoreVO;

@Controller
public class StoreController {
	
	@Autowired
	StoreLoginService storeLoginService;
	@Autowired
	StoreInfoService storeService;
	
	//매장 회원가입
	@RequestMapping("storejoin.do")
	public String storejoin() {
		return "store/join";

	}
	//매장 로그인
	@RequestMapping("storelogin.do")
	public String storelogin() {
		return "store/login";
	}

	//매장 로그인 처리
	@RequestMapping("storeloginresult.do")
	public String storeloginResult(StoreVO vo, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		
		StoreVO store = storeLoginService.getStore(vo);
		PrintWriter out = response.getWriter();
		
		
		if(store == null) {
			System.out.println("null");
			out.println("<script>alert('입력하신 아이디와 비밀번호를 다시 확인해주세요.');</script>");
			out.flush();
			return "store/login";
		} else {
			System.out.println("not null");
			session.setAttribute("sid", store.getSid());
			session.setAttribute("sName", store.getSname());
			System.out.println(session.getAttribute("sid"));
			System.out.println("store name : " + store.getSname());
			return "store/main";
		}

	}
	
	// 매장 로그아웃
	@RequestMapping("storelogout.do")
	public String logout(HttpSession session) {
		
		String id = (String) session.getAttribute("sid");
		
		if(id != null) {
			System.out.println("매장 로그아웃");
			session.removeAttribute("sid");
		}
		
		return "store/logout";
	}
	
	//매장 정보수정
	@RequestMapping("storeinfoedit.do")
	public String storeinfoedit() {
		return "store/infoedit";
	}

}

package co.yedam.cafein.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.store.info.StoreInfoService;
import co.yedam.cafein.store.join.StoreJoinService;
import co.yedam.cafein.store.login.StoreLoginService;
import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.StoreVO;

@Controller
public class StoreController {
	
	@Autowired
	StoreLoginService storeLoginService;
	@Autowired
	StoreInfoService storeService;
	@Autowired
	StoreJoinService storejoinService; 
	
	//매장 회원가입
	@RequestMapping("storejoin.do")
	public String storejoin() {
		return "store/join";
	}
	//고객회원가입 insert
	@RequestMapping(value="/storejoin.do", method=RequestMethod.POST)
	public String insertJoin(StoreVO vo, HttpServletResponse response) throws IOException {
		System.out.println(vo);
		PrintWriter out = response.getWriter();
		
		int n = storejoinService.insertJoin(vo);
		ModelAndView mv = new ModelAndView();
		if(n==1) {
			out.println("<script>alert('가입이 완료되었습니다. 승인 완료시 로그인 가능합니다.');</script>");
			return("store/login");
		}else {
			return("store/join");
		}
	}
	
	// ajax 회원가입 id 체크를 할 컨트롤러
		@RequestMapping(value = "/getstorejoin/{sId}", method = RequestMethod.POST)
		@ResponseBody
		public Map<Object, Object> idCheck(@PathVariable("sId") String sId) {
			StoreVO vo = new StoreVO();
			vo.setSid(sId);
			System.out.println("================" + vo.getSid());
			int n = storejoinService.idCheck(vo);
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("cnt", n);
			return map;
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
			session.setAttribute("sId", store.getSid());
			session.setAttribute("sName", store.getSname());
			System.out.println(session.getAttribute("sId"));
			System.out.println("store name : " + store.getSname());
			return "store/main";
		}

	}
	
	// 매장 로그아웃
	@RequestMapping("storelogout.do")
	public String logout(HttpSession session) {
		
		String id = (String) session.getAttribute("sId");
		
		if(id != null) {
			System.out.println("매장 로그아웃");
			session.removeAttribute("sId");
			session.removeAttribute("sName");
			
		}
		
		return "store/logout";
	}
	
	//매장 정보수정
	@RequestMapping("storeinfoedit.do")
	public String storeinfoedit() {
		return "store/infoedit";
	}

}

package co.yedam.cafein.customer.info;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.CustomerVO;

@Controller
public class CustomerInfoController {

	@Autowired
	CustomerInfoService customService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 회원 단건 조회
	@ResponseBody
	@RequestMapping(value = "/customerinfo", method = RequestMethod.GET)
	public CustomerVO getCustomer(CustomerVO vo, Model model) {

		CustomerVO resultvo = new CustomerVO();

		resultvo = customService.getCustomer(vo);
		/*
		 * if(resultvo.getcJoin().equals("naver")) {
		 * 
		 * String cname = resultvo.getcId(); // 먼저 @ 의 인덱스를 찾는다 - 인덱스 값: 5 int idx =
		 * cname.indexOf("@");
		 * 
		 * // @ 앞부분을 추출 // substring은 첫번째 지정한 인덱스는 포함하지 않는다. // 아래의 경우는 첫번째 문자열인 a 부터
		 * 추출된다. String changename = cname.substring(0, idx);
		 * resultvo.setcId(changename); resultvo.setcNick(""); resultvo.setcTel("");
		 * resultvo.setcPw("");
		 * 
		 * }
		 */

		System.out.println(resultvo);
		return resultvo;
	}

	// 수정
	@ResponseBody
	@RequestMapping(value = "/customerinfo", method = RequestMethod.PUT, consumes = "application/json")
	public CustomerVO infoedit(@RequestBody CustomerVO vo, Model model, HttpServletRequest req) {
		System.out.println(vo + "==============================");
		vo.setcPw(null);
		customService.infoedit(vo);
		return vo;
	}

	// 비밀번호 변경
	@ResponseBody
	@RequestMapping(value = "/customerpw/{cId}", method = RequestMethod.PUT, consumes = "application/json")
	public int checkpw(@PathVariable("cId") String id, @RequestBody CustomerVO vo, Model model,
			HttpServletRequest req) {
		System.out.println(vo + "==============================");
		vo.setcId(id);
		CustomerVO customer = customService.getCustomer(vo);
		int n = 0;
		boolean mathes = passEncoder.matches(vo.getCurpw(), customer.getcPw());
		if (mathes) {
			n = customService.checkpw(vo);
			if (n == 0) {
				return 2;
			}
		} else { // 매치가 안된경우 0
			return n;
		}
		return n;
	}

	// 삭제
	@ResponseBody
	@RequestMapping(value = "/customerinfo/{cId}", method = RequestMethod.DELETE)
	public Map getUserList(@PathVariable("cId") String id, CustomerVO vo, Model model) {
		vo.setcId(id);
		customService.deleteCustomer(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

}

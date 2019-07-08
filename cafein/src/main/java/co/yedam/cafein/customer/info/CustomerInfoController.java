package co.yedam.cafein.customer.info;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 회원 단건 조회
	@ResponseBody
	@RequestMapping(value = "/customerinfo/{cId}", method = RequestMethod.GET)
	public CustomerVO getCustomer(@PathVariable("cId") String id, CustomerVO vo, Model model) {
		vo.setcId(id);
		return customService.getCustomer(vo);
	}
	
	//수정
	@ResponseBody
	@RequestMapping(value="/customerinfo", method=RequestMethod.PUT, consumes="application/json")
	public CustomerVO infoedit(@RequestBody CustomerVO vo, Model model,HttpServletRequest req) {
		System.out.println(vo+"==============================");
		vo.setcPw(null);
		customService.infoedit(vo);
		return vo;
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/customerpw/{cId}", method=RequestMethod.PUT, consumes="application/json")
	public CustomerVO checkpw(@PathVariable("cId") String id,@RequestBody CustomerVO vo, Model model,HttpServletRequest req) {
		System.out.println(vo+"==============================");
		vo.setcId(id);
		customService.checkpw(vo);
		return vo;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/customerinfo/{cId}", method=RequestMethod.DELETE)
	public Map getUserList(@PathVariable("cId") String id, CustomerVO vo, Model model) {
		vo.setcId(id);
		customService.deleteCustomer(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	
	
	

}

package co.yedam.cafein.customer.info;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value="/customerinfo", method=RequestMethod.PUT)
	public CustomerVO infoedit(CustomerVO vo, Model model) {
		customService.infoedit(vo);
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

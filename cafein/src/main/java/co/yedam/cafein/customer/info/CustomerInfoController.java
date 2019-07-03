package co.yedam.cafein.customer.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.CustomerVO;

@Controller
public class CustomerInfoController {
	@Autowired
	CustomerInfoService customService;

	// 고객 회원정보 수정처리 --AN
	// @RequestMapping("customerinfoedit.do")
	@ResponseBody
	@RequestMapping(value = "/customerinfo/{cId}", method = RequestMethod.GET)
	public CustomerVO getCustomer(@PathVariable("cId") String id, CustomerVO vo, Model model) {
		vo.setcId(id);
		return customService.getCustomer(vo);
	}
	

	
	
	
	

}

package co.yedam.cafein.store.open;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.StoreOpenVO;


@Controller
public class StoreOpenController {

	@Autowired
	StoreOpenServiceImpl storeOpenService;
	
	@RequestMapping(value="/storeopen.do")
	public String getStoreOpenListForm() {
		return "store/storeopen"; 
	}
	
	@ResponseBody
	@RequestMapping(value="/insertstoreopen.do",  method = RequestMethod.POST, consumes = "application/json")
	public Map<String,Object> insertStoreOpen(Model model,@RequestBody StoreOpenVO vo) {
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
}

package co.yedam.cafein.store.open;

import java.util.HashMap;
import java.util.List;
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
	StoreOpenService storeOpenService;
	
	//오픈 페이지 이동
	@RequestMapping(value="/storeopen.do")
	public String getStoreOpenListForm() {
		return "store/storeopen"; 
	}
	
	//오픈할 때 INSERT 컨트롤
	@ResponseBody
	@RequestMapping(value="/insertstoreopen.do",  method = RequestMethod.POST, consumes = "application/json")
	public Map<String,Object> insertOpen(Model model,@RequestBody StoreOpenVO vo) {
		storeOpenService.insertOpen(vo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
		
	}
	
	//오픈 목록 리스트
	@ResponseBody
	@RequestMapping(value = "/getOpenList.do")
	public List<StoreOpenVO> getOpenList(Model model, StoreOpenVO vo) {
		
		return storeOpenService.getOpenList(vo);

	}
	//오픈 목록 단건검색
		@ResponseBody
		@RequestMapping(value = "/getOpen.do")
		public StoreOpenVO getOpen(Model model, StoreOpenVO vo) {
			
			return storeOpenService.getOpen(vo);

		}
}

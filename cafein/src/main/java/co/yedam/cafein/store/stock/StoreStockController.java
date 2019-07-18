package co.yedam.cafein.store.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.ConditionServiceImpl;
import co.yedam.cafein.vo.ConditionVO;
import co.yedam.cafein.vo.StockVO;

@Controller
public class StoreStockController {

	@Autowired
	StoreStockServiceImpl storeStockService;
	@Autowired
	ConditionServiceImpl conditionService;
	
	//재고목록 페이지 이동
	@RequestMapping(value = "/stocklist.do")
	public String getStockListForm(Model model, ConditionVO vo) {
		
		vo.setMasterCd("B");
		model.addAttribute("B", conditionService.getConditionDetailList(vo));
		vo.setMasterCd("CA");
		model.addAttribute("CA", conditionService.getConditionDetailList(vo));
		return "store/stocklist";
	}
	//입고 목록
	@RequestMapping(value = "/warehousingregi.do")
	public String getEnteredStockListForm(Model model, ConditionVO vo) {
		
		vo.setMasterCd("B");
		model.addAttribute("B", conditionService.getConditionDetailList(vo));
		vo.setMasterCd("CA");
		model.addAttribute("CA", conditionService.getConditionDetailList(vo));
		return "store/warehousingregi";
	}
	
	// 전체조회
	@ResponseBody
	@RequestMapping(value = "/stocks", method = RequestMethod.GET)
	public List<StockVO> getStockList(Model model, StockVO vo) {
		
		return storeStockService.getStockList(vo);

	}

	// 단건조회
	@ResponseBody
	@RequestMapping(value = "/stocks/{stNum}", method = RequestMethod.GET)
	public StockVO getStock(@PathVariable String stNum, StockVO vo, Model model) {
		vo.setStNum(stNum);
		return storeStockService.getStock(vo);
	}

	// 삭제
	@ResponseBody
	@RequestMapping(value = "/stocks", method = RequestMethod.DELETE, consumes = "application/json")
	public Map<String, Object> getStockList(@RequestBody StockVO vo, Model model) {
		storeStockService.deleteStock(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 등록
	@ResponseBody
	@RequestMapping(value = "/stocks", method = RequestMethod.POST, consumes = "application/json")
	public Map<String, Boolean> insertStock(@RequestBody StockVO vo, Model model) {
		storeStockService.insertStock(vo);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return map;
	}

	// 수정
	@ResponseBody
	@RequestMapping(value = "/stocks", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public StockVO updateStock(@RequestBody StockVO vo, Model model) {
		storeStockService.updateStock(vo);
		return vo;
	}
}

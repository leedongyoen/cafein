package co.yedam.cafein.store.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.vo.StockVO;

@RestController
public class StoreStockRestController {

	@Autowired
	StoreStockServiceImpl storeStockService;
	
//	//재고 폼
//	@RequestMapping(value = "/stockslist", method = RequestMethod.GET)
//	public String stockListForm() {
//		
//		return "store/stocklist";
//	}
	
//	@RequestMapping(value="/stocks", method=RequestMethod.GET) 
//    public ModelAndView getstocklist(ModelAndView mv){
//       StockVO vo = new StockVO();
//       mv.addObject("item",storeStockService.getStockList(vo));
//       mv.setViewName("store/stocklist");
//    
//       return mv; 
//    }
	
	
	//전체조회
		@RequestMapping(value="/stocks", method=RequestMethod.GET)
		public List<StockVO> getStockList(Model model, StockVO vo) {
			  return storeStockService.getStockList(vo);
			  
		}
		
		//단건조회
		@RequestMapping(value="/stocks/{stNum}",  method=RequestMethod.GET)
		public StockVO getStock(@PathVariable String stNum, StockVO vo, Model model) {
			vo.setStNum(stNum);
			return storeStockService.getStock(vo);
		}
		
		//삭제
		@RequestMapping(value="/stocks/{stNum}", method=RequestMethod.DELETE)
		public Map  getStockList( @PathVariable String stNum, StockVO vo, Model model) {
			vo.setStNum(stNum);
			storeStockService.deleteStock(vo);
			Map result = new HashMap<String, Object>();
			result.put("result", Boolean.TRUE);
			return result;
		}
		//등록
		@RequestMapping(value="/stocks"
				,method=RequestMethod.POST
		//		,produces="application/json"     
		 		,consumes="application/json"
//	            ,headers = {"Content-type=application/json" }
		)
		public Map<String, Boolean> insertStock(@RequestBody StockVO vo, Model model) {
			storeStockService.insertStock(vo);
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("result", true);
			return  map;
		}
		
		//수정
		@RequestMapping(value="/stocks"
				,method=RequestMethod.PUT
		//		,produces="application/json"      //응답헤더
		 		,consumes="application/json"      //요청헤더
	     //       ,headers = {"Content-type=application/json" }
		)
		public StockVO updateStock(@RequestBody StockVO vo, Model model) {
			storeStockService.updateStock(vo);
			return  vo;
		}	
	
}

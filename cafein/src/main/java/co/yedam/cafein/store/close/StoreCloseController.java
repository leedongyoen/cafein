package co.yedam.cafein.store.close;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreCloseDataInsertVO;
import co.yedam.cafein.vo.StoreOpenVO;
import co.yedam.cafein.vo.WarehousingVO;

@Controller
public class StoreCloseController {
	
	@Autowired
	StoreCloseService service;
	
	// 매장 마감 정산
	@RequestMapping("daycal.do")
	public String daycal() {
		return "store/daycal";
	}
	
	// 매장 영업 준비금 (json 형식으로 data만 넘겨준다)
	@ResponseBody
	@RequestMapping(value="/operatingreserve", method=RequestMethod.GET)
	public List<ViewWarehousingVO> getOperatingreserve(ViewWarehousingVO vo){
		return service.getWarehousing(vo);
	}
	
	// 매장 영업 준비금  (단순 페이지 이동)
	@RequestMapping("operatingreserve.do")
	public String operatingreserve() {
		return "store/operatingreserve";
	}
	
	//----------------------------------------------------------------------------
	// 마감 시재 정산
	@ResponseBody
	@RequestMapping(value="/cashadvance", method=RequestMethod.GET)
	public List<OrdersVO> getCashadvance(OrdersVO vo) {
		return service.getCashAdvance(vo);
	}
	
	// storeopen 테이블에서 기본준비금, 오픈시간을 읽어와야한다
	@ResponseBody
	@RequestMapping(value="/storeopen", method=RequestMethod.GET)
	public StoreOpenVO getStoreOpen(StoreOpenVO vo) {
		return service.getStoreOpen(vo);
	}

	// 마감 시재 정산
	@RequestMapping("cashadvance.do")
	public String cashadvance() {
		return "store/cashadvance";
	}
	
	//----------------------------------------------------------------------------
	// 마감 재고 업데이트
	@ResponseBody
	@RequestMapping(value="/stocktruthlist", method=RequestMethod.GET)
	public List<StockVO> getStockTruthList(StockVO vo) {
		return service.getStockTruthList(vo);
	}
	
	// 재고 실수량 입력
	@RequestMapping("stocktruthlist.do")
	public String stocktruthlist() {
		return "store/stocktruthlist";
	}

	//----------------------------------------------------------------------------
	// 마감 영수증을 위한 결제내역(현금/카드) 조회
	@ResponseBody
	@RequestMapping(value="/closereceiptcash", method=RequestMethod.GET)
	public List<OrdersVO> getCloseReceiptCash(OrdersVO vo) {
		return service.getCloseReceiptCash(vo);
	}
	
	// 마감 영수증을 위한 결제내역(마일리지/총매출액) 조회
	@ResponseBody
	@RequestMapping(value="/closereceiptmileage", method=RequestMethod.GET)
	public List<OrdersVO> getCloseReceiptMileage(OrdersVO vo) {
		return service.getCloseReceiptMileage(vo);
	}
	
	//----------------------------------------------------------------------------
	// 마감 정산 버튼 클릭 시 모든 데이터 insert 및 update
	@ResponseBody
	@RequestMapping(value="dateInsertUpdate.do", method=RequestMethod.POST, consumes="application/json")
	public Map<String, Object> dateInsertUpdate(@RequestBody StoreCloseDataInsertVO vo) throws JsonParseException, JsonMappingException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store", vo.getStore());
		
		service.storeCloseDataImsert(vo);
		return map;
	}

}

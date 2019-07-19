package co.yedam.cafein.store.close;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	// 마감 정산 버튼 클릭 시 모든 데이터 insert 및 update
	@SuppressWarnings("unchecked")
	@RequestMapping("dateInsertUpdate.do")
	public String dateInsertUpdate( @RequestParam String cashadvanceInsert, 
									@RequestParam String stocktruthInsert, 
									@RequestParam String operationreservInsert) throws JsonParseException, JsonMappingException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		
		// storeopen 테이블에 data를 update하기 위한 list
		List<StoreOpenVO> storeVO = (List<StoreOpenVO>) mapper.readValue(cashadvanceInsert, new TypeReference<List<StoreOpenVO>>(){});
		// 재고수량의 변경이 있을 때 stock 테이블에 재고수량과 재고상태를 update하기 위한 list
		List<StockVO> stockVO = (List<StockVO>) mapper.readValue(stocktruthInsert, new TypeReference<List<StockVO>>(){});
		// 재고수량의 변경으로 손실이 발생한 경우 warehousing 테이블에 손실량을 insert하기 위한 list
		List<WarehousingVO> warehousingLossVO = (List<WarehousingVO>) mapper.readValue(stocktruthInsert, new TypeReference<List<WarehousingVO>>(){});
		// 추가로 입고한 물품이나 재고가 있을 때 warehousing 테이블에 data를 insert하기 위한 list
		List<WarehousingVO> warehousingAddStockVO = (List<WarehousingVO>) mapper.readValue(operationreservInsert, new TypeReference<List<WarehousingVO>>(){});
		
		System.out.println("storeopen table update : " + storeVO);
		System.out.println("stock table update : " + stockVO);
		System.out.println("warehousing table insert(손실량) : " + warehousingLossVO);
		System.out.println("warehousing table insert(추가입고) : " + warehousingAddStockVO);

		// 0이 아닌 데이터를 담기위한 빈 list
		List<WarehousingVO> plusList = new ArrayList<WarehousingVO>();
		
		// warehousing insert (손실량)
		if(warehousingLossVO.size() != 0) {
			for(int i=0;i<warehousingLossVO.size();i++) {
				if(warehousingLossVO.get(i).getStLoss() != 0) {
					plusList.add(warehousingLossVO.get(i));
					System.out.println("warehousingLossVO : " + warehousingLossVO.get(i).getStLoss());
				}
			}
			if(plusList.size() != 0) {
				service.warehousingInsertLoss(plusList);
				System.out.println("warehousing table data insert seccess ! (Loss)");
			}
			
		}
		
		// warehousing insert (추가재고)
		if(warehousingAddStockVO.size() != 0) {
			System.out.println("------ warehousingAddStockVO is Not Null ! ------");
			for(int i=0;i<warehousingAddStockVO.size();i++) {
				if(warehousingAddStockVO.get(i).getStPayMethod().equals("현금")) {
					warehousingAddStockVO.get(i).setStPayMethod("cash");
				} else if(warehousingAddStockVO.get(i).getStPayMethod().equals("카드")) {
					warehousingAddStockVO.get(i).setStPayMethod("card");
				}
			}
			service.warehousingInsertAddStock(warehousingAddStockVO);
			System.out.println("warehousing table data insert seccess ! (Add Stock)");
		}
		System.out.println("------ warehousingAddStockVO is Null ! ------");
		
		// 재고 수량과 실 수량이 같지 않은 데이터를 담기위한 빈 list
		List<StockVO> plusStockList = new ArrayList<StockVO>();
		
		// stock update (재고수량, 재고상태)
		if(stockVO.size() != 0) {
			for(int i=0;i<stockVO.size();i++) {
				if(stockVO.get(i).getStQty() != stockVO.get(i).getTruthQty()) {
					System.out.println("stockVO에서 재고수량과 실 수량이 같지 않은 재고 : " + stockVO.get(i).getStName());
					
					if(stockVO.get(i).getTruthQty() > stockVO.get(i).getLackQty()) {
						stockVO.get(i).setStStatus("B1");
					} else if (stockVO.get(i).getTruthQty() == 0) {
						stockVO.get(i).setStStatus("B3");
					} else if (stockVO.get(i).getTruthQty() <= stockVO.get(i).getLackQty()) {
						stockVO.get(i).setStStatus("B2");
					} 
					System.out.println("실수량 : " + stockVO.get(i).getTruthQty());
					System.out.println("재고상태 : " + stockVO.get(i).getStStatus());
					
					plusStockList.add(stockVO.get(i));
				}
			}
			if(plusStockList.size() != 0) {
				for(int j=0;j<plusStockList.size();j++) {
					System.out.println("plusStockList : " + plusStockList.get(j).getStName());
				}
				service.stockUpdate(plusStockList);
				System.out.println("stock table data update seccess !");
			}
		}
		
		// storeopen update (오픈시간, 기본준비금 제외한 모든 데이터)
		if(storeVO.size() != 0) {
			for(int i=0;i<storeVO.size();i++) {
				System.out.println("store cash : " + storeVO.get(i).getCash());
			}
			service.storeUpdate(storeVO);
			System.out.println("storeopen table data update seccess !");
		}

		return "store/closedreceipt";
	}

}

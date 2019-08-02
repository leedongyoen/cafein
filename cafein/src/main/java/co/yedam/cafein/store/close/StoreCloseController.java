package co.yedam.cafein.store.close;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import co.yedam.cafein.common.Paging;
import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreCloseDataInsertVO;
import co.yedam.cafein.vo.StoreOpenVO;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;

@Controller
public class StoreCloseController {
	
	@Autowired
	StoreCloseService service;

	@Autowired
	BasicDataSource dataSource;
	
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
	
	// 마감 영수증을 위한 결제내역(마일리지/총매출액) 조회
	@ResponseBody
	@RequestMapping(value="/refundinfo", method=RequestMethod.GET)
	public List<OrdersVO> getRefundInfo(OrdersVO vo) {
		return service.getRefundInfo(vo);
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
	
	//----------------------------------------------------------------------------
	
	// 마감 내역 조회
	@RequestMapping("closedetails.do")
	public String storeReceipt() {
		return "store/closingdetails";
	}
	
	// 마감 내역을 알기위해 storeopen 테이블에서 오픈시간 마감시간을 가지고 온다
	@ResponseBody
	@RequestMapping(value="/closedetailslist", method=RequestMethod.GET)
	public Map<String, Object> storeReceiptList(StoreOpenVO vo) {
		Paging paging = new Paging();
		paging.setPage(vo.getCheckpagenum()); // 현재 선택된 페이지 번호를 넣음.
		paging.setPageUnit(8);
		vo.setStart(paging.getFirst());    // 화면에서 보여줄 목록 처음 번호
		vo.setEnd(paging.getLast());      // 화면에서 보여줄 목록 마지막 번호
		
		// 전체 건수 받아오기
		paging.setTotalRecord(service.storeReceiptListPaging(vo));
	    // vo - start, end로 한 페이지당 보일 목록만큼만 가져옴
	    List<StoreOpenVO> receiptList = service.storeReceiptList(vo);
	    Map<String, Object> result = new HashMap<String, Object>();
	      
	    result.put("list", receiptList);
	    result.put("paging", paging);
	      
	    return result;
	}

	
	//----------------------------------------------------------------------------
	// 현재 사용중인 웹 브라우저를 찾아낸다
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	
	// pdf 파일 저장 시 file name 설정 (한글 깨짐 방지)
	/**
	 * Disposition 지정하기. *
	 * 
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String browser = getBrowser(request);
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	

	// 마감 정산 내역 PDF 파일로 저장
	@RequestMapping("report.do")
	public void report(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Connection conn = null;
		
		try {
			
			String sId = (String) session.getAttribute("sId");
			String sName = (String) session.getAttribute("sName");
			String openTime = request.getParameter("openTime");
			//String closeTime = request.getParameter("closeTime");
			String atchFileId = openTime + " 마감내역.pdf";
			
			conn = dataSource.getConnection();

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("p_store", sId);
			map.put("p_opendate", openTime);
			map.put("p_name", sName);
			//map.put("p_closedate", closeTime);	
			
			JasperReport report = JasperCompileManager
					.compileReport(request.getSession().getServletContext().getRealPath("reports/receipt.jrxml"));
			
			// 파일 저장 시 이름 정해주기 p_opendate + 마감내역'
			//response.setContentType("application/pdf");						바로 다운로드 됨
			//response.setContentType("application/octet-stream");				웹으로 보여줌
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + openTime + "마감내역.pdf\";");
			setDisposition(atchFileId, request, response);
			
			OutputStream out = response.getOutputStream();
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, map, conn);
			JasperExportManager.exportReportToPdfStream(jasperPrint, out);
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}


}

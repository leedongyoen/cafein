package co.yedam.cafein.customer.mymenu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.MyMenuVO;

@RestController
public class CusMyMenuController {
	@Autowired
	CusMyServiceImpl cusmyService;
	CustomerOrderServiceImpl service;
	
	//나만의 메뉴 가져오기
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.GET)
			public List<ViewMymenuVO> getMymenu(ViewMymenuVO vo, HttpSession session) {
				String cId = (String)session.getAttribute("cId");
				vo.setcId(cId);
				return cusmyService.getMymenu(vo);
			}
			
	
	//나만의 메뉴 상세 옵션
			@RequestMapping(value="/mymenuop/{cuNum}",  method=RequestMethod.GET)
			public List<ViewMymenuVO> getMymenuDetail( ViewMymenuVO vo, @PathVariable("cuNum") String cuNum) {
				vo.setCuNum(cuNum);
				System.out.println(cuNum);
				return cusmyService.getMymenuDetail(vo);
			}
			
			
			
	//나만의 메뉴 삭제		
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.DELETE, consumes="application/json")
			public Map<String, String> deleteMymenu(@RequestBody MyMenuVO vo) {
				cusmyService.deleteMymenu(vo);
				return Collections.singletonMap("result", "ok");
			}
			
	//주문으로 넘어가기	
	/*
	 * @RequestMapping(value = "/customerorder", method = RequestMethod.POST) public
	 * ModelAndView customerorder(MenuOrderVO vo) { ModelAndView mv = new
	 * ModelAndView(); mv.addObject("selectmenu", vo);
	 * System.out.println("================== 주문 내역 :" + vo); mv.addObject("option",
	 * service.getorderrecipeno(vo)); mv.setViewName("customer/orderregi"); return
	 * mv; }
	 */
			//getcunum
			@ResponseBody
			@RequestMapping(value="/insertmymenu",  method=RequestMethod.PUT, consumes="application/json")
			public Boolean insertmymenu(@RequestBody MyMenuVO vo) {
				System.out.println("============================"+vo);
				MyMenuVO mymenu;
				String cuslist[] = null;
				String cus_id = vo.getcId();
				Boolean ck_cunumlist = true;
				Boolean insertck=true;
				
				if(vo.getCuNumList() == null) {
					ck_cunumlist =false;
					System.out.println("============ck_cunumlist "+ck_cunumlist);
					
				}else if(vo.getCuNumList().length >0 ) {
					cuslist = vo.getCuNumList();
				}
				
				
				// 커스텀 번호 가져오기
				String cu_num = cusmyService.getcunum();
				
				// 최종적으로 레시피 테이블에 넣을 데이터 리스트
				List<MyMenuVO> mymenulist = new ArrayList<MyMenuVO>();
				
				// 옵션이 존재여부 체크
				Boolean optioncheck=false;
				
				// 먼저, 해당 메뉴의 레시피 모두를 가져온다.
				mymenulist = cusmyService.getrecipelist(vo);
				
				// 레시피 리스트를 돌면서 옵션과 HOT/ICE에 대한 정보와 비교하여 삭제
				for(int n=0; n<mymenulist.size(); n++) {
					mymenu = mymenulist.get(n);
					mymenu.setCuNum(cu_num);
					mymenu.setcId(cus_id);
					
					// 레시피 카테고리번호가 옵션이고 옵션 리스트에 정보가 있을 경우
					if( mymenu.getCaNum().equals("CAOP")  && ck_cunumlist) {
						
						// 옵션 리스트 크기만큼 돌림
						for(int i=0; i<cuslist.length; i++) { 
							
							//만약 동일한 옵션이 존재한다면 옵션체크변수를 true로  
							if( mymenu.getStNum().equals(cuslist[i])){
								  optioncheck = true; 
							  }							  
						}
						// 만약에 옵션이 하나도 없는 상태라면
						// 옵션과 관련된 정보들은 지운다.
						if(!optioncheck) { 
							mymenulist.remove(n);
							// 리스트 속 정보가 삭제되서 없어지므로 for문 n의 수를 1줄인다.
							n-=1;
						}
						// 다시 검사를 위해 false로 초기화
						optioncheck = false; 
						
					//  옵션 리스트가 null일 경우엔 지움.
					}else if(mymenu.getCaNum().equals("CAOP") && ck_cunumlist == false) {
						mymenulist.remove(n);
						n-=1;
					}else if( mymenu.getCaNum().equals("CAIC") && mymenu.getCaNum().equals(vo.getHotice_option()) == false) {
						// ICE 카테고리가 존재하지만 고객이 선택하지 않았으므로 삭제
						mymenulist.remove(n);
						n-=1;
					}else if( mymenu.getCaNum().equals("CAHT") && mymenu.getCaNum().equals(vo.getHotice_option()) == false) {
						// HOT 카테고리가 존재하지만 고객이 선택하지 않았으므로 삭제
						mymenulist.remove(n);
						n-=1;
					}
					
					
				}
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+mymenulist);
				for(int i=0; i<mymenulist.size();i++) {
					MyMenuVO invo = mymenulist.get(i);
					int n = cusmyService.insertmymenu(invo);
					if(n == 0 ) insertck= false;
					System.out.println("========== insert result : "+n);
				}
				
				
				return insertck;
			}
			
}

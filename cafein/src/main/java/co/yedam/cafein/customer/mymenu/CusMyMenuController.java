package co.yedam.cafein.customer.mymenu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.MyMenuVO;
import co.yedam.cafein.vo.RecipeVO;

@RestController
public class CusMyMenuController {
	@Autowired
	CusMyService cusmyService;
	
	//怨좉컼 �굹留뚯쓽 硫붾돱 議고쉶
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.GET)
			public List<ViewMymenuVO> getMymenu(ViewMymenuVO vo, HttpSession session) {
				String cId = (String)session.getAttribute("cId");
				vo.setcId(cId);
				return cusmyService.getMymenu(vo);
			}
			
			
			
			
			
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.DELETE, consumes="application/json")
			public Map<String, String> deleteMymenu(@RequestBody MyMenuVO vo) {
				cusmyService.deleteMymenu(vo);
				return Collections.singletonMap("result", "ok");
			}
			
			//getcunum
			@ResponseBody
			@RequestMapping(value="/insertmymenu",  method=RequestMethod.PUT, consumes="application/json")
			public List<MyMenuVO> insertmymenu(@RequestBody MyMenuVO vo) {
				System.out.println("============================"+vo);
				MyMenuVO mymenu;
				String cuslist[] = null;
				String cus_id = vo.getcId();
				Boolean ck_cunumlist = true;
				
				if(vo.getCuNumList() == null) {
					ck_cunumlist =false;
					System.out.println("============ck_cunumlist "+ck_cunumlist);
					
				}else if(vo.getCuNumList().length >0 ) {
					cuslist = vo.getCuNumList();
				}
				
				
				String cu_num = cusmyService.getcunum();
				List<MyMenuVO> mymenulist = new ArrayList<MyMenuVO>();
				
		/*
		 * vo.setsId("SH001"); vo.setmNum("ME002");
		 */
				Boolean optioncheck=false;
				mymenulist = cusmyService.getrecipelist(vo);
				
				for(int n=0; n<mymenulist.size(); n++) {
					mymenu = mymenulist.get(n);
					mymenu.setCuNum(cu_num);
					mymenu.setcId(cus_id);
					System.out.println("==============mymenu "+mymenu);
					if(mymenu.getCaNum().equals("CAOP") && ck_cunumlist) {
						System.out.println("==============CAOP "+mymenu.getCaNum());
				
						
						for(int i=0; i<cuslist.length; i++) { 
							  if( mymenu.getStNum().equals(cuslist[i])){
								  System.out.println("=============="+mymenu.getCaNum());
								  optioncheck = true; 
								  
							  }
							  
						}
						if(!optioncheck) { 
							mymenulist.remove(n);
							n-=1;
							System.out.println("=============="+optioncheck);
						}
						optioncheck = false; 
						
					}else if(mymenu.getCaNum().equals("CAOP") && ck_cunumlist == false) {
						System.out.println("======= false option" + mymenu);
						mymenulist.remove(n);
						n-=1;
					}
					
					
				}
				System.out.println("============================"+mymenulist);
						
				
				
				return mymenulist;
			}
			
}

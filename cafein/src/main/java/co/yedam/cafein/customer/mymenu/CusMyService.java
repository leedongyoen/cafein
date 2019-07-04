package co.yedam.cafein.customer.mymenu;

import java.util.List;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MyMenuVO;

public interface CusMyService {
	
	 List<ViewMymenuVO> getMymenu(ViewMymenuVO vo);
	 
	 void insertMymenu(MyMenuVO vo);
	 
	 void updateMymenu(MyMenuVO vo);
	 
	 void deleteMymenu(MyMenuVO vo);
	 

}

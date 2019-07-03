package co.yedam.cafein.customer.mymenu;

import co.yedam.cafein.vo.MyMenuVO;

public interface CusMyService {
	
	 MyMenuVO getMymenu(MyMenuVO vo);
	 
	 void insertMymenu(MyMenuVO vo);
	 
	 void updateMymenu(MyMenuVO vo);
	 
	 void deleteMymenu(MyMenuVO vo);
	 

}

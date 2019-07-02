package co.yedam.cafein.customer.mymenu;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MyMenuVO;

@Service("CusMyService")
public class CusMyServiceImpl implements CusMyService{
	@Resource(name="cusMyDAO")
	private CusMyDAO DAO;
	public MyMenuVO getMymenu(MyMenuVO vo) {
		return DAO.getMymenu(vo);
	}


}

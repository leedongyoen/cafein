package co.yedam.cafein.customer.mymenu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MyMenuVO;
import co.yedam.cafein.vo.RecipeVO;

@Service("CusMyService")
public class CusMyServiceImpl implements CusMyService{
	
	@Resource(name="cusMyDAO")
	private CusMyDAO DAO;
	
	
	public List<ViewMymenuVO> getMymenu(ViewMymenuVO vo) {
		return DAO.getMymenu(vo);
	}
	
	public List<ViewMymenuVO> getMymenuDetail(ViewMymenuVO vo) {
		return DAO.getMymenuDetail(vo);
	}
	
	public void insertMymenu(MyMenuVO vo) {
		//DAO.inserMymenu(vo);
	}
	
	public void deleteMymenu(MyMenuVO vo) {
		 DAO.deleteMymenu(vo);
	}

	@Override
	public String getcunum() {
		
		return DAO.getcunum();
	}

	@Override
	public List<MyMenuVO> getrecipelist(MyMenuVO vo) {
		
		return DAO.getrecipelist(vo);
	}

	@Override
	public int insertmymenu(MyMenuVO vo) {
		return DAO.insertmymenu(vo);
	}

	
	
	


}

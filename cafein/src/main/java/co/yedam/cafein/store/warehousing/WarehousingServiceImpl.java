package co.yedam.cafein.store.warehousing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.WarehousingVO;
@Service
public class WarehousingServiceImpl implements WarehousingService{

	@Autowired
	WarehousingDAO wareDao;

	@Override
	public List<WarehousingVO> getWarehousingList(WarehousingVO vo) {
		// TODO Auto-generated method stub
		return wareDao.getWarehousingList(vo);
	}
	@Override
	public List<WarehousingVO> getReleasedList(WarehousingVO vo) {
		// TODO Auto-generated method stub
		return wareDao.getReleasedList(vo);
	}
	@Override
	public List<WarehousingVO> getEnteredList(WarehousingVO vo) {
		// TODO Auto-generated method stub
		return wareDao.getEndteredList(vo);
	}
	@Override
	public int insertEnter(WarehousingVO vo) {
		
		return wareDao.insertEnter(vo);
	}
	@Override
	public List<WarehousingVO> getWarehousing(WarehousingVO vo) {
		return wareDao.getWarehousing(vo);
	}
	

}

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
	public List<WarehousingVO> getWareList(WarehousingVO vo) {
		
		return wareDao.getWarehousingList(vo);
	}

}

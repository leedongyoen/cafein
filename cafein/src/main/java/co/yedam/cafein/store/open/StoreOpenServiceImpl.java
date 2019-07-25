package co.yedam.cafein.store.open;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreOpenVO;

@Service
public class StoreOpenServiceImpl implements StoreOpenService {

	@Autowired
	StoreOpenDAO storeOpenDAO;
	
	@Override
	public int insertOpen(StoreOpenVO vo) {
		
		return storeOpenDAO.insertOpen(vo);
	}

	@Override
	public List<StoreOpenVO> getOpenList(StoreOpenVO vo) {
		
		return storeOpenDAO.getStoreOpenList(vo);
	}

	@Override
	public StoreOpenVO getOpen(StoreOpenVO vo) {
		return storeOpenDAO.getOpen(vo);
	}

	@Override
	public int checkOpen(StoreOpenVO vo) {
		return storeOpenDAO.checkOpen(vo);
	}
	
}

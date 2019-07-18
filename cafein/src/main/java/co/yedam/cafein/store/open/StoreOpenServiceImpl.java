package co.yedam.cafein.store.open;

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

	
}

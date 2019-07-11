package co.yedam.cafein.store.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreVO;

@Service
public class StoreInfoServiceImpl implements StoreInfoService{
	@Autowired
	StoreInfoDAO StoreDAO;
	
	//매장 단건조회
	@Override
	public StoreVO getStore(StoreVO vo) {
		return StoreDAO.getStore(vo);
	}
	//매장 정보수정
	@Override
	public int infoedit(StoreVO vo) {
		return StoreDAO.infoedit(vo);
	}
	
	//비밀번호변경
	@Override
	public int checkpw(StoreVO vo) {
		return StoreDAO.checkpw(vo);
	} 

}

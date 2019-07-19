package co.yedam.cafein.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreVO;

@Service
public class AdminStoreServiceImpl implements AdminStoreService{

	@Autowired
	AdminStoreDAO adminstoreDao;
	@Override
	public List<StoreVO> StoreList(StoreVO vo) {
		return adminstoreDao.StoreList(vo);
	}
	@Override
	public List<StoreVO> StorePermissionList(StoreVO vo) {
		return adminstoreDao.StorePermissionList(vo);
	}
	@Override
	public int updatePermission(List<String> list) {
		for(String sid : list) {
			StoreVO vo = new StoreVO();
			vo.setSid(sid);
			adminstoreDao.updatePermission(vo);
		}
		return 0;
	}
	

}

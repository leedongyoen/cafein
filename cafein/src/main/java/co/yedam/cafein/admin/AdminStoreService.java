package co.yedam.cafein.admin;

import java.util.List;

import co.yedam.cafein.vo.StoreVO;

public interface AdminStoreService {
	
	public List<StoreVO> StoreList(StoreVO vo);

	public List<StoreVO> StorePermissionList(StoreVO vo);

	public int updatePermission(List<String> sid);


}

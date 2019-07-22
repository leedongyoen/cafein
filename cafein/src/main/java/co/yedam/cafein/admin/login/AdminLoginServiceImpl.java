package co.yedam.cafein.admin.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.AdminVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	AdminLoginDAO adminLoginDAO;
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
	
		return adminLoginDAO.getAdmin(vo);
	}

}

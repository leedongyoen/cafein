package co.yedam.cafein.admin.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.AdminVO;
@Repository
public class AdminLoginDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO getAdmin(AdminVO vo) {
		return mybatis.selectOne("adminLoginMampper.getAdmin", vo);
	}
	
}

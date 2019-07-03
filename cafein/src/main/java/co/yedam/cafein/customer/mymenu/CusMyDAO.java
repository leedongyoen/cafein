package co.yedam.cafein.customer.mymenu;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MyMenuVO;

@Repository
public class CusMyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
//	private static final String mymenu = "mapper.mymenuMapper";
	
	//한 고객의 나만의 메뉴 조회
	public MyMenuVO getMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis getMymenu()");
		return mybatis.selectOne("CusMyDAO.getMymenu", vo);
	}
	
	//나만의 메뉴 입력
	
	public void inserMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis inserMymenu()");
		mybatis.insert("CusMyDAO.insertBoard", vo);
	}
	
	public void deleteMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis deleteMymenu()");
		mybatis.update("CusMyDAO.deleteMymenu", vo);
	}
	
	public void updateMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis updateMymenu()");
		mybatis.update("CusMyDAO.updateMymenu", vo);
	}


	
	
}

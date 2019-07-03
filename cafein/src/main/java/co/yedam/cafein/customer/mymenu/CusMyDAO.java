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
	
	//
	public MyMenuVO getMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis getMymenu()");
		return mybatis.selectOne("CusMyDAO.getMymenu", vo);
	}
	
	/*
	 * //������ �޴� �Է�
	 * 
	 * public void inserMymenu(MyMenuVO vo) {
	 * System.out.println("===> Mybatis inserMymenu()");
	 * mybatis.insert("MymenuDAO.insertBoard", vo); }
	 * 
	 * public void deleteMymenu(MyMenuVO vo) {
	 * System.out.println("===> Mybatis deleteMymenu()");
	 * mybatis.update("MymenuDAO.deleteMymenu", vo); }
	 * 
	 * public void updateMymenu(MyMenuVO vo) {
	 * System.out.println("===> Mybatis updateMymenu()");
	 * mybatis.update("MymenuDAO.updateMymenu", vo); }
	 */


	
	
}

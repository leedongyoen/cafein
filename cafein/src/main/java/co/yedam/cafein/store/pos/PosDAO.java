package co.yedam.cafein.store.pos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.RecipeVO;

@Repository
public class PosDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	//메뉴뿌리기
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo){
		System.out.println("===> Mybatis getStoreMenuList()");
		return mybatis.selectList("PosDAO.getStoreMenuList", vo);
	}
	//옵션선택
	public List<RecipeVO> getOptionList(RecipeVO vo){
		System.out.println("===> Mybatis getOptionList()");
		return mybatis.selectList("PosDAO.getOptionList", vo);
	}
	//고객조회
	public List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo) {
		System.out.println("===> Mybatis getCus()");
		return mybatis.selectList("PosDAO.getCusList", vo);
	}
}

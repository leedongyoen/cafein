package co.yedam.cafein.vo;

public class CategoryVO {

	private String caNum;
	private String caType;
	
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getCaType() {
		return caType;
	}
	public void setCaType(String caType) {
		this.caType = caType;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [caNum=" + caNum + ", caType=" + caType + "]";
	}
	
	
}

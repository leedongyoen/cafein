package co.yedam.cafein.vo;

public class MyMenuVO {
	
	private String myNum;
	private String cId;
	private String mNum;
	private String cuNum;

	public String getMyNum() {
		return myNum;
	}
	public void setMyNum(String myNum) {
		this.myNum = myNum;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getCuNum() {
		return cuNum;
	}
	public void setCuNum(String cuNum) {
		this.cuNum = cuNum;
	}
	@Override
	public String toString() {
		return "MyMenuVO [myNum=" + myNum + ", cId=" + cId + ", mNum=" + mNum + ", cuNum=" + cuNum + "]";
	}
	
	

}

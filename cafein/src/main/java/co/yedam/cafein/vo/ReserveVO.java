package co.yedam.cafein.vo;

public class ReserveVO {

	private int mileNum;
	private int mileAge;
	private String sId;
	private String cId;
	public int getMileNum() {
		return mileNum;
	}
	public void setMileNum(int mileNum) {
		this.mileNum = mileNum;
	}
	public int getMileAge() {
		return mileAge;
	}
	public void setMileAge(int mileAge) {
		this.mileAge = mileAge;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	@Override
	public String toString() {
		return "ReserveVO [mileNum=" + mileNum + ", mileAge=" + mileAge + ", sId=" + sId + ", cId=" + cId + "]";
	}
	
	
}

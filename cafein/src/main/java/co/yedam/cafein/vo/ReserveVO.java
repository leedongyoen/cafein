package co.yedam.cafein.vo;

import java.sql.Timestamp;

public class ReserveVO {

	private int mileNum;
	private int mileAge;
	private String sId;
	private String cId;
	private String sName;
	private Timestamp oDate;
	// Alias 쓸 VO
	private String dates;
	private String totalre;
	private String usere;

	public String getTotalre() {
		return totalre;
	}

	public void setTotalre(String totalre) {
		this.totalre = totalre;
	}

	public String getUsere() {
		return usere;
	}

	public void setUsere(String usere) {
		this.usere = usere;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

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

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Timestamp getoDate() {
		return oDate;
	}

	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}

	@Override
	public String toString() {
		return "ReserveVO [mileNum=" + mileNum + ", mileAge=" + mileAge + ", sId=" + sId + ", cId=" + cId + ", sName="
				+ sName + ", oDate=" + oDate + ", dates=" + dates + ", totalre=" + totalre + ", usere=" + usere + "]";
	}

}

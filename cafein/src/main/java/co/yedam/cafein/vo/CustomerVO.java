package co.yedam.cafein.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CustomerVO {
	
	private String cId;				//아이디
	private String cNick;			//닉네임
	private String cTel;			//번호
	private String cName;
	private String cPw;
	private int pPoint;
	private String grade;
	private String cAdd;
	private String cAdd2;
	private String cAdd3;
	private int stmp;
	private String email;
	
	// 마일리지 조인
	private String mileage;
	private String sId;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@JsonFormat(pattern = "yyyy-MM-dd")			//날짜형식 포맷
	private Date dob;
	private String cJoin;
	
	
	
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcNick() {
		return cNick;
	}
	public void setcNick(String cNick) {
		this.cNick = cNick;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPw() {
		return cPw;
	}
	public void setcPw(String cPw) {
		this.cPw = cPw;
	}
	public int getpPoint() {
		return pPoint;
	}
	public void setpPoint(int pPoint) {
		this.pPoint = pPoint;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getcAdd() {
		return cAdd;
	}
	public void setcAdd(String cAdd) {
		this.cAdd = cAdd;
	}
	public String getcAdd2() {
		return cAdd2;
	}
	public void setcAdd2(String cAdd2) {
		this.cAdd2 = cAdd2;
	}
	public String getcAdd3() {
		return cAdd3;
	}
	public void setcAdd3(String cAdd3) {
		this.cAdd3 = cAdd3;
	}
	public int getStmp() {
		return stmp;
	}
	public void setStmp(int stmp) {
		this.stmp = stmp;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getcJoin() {
		return cJoin;
	}
	public void setcJoin(String cJoin) {
		this.cJoin = cJoin;
	}
	@Override
	public String toString() {
		return "CustomerVO [cId=" + cId + ", cNick=" + cNick + ", cTel=" + cTel + ", cName=" + cName + ", cPw=" + cPw
				+ ", pPoint=" + pPoint + ", grade=" + grade + ", cAdd=" + cAdd + ", cAdd2=" + cAdd2 + ", cAdd3=" + cAdd3
				+ ", stmp=" + stmp + ", mileage=" + mileage + ", sId=" + sId + ", dob=" + dob + ", cJoin=" + cJoin
				+ "]";
	}
	
	
}

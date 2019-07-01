package co.yedam.cafein.vo;

import java.util.Date;

public class CustomerVO {
	
	private String cId;
	private String cNick;
	private String cTel;
	private String cName;
	private String cPw;
	private int pPoint;
	private String grade;
	private String cAdd;
	private int stmp;
	private Date dob;
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
	@Override
	public String toString() {
		return "CustomerVO [cId=" + cId + ", cNick=" + cNick + ", cTel=" + cTel + ", cName=" + cName + ", cPw=" + cPw
				+ ", pPoint=" + pPoint + ", grade=" + grade + ", cAdd=" + cAdd + ", stmp=" + stmp + ", dob=" + dob
				+ "]";
	}
	
	
	
	
	
}
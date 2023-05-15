package semi.project.jsnr.jibsa.model.vo;

import java.sql.Date;

public class Jibsa {
	private int memberNo;
	private String memberName;
	private String jibsaGender;
	private int jibsaRrn;
	private String isSmoking;
	private String workCareer;
	private String availableHour;
	private String availableArea;
	private String motive;
	private int exptectedSalary;
	private String chatAddress;
	private String isPrimium;
	private Date primiumPaymentDate;
	private Date primiumEndDate;
	private String isTrainer;
	private String isJibsa;

	public Jibsa() {}

	public Jibsa(int memberNo, String memberName, String jibsaGender, int jibsaRrn, String isSmoking, String workCareer,
			String availableHour, String availableArea, String motive, int exptectedSalary, String chatAddress,
			String isPrimium, Date primiumPaymentDate, Date primiumEndDate, String isTrainer, String isJibsa) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.jibsaGender = jibsaGender;
		this.jibsaRrn = jibsaRrn;
		this.isSmoking = isSmoking;
		this.workCareer = workCareer;
		this.availableHour = availableHour;
		this.availableArea = availableArea;
		this.motive = motive;
		this.exptectedSalary = exptectedSalary;
		this.chatAddress = chatAddress;
		this.isPrimium = isPrimium;
		this.primiumPaymentDate = primiumPaymentDate;
		this.primiumEndDate = primiumEndDate;
		this.isTrainer = isTrainer;
		this.isJibsa = isJibsa;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getJibsaGender() {
		return jibsaGender;
	}


	public void setJibsaGender(String jibsaGender) {
		this.jibsaGender = jibsaGender;
	}


	public int getJibsaRrn() {
		return jibsaRrn;
	}


	public void setJibsaRrn(int jibsaRrn) {
		this.jibsaRrn = jibsaRrn;
	}


	public String getIsSmoking() {
		return isSmoking;
	}


	public void setIsSmoking(String isSmoking) {
		this.isSmoking = isSmoking;
	}


	public String getWorkCareer() {
		return workCareer;
	}


	public void setWorkCareer(String workCareer) {
		this.workCareer = workCareer;
	}


	public String getAvailableHour() {
		return availableHour;
	}


	public void setAvailableHour(String availableHour) {
		this.availableHour = availableHour;
	}


	public String getAvailableArea() {
		return availableArea;
	}


	public void setAvailableArea(String availableArea) {
		this.availableArea = availableArea;
	}


	public String getMotive() {
		return motive;
	}


	public void setMotive(String motive) {
		this.motive = motive;
	}


	public int getExptectedSalary() {
		return exptectedSalary;
	}


	public void setExptectedSalary(int exptectedSalary) {
		this.exptectedSalary = exptectedSalary;
	}


	public String getChatAddress() {
		return chatAddress;
	}


	public void setChatAddress(String chatAddress) {
		this.chatAddress = chatAddress;
	}


	public String getIsPrimium() {
		return isPrimium;
	}


	public void setIsPrimium(String isPrimium) {
		this.isPrimium = isPrimium;
	}


	public Date getPrimiumPaymentDate() {
		return primiumPaymentDate;
	}


	public void setPrimiumPaymentDate(Date primiumPaymentDate) {
		this.primiumPaymentDate = primiumPaymentDate;
	}


	public Date getPrimiumEndDate() {
		return primiumEndDate;
	}


	public void setPrimiumEndDate(Date primiumEndDate) {
		this.primiumEndDate = primiumEndDate;
	}


	public String getIsTrainer() {
		return isTrainer;
	}


	public void setIsTrainer(String isTrainer) {
		this.isTrainer = isTrainer;
	}


	public String getIsJibsa() {
		return isJibsa;
	}


	public void setIsJibsa(String isJibsa) {
		this.isJibsa = isJibsa;
	}


	@Override
	public String toString() {
		return "Jibsa [memberNo=" + memberNo + ", memberName=" + memberName + ", jibsaGender=" + jibsaGender
				+ ", jibsaRrn=" + jibsaRrn + ", isSmoking=" + isSmoking + ", workCareer=" + workCareer
				+ ", availableHour=" + availableHour + ", availableArea=" + availableArea + ", motive=" + motive
				+ ", exptectedSalary=" + exptectedSalary + ", chatAddress=" + chatAddress + ", isPrimium=" + isPrimium
				+ ", primiumPaymentDate=" + primiumPaymentDate + ", primiumEndDate=" + primiumEndDate + ", isTrainer="
				+ isTrainer + ", isJibsa=" + isJibsa + "]";
	}



}



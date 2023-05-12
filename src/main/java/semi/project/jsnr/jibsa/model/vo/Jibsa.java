package semi.project.jsnr.jibsa.model.vo;

import java.sql.Date;

public class Jibsa {
	private int memberNo;
	private String jibsaGender;
	private int jibsaRrn;
	private String isSmoking;
	private int workCount;
	private String workCareer;
	private String vehicle;
	private String availableHour;
	private int availableTime;
	private String availableArea;
	private String motive;
	private int exptectedSalary;
	private String isPrivacy;
	private String isTrue;
	private String charAddress;
	private String isPrimium;
	private Date primiumPaymentDate;
	private String isTrainer;
	
	public Jibsa(int memberNo, String jibsaGender, int jibsaRrn, String isSmoking, int workCount, String workCareer,
			String vehicle, String availableHour, int availableTime, String availableArea, String motive,
			int exptectedSalary, String isPrivacy, String isTrue, String charAddress, String isPrimium,
			Date primiumPaymentDate, String isTrainer) {
		super();
		this.memberNo = memberNo;
		this.jibsaGender = jibsaGender;
		this.jibsaRrn = jibsaRrn;
		this.isSmoking = isSmoking;
		this.workCount = workCount;
		this.workCareer = workCareer;
		this.vehicle = vehicle;
		this.availableHour = availableHour;
		this.availableTime = availableTime;
		this.availableArea = availableArea;
		this.motive = motive;
		this.exptectedSalary = exptectedSalary;
		this.isPrivacy = isPrivacy;
		this.isTrue = isTrue;
		this.charAddress = charAddress;
		this.isPrimium = isPrimium;
		this.primiumPaymentDate = primiumPaymentDate;
		this.isTrainer = isTrainer;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public int getWorkCount() {
		return workCount;
	}

	public void setWorkCount(int workCount) {
		this.workCount = workCount;
	}

	public String getWorkCareer() {
		return workCareer;
	}

	public void setWorkCareer(String workCareer) {
		this.workCareer = workCareer;
	}

	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getAvailableHour() {
		return availableHour;
	}

	public void setAvailableHour(String availableHour) {
		this.availableHour = availableHour;
	}

	public int getAvailableTime() {
		return availableTime;
	}

	public void setAvailableTime(int availableTime) {
		this.availableTime = availableTime;
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

	public String getIsPrivacy() {
		return isPrivacy;
	}

	public void setIsPrivacy(String isPrivacy) {
		this.isPrivacy = isPrivacy;
	}

	public String getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(String isTrue) {
		this.isTrue = isTrue;
	}

	public String getCharAddress() {
		return charAddress;
	}

	public void setCharAddress(String charAddress) {
		this.charAddress = charAddress;
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

	public String getIsTrainer() {
		return isTrainer;
	}

	public void setIsTrainer(String isTrainer) {
		this.isTrainer = isTrainer;
	}

	@Override
	public String toString() {
		return "Jibsa [memberNo=" + memberNo + ", jibsaGender=" + jibsaGender + ", jibsaRrn=" + jibsaRrn
				+ ", isSmoking=" + isSmoking + ", workCount=" + workCount + ", workCareer=" + workCareer + ", vehicle="
				+ vehicle + ", availableHour=" + availableHour + ", availableTime=" + availableTime + ", availableArea="
				+ availableArea + ", motive=" + motive + ", exptectedSalary=" + exptectedSalary + ", isPrivacy="
				+ isPrivacy + ", isTrue=" + isTrue + ", charAddress=" + charAddress + ", isPrimium=" + isPrimium
				+ ", primiumPaymentDate=" + primiumPaymentDate + ", isTrainer=" + isTrainer + "]";
	}
}



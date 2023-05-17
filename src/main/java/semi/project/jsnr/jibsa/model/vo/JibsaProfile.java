package semi.project.jsnr.jibsa.model.vo;

import java.util.Arrays;

public class JibsaProfile {
	private int memberNo;
	private String jibsaName;
	private String profileTitle;
	private String profileTag;
	private double jibsaAvgRating;
	private String availableHour;
	private int[] availableHourArr;
	private String availableArea;
	private int exptectedSalary;
//	private int workCount;	보류
	
//	활동 지역 		availableArea
//	시간당 금액		exptectedSalary
//	매칭 횟수		workCount
	
	public JibsaProfile() {}
	
	
	public JibsaProfile(int memberNo, String jibsaName, String profileTitle, String profileTag, double jibsaAvgRating,
			String availableHour, int[] availableHourArr, String availableArea, int exptectedSalary) {
		super();
		this.memberNo = memberNo;
		this.jibsaName = jibsaName;
		this.profileTitle = profileTitle;
		this.profileTag = profileTag;
		this.jibsaAvgRating = jibsaAvgRating;
		this.availableHour = availableHour;
		this.availableHourArr = availableHourArr;
		this.availableArea = availableArea;
		this.exptectedSalary = exptectedSalary;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getJibsaName() {
		return jibsaName;
	}


	public void setJibsaName(String jibsaName) {
		this.jibsaName = jibsaName;
	}


	public String getProfileTitle() {
		return profileTitle;
	}


	public void setProfileTitle(String profileTitle) {
		this.profileTitle = profileTitle;
	}


	public String getProfileTag() {
		return profileTag;
	}


	public void setProfileTag(String profileTag) {
		this.profileTag = profileTag;
	}


	public double getJibsaAvgRating() {
		return jibsaAvgRating;
	}


	public void setJibsaAvgRating(double jibsaAvgRating) {
		this.jibsaAvgRating = jibsaAvgRating;
	}


	public String getAvailableHour() {
		return availableHour;
	}


	public void setAvailableHour(String availableHour) {
		this.availableHour = availableHour;
	}


	public int[] getAvailableHourArr() {
		return availableHourArr;
	}


	public void setAvailableHourArr(int[] availableHourArr) {
		this.availableHourArr = availableHourArr;
	}


	public String getAvailableArea() {
		return availableArea;
	}


	public void setAvailableArea(String availableArea) {
		this.availableArea = availableArea;
	}


	public int getExptectedSalary() {
		return exptectedSalary;
	}


	public void setExptectedSalary(int exptectedSalary) {
		this.exptectedSalary = exptectedSalary;
	}


	@Override
	public String toString() {
		return "JibsaProfile [memberNo=" + memberNo + ", jibsaName=" + jibsaName + ", profileTitle=" + profileTitle
				+ ", profileTag=" + profileTag + ", jibsaAvgRating=" + jibsaAvgRating + ", availableHour="
				+ availableHour + ", availableHourArr=" + Arrays.toString(availableHourArr) + ", availableArea="
				+ availableArea + ", exptectedSalary=" + exptectedSalary + "]";
	}
		
	
	
	
}

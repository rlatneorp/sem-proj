package semi.project.jsnr.jibsa.model.vo;

public class JibsaProfile {
	private int memberNo;
	private String jibsaName;
	private String profileTitle;
	private String profileTag;
	private double jibsaAvgRating;
	private String availableArea;
	private int exptectedSalary;
	private int workCount;
	
//	활동 지역 		availableArea
//	시간당 금액		exptectedSalary
//	매칭 횟수		workCount
	
	
	public JibsaProfile() {}

	public JibsaProfile(int memberNo, String jibsaName, String profileTitle, String profileTag, double jibsaAvgRating,
			String availableArea, int exptectedSalary, int workCount) {
		super();
		this.memberNo = memberNo;
		this.jibsaName = jibsaName;
		this.profileTitle = profileTitle;
		this.profileTag = profileTag;
		this.jibsaAvgRating = jibsaAvgRating;
		this.availableArea = availableArea;
		this.exptectedSalary = exptectedSalary;
		this.workCount = workCount;
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

	public int getWorkCount() {
		return workCount;
	}

	public void setWorkCount(int workCount) {
		this.workCount = workCount;
	}

	@Override
	public String toString() {
		return "JibsaProfile [memberNo=" + memberNo + ", jibsaName=" + jibsaName + ", profileTitle=" + profileTitle
				+ ", profileTag=" + profileTag + ", jibsaAvgRating=" + jibsaAvgRating + ", availableArea="
				+ availableArea + ", exptectedSalary=" + exptectedSalary + ", workCount=" + workCount + "]";
	}
	
}

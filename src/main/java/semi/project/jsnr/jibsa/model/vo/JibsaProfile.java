package semi.project.jsnr.jibsa.model.vo;

import java.util.Arrays;

import semi.project.jsnr.animal.model.vo.Image;

public class JibsaProfile {
	private int memberNo;
	private String jibsaName;
	private String profileTitle;
	private String profileTag;
	private double jibsaAvgRating;
	private String availableHour;
	private String[] availableHourArr;
	private String availableArea;
	private int expectedSalary;
	private Image image;
	
	public JibsaProfile() {}

	public JibsaProfile(int memberNo, String jibsaName, String profileTitle, String profileTag, double jibsaAvgRating,
			String availableHour, String[] availableHourArr, String availableArea, int expectedSalary, Image image) {
		super();
		this.memberNo = memberNo;
		this.jibsaName = jibsaName;
		this.profileTitle = profileTitle;
		this.profileTag = profileTag;
		this.jibsaAvgRating = jibsaAvgRating;
		this.availableHour = availableHour;
		this.availableHourArr = availableHourArr;
		this.availableArea = availableArea;
		this.expectedSalary = expectedSalary;
		this.image = image;
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

	public String[] getAvailableHourArr() {
		return availableHourArr;
	}

	public void setAvailableHourArr(String[] availableHourArr) {
		this.availableHourArr = availableHourArr;
	}

	public String getAvailableArea() {
		return availableArea;
	}

	public void setAvailableArea(String availableArea) {
		this.availableArea = availableArea;
	}

	public int getExpectedSalary() {
		return expectedSalary;
	}

	public void setExpectedSalary(int expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "JibsaProfile [memberNo=" + memberNo + ", jibsaName=" + jibsaName + ", profileTitle=" + profileTitle
				+ ", profileTag=" + profileTag + ", jibsaAvgRating=" + jibsaAvgRating + ", availableHour="
				+ availableHour + ", availableHourArr=" + Arrays.toString(availableHourArr) + ", availableArea="
				+ availableArea + ", expectedSalary=" + expectedSalary + ", image=" + image + "]";
	}

		
}

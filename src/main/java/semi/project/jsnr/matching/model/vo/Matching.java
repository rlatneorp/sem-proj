package semi.project.jsnr.matching.model.vo;

public class Matching {
	private int matchingNo;
	private int animalNo;
	private int memberNo;
	private int jibsaNo;
	private String startDate;
	private String endDate;
	private String animalKind;
	private String serviceType;
	private String wantJibsaGender;
	private String wantMatchingPlace;
	private String matchingPlace;
	private String reviewContent;
	private String matchingStatus;
	
	public Matching() {}

	public Matching(int matchingNo, int animalNo, int memberNo, int jibsaNo, String startDate, String endDate,
			String animalKind, String serviceType, String wantJibsaGender, String wantMatchingPlace,
			String matchingPlace, String reviewContent, String matchingStatus) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.memberNo = memberNo;
		this.jibsaNo = jibsaNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.animalKind = animalKind;
		this.serviceType = serviceType;
		this.wantJibsaGender = wantJibsaGender;
		this.wantMatchingPlace = wantMatchingPlace;
		this.matchingPlace = matchingPlace;
		this.reviewContent = reviewContent;
		this.matchingStatus = matchingStatus;
	}

	public int getMatchingNo() {
		return matchingNo;
	}

	public void setMatchingNo(int matchingNo) {
		this.matchingNo = matchingNo;
	}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getJibsaNo() {
		return jibsaNo;
	}

	public void setJibsaNo(int jibsaNo) {
		this.jibsaNo = jibsaNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAnimalKind() {
		return animalKind;
	}

	public void setAnimalKind(String animalKind) {
		this.animalKind = animalKind;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getWantJibsaGender() {
		return wantJibsaGender;
	}

	public void setWantJibsaGender(String wantJibsaGender) {
		this.wantJibsaGender = wantJibsaGender;
	}

	public String getWantMatchingPlace() {
		return wantMatchingPlace;
	}

	public void setWantMatchingPlace(String wantMatchingPlace) {
		this.wantMatchingPlace = wantMatchingPlace;
	}

	public String getMatchingPlace() {
		return matchingPlace;
	}

	public void setMatchingPlace(String matchingPlace) {
		this.matchingPlace = matchingPlace;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getMatchingStatus() {
		return matchingStatus;
	}

	public void setMatchingStatus(String matchingStatus) {
		this.matchingStatus = matchingStatus;
	}

	@Override
	public String toString() {
		return "Matching [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", memberNo=" + memberNo + ", jibsaNo="
				+ jibsaNo + ", startDate=" + startDate + ", endDate=" + endDate + ", animalKind=" + animalKind
				+ ", serviceType=" + serviceType + ", wantJibsaGender=" + wantJibsaGender + ", wantMatchingPlace="
				+ wantMatchingPlace + ", matchingPlace=" + matchingPlace + ", reviewContent=" + reviewContent
				+ ", matchingStatus=" + matchingStatus + "]";
	}

}

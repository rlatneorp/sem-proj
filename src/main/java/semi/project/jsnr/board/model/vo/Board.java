package semi.project.jsnr.board.model.vo;

public class Board {
	private int matchingNo;
	private int animalNo;
	private String animalName;
	private String animalKind;
	private String startDate;
	private String endDate;
	private String matchingPlace;
	private String reviewContent;
	private Double reviewRating;
	private int reviewCount;
	private String jibsaComment;
	private String memberName;
	private int memberNo;
	private String jibsaName;
	private String isJibsa;
	private String matchingStatus;
	private String reviewStatus;
	private int jibsaNo;
	private int jibsaAvgRating;
	private String serviceType;
	
	public Board() {}

	public Board(int matchingNo, int animalNo, String animalName, String animalKind, String startDate, String endDate,
			String matchingPlace, String reviewContent, Double reviewRating, int reviewCount, String jibsaComment,
			String memberName, int memberNo, String jibsaName, String isJibsa, String matchingStatus,
			String reviewStatus, int jibsaNo, int jibsaAvgRating,String serviceType) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.animalName = animalName;
		this.animalKind = animalKind;
		this.startDate = startDate;
		this.endDate = endDate;
		this.matchingPlace = matchingPlace;
		this.reviewContent = reviewContent;
		this.reviewRating = reviewRating;
		this.reviewCount = reviewCount;
		this.jibsaComment = jibsaComment;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.jibsaName = jibsaName;
		this.isJibsa = isJibsa;
		this.matchingStatus = matchingStatus;
		this.reviewStatus = reviewStatus;
		this.jibsaNo = jibsaNo;
		this.jibsaAvgRating = jibsaAvgRating;
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

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public String getAnimalKind() {
		return animalKind;
	}

	public void setAnimalKind(String animalKind) {
		this.animalKind = animalKind;
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

	public Double getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(Double reviewRating) {
		this.reviewRating = reviewRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getJibsaComment() {
		return jibsaComment;
	}

	public void setJibsaComment(String jibsaComment) {
		this.jibsaComment = jibsaComment;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getIsJibsa() {
		return isJibsa;
	}

	public void setIsJibsa(String isJibsa) {
		this.isJibsa = isJibsa;
	}

	public String getMatchingStatus() {
		return matchingStatus;
	}

	public void setMatchingStatus(String matchingStatus) {
		this.matchingStatus = matchingStatus;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public int getJibsaNo() {
		return jibsaNo;
	}

	public void setJibsaNo(int jibsaNo) {
		this.jibsaNo = jibsaNo;
	}

	public int getJibsaAvgRating() {
		return jibsaAvgRating;
	}

	public void setJibsaAvgRating(int jibsaAvgRating) {
		this.jibsaAvgRating = jibsaAvgRating;
	}	
	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	@Override
	public String toString() {
		return "Board [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", animalName=" + animalName
				+ ", animalKind=" + animalKind + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", matchingPlace=" + matchingPlace + ", reviewContent=" + reviewContent + ", reviewRating="
				+ reviewRating + ", reviewCount=" + reviewCount + ", jibsaComment=" + jibsaComment + ", memberName="
				+ memberName + ", memberNo=" + memberNo + ", jibsaName=" + jibsaName + ", isJibsa=" + isJibsa
				+ ", matchingStatus=" + matchingStatus + ", reviewStatus=" + reviewStatus + ", jibsaNo=" + jibsaNo
				+ ", jibsaAvgRating=" + jibsaAvgRating + "]"
				+ ", serviceType=" + serviceType + "]";
	}

	
	
	
}
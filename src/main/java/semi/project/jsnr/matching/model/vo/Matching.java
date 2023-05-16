package semi.project.jsnr.matching.model.vo;

public class Matching {
	private int matchingNo;
	private int animalNo;
	private int memberNo;
	private String startDate;
	private String endDate;
	private String matchingPlace;
	private String reviewContent;
	private String matchingStatus;
	
	public Matching() {}

	public Matching(int matchingNo, int animalNo, int memberNo, String startDate, String endDate, String matchingPlace,
			String reviewContent, String matchingStatus) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.memberNo = memberNo;
		this.startDate = startDate;
		this.endDate = endDate;
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

	public String getMatchingStatus() {
		return matchingStatus;
	}

	public void setMatchingStatus(String matchingStatus) {
		this.matchingStatus = matchingStatus;
	}

	@Override
	public String toString() {
		return "Matching [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", memberNo=" + memberNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", matchingPlace=" + matchingPlace
				+ ", reviewContent=" + reviewContent + ", matchingStatus=" + matchingStatus + "]";
	}
	
}

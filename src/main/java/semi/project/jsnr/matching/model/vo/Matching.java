package semi.project.jsnr.matching.model.vo;

import java.sql.Timestamp;

public class Matching {
	private int matchingNo;
	private int animalNo;
	private int memberNo;
	private Timestamp startDate;
	private Timestamp endDate;
	private String matchingPlace;
	private String reviewContent;
	
	public Matching() {}

	public Matching(int matchingNo, int animalNo, int memberNo, Timestamp startDate, Timestamp endDate,
			String matchingPlace, String reviewContent) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.memberNo = memberNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.matchingPlace = matchingPlace;
		this.reviewContent = reviewContent;
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

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
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

	@Override
	public String toString() {
		return "Matching [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", memberNo=" + memberNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", matchingPlace=" + matchingPlace
				+ ", reviewContent=" + reviewContent + "]";
	};
	
}

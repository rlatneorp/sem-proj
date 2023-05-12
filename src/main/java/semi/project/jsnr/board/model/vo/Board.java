package semi.project.jsnr.board.model.vo;

import java.sql.Date;

public class Board {
	private int matchingNo;
	private int animalNo;
	private String animalName;
	private Date startDate;
	private Date endDate;
	private String matchingPlace;
	private String reviewContent;
	private int reviewRaiting;
	private int reviewCount;
	private String jibsaComment;
	private String memberName;
	private int memberNo;
	
	public Board() {}

	public Board(int matchingNo, int animalNo, String animalName, Date startDate, Date endDate, String matchingPlace,
			String reviewContent, int reviewRaiting, int reviewCount, String jibsaComment, String memberName,
			int memberNo) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.animalName = animalName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.matchingPlace = matchingPlace;
		this.reviewContent = reviewContent;
		this.reviewRaiting = reviewRaiting;
		this.reviewCount = reviewCount;
		this.jibsaComment = jibsaComment;
		this.memberName = memberName;
		this.memberNo = memberNo;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
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

	public int getReviewRaiting() {
		return reviewRaiting;
	}

	public void setReviewRaiting(int reviewRaiting) {
		this.reviewRaiting = reviewRaiting;
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

	@Override
	public String toString() {
		return "Board [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", animalName=" + animalName
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", matchingPlace=" + matchingPlace
				+ ", reviewContent=" + reviewContent + ", reviewRaiting=" + reviewRaiting + ", reviewCount="
				+ reviewCount + ", jibsaComment=" + jibsaComment + ", memberName=" + memberName + ", memberNo="
				+ memberNo + "]";
	}

	
	
}
package semi.project.jsnr.board.model.vo;

import java.sql.Date;

public class Board {
	private int matchingNo;
	private int animalNo;
	private String animalName;
	private String animalKind;
	private Date startDate;
	private Date endDate;
	private String matchingPlace;
	private String reviewContent;
	private int reviewRaiting;
	private int reviewCount;
	private String jibsaComment;
	private String memberName;
	private int memberNo;
	private String jibsaName;
	private String isJibsa;
	
	
	public Board() {}


	public Board(int matchingNo, int animalNo, String animalName, String animalKind, Date startDate, Date endDate,
			String matchingPlace, String reviewContent, int reviewRaiting, int reviewCount, String jibsaComment,
			String memberName, int memberNo, String jibsaName, String isJibsa) {
		super();
		this.matchingNo = matchingNo;
		this.animalNo = animalNo;
		this.animalName = animalName;
		this.animalKind = animalKind;
		this.startDate = startDate;
		this.endDate = endDate;
		this.matchingPlace = matchingPlace;
		this.reviewContent = reviewContent;
		this.reviewRaiting = reviewRaiting;
		this.reviewCount = reviewCount;
		this.jibsaComment = jibsaComment;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.jibsaName = jibsaName;
		this.isJibsa = isJibsa;
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


	@Override
	public String toString() {
		return "Board [matchingNo=" + matchingNo + ", animalNo=" + animalNo + ", animalName=" + animalName
				+ ", animalKind=" + animalKind + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", matchingPlace=" + matchingPlace + ", reviewContent=" + reviewContent + ", reviewRaiting="
				+ reviewRaiting + ", reviewCount=" + reviewCount + ", jibsaComment=" + jibsaComment + ", memberName="
				+ memberName + ", memberNo=" + memberNo + ", jibsaName=" + jibsaName + ", isJibsa=" + isJibsa + "]";
	}



}
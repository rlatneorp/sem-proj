package semi.project.jsnr.board.model.vo;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private int memberNo;
	private String memberId;
	private String memberName;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date questionDate;
	private String qnaAnswer;
	private Date answerDate;
	private String qnaStatus;
	
	public Qna() {}

	public Qna(int qnaNo, int memberNo, String memberId, String memberName, String qnaCategory, String qnaTitle,
			String qnaContent, Date questionDate, String qnaAnswer, Date answerDate, String qnaStatus) {
		super();
		this.qnaNo = qnaNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.questionDate = questionDate;
		this.qnaAnswer = qnaAnswer;
		this.answerDate = answerDate;
		this.qnaStatus = qnaStatus;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", memberName="
				+ memberName + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent
				+ ", questionDate=" + questionDate + ", qnaAnswer=" + qnaAnswer + ", answerDate=" + answerDate
				+ ", qnaStatus=" + qnaStatus + "]";
	}

	
}

package semi.project.jsnr.board.model.vo;

import java.sql.Date;

public class Faq {
	private int faqNo;
	private String faqWriter;
	private String faqTitle;
	private String faqContent;
	private Date faqCreateDate;
	private String faqStatus;
	
	public Faq() {}

	public Faq(int faqNo, String faqWriter, String faqTitle, String faqContent, Date faqCreateDate, String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqCreateDate = faqCreateDate;
		this.faqStatus = faqStatus;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqCreateDate() {
		return faqCreateDate;
	}

	public void setFaqCreateDate(Date faqCreateDate) {
		this.faqCreateDate = faqCreateDate;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqCreateDate=" + faqCreateDate + ", faqStatus=" + faqStatus + "]";
	}
	
	
}

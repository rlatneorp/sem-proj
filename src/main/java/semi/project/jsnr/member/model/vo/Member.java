package semi.project.jsnr.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String isAdmin;
	private String isJibsa;
	private String memberStatus;
	private Date enrollDate;
	private Date exitDate;
	private int blackList;
	private String memberPhone;
	private String memberAddress;
	private int animalCount;
	private String applyJibsa;
	
	public Member() {}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberEmail,
			String isAdmin, String isJibsa, String memberStatus, Date enrollDate, Date exitDate, int blackList,
			String memberPhone, String memberAddress, int animalCount, String applyJibsa) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.isAdmin = isAdmin;
		this.isJibsa = isJibsa;
		this.memberStatus = memberStatus;
		this.enrollDate = enrollDate;
		this.exitDate = exitDate;
		this.blackList = blackList;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.animalCount = animalCount;
		this.applyJibsa = applyJibsa;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getIsJibsa() {
		return isJibsa;
	}

	public void setIsJibsa(String isJibsa) {
		this.isJibsa = isJibsa;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getExitDate() {
		return exitDate;
	}

	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}

	public int getBlackList() {
		return blackList;
	}

	public void setBlackList(int blackList) {
		this.blackList = blackList;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public int getAnimalCount() {
		return animalCount;
	}

	public void setAnimalCount(int animalCount) {
		this.animalCount = animalCount;
	}

	public String getApplyJibsa() {
		return applyJibsa;
	}

	public void setApplyJibsa(String applyJibsa) {
		this.applyJibsa = applyJibsa;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberEmail=" + memberEmail + ", isAdmin=" + isAdmin + ", isJibsa=" + isJibsa
				+ ", memberStatus=" + memberStatus + ", enrollDate=" + enrollDate + ", exitDate=" + exitDate
				+ ", blackList=" + blackList + ", memberPhone=" + memberPhone + ", memberAddress=" + memberAddress
				+ ", animalCount=" + animalCount + ", applyJibsa=" + applyJibsa + "]";
	}

}
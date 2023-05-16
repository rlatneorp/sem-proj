package semi.project.jsnr.animal.model.vo;

public class Image {
	private int imageNo;
	private String renameName;
	private String originalName;
	private int imageLevel;
	private String imagePath;
	private int memberNo;
	
	public Image() {}

	public Image(int imageNo, String renameName, String originalName, int imageLevel, String imagePath, int memberNo) {
		super();
		this.imageNo = imageNo;
		this.renameName = renameName;
		this.originalName = originalName;
		this.imageLevel = imageLevel;
		this.imagePath = imagePath;
		this.memberNo = memberNo;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getRenameName() {
		return renameName;
	}

	public void setRenameName(String renameName) {
		this.renameName = renameName;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public int getImageLevel() {
		return imageLevel;
	}

	public void setImageLevel(int imageLevel) {
		this.imageLevel = imageLevel;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Image [imageNo=" + imageNo + ", renameName=" + renameName + ", originalName=" + originalName
				+ ", imageLevel=" + imageLevel + ", imagePath=" + imagePath + ", memberNo=" + memberNo + "]";
	};
	
}
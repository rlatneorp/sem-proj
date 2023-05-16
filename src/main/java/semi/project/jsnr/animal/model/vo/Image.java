package semi.project.jsnr.animal.model.vo;

public class Image {
	private int imageNo;
	private int memberNo;
	private String renameName;
	private String originalName;
	private int imageLevel;
	private String imagePath;
	
	public Image() {}

	public Image(int imageNo, int memberNo, String renameName, String originalName, int imageLevel, String imagePath) {
		super();
		this.imageNo = imageNo;
		this.memberNo = memberNo;
		this.renameName = renameName;
		this.originalName = originalName;
		this.imageLevel = imageLevel;
		this.imagePath = imagePath;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	@Override
	public String toString() {
		return "Image [imageNo=" + imageNo + ", memberNo=" + memberNo + ", renameName=" + renameName + ", originalName="
				+ originalName + ", imageLevel=" + imageLevel + ", imagePath=" + imagePath + "]";
	};

}
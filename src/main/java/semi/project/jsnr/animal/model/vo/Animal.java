package semi.project.jsnr.animal.model.vo;

public class Animal {
	private int animalNo;
	private String animalName;
	private String animalGender;
	private String animalKind;
	private double animalWeight;
	private String animalNote;
	private int memberNo;
	private String animalType;
	private String animalSize;
	private String isNeuter;
	private String birthDate;
	private String isStatus;
	private int imageLevel;
	
	public Animal() {};

	public Animal(int animalNo, String animalName, String animalGender, String animalKind, double animalWeight,
			String animalNote, int memberNo, String animalType, String animalSize, String isNeuter, String birthDate, String isStatus, int imageLevel) {
		super();
		this.animalNo = animalNo;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalKind = animalKind;
		this.animalWeight = animalWeight;
		this.animalNote = animalNote;
		this.memberNo = memberNo;
		this.animalType = animalType;
		this.animalSize = animalSize;
		this.isNeuter = isNeuter;
		this.birthDate = birthDate;
		this.isStatus = isStatus;
		this.imageLevel = imageLevel;
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

	public String getAnimalGender() {
		return animalGender;
	}

	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}

	public String getAnimalKind() {
		return animalKind;
	}

	public void setAnimalKind(String animalKind) {
		this.animalKind = animalKind;
	}

	public double getAnimalWeight() {
		return animalWeight;
	}

	public void setAnimalWeight(double animalWeight) {
		this.animalWeight = animalWeight;
	}

	public String getAnimalNote() {
		return animalNote;
	}

	public void setAnimalNote(String animalNote) {
		this.animalNote = animalNote;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	public String getAnimalSize() {
		return animalSize;
	}

	public void setAnimalSize(String animalSize) {
		this.animalSize = animalSize;
	}

	public String getIsNeuter() {
		return isNeuter;
	}

	public void setIsNeuter(String isNeuter) {
		this.isNeuter = isNeuter;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getIsStatus() {
		return isStatus;
	}

	public void setIsStatus(String isStatus) {
		this.isStatus = isStatus;
	}

	public int getImageLevel() {
		return imageLevel;
	}

	public void setImageLevel(int imageLevel) {
		this.imageLevel = imageLevel;
	}

	@Override
	public String toString() {
		return "Animal [animalNo=" + animalNo + ", animalName=" + animalName + ", animalGender=" + animalGender
				+ ", animalKind=" + animalKind + ", animalWeight=" + animalWeight + ", animalNote=" + animalNote
				+ ", memberNo=" + memberNo + ", animalType=" + animalType + ", animalSize=" + animalSize + ", isNeuter="
				+ isNeuter + ", birthDate=" + birthDate + ", isStatus=" + isStatus + ", imageLevel=" + imageLevel + "]";
	}
	
}

package semi.project.jsnr.animal.model.vo;

public class Animal {
	private int animalNo;
	private String animalName;
	private String animalGender;
	private String animalKind;
	private double animalWeight;
	private String animalNote;
	private int memberNo;
	
	public Animal(int animalNo, String animalName, String animalGender, String animalKind, double animalWeight,
			String animalNote, int memberNo) {
		super();
		this.animalNo = animalNo;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalKind = animalKind;
		this.animalWeight = animalWeight;
		this.animalNote = animalNote;
		this.memberNo = memberNo;
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

	@Override
	public String toString() {
		return "Animal [animalNo=" + animalNo + ", animalName=" + animalName + ", animalGender=" + animalGender
				+ ", animalKind=" + animalKind + ", animalWeight=" + animalWeight + ", animalNote=" + animalNote
				+ ", memberNo=" + memberNo + "]";
	}
	
	
}

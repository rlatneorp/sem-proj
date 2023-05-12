package semi.project.jsnr.jibsa.model.exception;

public class JibsaException extends RuntimeException{
	// runtime Exception의 후손은 unchecked Exception으로 예외처리 안해도 돼.
	public JibsaException() {}
	public JibsaException(String msg) {
		super(msg);
	}
}

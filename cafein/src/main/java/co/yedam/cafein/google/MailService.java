package co.yedam.cafein.google;

public interface MailService {
	boolean send(String subject, String text, String from, String to, Object object);
}

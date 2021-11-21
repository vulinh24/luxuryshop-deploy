package com.luxuryshop.Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import com.luxuryshop.WebConstants;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Component
@Data
@EqualsAndHashCode (callSuper = false)
@NoArgsConstructor
public class SendMailService extends Thread{
	
	@Autowired
	JavaMailSender sender;
	
	private String toMail;
	
	public SendMailService(String toMail) {
		this.toMail = toMail;
	}
	
	@Override
	public void run() {
		sendMailToThankRegister();
	}
	
	public void sendMailToThankRegister() {
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setFrom(WebConstants.MYMAIL);
		mail.setTo(toMail);
		mail.setSubject("THƯ CẢM ƠN!");
		String content = "Xin chào, " + toMail
				+ "\nBức thư được gửi đến quý khách vì bạn đã đăng kí nhận thông báo từ LUXURY shop."
				+ "\nCảm ơn quý khách vì đã tin tưởng, chúng tôi cam kết sẽ đem lại cho quý khách trải nghiệm tốt nhất!"
				+ "\nTrân thành cảm ơn!";
		mail.setText(content);
		sender.send(mail);
	}
}

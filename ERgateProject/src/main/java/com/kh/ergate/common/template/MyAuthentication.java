package com.kh.ergate.common.template;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator{
	
	private PasswordAuthentication pa;
	
	public MyAuthentication() {
		
		String id="dlfroal06@gmail.com";
		String pw="ant200616";
		
		pa = new PasswordAuthentication(id, pw);
		
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
}

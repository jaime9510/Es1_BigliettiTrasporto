package it.polito.ai.es1.implementation;

import it.polito.ai.es1.interfaces.LoginServiceInterface;

public class LoginService implements LoginServiceInterface {

	private String user1 = "luca@gmail.com";
	private String pass1 = "123";
	private String user2 = "sara@hotmail.com";
	private String pass2 = "321";
	
	
	public boolean login(String username, String password) {
		boolean response = false;		
		if(user1.equals(username) && pass1.equals(password)) {
			response = true;
		} else if (user2.equals(username) && pass2.equals(password)) {
			response = true;
		}
		return response;
	}

	public boolean logout(String username) {
		// TODO Auto-generated method stub

	}

	public String getUserName() {
		// TODO Auto-generated method stub
		return null;
	}

}

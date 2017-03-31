package it.polito.ai.es1.interfaces;

public interface LoginServiceInterface {

	public boolean login(String username, String password);
	
	public boolean logout(String username);
	
	public String getUserName();
}

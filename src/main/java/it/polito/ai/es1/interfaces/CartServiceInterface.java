package it.polito.ai.es1.interfaces;

import java.util.HashMap;

import it.polito.ai.es1.models.Item;
import it.polito.ai.es1.models.Ticket;

public interface CartServiceInterface {

	public boolean addItem(Ticket ticket, Integer qty);
	
	public boolean removeItem(String id);
	
	public boolean modifyItem(Ticket ticket, Integer qty);
	
	public HashMap<String, Item> getItems();
	
	public double getTotal();
	
	public void clearCart();
}

package it.polito.ai.es1.implementation;

import java.util.HashMap;

import it.polito.ai.es1.interfaces.CartServiceInterface;
import it.polito.ai.es1.models.Item;
import it.polito.ai.es1.models.Ticket;

public class CartService implements CartServiceInterface {
	private HashMap<String, Item> items = new HashMap<String, Item>();
	
	public boolean addItem(Ticket ticket, Integer qty) {		
		Item i = items.get(ticket.getId());
		if (i == null) {
			items.put(ticket.getId(), new Item(ticket, qty));
		} else {
			i.setQty(i.getQty()+qty);
			items.put(ticket.getId(), i);
		}
		return true;
	}

	public boolean removeItem(String id) {
		Item i = items.remove(id);
		if (i != null) {
			return true;
		}
		return false;
	}

	public HashMap<String, Item> getItems() {
		return items;
	}

	public double getTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean modifyItem(Ticket ticket, Integer qty) {
		Item i = items.get(ticket.getId());
		i.setQty(qty);
		items.put(ticket.getId(), i);
		return false;
	}

}

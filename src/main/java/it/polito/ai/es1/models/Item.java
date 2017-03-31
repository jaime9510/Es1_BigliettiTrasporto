package it.polito.ai.es1.models;

public class Item {

	private Ticket ticket;
	private Integer qty;

	public Item(Ticket ticket, Integer qty) {
		super();
		this.ticket = ticket;
		this.qty = qty;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	
}

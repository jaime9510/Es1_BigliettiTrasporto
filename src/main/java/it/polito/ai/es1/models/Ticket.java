package it.polito.ai.es1.models;

public class Ticket {

	private String type;
	private String id;
	private double price;
	
	public Ticket(String type, String id, double price) {
		super();
		this.type = type;
		this.id = id;
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}

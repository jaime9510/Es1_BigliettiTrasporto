package it.polito.ai.es1.implementation;

import java.util.Random;

import it.polito.ai.es1.interfaces.PaymentServiceInterface;

public class PaymentService implements PaymentServiceInterface {
	
	private Integer numOrder = 0;

	public Integer numOrder() {
		Random random = new Random();
		numOrder = random.nextInt(10000);		
		return numOrder;
	}

}

package com.bank.dto;

import java.sql.Date;

public class Transaction {
	private long transactionID;
	private long user;
	private long rec_acc;
	private Date date;
	private String transaction;
	private double amount;
	private double balance;
	public Transaction(long transactionID, long user, long rec_acc, Date date, String transaction, double amount,
			double balance) {
		super();
		this.transactionID = transactionID;
		this.user = user;
		this.rec_acc = rec_acc;
		this.date = date;
		this.transaction = transaction;
		this.amount = amount;
		this.balance = balance;
	}

	public Transaction() {
		// TODO Auto-generated constructor stub
	}

	public long getTransactionId() { 
	return transactionID; 
	} 
	public void setTransactionId(long transactionId) { 
	this.transactionID = transactionId; 
	} 
	public long getUser() { 

	return user; 
	} 
	public void setUser(long user) { 
	this.user = user; 
	} 
	public long getRec_acc() { 
	return rec_acc; 
	} 
	public void setRec_acc(long rec_acc) { 
	this.rec_acc = rec_acc; 
	} 
	public Date getDate() { 
	return date; 
	} 
	public void setDate(Date date) { 
	this.date = date; 
	} 
	 
	public String getTransaction() { 
	return transaction; 
	} 
	public void setTransaction(String transaction) { 
	this.transaction = transaction; 
	} 
	public double getAmount() { 
	return amount; 
	} 
	public void setAmount(double amount) { 
	this.amount = amount; 
	} 
	public double getBalance() { 
	return balance; 
	} 
	public void setBalance(double balance) { 
	this.balance = balance; 
	} 
}

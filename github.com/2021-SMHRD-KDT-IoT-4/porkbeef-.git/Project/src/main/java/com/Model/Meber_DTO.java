package com.Model;

public class Meber_DTO {
	
	private int feed;
	private int door;
	private int absor;
	private int aircon;
	private int pump;
	private int boil;
	private int humid;
	
	public Meber_DTO(int feed, int door, int absor, int aircon, int pump, int boil, int humid) {
		super();
		this.feed = feed;
		this.door = door;
		this.absor = absor;
		this.aircon = aircon;
		this.pump = pump;
		this.boil = boil;
		this.humid = humid;
	}
	
	public int getFeed() {
		return feed;
	}


	public void setFeed(int feed) {
		this.feed = feed;
	}


	public int getDoor() {
		return door;
	}


	public void setDoor(int door) {
		this.door = door;
	}


	public int getAbsor() {
		return absor;
	}


	public void setAbsor(int absor) {
		this.absor = absor;
	}


	public int getAircon() {
		return aircon;
	}


	public void setAircon(int aircon) {
		this.aircon = aircon;
	}


	public int getPump() {
		return pump;
	}


	public void setPump(int pump) {
		this.pump = pump;
	}


	public int getBoil() {
		return boil;
	}


	public void setBoil(int boil) {
		this.boil = boil;
	}


	public int getHumid() {
		return humid;
	}


	public void setHumid(int humid) {
		this.humid = humid;
	}


	
}

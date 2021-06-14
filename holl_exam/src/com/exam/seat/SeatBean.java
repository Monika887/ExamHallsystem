package com.exam.seat;

public class SeatBean {
	private int seat_id;
	private String seate_block_id,seat_number,seat_description;
	public SeatBean() {
		
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public String getSeate_block_id() {
		return seate_block_id;
	}
	public void setSeate_block_id(String seate_block_id) {
		this.seate_block_id = seate_block_id;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}
	public String getSeat_description() {
		return seat_description;
	}
	public void setSeat_description(String seat_description) {
		this.seat_description = seat_description;
	}
	
}

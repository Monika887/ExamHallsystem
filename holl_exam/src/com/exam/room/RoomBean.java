package com.exam.room;

public class RoomBean {
private int room_id;
private String room_floor_id,room_user_id,room_name,room_description;
public RoomBean() {
	
}
public int getRoom_id() {
	return room_id;
}
public void setRoom_id(int room_id) {
	this.room_id = room_id;
}
public String getRoom_floor_id() {
	return room_floor_id;
}
public void setRoom_floor_id(String room_floor_id) {
	this.room_floor_id = room_floor_id;
}
public String getRoom_user_id() {
	return room_user_id;
}
public void setRoom_user_id(String room_user_id) {
	this.room_user_id = room_user_id;
}
public String getRoom_name() {
	return room_name;
}
public void setRoom_name(String room_name) {
	this.room_name = room_name;
}
public String getRoom_description() {
	return room_description;
}
public void setRoom_description(String room_description) {
	this.room_description = room_description;
}

}

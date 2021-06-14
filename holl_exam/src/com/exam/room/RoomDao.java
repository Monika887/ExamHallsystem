package com.exam.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.exam.data.Database;

public class RoomDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public RoomDao() {
		
	}
	@SuppressWarnings("finally")
	public  boolean addroom(RoomBean bean){
		boolean flag=false;
		if(conn==null) {
			conn=Database.getDatabase();
		} try {
			//"insert into room_id(room_floor_id,room_user_id,room_name,room_description) values(?,?,?,?)";
			  String query="INSERT INTO `room_id` (`room_floor_id`, `room_user_id`, `room_name`, `room_description`) VALUES (?, ?, ?, ?)";
			 ps=conn.prepareStatement(query);
		     ps.setString(1,bean.getRoom_floor_id());
		     ps.setString(2,bean.getRoom_user_id()); 
		     ps.setString(3,bean.getRoom_name());
		     ps.setString(4,bean.getRoom_description());
		     if(ps.executeUpdate()>0) {
		    	 flag=true;
	           }
		} catch (Exception e) {
			System.out.println("Exception at addroom():"+e);
		} finally { 
			ps=null;
			conn=null;
			return flag;
		}
	 }
	
	 @SuppressWarnings("finally")
		public boolean deleteroom(String room_id) {
	    	 boolean flag=false;
	    	 if(conn==null) {
	    		 conn =Database.getDatabase();
	    	 }
	    	  try {
	    		  
				ps=conn.prepareStatement("DELETE FROM room_id WHERE room_id="+room_id);
		        if(ps.executeUpdate()>0) {
		        	flag=true;
		        }
	    	  } catch (Exception e) {
				System.out.println("Exception at deleteroom():"+e );
			} finally {
				ps=null;
				conn=null;
				return flag;
			}
	     }
	
	 @SuppressWarnings("finally")
		public boolean updateroom(RoomBean bean) {
	    		boolean flag=false;
	    		if(conn==null) {
	    			conn=Database.getDatabase();
	    		} try {
	    			 String query="UPDATE `room_id` SET `room_floor_id` = ?, `room_user_id` = ?, `room_name` = ?, `room_description` = ? WHERE `room_id` = ?";
	    			 ps=conn.prepareStatement(query);
	    		     ps.setString(1,bean.getRoom_floor_id());
	    		     ps.setString(2,bean.getRoom_user_id());
	    		     ps.setString(3,bean.getRoom_name());
	    		     ps.setString(4,bean.getRoom_description());
	    		     ps.setInt(5,bean.getRoom_id());
	    		     if(ps.executeUpdate()>0) {
	    		    	 flag=true;
	    	   }
	    		} catch (Exception e) {
	    			System.out.println("Exception at updateroom()"+e);
	    		} finally { 
	    			ps=null;
	    			conn=null;
	    			return flag;
	    		}
	    	}	
	 @SuppressWarnings("finally")
		public ArrayList<RoomBean> getAllroom(){
			ArrayList<RoomBean> arraylist=new ArrayList<>();
			if(conn==null) {
				conn=Database.getDatabase();	
			}
			 RoomBean bean =null;
			try {
				
				String query="SELECT *FROM room_id";
				 ps=conn.prepareStatement(query);
			     rs=ps.executeQuery();
			     while(rs.next()) {
			    	 bean=new RoomBean();
			    	 bean.setRoom_id(rs.getInt("room_id"));
			    	 bean.setRoom_floor_id(rs.getString("room_floor_id"));
			    	 bean.setRoom_user_id(rs.getString("room_user_id"));
			    	 bean.setRoom_name(rs.getString("room_name"));
			    	 bean.setRoom_description(rs.getString("room_description"));
			         arraylist.add(bean);
			     } 
			}
			 catch (Exception e) {
				System.out.println("Exception at getAllRoom():"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				if(arraylist.isEmpty()) {
					arraylist=null;
				}
				return arraylist;
			}
		}	
	 public RoomBean getRoom(String room_id){
			
			if(conn==null) {
				conn=Database.getDatabase();	
			} 
			 RoomBean been=null;
			try {
				
				ps=conn.prepareStatement("SELECT * FROM `room_id` WHERE room_id = " + room_id);
			     rs=ps.executeQuery();
			     if(rs.next()) {
			    	 been=new RoomBean();
			    	 been.setRoom_id(rs.getInt("room_id"));
			    	 been.setRoom_floor_id(rs.getString("room_floor_id"));
			    	 been.setRoom_user_id(rs.getString("room_user_id"));
			    	 been.setRoom_name(rs.getString("room_name"));
			    	 been.setRoom_description(rs.getString("room_description"));
			     }
			     
			} catch (Exception e) {
				System.out.println("Exception at getRoom()"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				
				}
				return been;
			}
		}
		


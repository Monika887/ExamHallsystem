package com.exam.student_seat;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.exam.block.Blockss;
import com.exam.data.Database;
import com.exam.floor.floorBean;
import com.exam.room.RoomBean;
import com.exam.seat.SeatBean;
import com.exam.student.StudentBean;

import java.io.*;

@SuppressWarnings("unused")
public class StudentseatD{
	
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public StudentseatD()
	{
		
	}
	 @SuppressWarnings("finally")
	public  boolean saveStudentSeat(StudentseatB beenn){
		boolean flag=false;
		if(conn==null) {
			conn=Database.getDatabase();
		} try {
			 String query="INSERT INTO student_seat (`ss_student_id`, `ss_seat_id`, `ss_description`) VALUES (?, ?, ?)";
			 ps=conn.prepareStatement(query);
			 ps.setString(1,beenn.get("ss_student_id"));
		     ps.setString(2,beenn.get("ss_seat_id"));
		     ps.setString(3,beenn.get("ss_description"));
		    // ps.setString(4,"");
		     if(ps.executeUpdate()>0) {
		    	 flag=true;
	           }
		} catch (Exception e) {
			System.out.println("Exception at addSeat():"+e);
		} finally { 
			ps=null;
			conn=null;
			return flag;
		}
	 }

	 public boolean getStudentSeatDetails(StudentseatB student_seat ) {
		 boolean flag=false;
	    	StudentseatB results = new StudentseatB();
	        
	        SeatBean beaan=null;
			RoomBean bean=null;
			floorBean bean2=null;
			Blockss beaBlockssn=null;
			StudentBean bean3=null;
	        if(conn==null) {
				   conn=Database.getDatabase();   
			   }

	        try {
	            String SQL = "SELECT * FROM student_seat WHERE student_seat  = " + student_seat ;
	            ps=conn.prepareStatement(SQL);
	            
				 ps.setString(1,student_seat.get("ss_student_id"));
			     ps.setString(2,student_seat.get("ss_seat_id"));
			     ps.setString(3,student_seat.get("ss_description"));
			    // ps.setString(4,"");
			     if(ps.executeUpdate()>0) {
			    	 flag=true;
		           }
			} catch (Exception e) {
				System.out.println("Exception at addSeat():"+e);
			} finally { 
				ps=null;
				conn=null;
				return flag;
			}
		 }
	     
	     
	     @SuppressWarnings("finally")
		public boolean updateStudentSeat(StudentseatB beenn) {
	    		boolean flag=false;
	    		    SeatBean beaan=null;
	    			RoomBean bean=null;
	    			floorBean bean2=null;
	    			Blockss beaBlockssn=null;
	    			StudentBean bean3=null;
	    		if(conn==null) {
	    			conn=Database.getDatabase();
	    			
	    		} try {
	    			 String query= "UPDATE student_seat SET `ss_student_id` = ?, `ss_seat_id` = ?, `ss_description` = ? WHERE `student_seat ` = ?";
	    			 ps=conn.prepareStatement(query); 
	    			
	    			 ps.setString(1,(String)beenn.get("ss_student_id"));
	    		     ps.setString(2,(String)beenn.get("ss_seat_id"));
	    		     ps.setString(3,(String)beenn.get("ss_description"));
	    		     ps.setString(4,beenn.get("student_seat"));
	    		     if(ps.executeUpdate()>0) {
	    		    	 flag=true;
	    	   }
	    		} catch (Exception e) {
	    			System.out.println("Exception at updateSeat()"+e);
	    		} finally { 
	    			ps=null;
	    			conn=null;
	    			return flag;
	    		}
	    	}
		
		@SuppressWarnings("finally")
		public ArrayList<HashMap> getAllStudentSeat(){
			ArrayList<HashMap> arraylist=new ArrayList<>();
			StudentseatB beaen;
			if(conn==null) {
				conn=Database.getDatabase();	
			}
			SeatBean beaan=null;
			RoomBean bean=null;
			floorBean bean2=null;
			Blockss beaBlockssn=null;
			StudentBean bean3=null;
			try {
				
				String query="SELECT * FROM `seat_id`,`block_id`,`room_id`,`floor_id`,`student_seat`,`students_id` WHERE students_id = ss_student_id AND ss_seat_id = seat_id AND block_room_id = room_id AND block_id = seat_block_id AND room_floor_id = floor_id";;
				 ps=conn.prepareStatement(query);
			     rs=conn.prepareStatement(query).executeQuery();
			     StudentseatB beean = new StudentseatB();
			     while(rs.next()) {
			    	 HashMap results = new HashMap();
			    	
			    	 beean.setStudent_seat(rs.getInt("student_seat "));
			    	 bean2.setFloor_name(rs.getString("floor_name"));
			    	 bean.setRoom_name(rs.getString("room_name"));
			    	 beaBlockssn.setBlock_name(rs.getString("block_name"));
			    	 beaan.setSeat_number(rs.getString("seat_number"));
			    	 bean3.setStudent_rollno(rs.getString("student_rollno"));
			    	 bean3.setStudent_name(rs.getString("student_name"));
			    	 beean.setSs_description(rs.getString("ss_description"));
			    	 arraylist.add(results);
			     } 
			}
			 catch (Exception e) {
				System.out.println("Exception at getAllStudentseatB():"+e);
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
		
		
		 public HashMap getStudentSeats(Integer students_id) {
			 HashMap results = new HashMap();
			if(conn==null) {
				conn=Database.getDatabase();	
			} 
			
			SeatBean beaan=null;
			RoomBean bean=null;
			floorBean bean2=null;
			Blockss beaBlockssn=null;
			StudentBean bean3=null;
			
			
			try {
				 String SQL = "SELECT * FROM `seat_id`,`block_id`,`room_id`,`floor_id`,`student_seat`,`students_id` WHERE students_id = ss_student_id AND ss_seat_id = seat_id AND block_room_id = room_id AND room_floor_id = floor_id AND student_rollno = " + students_id;
				ps=conn.prepareStatement(SQL);
			     rs=ps.executeQuery();
			     StudentseatB beean = new StudentseatB();
			     while(rs.next()) {
			    	 beean.setStudent_seat(rs.getInt("student_seat "));
			    	 bean2.setFloor_name(rs.getString("floor_name"));
			    	 bean.setRoom_name(rs.getString("room_name"));
			    	 beaBlockssn.setBlock_name(rs.getString("block_name"));
			    	 beaan.setSeat_number(rs.getString("seat_number"));
			    	 bean3.setStudent_rollno(rs.getString("student_rollno"));
			    	 bean3.setStudent_name(rs.getString("student_name"));
			    	 beean.setSs_description(rs.getString("ss_description"));
			    
			     }
			     
			} catch (Exception e) {
				System.out.println("Exception at getSeat()"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				
				}
				return results ;
			}
		}
		

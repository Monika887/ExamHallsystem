package com.exam.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.exam.data.Database;

public class SeatDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public SeatDao()
	{
		
	}
	 @SuppressWarnings("finally")
	public  boolean addSeat(SeatBean bean){
		boolean flag=false;
		if(conn==null) {
			conn=Database.getDatabase();
		} try {
			 String query="INSERT INTO `seat_id`(`seat_number`, `seate_block_id`, `seat_description`) VALUES (?, ?, ?)";
			 ps=conn.prepareStatement(query);
		     ps.setString(1,bean.getSeat_number());
		     ps.setString(2,bean.getSeate_block_id());
		     ps.setString(3,bean.getSeat_description());
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
		public boolean deleteSeat(String seat_id) {
	    	 boolean flag=false;
	    	 if(conn==null) {
	    		 conn =Database.getDatabase();
	    	 }
	    	  try {
	    		  
				ps=conn.prepareStatement("DELETE FROM seat_id WHERE seat_id="+seat_id);
		        if(ps.executeUpdate()>0) {
		        	flag=true;
		        }
	    	  } catch (Exception e) {
				System.out.println("Exception at deleteSeat():"+e );
			} finally {
				ps=null;
				conn=null;
				return flag;
			}
	     }

	     
	     
	     @SuppressWarnings("finally")
		public boolean updateSeat(SeatBean bean) {
	    		boolean flag=false;
	    		if(conn==null) {
	    			conn=Database.getDatabase();
	    		} try {
	    			 String query= "UPDATE `seat_id` SET `seat_number` = ?,`seate_block_id` = ?, `seat_description` = ? WHERE `seat_id` = ?";
	    			 ps=conn.prepareStatement(query); 
	    			 
	    			 ps.setString(1,bean.getSeat_number());
	    		     ps.setString(2,bean.getSeate_block_id());
	    		     ps.setString(3,bean.getSeat_description());
	    		     ps.setInt(4,bean.getSeat_id());
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
		public ArrayList<SeatBean> getAllSeat(){
			ArrayList<SeatBean> arraylist=new ArrayList<>();
			if(conn==null) {
				conn=Database.getDatabase();	
			}
			SeatBean bean =null;
			try {
				
				String query="SELECT *FROM seat_id";
				 ps=conn.prepareStatement(query);
			     rs=ps.executeQuery();
			     while(rs.next()) {
			    	 bean=new SeatBean();
			    	 bean.setSeat_id(rs.getInt("seat_id"));
			    	 bean.setSeat_number(rs.getString("seat_number"));
			    	 bean.setSeate_block_id(rs.getString("seate_block_id"));
			    	 bean.setSeat_description(rs.getString("seat_description"));
			         arraylist.add(bean);
			     } 
			}
			 catch (Exception e) {
				System.out.println("Exception at getAllSeat():"+e);
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
		
	public SeatBean getSeat(String seat_id){
			
			if(conn==null) {
				conn=Database.getDatabase();	
			} 
			 SeatBean been=null;
			try {
				
				ps=conn.prepareStatement("SELECT * FROM `seat_id` WHERE seat_id = " + seat_id);
			     rs=ps.executeQuery();
			     if(rs.next()) {
			    	 been=new SeatBean();
			    	 been.setSeat_id(rs.getInt("seat_id"));
			    	 been.setSeat_number(rs.getString("seat_number"));
			    	 been.setSeate_block_id(rs.getString("seate_block_id"));
			    	 been.setSeat_description(rs.getString("seat_description"));
			     }
			     
			} catch (Exception e) {
				System.out.println("Exception at getSeat()"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				
				}
				return been;
			}
		}
		

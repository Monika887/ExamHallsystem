package com.exam.assing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.exam.data.Database;

public class AssingDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public AssingDao()
	{
		
	}
	 @SuppressWarnings("finally")
	public  boolean addAssing(AssingBean bean){
		boolean flag=false;
		if(conn==null) {
			conn=Database.getDatabase();
		} try {
			 String query="insert into student_seat(ss_student_id,ss_seat_id,ss_description) values(?,?,?)";
			 ps=conn.prepareStatement(query);
		     ps.setString(1,bean.getSs_student_id());
		     ps.setString(2,bean.getSs_seat_id());
		     ps.setString(3,bean.getSs_description());
		    // ps.setString(4,"");
		     if(ps.executeUpdate()>0) {
		    	 flag=true;
	           }
		} catch (Exception e) {
			System.out.println("Exception at addAssing():"+e);
		} finally { 
			ps=null;
			conn=null;
			return flag;
		}
	 }

	     @SuppressWarnings("finally")
		public boolean deleteAssing(String student_seat) {
	    	 boolean flag=false;
	    	 if(conn==null) {
	    		 conn =Database.getDatabase();
	    	 }
	    	  try {
				ps=conn.prepareStatement("DELETE FROM student_seat WHERE student_seat="+student_seat);
		        if(ps.executeUpdate()>0) {
		        	flag=true;
		        }
	    	  } catch (Exception e) {
				System.out.println("Exception at deleteAssing():"+e );
			} finally {
				ps=null;
				conn=null;
				return flag;
			}
	     }

	     
	     
	     @SuppressWarnings("finally")
		public boolean updateAssing(AssingBean bean) {
	    		boolean flag=false;
	    		if(conn==null) {
	    			conn=Database.getDatabase();
	    		} try {
	    			 String query= "UPDATE `student_seat` SET `ss_student_id` = ?,`ss_seat_id` = ?, `ss_description` = ? WHERE `student_seat` = ?";
	    			 ps=conn.prepareStatement(query); 			 
	    			 ps.setString(1,bean.getSs_student_id());
	    		     ps.setString(2,bean.getSs_seat_id());
	    		     ps.setString(3,bean.getSs_description());
	    		     ps.setInt(4,bean.getStudent_seat());
	    		     if(ps.executeUpdate()>0) {
	    		    	 flag=true;
	    	   }
	    		} catch (Exception e) {
	    			System.out.println("Exception at updateAssing()"+e);
	    		} finally { 
	    			ps=null;
	    			conn=null;
	    			return flag;
	    		}
	    	}
		
		@SuppressWarnings("finally")
		public ArrayList<AssingBean> getAllAssing(){
			ArrayList<AssingBean> arraylist=new ArrayList<>();
			if(conn==null) {
				conn=Database.getDatabase();	
			}
			AssingBean bean =null;
			try {
				
				String query="SELECT *FROM student_seat";
				 ps=conn.prepareStatement(query);
			     rs=ps.executeQuery();
			     while(rs.next()) {
			    	 bean=new AssingBean();
			    	 bean.setStudent_seat(rs.getInt("student_seat"));
			    	 bean.setSs_student_id(rs.getString("ss_student_id"));
			    	 bean.setSs_seat_id(rs.getString("ss_seat_id"));
			    	 bean.setSs_description(rs.getString("ss_description"));
			         arraylist.add(bean);
			     } 
			}
			 catch (Exception e) {
				System.out.println("Exception at getAllAssing():"+e);
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
		
	public AssingBean getAssing(String student_seat){
			
			if(conn==null) {
				conn=Database.getDatabase();	
			} 
			 AssingBean been=null;
			try {
				
				ps=conn.prepareStatement("SELECT * FROM `student_seat` WHERE student_seat = " + student_seat);
			     rs=ps.executeQuery();
			     if(rs.next()) {
			    	 been=new AssingBean();
			    	 been.setStudent_seat(rs.getInt("student_seat"));
			    	 been.setSs_student_id(rs.getString("ss_student_id"));
			    	 been.setSs_seat_id(rs.getString("ss_seat_id"));
			    	 been.setSs_description(rs.getString("ss_description"));
			     }
			     
			} catch (Exception e) {
				System.out.println("Exception at getAssing()"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				
				}
				return been;
			}	

}

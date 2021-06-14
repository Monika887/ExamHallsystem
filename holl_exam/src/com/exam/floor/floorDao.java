package com.exam.floor;

import java.sql.*;
import java.util.*;
import java.sql.Connection;
import com.exam.data.Database;

public class floorDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public floorDao() {
		   
	   }
	@SuppressWarnings("finally")
	public boolean addfloor(floorBean bean) {
		boolean flag = false;
		if(conn==null) {
			conn=Database.getDatabase();
		}
		try {
			 String query="INSERT INTO `floor_id` (`floor_name`, `floor_description`) VALUES (?, ?);";
			 ps=conn.prepareStatement(query); 
			  // ps.setInt(1,bean.getFloor_id());
			  ps.setString(1,bean.getFloor_name());
		     ps.setString(2,bean.getFloor_description());
		    //ps.setString(3, "");
		     if(ps.executeUpdate()>0) {
		    	 flag = true;
		     }
		} catch (Exception e) {
		 System.out.println("Exception at addfloor():"+e);
		} finally {
			ps=null;
			conn=null;
		return flag;
		}
		
	}

	
	@SuppressWarnings("finally")
	public boolean deletefloor(String floor_id) {
		   boolean flag=false;
		   if(conn==null) {
			   conn=Database.getDatabase();   
		   }
		   try {
			   ps=conn.prepareStatement("DELETE FROM floor_id WHERE floor_id="+floor_id);
		    if(ps.executeUpdate()>0) {
		    	flag=true;
		    }
		   }catch (Exception e) {
			System.out.println("Exception at deletefloor()");
		}finally {
			ps=null;
			conn=null;
			return flag;
		}
		
	}
@SuppressWarnings("finally")
	public boolean updatefloor(floorBean bean) {
   		boolean flag=false;
   		if(conn==null) {
   			conn=Database.getDatabase();
   		} try {
   			 String query="UPDATE `floor_id` SET `floor_name` = ?, `floor_description` = ? WHERE `floor_id` = ?";
   			 ps=conn.prepareStatement(query);
   		     ps.setString(1,bean.getFloor_name());
   		     ps.setString(2,bean.getFloor_description());
   		     ps.setInt(3, bean.getFloor_id());
   		     if(ps.executeUpdate()>0) {
   		    	 flag=true;
   	       }
   		   } catch (Exception e) {
   		    	System.out.println("Exception at updatefloor()"+e);
   	     	} finally { 
   			ps=null;
   			conn=null;
   			return flag;
   	  }
   	}


@SuppressWarnings("finally")
public ArrayList<floorBean> getAllfloor(){
	ArrayList<floorBean> arraylist =new ArrayList<>();
	if(conn==null) {
		conn=Database.getDatabase();
		
	} 
	floorBean bean=null;
	try {
		String query="SELECT *FROM floor_id";
		ps =conn.prepareStatement(query);
	    rs =ps.executeQuery();
	   while(rs.next()) {
		bean=new floorBean();  
		bean.setFloor_id(rs.getInt("floor_id"));
		bean.setFloor_name(rs.getString("floor_name"));
		bean.setFloor_description(rs.getString("floor_description"));
		arraylist.add(bean);
	   }
	}catch (Exception e) {
		System.out.println("Exception at getAllfloor():");
	}finally {
		rs=null;
		ps=null;
		conn=null;
		if(arraylist.isEmpty()) {
			arraylist=null;

}return arraylist;
		
	}
}


public floorBean getfloor(String floor_id){
	
	if(conn==null) {
		conn=Database.getDatabase();
		
	} 
	floorBean bean=null;
	try {
		
		ps =conn.prepareStatement("SELECT * FROM `floor_id` WHERE floor_id = " + floor_id);
	    rs =ps.executeQuery();
	   while(rs.next()) {
		bean=new floorBean();  
		bean.setFloor_id(rs.getInt("floor_id"));
		bean.setFloor_name(rs.getString("floor_name"));
		bean.setFloor_description(rs.getString("floor_description"));
		
	   }
	}catch (Exception e) {
		System.out.println("Exception at getfloor():");
	}finally {
		rs=null;
		ps=null;
		conn=null;
	}
		return bean;
	}
}



	

	
	
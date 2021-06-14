package com.exam.block;
import java.sql.*;
import java.util.*;
import com.exam.data.Database;
import java.sql.Connection;

public class BlockDao{
private PreparedStatement ps=null;
private Connection conn=null;
private ResultSet rs=null;
public BlockDao()
{
	
}
 @SuppressWarnings("finally")
public  boolean addBlock(Blockss bean){
	boolean flag=false;
	if(conn==null) {
		conn=Database.getDatabase();
	} try {
		 String query="insert into block_id(block_room_id,block_name,block_description) values(?,?,?)";
		 ps=conn.prepareStatement(query);
	     ps.setString(1,bean.getBlock_room_id());
	     ps.setString(2,bean.getBlock_name());
	     ps.setString(3,bean.getBlock_description());
	    // ps.setString(4,"");
	     if(ps.executeUpdate()>0) {
	    	 flag=true;
           }
	} catch (Exception e) {
		System.out.println("Exception at addBlock():"+e);
	} finally { 
		ps=null;
		conn=null;
		return flag;
	}
 }

     @SuppressWarnings("finally")
	public boolean deleteBlock(String block_id) {
    	 boolean flag=false;
    	 if(conn==null) {
    		 conn =Database.getDatabase();
    	 }
    	  try {
    		  
			
			ps=conn.prepareStatement("DELETE FROM block_id WHERE block_id="+block_id);
	        if(ps.executeUpdate()>0) {
	        	flag=true;
	        }
    	  } catch (Exception e) {
			System.out.println("Exception at deleteBlock():"+e );
		} finally {
			ps=null;
			conn=null;
			return flag;
		}
     }

     
     
     @SuppressWarnings("finally")
	public boolean updateBlock(Blockss bean) {
    		boolean flag=false;
    		if(conn==null) {
    			conn=Database.getDatabase();
    		} try {
    			 String query= "UPDATE `block_id` SET `block_name` = ?,`block_room_id` = ?, `block_description` = ? WHERE `block_id` = ?";
    			 ps=conn.prepareStatement(query); 
    			 
    			 ps.setString(1,bean.getBlock_name());
    		     ps.setString(2,bean.getBlock_room_id());
    		     ps.setString(3,bean.getBlock_description());
    		     ps.setInt(4,bean.getBlock_id());
    		     if(ps.executeUpdate()>0) {
    		    	 flag=true;
    	   }
    		} catch (Exception e) {
    			System.out.println("Exception at updateBlock()"+e);
    		} finally { 
    			ps=null;
    			conn=null;
    			return flag;
    		}
    	}
	
	@SuppressWarnings("finally")
	public ArrayList<Blockss> getAllBlock(){
		ArrayList<Blockss> arraylist=new ArrayList<>();
		if(conn==null) {
			conn=Database.getDatabase();	
		}
		 Blockss bean =null;
		try {
			
			String query="SELECT *FROM block_id";
			 ps=conn.prepareStatement(query);
		     rs=ps.executeQuery();
		     while(rs.next()) {
		    	 bean=new Blockss();
		    	 bean.setBlock_id(rs.getInt("block_id"));
		    	 bean.setBlock_room_id(rs.getString("block_room_id"));
		    	 bean.setBlock_name(rs.getString("block_name"));
		    	 bean.setBlock_description(rs.getString("block_description"));
		         arraylist.add(bean);
		     } 
		}
		 catch (Exception e) {
			System.out.println("Exception at getAllBlock():"+e);
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
	
public Blockss getBlock(String block_id){
		
		if(conn==null) {
			conn=Database.getDatabase();	
		} 
		 Blockss been=null;
		try {
			
			ps=conn.prepareStatement("SELECT * FROM `block_id` WHERE block_id = " + block_id);
		     rs=ps.executeQuery();
		     if(rs.next()) {
		    	 been=new Blockss();
		    	 been.setBlock_id(rs.getInt("block_id"));
		    	 been.setBlock_room_id(rs.getString("block_room_id"));
		    	 been.setBlock_name(rs.getString("block_name"));
		    	 been.setBlock_description(rs.getString("block_description"));
		     }
		     
		} catch (Exception e) {
			System.out.println("Exception at getBlock()"+e);
		}finally {
			rs=null;
			ps=null;
			conn=null;
			
			}
			return been;
		}
	}
	
	
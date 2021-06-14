package com.exam.student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import com.exam.data.Database;


public class StudentDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	public StudentDao()
	{
		
	}
	 @SuppressWarnings("finally")
	public boolean addStudent(StudentBean bean){
		 boolean flag= false;
		if(conn==null) {
			conn=Database.getDatabase();
		} try {
			 String query="INSERT INTO `students_id` (`student_course_id`, `student_rollno`, `student_name`, `student_father_name`, `student_dob`, `student_mobail`, `student_details`) VALUES (?, ?, ?, ?, ?, ?, ?)";
			 ps=conn.prepareStatement(query);
		     ps.setString(1,bean.getStudent_course_id());
		     ps.setString(2,bean.getStudent_rollno());
		     ps.setString(3,bean.getStudent_name());
		     ps.setString(4,bean.getStudent_father_name());
		     ps.setInt(5,bean.getStudent_dob());
		     ps.setInt(6,bean.getStudent_mobail());
		     ps.setString(7,bean.getStudent_details());
		    // ps.setString(4,"");
		     if(ps.executeUpdate()>0) {
		    	 flag=true;
	           }
		} catch (Exception e) {
			System.out.println("Exception at addStudent():"+e);
		} finally { 
			ps=null;
			conn=null;
			return flag;
		}
	 }

	     @SuppressWarnings("finally")
		public boolean deletestudent(String students_id) {
	    	 boolean flag=false;
	    	 if(conn==null) {
	    		 conn =Database.getDatabase();
	    	 }
	    	  try {
	    		  
				
				ps=conn.prepareStatement("DELETE FROM students_id WHERE students_id="+students_id);
		        if(ps.executeUpdate()>0) {
		        	flag=true;
		        }
	    	  } catch (Exception e) {
				System.out.println("Exception at deletestudent():"+e );
			} finally {
				ps=null;
				conn=null;
				return flag;
			}
	     }

	     
	     
	     @SuppressWarnings("finally")
		public boolean updateStudent(StudentBean bean) {
	    		boolean flag=false;
	    		if(conn==null) {
	    			conn=Database.getDatabase();
	    		} try {
	    			 String query="UPDATE `students_id` SET `student_course_id` = ?, `student_rollno` = ?, `student_name` = ?, `student_father_name` = ?, `student_dob` = ?, `student_mobail` = ?, `student_details` = ? WHERE `students_id` = ?";
	    			 ps=conn.prepareStatement(query); 	 
	    			ps.setString(1,bean.getStudent_course_id());
	    		     ps.setString(2,bean.getStudent_rollno());
	    		     ps.setString(3,bean.getStudent_name());
	    		     ps.setString(4,bean.getStudent_father_name());
	    		     ps.setInt(5,bean.getStudent_dob());
	    		     ps.setInt(6,bean.getStudent_mobail());
	    		     ps.setString(7,bean.getStudent_details());
	    		     ps.setInt(8,bean.getStudents_id());
	    		     if(ps.executeUpdate()>0) {
	    		    	 flag=true;
	    	   }
	    		} catch (Exception e) {
	    			System.out.println("Exception at updateStudent()"+e);
	    		} finally { 
	    			ps=null;
	    			conn=null;
	    			return flag;
	    		}
	    	}
		
		@SuppressWarnings("finally")
		public ArrayList<StudentBean> getAllStudent(){
			ArrayList<StudentBean> arraylist=new ArrayList<>();
			if(conn==null) {
				conn=Database.getDatabase();	
			}
			StudentBean bean =null;
			try {
				
				String query="SELECT *FROM students_id";
				 ps=conn.prepareStatement(query);
			     rs=ps.executeQuery();
			     while(rs.next()) {
			    	 bean=new StudentBean();
			    	 bean.setStudents_id(rs.getInt("students_id"));			    	
			    	 bean.setStudent_rollno(rs.getString("student_rollno"));
			    	 bean.setStudent_name(rs.getString("student_name"));
			    	 bean.setStudent_father_name(rs.getString("student_father_name"));
			    	 bean.setStudent_dob(rs.getInt("student_dob"));
			    	 bean.setStudent_mobail(rs.getInt("student_mobail"));
			    	 bean.setStudent_course_id(rs.getString("student_course_id"));
			    	 bean.setStudent_details(rs.getString("student_details"));
			    	 arraylist.add(bean);
			     } 	
			}
			 catch (Exception e) {
				System.out.println("Exception at getAllStudent():"+e);
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
		
	public StudentBean getStudent(String students_id){
			
			if(conn==null) {
				conn=Database.getDatabase();	
			} 
			 StudentBean been=null;
			try {
				
				ps=conn.prepareStatement("SELECT * FROM `students_id` WHERE students_id = " +students_id);
			     rs=ps.executeQuery();
			     if(rs.next()) {
			    	 been=new StudentBean();
			    	 been.setStudents_id(rs.getInt("students_id"));
			    	 been.setStudent_rollno(rs.getString("student_rollno"));
			    	 been.setStudent_name(rs.getString("student_name"));
			    	 been.setStudent_father_name(rs.getString("student_father_name"));
			    	 been.setStudent_dob(rs.getInt("student_dob"));
			    	 been.setStudent_mobail(rs.getInt("student_mobail"));
			    	 been.setStudent_course_id(rs.getString("student_course_id"));
			    	 been.setStudent_details(rs.getString("student_details"));
			     }
			     
			} catch (Exception e) {
				System.out.println("Exception at getStudent()"+e);
			}finally {
				rs=null;
				ps=null;
				conn=null;
				
				}
				return been;
			}
	

	
		}
		



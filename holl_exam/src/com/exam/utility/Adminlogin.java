package com.exam.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.exam.data.Database;

    public class Adminlogin {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet set=null;
	@SuppressWarnings("finally")
	 public boolean adminlogin(String login_user, String login_password) {
		boolean flag = false;
       if(conn==null) {
    	   conn=Database.getDatabase();
       }
        try {
            String SQL = "SELECT login_user FROM login WHERE login_user = ? and login_password=?";
            ps= conn.prepareStatement(SQL);
            ps.setString(1, login_user);
            ps.setString(2, login_password);
            set = ps.executeQuery();
            if (set.next()) {
                flag=true;	
            }
        } catch (Exception e) {
            System.out.println("Exception at adminlogin(): " + e);
        }finally {
      set=null;
      ps=null;
      conn=null;
        return flag; 
        }
    }

    
	public boolean checkLogin(String login_user, String login_password) {
        boolean check = false;
        int count = 0;
        try {
            String SQL = "SELECT * FROM login WHERE login_user = ? and login_password=?";

            ps = conn.prepareStatement(SQL);
            ps.setString(1, login_user);
            ps.setString(2, login_password);
            set = ps.executeQuery();
            while (set.next()) {
                count++;
            }
            if (count > 0) {
                check = true;
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }

        return check;
    }

    public boolean changePassword(String old_password, String new_password, int login_id) {
        boolean check = false;
      
        String tableOldPassword = "";
        try {
            String SQL = "SELECT login_password FROM login WHERE login_id = ?";

            ps = conn.prepareStatement(SQL);
            ps.setInt(1, login_id);

            set = ps.executeQuery();
            while (set.next()) {
                System.out.println("old pass" + set.getString(1));
                tableOldPassword = set.getString(1);
            }
            if (tableOldPassword.equals(old_password)) {
                ps = conn.prepareStatement("UPDATE login SET login_password = ? WHERE login_id = ?");
                ps.setString(1, new_password);
                ps.setInt(2, login_id);
                int i = ps.executeUpdate();
                if(i>0){
                     check = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }

        return check;
    }

}

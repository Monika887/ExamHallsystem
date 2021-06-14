package com.exam.data;

import java.sql.Connection;
import java.sql.DriverManager;


public class Database {
	 private static final String URL="jdbc:mysql://127.0.0.1:3306/exam_stuholl?serverTimezone=UTC";
	 private static final String USER="root";
	 private static final String PWD= "";
   	 private static final String DRIVER="com.mysql.cj.jdbc.Driver";
	 public  static Connection conn=null;
	 
	      static{
		
		try {
			Class.forName(DRIVER);
			 conn=DriverManager.getConnection(URL,USER,PWD);
		}
		catch (Exception e) {
			System.out.println("Connection failed:"+e);
		}
	 }
	      
	      public static Connection getDatabase()
		  {
			  return conn;
		  }
		
			public static void main(String[] args) 
			{
				System.out.print(getDatabase());
			}


			

			
	   }
	
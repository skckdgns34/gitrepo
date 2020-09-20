package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class mainDAO
{	
	Connection conn = null;
	PreparedStatement psmt;
	ResultSet rs;
	
	static mainDAO instance;	
	public static mainDAO getInstance() {
		if (instance == null)
			instance = new mainDAO();
		return instance;
	}
	
	public void select() {
		
	}
}

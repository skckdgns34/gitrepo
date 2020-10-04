package moneyManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
import vo.Books;
import vo.Purchase;

public class MoneyDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static MoneyDAO instance;
	public static MoneyDAO getInstance() {
		if(instance==null)
			instance=new MoneyDAO();
		return instance;
	}
	
	
	

	
}

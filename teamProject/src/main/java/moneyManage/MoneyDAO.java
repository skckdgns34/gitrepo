package moneyManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
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
	
	public ArrayList<Purchase> selectAll(String search_text, String search_type) {
	      ArrayList<Purchase> list = new ArrayList<Purchase>();
	      Purchase purchase = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT P.PURCHASE_NO, P.PURCHASE_PRICE, P.PURCHASE_DATE, P.PURCHASE_CONTENT, E.EMP_NAME, B.TITLE "
	         		+ "FROM PURCHASE P, BOOKS B, EMPLOYEES E "
	         		+ "WHERE P.BOOK_NO = B.BOOK_NO AND P.EMP_NO = E.EMP_NO";    
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	 purchase = new Purchase();
	        	 purchase.setPurchase_no(rs.getString(1));	
	        	 purchase.setPurchase_price(rs.getString(2));	
	        	 purchase.setPurchase_date(rs.getString(3));	
	        	 purchase.setPurchase_content(rs.getString(4));
	        	 purchase.setEmp_name(rs.getString(5));			
	        	 purchase.setTitle(rs.getString(6));	
	             list.add(purchase);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(rs, pstmt, conn);
	      }
	      return list;
	   }
	

	
}

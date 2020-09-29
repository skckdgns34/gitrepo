package moneyManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	
	public Purchase insert (Purchase purchase) {
		Purchase resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'purchase'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			purchase.setPurchase_no(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'purchase'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into purchase (purchase_no, purchase_price, purchase_subject, purchase_date, purchase_status, "
					+ "purchase_content, total_price, company_code, emp_no, count)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, purchase.getPurchase_no());		//거래번호
			pstmt.setString(2, purchase.getPurchase_price());	//단가
			pstmt.setString(3, purchase.getPurchase_subject());	//매입상품명
			pstmt.setString(4, purchase.getPurchase_date());	//매입일자
			pstmt.setString(5, purchase.getPurchase_status());	//매입상태
			pstmt.setString(6, purchase.getPurchase_content());	//비고
			pstmt.setString(7, purchase.getTotal_price());		//총 금액
			pstmt.setString(8, purchase.getCompany_code());		//출판사코드
			pstmt.setString(9, purchase.getEmp_no());			//사원번호
			pstmt.setString(10, purchase.getCount());			//매입수량
			pstmt.executeUpdate();
			conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			ConnectionManager.close(conn);
		}
		return resultVO;
	}
}

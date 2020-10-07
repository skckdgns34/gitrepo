package licence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import common.ConnectionManager;
import vo.PayVO;

public class PayDAO {
	Connection conn;
	PreparedStatement pstmt;

	static LicenceDAO instance;

	public static LicenceDAO getInstance() {
		if (instance == null)
			instance = new LicenceDAO();
		return instance;
	}

	public void insertPay(PayVO payVO) {
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();

			String seqSql = "select no from seq where tablename='pay'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			payVO.setPay_no(Integer.toString(no));

			seqSql = "update seq set no = no + 1 where tablename='pay'";
			stmt = conn.createStatement();
			stmt.execute(seqSql);

			String sql = "insert into pay values(?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, payVO.getPay_no());
			pstmt.setString(2, payVO.getMember_no());
			pstmt.setString(3, payVO.getTicket_code());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 입력");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
}

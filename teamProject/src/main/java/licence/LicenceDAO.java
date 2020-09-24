package licence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Common;


public class LicenceDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static LicenceDAO instance;

	public static LicenceDAO getInstance() {
		if (instance == null)
			instance = new LicenceDAO();
		return instance;
	}

	
	public ArrayList<Common> selectAllLicence(){
		Common common = null;
		ArrayList<Common> list = new ArrayList<Common>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select common_name, code, code_value from common where common_code='0G'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				common = new Common();
				common.setCommon_name(rs.getString(1));
				common.setCode(rs.getString(2));
				common.setCode_value(rs.getString(3));
				list.add(common);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}

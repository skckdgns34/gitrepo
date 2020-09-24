package ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Common;

public class CommonDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static CommonDAO instance;

	public static CommonDAO getInstance() {
		if (instance == null)
			instance = new CommonDAO();
		return instance;
	}
	
	public ArrayList<Common> selectAllGenre() {
		ArrayList<Common> list = new ArrayList<Common>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select code,code_value from common where common_code = '0D'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Common com = new Common();
				com.setCode(rs.getString("code"));
				com.setCode_value(rs.getString("code_value"));
				list.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}

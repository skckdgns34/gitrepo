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
			String sql = "select a.code,a.code_value,nvl(b.cnt,0) " + 
					" from common a left outer join " + 
					" (select genre,count(*) cnt from books where member_no is not null group by genre) b " + 
					" on(a.code=b.genre) " + 
					" where a.common_code='0D'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Common com = new Common();
				com.setCode(rs.getString("code"));
				com.setCode_value(rs.getString("code_value"));
				com.setCount(rs.getString(3));
				list.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public Common selectCodeValue(String code) {
		Common com= null;
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select code_value from common where code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				com = new Common();
				com.setCode_value(rs.getString("code_value"));
			}else {
				System.out.println("없");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return com;
	}
}

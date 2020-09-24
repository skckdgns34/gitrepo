package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.FAQ;
import vo.Member;

public class FAQDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static FAQDAO instance;

	public static FAQDAO getinstance() {
		if (instance == null)
			instance = new FAQDAO();
		return instance;
	}

	// 전체조회
	public ArrayList<FAQ> selectAll(FAQ FAQ) {
		FAQ resultVo = null;
		ResultSet rs = null;
		ArrayList<FAQ> list = new ArrayList<FAQ>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT CONTENTS, TITLE"
					+ " FROM FAQ"
					+ " ORDER BY TITLE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new FAQ();
				resultVo.setContents(rs.getString("CONTENTS"));
				resultVo.setTitle(rs.getString("TITLE"));
				list.add(resultVo);
				System.out.println(rs.getString("CONTENTS"));
				System.out.println(rs.getString("TITLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}


}

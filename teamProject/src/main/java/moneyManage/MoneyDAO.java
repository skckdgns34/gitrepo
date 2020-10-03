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
	
	
	
	//챕 최다 조회수
	public List<Books> selectViews(){
		Books resultVO = null;
		ResultSet rs = null;
		List<Books> list = new ArrayList<Books>(); 
		try {
			conn = ConnectionManager.getConnnect();
			String sql =
					" SELECT TITLE, VIEWS "
					+ " FROM (SELECT TITLE, VIEWS FROM BOOKS ORDER BY VIEWS DESC ) "
					+ " WHERE ROWNUM <= 7 "
					+ " ORDER BY VIEWS DESC ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVO = new Books();
				resultVO.setTitle(rs.getString("title"));
				resultVO.setViews(rs.getString("views"));
				list.add(resultVO);
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	
}

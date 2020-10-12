package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Hopebooks;
import vo.Questions;

public class HopeBookDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static HopeBookDAO instance;
	public static HopeBookDAO getinstance() {
		if (instance == null)
			instance = new HopeBookDAO();
		return instance;
	}

	// 전체조회
	public ArrayList<Hopebooks> selectAll(Hopebooks hopebooks) {
		ArrayList<Hopebooks> list = new ArrayList<Hopebooks>();
		Hopebooks result = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT *"
					+ " FROM hopebooks"
					+ " WHERE member_no = ?"
					+ " ORDER BY 3";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hopebooks.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = new Hopebooks();
				result.setHopebooks_no(rs.getString(1));
				result.setMember_no(rs.getString(2));
				result.setTitle(rs.getString(3));
				result.setWriter(rs.getString(4));
				result.setCompany(rs.getString(5));
				list.add(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	//문의사항 등록
	public int insert (Hopebooks hopebooks) {
		int no = 0;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'hopebooks'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			no = rs.getInt(1);
			hopebooks.setHopebooks_no(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'hopebooks'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into hopebooks"
					+ " values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hopebooks.getHopebooks_no());
			pstmt.setString(2, hopebooks.getMember_no());
			pstmt.setString(3, hopebooks.getTitle());
			pstmt.setString(4, hopebooks.getWriter());
			pstmt.setString(5, hopebooks.getCompany());
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
		return no;
	}

}

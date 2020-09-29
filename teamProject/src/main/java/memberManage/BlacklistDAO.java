
package memberManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import common.ConnectionManager;
import vo.Blacklist;
import vo.Member;

public class BlacklistDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static BlacklistDAO instance;

	public static BlacklistDAO getinstance() {
		if (instance == null)
			instance = new BlacklistDAO();
		return instance;
	}

	// 전체조회
	public List<Blacklist> selectAll(String search_text, String search_type) {
	
		List<Blacklist> list = new ArrayList<Blacklist>(); 
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT B.BLACKLIST_NO, B.MEMBER_NO, M.NICKNAME,  B.BLACKLIST_REASON,  B.LIMIT_DATE " + 
					" FROM BLACKLIST B, MEMBER M " + 
					" WHERE B.MEMBER_NO = M.MEMBER_NO ";
			System.out.println("search_text = " + search_text + ", search_type =" + search_type);
			if (search_text != null && !search_text.equals("")) {
				sql += " WHERE " + search_type + " Like '%" + search_text + "%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Blacklist black = new Blacklist();
				black.setBlacklist_no(rs.getString("blacklist_no"));
				black.setMember_no(rs.getString("member_no"));
				black.setNickname(rs.getString("nickname"));
				black.setBlacklist_reason(rs.getString("blacklist_reason"));
				black.setLimit_date(rs.getString("limit_date"));
				
				
				list.add(black);
				     
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 단건조회
	public Blacklist selectOne(Blacklist black) {
		Blacklist resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT BLACKLIST_NO, BLACKLIST_REASON, MEMBER_NO, LIMIT_DATE"
					+ " FROM BLACKLIST"
					+ " WHERE BLACKLIST_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Blacklist();
				resultVO.setBlacklist_no(rs.getString("blacklist_no"));
				resultVO.setBlacklist_reason(rs.getString("blacklist_reason"));
				resultVO.setMember_no(rs.getString("member_no"));
				resultVO.setLimit_date(rs.getString("limit_date"));
				
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}

	public void delete(Blacklist black) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete blacklist where blacklist_no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public void update(Blacklist black) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update blacklist set blacklist_reason = ?, limit_date= ?  where blacklist_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_reason());
			pstmt.setString(2, black.getLimit_date());
			pstmt.setString(3, black.getBlacklist_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public Member insert(Blacklist black) {
		Blacklist resultVO = null;
		try {

			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			  //보드 번호 조회
	         String seqSql = "select no from seq where tablename= 'blacklist'";
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(seqSql);
	         rs.next();
	         int no = rs.getInt(1);
	         black.setBlacklist_no(Integer.toString(no));
	         
	         
	         //보드 번호 업데이트
	         seqSql = "update seq set no = no + 1 where tablename = 'blacklist'";
	         stmt = conn.createStatement();
	         stmt.executeUpdate(seqSql);

			// 2.sql 구문실행
			/*String sql = "insert into member (blacklist_no, blacklist_reason, member_no, limit_date)"
					+ " values (?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, memberVO.getMember_id());
			pstmt.setString(3, memberVO.getMember_pw());
			pstmt.setString(4, memberVO.getNickname());
			pstmt.setString(5, memberVO.getMember_tel());
			pstmt.setString(6, memberVO.getMember_email());
			pstmt.setString(7, memberVO.getGender());
			int r = pstmt.executeUpdate();*/

			// 3.결과처리
			//System.out.println(r + " 건이 처리됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// 4.연결해제
			ConnectionManager.close(conn);
		}
		return null;
	}

	
}


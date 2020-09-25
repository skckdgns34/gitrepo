package memberManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import common.ConnectionManager;
import vo.Member;

public class MemberManageDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static MemberManageDAO instance;

	public static MemberManageDAO getinstance() {
		if (instance == null)
			instance = new MemberManageDAO();
		return instance;
	}

	// 전체조회
	public List<Member> selectAll(String search_text, String search_type) {
	
		List<Member> list = new ArrayList<Member>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT * FROM MEMBER";
			System.out.println("search_text = " + search_text + ", search_type =" + search_type);
			if (search_text != null && !search_text.equals("")) {
				sql += " WHERE " + search_type + " Like '%" + search_text + "%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setMember_no(rs.getString("MEMBER_NO"));
				member.setMember_id(rs.getString("MEMBER_ID"));
				member.setMember_pw(rs.getString("MEMBER_PW"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setMember_tel(rs.getString("MEMBER_TEL"));
				member.setMember_email(rs.getString("MEMBER_EMAIL"));
				member.setSignup_date(rs.getString("SIGNUP_DATE"));
				member.setTicket_date(rs.getString("TICKET_DATE"));
				member.setLast_access_date(rs.getString("LAST_ACCESS_DATE"));
				member.setGender(rs.getString("GENDER"));
				member.setTicket_code(rs.getString("TICKET_CODE"));
				list.add(member);
				
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 단건조회
	public Member selectOne(Member memberVO) {
		Member resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT MEMBER_NO, MEMBER_ID, MEMBER_PW, NICKNAME, MEMBER_TEL,"
					+ "  MEMBER_EMAIL, SIGNUP_DATE, TICKET_DATE, LAST_ACCESS_DATE, GENDER, TICKET_CODE"
					+ " FROM MEMBER"
					+ " WHERE MEMBER_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Member();
				resultVO.setMember_no(rs.getString("MEMBER_NO"));
				resultVO.setMember_id(rs.getString("MEMBER_ID"));
				resultVO.setMember_pw(rs.getString("MEMBER_PW"));
				resultVO.setNickname(rs.getString("NICKNAME"));
				resultVO.setMember_tel(rs.getString("MEMBER_TEL"));
				resultVO.setMember_email(rs.getString("MEMBER_EMAIL"));
				resultVO.setSignup_date(rs.getString("SIGNUP_DATE"));
				resultVO.setTicket_date(rs.getString("TICKET_DATE"));
				resultVO.setLast_access_date(rs.getString("LAST_ACCESS_DATE"));
				resultVO.setGender(rs.getString("GENDER"));
				resultVO.setTicket_code(rs.getString("TICKET_CODE"));
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

	public void delete(Member memberVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete member where member_id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public void update(Member memberVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set member_pw = ?,nickname = ?, member_email = ?, member_tel = ? where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_pw());
			pstmt.setString(2, memberVO.getNickname());
			pstmt.setString(3, memberVO.getMember_email());
			pstmt.setString(4, memberVO.getMember_tel());
			pstmt.setString(5, memberVO.getMember_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public Member insert(Member memberVO) {
		Member resultVO = null;
		try {

			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			  //보드 번호 조회
	         String seqSql = "select no from seq where tablename= 'member'";
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(seqSql);
	         rs.next();
	         int no = rs.getInt(1);
	         memberVO.setMember_no(Integer.toString(no));
	         
	         //보드 번호 업데이트
	         seqSql = "update seq set no = no + 1 where tablename = 'member'";
	         stmt = conn.createStatement();
	         stmt.executeUpdate(seqSql);

			// 2.sql 구문실행
			String sql = "insert into member (member_no, member_id, member_pw, nickname, member_tel, member_email, gender, signup_date)"
					+ " values (?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, memberVO.getMember_id());
			pstmt.setString(3, memberVO.getMember_pw());
			pstmt.setString(4, memberVO.getNickname());
			pstmt.setString(5, memberVO.getMember_tel());
			pstmt.setString(6, memberVO.getMember_email());
			pstmt.setString(7, memberVO.getGender());
			int r = pstmt.executeUpdate();

			// 3.결과처리
			System.out.println(r + " 건이 처리됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// 4.연결해제
			ConnectionManager.close(conn);
		}
		return resultVO;
	}

	//
	// 메일수신회원수 : select count(id) from member where mailyn='y'
	public int getMailynCnt() {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(member_id) from member where member_email='y'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}

	// 성별인원수 : select gender, count(id) cnt from member group by gender
	public List<HashMap<String, Object>> getGenderCnt() {
		int cnt = 0;
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select gender, count(member_id) cnt from member group by gender";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("gender", rs.getString("gender"));
				map.put("cnt", rs.getInt("cnt"));
			}
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	}

}

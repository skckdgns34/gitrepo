package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import member.MemberDAO;
import vo.Member;
import vo.Notice;

public class NoticeDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
		Connection conn;
		PreparedStatement pstmt;
		
		// 싱글톤(하나 만들어두면 불러와서 계속씀)
		static MemberDAO instance;

		public static MemberDAO getinstance() {
			if (instance == null)
				instance = new MemberDAO();
			return instance;
		}
		
		// 전체조회
		public ArrayList<Notice> selectAll(Notice notice) {
			Notice resultVO = null;
			ResultSet rs = null;
			ArrayList<Notice> list = new ArrayList<Notice>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = " SELECT EMP_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_IMG, VIEW"
						+ " FROM NOTICE"
						+ " ORDER BY EMP_NO";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					resultVO = new Notice();
					resultVO.setEmp_no(rs.getString("MEMBER_NO"));
					resultVO.setNotice_title(rs.getString("MEMBER_ID"));
					resultVO.setNotice_content(rs.getString("MEMBER_PW"));
					resultVO.setNotice_date(rs.getString("NICKNAME"));
					resultVO.setNotice_img(rs.getString("MEMBER_TEL"));
					resultVO.setView(rs.getString("VIEW"));
					list.add(resultVO);
					System.out.println(rs.getString("EMP_NO"));
					System.out.println(rs.getString("NOTICE_TITLE"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}

		// 검색
		public Notice search(Notice notice) {
			Notice resultVO = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql =  " SELECT EMP_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_IMG, VIEW"
						+ " FROM NOTICE"
						+ " WHERE NOTICE_TITLE = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, notice.getNotice_title());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resultVO = new Notice();
					resultVO.setEmp_no(rs.getString("MEMBER_NO"));
					resultVO.setNotice_title(rs.getString("MEMBER_ID"));
					resultVO.setNotice_content(rs.getString("MEMBER_PW"));
					resultVO.setNotice_date(rs.getString("NICKNAME"));
					resultVO.setNotice_img(rs.getString("MEMBER_TEL"));
					resultVO.setView(rs.getString("VIEW"));
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
		

}

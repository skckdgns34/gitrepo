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
		static NoticeDAO instance;

		public static NoticeDAO getinstance() {
			if (instance == null)
				instance = new NoticeDAO();
			return instance;
		}
		
		//전체 건수 
		public int count(Notice notice) {
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String where ="where 1=1";
				if(notice.getNotice_title() !=null) {
					where += " and notice_title like '%' || ? || '%'";
				}
				String sql = "select count(*) from notice" + where;
				pstmt = conn.prepareStatement(sql);
				int pos = 1;
				if(notice.getNotice_title() !=null) {
					pstmt.setString(pos++, notice.getNotice_title());
				}
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(conn);
			}
			return cnt;
		}
		
		// 전체조회(페이징)
		public ArrayList<Notice> selectAll(Notice notice) {
			Notice resultVO = null;
			ResultSet rs = null;
			ArrayList<Notice> list = new ArrayList<Notice>();
			try {
				conn = ConnectionManager.getConnnect();
				String where =" where 1=1";
				if(notice.getNotice_title() !=null) {
					where += " and notice_title like '%' || ? || '%'";
				}
				String sql = "select a.* from(select rownum rn, b.* from ( "
						+ " SELECT EMP_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_IMG, VIEWS"
						+ " FROM NOTICE"
						+ where
						+ " ORDER BY EMP_NO"
						+ ")b)a where rn between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				System.out.println(notice);
				int pos = 1;
				if(notice.getNotice_title() !=null) {
					pstmt.setString(pos++, notice.getNotice_title());
				}
				
				pstmt.setInt(pos++, notice.getFirst());
				pstmt.setInt(pos++, notice.getLast());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					resultVO = new Notice();
					resultVO.setEmp_no(rs.getString("EMP_NO"));					
					  resultVO.setNotice_title(rs.getString("NOTICE_TITLE"));
					  resultVO.setNotice_content(rs.getString("NOTICE_CONTENT"));
					  resultVO.setNotice_date(rs.getString("NOTICE_DATE"));
					  resultVO.setNotice_img(rs.getString("NOTICE_IMG"));
					  resultVO.setViews(rs.getString("VIEWS")); 
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
					resultVO.setEmp_no(rs.getString("EMP_NO"));
					resultVO.setNotice_title(rs.getString("NOTICE_TITLE"));
					resultVO.setNotice_content(rs.getString("NOTICE_CONTENT"));
					resultVO.setNotice_date(rs.getString("NOTICE_DATE"));
					resultVO.setNotice_img(rs.getString("NOTICE_IMG"));
					resultVO.setViews(rs.getString("VIEW"));
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

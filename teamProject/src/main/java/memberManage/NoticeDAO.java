package memberManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
import vo.Books;
import vo.Member;
import vo.Notice;

public class NoticeDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static NoticeDAO instance;

	public static NoticeDAO getinstance() {
		if (instance == null)
			instance = new NoticeDAO();
		return instance;
	}

	// 전체 건수 조회
	public List<Notice> selectAll(Notice noticeVO) {
		
		List<Notice> list = new ArrayList<Notice>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT N.NOTICE_NO, N.NOTICE_TITLE, N.NOTICE_CONTENT,  N.NOTICE_DATE, N.NOTICE_IMG, N.VIEWS, N.EMP_NO,  E.EMP_NAME "
					+ " FROM NOTICE N, EMPLOYEES E "
					+ " WHERE N.EMP_NO = E.EMP_NO ";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNotice_no(rs.getString("notice_no"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getString("notice_date"));
				notice.setNotice_img(rs.getString("notice_img"));
				notice.setViews(rs.getString("views"));
				notice.setEmp_no(rs.getString("emp_no"));
				notice.setEmp_name(rs.getString("emp_name"));
				list.add(notice);			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	//불필요 ㅋ
	public Notice selectOne(Notice noticeVO) {
		Notice resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_IMG,"
					+ "  VIEWS FROM NOTICE WHERE NOTICE_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getNotice_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Notice();
				resultVO.setNotice_no(rs.getString("NOTICE_NO"));
				resultVO.setNotice_title(rs.getString("NOTICE_TITLE"));
				resultVO.setNotice_content(rs.getString("NOTICE_CONTENT"));
				resultVO.setNotice_date(rs.getString("NOTICE_DATE"));
				resultVO.setNotice_img(rs.getString("NOTICE_IMG"));
				resultVO.setViews(rs.getString("VIEWS"));
				
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
	
	
	//insert
	public Notice insert(Notice NoticeVO) {
		Notice resultVO = null;
		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);

			// 보드 번호 조회
			String seqSql = "select no from seq where tablename= 'notice'";
			Statement stmt = conn.createStatement();
			ResultSet  rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			NoticeVO.setNotice_no(Integer.toString(no));
		

			// 보드 번호 업데이트
			seqSql = "update seq set no = no + 1 where tablename = 'notice'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);

			// 2.sql 구문실행
			String sql = " insert into notice (notice_no,  notice_title, notice_content, notice_date, notice_img,emp_no) "
					+ " values (?,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NoticeVO.getNotice_no());
			pstmt.setString(2, NoticeVO.getNotice_title());
			pstmt.setString(3, NoticeVO.getNotice_date());
			pstmt.setString(4, NoticeVO.getNotice_img());
			pstmt.setString(5, NoticeVO.getEmp_no());
			pstmt.executeUpdate();
			
			conn.commit();
			

			// 3.결과처리
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		} finally {

			// 4.연결해제
			ConnectionManager.close(conn);
		}
		return resultVO;
	}
	
	

}

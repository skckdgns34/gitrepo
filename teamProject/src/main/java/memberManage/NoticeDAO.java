package memberManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
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

	// 전체 건수
	public List<Notice> selectAll(Notice noticeVO) {
		
		List<Notice> list = new ArrayList<Notice>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT N.NOTICE_TITLE, N.NOTICE_DATE, N.NOTICE_CONTENT, N.NOTICE_IMG, N.EMP_NO, N.VIEWS, E.EMP_NAME "
					+ " FROM NOTICE N, EMPLOYEES "
					+ " WHERE N.EMP_NO = E.EMP_NO ";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_date(rs.getString("notice_date"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_img(rs.getString("notice_img"));
				notice.setEmp_no(rs.getString("emp_no"));
				notice.setViews(rs.getString("views"));
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

}

package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import vo.Books;
import vo.Mylibrary;
import vo.Mywriting;
import vo.PayVO;

public class MemberBookDAO {	//내서재 등 관련
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static MemberBookDAO instance;

	public static MemberBookDAO getinstance() {
		if (instance == null)
			instance = new MemberBookDAO();
		return instance;
	}
	
	// 나만의 도서 목록 작성중
	public ArrayList<Mywriting> Myselect(Mywriting mywritingVO) {
		Mywriting resultVo = null;
		ResultSet rs = null;
		ArrayList<Mywriting> list = new ArrayList<Mywriting>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT MEMBER_NO, MY_TITLE, MY_WRITE_DATE, code_value "
					+ " FROM (select m.MEMBER_NO, m.MY_TITLE, m.MY_WRITE_DATE,"
					+ " c.code_value, ROW_NUMBER() OVER(PARTITION BY m.member_no ORDER BY m.my_title DESC)  as rn"
					+ " from MYWRITING m, common c"
					+ " WHERE m.genre = c.code )"
					+ " where rn=1"
					+ " and MEMBER_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mywritingVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Mywriting();
				resultVo.setMember_no(rs.getString("MEMBER_NO"));
				resultVo.setMy_title(rs.getString("MY_TITLE"));
				resultVo.setMy_write_date(rs.getString("MY_WRITE_DATE"));
				resultVo.setGenre(rs.getString("code_value"));
				list.add(resultVo);
				System.out.println(rs.getString("MEMBER_NO"));
				System.out.println(rs.getString("MY_TITLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//나만의 도서 목록 등록완료
	public ArrayList<Books> MyBook(Books booksVO) {
		Books resultVo = null;
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT  b.book_no, b.member_no, b.title, b.writer, b.views, b.registration_date, c.code_value"
					+ " FROM books b, common c"
					+ " WHERE c.code = b.genre"
					+ " AND MEMBER_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booksVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Books();
				resultVo.setBook_no(rs.getString("BOOK_NO"));
				resultVo.setMember_no(rs.getString("MEMBER_NO"));
				resultVo.setTitle(rs.getString("TITLE"));
				resultVo.setWriter(rs.getString("writer"));
				resultVo.setViews(rs.getString("VIEWS"));
				resultVo.setRegistration_date(rs.getString("registration_date"));
				resultVo.setGenre(rs.getString("code_value"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//읽던 책
	public ArrayList<Mylibrary> reading(Mylibrary mylibraryVO) {
		Mylibrary resultVo = null;
		ResultSet rs = null;
		ArrayList<Mylibrary> list = new ArrayList<Mylibrary>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT l.member_no, l.book_no, b.book_img, b.title, b.writer"
					+ " FROM mylibrary l, books b"
					+ " WHERE l.book_no = b.book_no"
					+ " and l.last_read_index is not null"
					+ " and l.member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mylibraryVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Mylibrary();
				resultVo.setMember_no(rs.getString("member_no"));
				resultVo.setBook_no(rs.getString("book_no"));
				resultVo.setBook_img(rs.getString("book_img"));
				resultVo.setTitle(rs.getString("title"));
				resultVo.setWriter(rs.getString("writer"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//찜 목록
	public ArrayList<Books>  myLuvList(Books booksVO) {
		Books resultVo = null;
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT rownum, m.member_no, b.book_no, b.title, b.writer, c.code_value, b.views, l.wish"
					+ " FROM member m, books b, mylibrary l, common c"
					+ " WHERE b.book_no = l.book_no"
					+ " AND m.member_no = l.member_no"
					+ " AND c.code = b.genre "
					+ " AND wish = 'y'"
					+ " AND m.member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booksVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Books();
				resultVo.setBook_no(rs.getString("book_no"));
				resultVo.setTitle(rs.getString("title"));
				resultVo.setWriter(rs.getString("writer"));
				resultVo.setGenre(rs.getString("code_value"));
				resultVo.setViews(rs.getString("views"));
				list.add(resultVo);
				resultVo.setNo(rs.getString("rownum"));
				System.out.println(rs.getString("rownum"));
				System.out.println(rs.getString("title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//이용권 내역
	public List<Map<String, Object>> ticketList(String member_no) {
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT rownum, m.member_no, t.ticket_code, t.ticket_name, t.price, p.pay_date, p.pay_date +  t.ticket_date expiration,"
					+ " case when sysdate <  p.pay_date +  t.ticket_date then '이용중' else '기간만료' end US"
					+ " FROM member m, ticket t, pay p"
					+ " WHERE t.ticket_code = p.ticket_code"
					+ " AND m.member_no = p.member_no"
					+ " AND m.member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member_no",rs.getString("member_no"));
				map.put("ticket_code",rs.getString("ticket_code"));
				map.put("ticket_name",rs.getString("ticket_name"));
				map.put("price",rs.getString("price"));
				map.put("pay_date",rs.getString("pay_date"));
				map.put("expiration",rs.getString("expiration"));
				map.put("US",rs.getString("US"));
				list.add(map);
//				System.out.println(rs.getString("rownum"));
//				System.out.println(rs.getString("ticket_name"));
//				System.out.println(rs.getString("US"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	//이용권 만료
	public void status(PayVO payVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " update pay set pay_status = 'n'" 
					 + " where  pay_no in(select p.pay_no"
					 + " FROM member m, ticket t, pay p"
					 + " WHERE t.ticket_code = p.ticket_code"
					 +  " AND m.member_no = p.member_no" 
					 + " and sysdate >  p.pay_date +  t.ticket_date"
					 + " and m.member_no = ?)" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, payVO.getMember_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
}

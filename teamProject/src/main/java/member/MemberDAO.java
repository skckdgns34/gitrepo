package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import common.ConnectionManager;
import vo.Bookmark;
import vo.Member;
import vo.Mylibrary;

public class MemberDAO {
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
	public ArrayList<Member> selectAll(Member memberVO) {
		Member resultVo = null;
		ResultSet rs = null;
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT MEMBER_NO, MEMBER_ID, MEMBER_PW, NICKNAME, MEMBER_TEL"
					+ " MEMBER_EMAIL, SIGNUP_DATE, LAST_ACCESS_DATE, GENDER"
					+ " FROM MEMBER"
					+ " ORDER BY MEMBER_NO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Member();
				resultVo.setMember_no(rs.getString("MEMBER_NO"));
				resultVo.setMember_id(rs.getString("MEMBER_ID"));
				resultVo.setMember_pw(rs.getString("MEMBER_PW"));
				resultVo.setNickname(rs.getString("NICKNAME"));
				resultVo.setMember_tel(rs.getString("MEMBER_TEL"));
				resultVo.setMember_email(rs.getString("MEMBER_EMAIL"));
				resultVo.setSignup_date(rs.getString("SIGNUP_DATE"));
				resultVo.setLast_access_date(rs.getString("LAST_ACCESS_DATE"));
				resultVo.setGender(rs.getString("GENDER"));
				list.add(resultVo);
				System.out.println(rs.getString("MEMBER_NO"));
				System.out.println(rs.getString("NICKNAME"));
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
					+ "  MEMBER_EMAIL, SIGNUP_DATE, LAST_ACCESS_DATE, GENDER"
					+ " FROM MEMBER"
					+ " WHERE MEMBER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
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
				resultVO.setLast_access_date(rs.getString("LAST_ACCESS_DATE"));
				resultVO.setGender(rs.getString("GENDER"));
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
	
	//최종접속일
	public void lastaccessdate(Member memberVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set last_access_date = sysdate"
						+ " where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	//회원탈퇴 PK 제외 null값 처리
	public void delete(Member memberVO) {
		Member resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " update member set member_id = null, member_pw = null, nickname = null, member_tel = null,"
					+ " member_email = null, signup_date = null, last_access_date = null, gender = null"
					+ " where member_id = ?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Member();
				resultVO.setMember_id(rs.getString("MEMBER_ID"));
				resultVO.setMember_pw(rs.getString("MEMBER_PW"));
				resultVO.setNickname(rs.getString("NICKNAME"));
				resultVO.setMember_tel(rs.getString("MEMBER_TEL"));
				resultVO.setMember_email(rs.getString("MEMBER_EMAIL"));
				resultVO.setSignup_date(rs.getString("SIGNUP_DATE"));
				resultVO.setLast_access_date(rs.getString("LAST_ACCESS_DATE"));
				resultVO.setGender(rs.getString("GENDER"));
			} else {
				System.out.println("no data");
			}
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
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

	public void insert(Member memberVO) {
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
	}
	
	//아이디 찾기
	public Member findId(Member memberVO) {
		Member resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " select member_id from member where member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_email());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Member();
				resultVO.setMember_id(rs.getString("MEMBER_ID"));
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
	
	//비밀번호 변경
	public void pwupdate(Member memberVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update member set member_pw = ? where member_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMember_pw());
			pstmt.setString(2, memberVO.getMember_email());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	//회원탈퇴시 비밀번호 확인
		public Member password(Member memberVO) {
			Member resultVO = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = " select member_id from member where member_pw = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberVO.getMember_pw());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resultVO = new Member();
					resultVO.setMember_id(rs.getString("MEMBER_ID"));
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
		
	//아이디 중복검사
		public int memberIdCheck(String idCheck) {
			int cnt = 0;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "  select count(member_id) from member where member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, idCheck);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt(1);					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return cnt;
		}
		
		//아이디 닉네임
				public int memberNiCheck(String NiCheck) {
					int cnt = 0;
					ResultSet rs = null;
					PreparedStatement pstmt = null;
					try {
						conn = ConnectionManager.getConnnect();
						String sql = "  select count(nickname) from member where nickname = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, NiCheck);
						rs = pstmt.executeQuery();
						if(rs.next()) {
							cnt = rs.getInt(1);					
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						ConnectionManager.close(rs, pstmt, conn);
					}
					return cnt;
				}
				
				//아이디 이메일
				public int memberEmCheck(String EmCheck) {
					int cnt = 0;
					ResultSet rs = null;
					PreparedStatement pstmt = null;
					try {
						conn = ConnectionManager.getConnnect();
						String sql = "  select count(member_email) from member where member_email = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, EmCheck);
						rs = pstmt.executeQuery();
						if(rs.next()) {
							cnt = rs.getInt(1);					
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						ConnectionManager.close(rs, pstmt, conn);
					}
					return cnt;
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
	
	//my library꺼 긁어오기
	public ArrayList<Mylibrary> mylibList(String member_no) {
		ArrayList<Mylibrary> list = new ArrayList<Mylibrary>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "select a.mylibrary_no, b.title, a.wish, a.last_read_index,a.book_no, b.writer "
					+ " from mylibrary a, books b "
					+ " where a.book_no = b.book_no and a.member_no = ? "
					+ " and b.audio_path is not null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Mylibrary lib = new Mylibrary();
				lib.setMylibrary_no(rs.getString(1));
				lib.setTitle(rs.getString(2));
				lib.setWish(rs.getString(3));
				lib.setLast_read_index(rs.getString(4));
				lib.setBook_no(rs.getString(5));
				lib.setWriter(rs.getString(6));
				list.add(lib);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public void updateIndex(String index, String member_no, String book_no) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update mylibrary set last_read_index=trunc(?) where member_no =? and book_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, index);
			pstmt.setString(2, member_no);
			pstmt.setString(3, book_no);
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 업데이트됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}

	public int myBookIndex(String book_no, String no) {
		ResultSet rs = null;
		int r = 0;
		try {
		conn = ConnectionManager.getConnnect();
		String sql = "select last_read_index from mylibrary where member_no = ? and book_no = ?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.setString(2, book_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				r = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
		
	}

	public ArrayList<Bookmark> bookMarkList(String book_no, String no) {
		ArrayList<Bookmark> list = new ArrayList<Bookmark>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "select bookmark_no, book_no, bookmark_index, bookmark_contents,rownum from bookmark where book_no=? and member_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_no);
			pstmt.setString(2, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bookmark mark = new Bookmark();
				mark.setBookmark_no(rs.getString(1));
				mark.setBook_no(rs.getString(2));
				mark.setBookmark_index(rs.getString(3));
				mark.setBookmark_contents(rs.getString(4));
				mark.setRownum(rs.getString(5));
				list.add(mark);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//북마크에 추가하는거
	public Bookmark insertBookMark(Bookmark mark) {
		ResultSet rs = null;
		try {
			
			conn = ConnectionManager.getConnnect();
			String seqSql = "select no from seq where tablename='bookmark'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			String no = rs.getString(1);
			mark.setBookmark_no(no);
			
			seqSql = "select count(*)+1 from bookmark where member_no="+mark.getMember_no()+" and book_no="+mark.getBook_no();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			String row_no = rs.getString(1);
			mark.setRownum(row_no);
			
			
			seqSql = "update seq set no = no + 1 where tablename='bookmark'";
			stmt = conn.createStatement();
			stmt.execute(seqSql);
			
			String sql = "insert into bookmark(bookmark_no, member_no, book_no, bookmark_index, bookmark_contents)"
					+ "values(?,?,?,trunc(?),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mark.getBookmark_no());
			pstmt.setString(2, mark.getMember_no());
			pstmt.setString(3, mark.getBook_no());
			pstmt.setString(4, mark.getBookmark_index());
			pstmt.setString(5, mark.getBookmark_contents());
			int r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return mark;
	}

	public void deleteBookM(String bookM_no) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete bookmark where bookmark_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookM_no);
			int r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}

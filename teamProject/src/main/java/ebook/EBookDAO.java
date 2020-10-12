package ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import vo.Books;
import vo.Good;
import vo.Review;
import vo.SearchBook;

public class EBookDAO
{

	Connection conn;
	PreparedStatement pstmt;
	//ResultSet rs = null;

	static EBookDAO instance;

	public static EBookDAO getInstance()
	{
		if (instance == null)
			instance = new EBookDAO();
		return instance;
	}

	public ArrayList<String> selectBookGenre()
	{
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select genre from books";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				String result;
				result = rs.getString("genre");
				list.add(result);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	// 전자책
	public ArrayList<Books> selectAllEBook()
	{
		ResultSet rs = null;
		Books resultVO = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img, writer, epub_path, genre from books where epub_path is not null and genre = ? order by 1 ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())
			{
				resultVO = new Books();
				resultVO.setBook_no(rs.getString(1));
				resultVO.setTitle(rs.getString(2));
				resultVO.setBook_img(rs.getString(3));
				resultVO.setWriter(rs.getString(4));
				resultVO.setEpub_path(rs.getString(5));
				resultVO.setGenre(rs.getString(6));
				list.add(resultVO);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 오디오 북
	public ArrayList<Books> selectAllAudioBook(String genre)
	{
		ResultSet rs = null;
		Books resultVO = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img, writer, audio_path, genre from books where audio_path is not null ";
			if (genre != null)
			{
				sql += "and genre = ? order by 1";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genre);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				resultVO = new Books();
				resultVO.setBook_no(rs.getString(1));
				resultVO.setTitle(rs.getString(2));
				resultVO.setBook_img(rs.getString(3));
				resultVO.setWriter(rs.getString(4));
				resultVO.setAudio_path(rs.getString(5));
				resultVO.setGenre(rs.getString(6));
				list.add(resultVO);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-Book 검색
	public ArrayList<SearchBook> searchBook(String a)
	{
		ResultSet rs = null;
		ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		try
		{
			SearchBook aa = null;
			conn = ConnectionManager.getConnnect();

			String sql = "select 'book', title from books where title like '%' || ? || '%' and epub_path is not null "
					+ " union all "
					+ " select 'writer', writer from books where  writer like '%' || ? || '%' and epub_path is not null "
					+ " union all "
					+ " select 'company', company_name from company c, books b where  c.company_name like '%' || ? || '%' and b.epub_path is not null ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, a);
			pstmt.setString(3, a);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				aa = new SearchBook();
				aa.setResult(rs.getString(1));
				aa.setTitle(rs.getString(2));

				list.add(aa);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-book검색해온 값이 뭔지 체크
	public List<Map<String, Object>> searchBooksEqualTitle(String a)
	{
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, "
					+ " views,score ,genre " + " from books b, company c "
					+ " where b.company_code = c.company_code "
					+ " and b.title= ? " + " and b.epub_path is not null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-Book 검색해온값이 출판사인지 체크
	public List<Map<String, Object>> searchBooksEqualCompany(String a)
	{
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, "
					+ " views,score ,genre " + " from books b, company c "
					+ " where b.company_code = c.company_code "
					+ " and c.company_name= ?"
					+ "  and b.epub_path is not null ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-Book 검색해온값이 저자인지 체크
	public List<Map<String, Object>> searchBooksEqualWriter(String a)
	{
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, "
					+ " views,score ,genre " + " from books b, company c "
					+ " where b.company_code = c.company_code "
					+ " and b.writer= ? " + " and b.epub_path is not null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-Book detail 페이지에서 사용자가 ebook 이용권이 있는지 없는지 체크
	public String checkTicket(Object a)
	{
		ResultSet rs = null;
		String list = "";
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select ticket_code from member m, pay p "
					+ " where m.member_no = p.member_no and rownum=1 and p.ticket_code in('g1','g2','g3','g4') "
					+ " and m.member_no= " + a;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{

				list = rs.getString("ticket_code");

			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// E-Book detail 페이지에서 해당책 상세내용 뿌려주기용
	public ArrayList<Books> detailBook(String b)
	{
		ResultSet rs = null;
		ArrayList<Books> books = new ArrayList<Books>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date,"
					+ " company_code, introduction, summary, views, best_book,genre,registration_date, book_img"
					+ " from books where book_no=" + b;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Books result = new Books();
				result.setBook_no(rs.getString(1));
				result.setTitle(rs.getString(2));
				result.setWriter(rs.getString(3));
				result.setPublication_date(rs.getString(4));
				result.setEpub_path(rs.getString(5));
				result.setIntroduction(rs.getString(6));
				result.setSummary(rs.getString(7));
				result.setViews(rs.getString(8));
				result.setBest_book(rs.getString(9));
				result.setGenre(rs.getString(10));
				result.setRegistration_date(rs.getString(11));
				result.setBook_img(rs.getString(12));
				books.add(result);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return books;
	}

	// 게시글 추천여부 검사
	public int recCheck(String a, String b)
	{
		ResultSet rs = null;
		int result = 0;
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select count(*) from good where book_no=? and member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				result = rs.getInt(1);
			}
		} catch (Exception e)
		{
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}

	// 게시글 추천
	public void recInsert(Good good)
	{
		ResultSet rs = null;
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "insert into good(book_no, member_no, like_count) values(?,?, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good.getBook_no());
			pstmt.setString(2, good.getMember_no());
			System.out.println(good.getMember_no() + "멤버 nonono");
			pstmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
	}

	// 게시글 추천 제거
	public void recDelete(Good good)
	{
		ResultSet rs = null;
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "delete from good where book_no =? and member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good.getBook_no());
			pstmt.setString(2, good.getMember_no());
			pstmt.executeUpdate();
		} catch (Exception e)
		{
			System.out.println("recDelete : " + e);
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
	}

	// 게시글 추천수
	public int recCount(String no)
	{
		int count = 0;
		ResultSet rs = null;
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select count(*) from good where book_no = " + no;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				count = rs.getInt(1);
			}
		} catch (Exception e)
		{
			System.out.println("recCount : " + e);
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return count;
	}

	// eBook Category Ajax 장르라디오 체크시
	public ArrayList<Books> radioCheckGenre(String gen, int first, int last)
	{
		ArrayList<Books> list = new ArrayList<Books>();
		ResultSet rs = null;

		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select a.* from ( select rownum rn, b.* from (  " + 
					"select title, book_no, book_img from books where genre =? and epub_path is not null order by book_no desc "
					+ ") b ) a where rn  between ? and ? "; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gen);
			pstmt.setInt(2, first);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Books books = new Books();
				books.setTitle(rs.getString("title"));
				books.setBook_no(rs.getString("book_no"));
				books.setBook_img(rs.getString("book_img"));
				list.add(books);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// ebook category 체크박스 전체 뿌려주기용
	public ArrayList<Books> raidoAllBooks(int first, int last)
	{
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try
		{
			conn = ConnectionManager.getConnnect();
			String sql = "select a.* from ( select rownum rn, b.* from (  " +
						  "select title, book_no, book_img from books where epub_path is not null order by book_no desc "
						  +  ") b ) a where rn  between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, first);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Books books = new Books();
				books.setTitle(rs.getString("title"));
				books.setBook_no(rs.getString("book_no"));
				books.setBook_img(rs.getString("book_img"));
				list.add(books);
				
			}System.out.println("전체리스트"+list);
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<Map<String, Object>> genreCount(){
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select genre, count(book_no) from books where epub_path is not null group by genre order by genre";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("genre", rs.getString(1));
				map.put("count", rs.getString(2));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int insertReview(Review review) {
		int no = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'review'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			no = rs.getInt(1);
			review.setReview_no(Integer.toString(no));
			
			
			seqSql = "update seq set no = no + 1 where tablename = 'review'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);

			String sql ="insert into review (review_no, contents, review_date, member_no, book_no  )values(?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getReview_no());
			pstmt.setString(2, review.getContents());
			pstmt.setString(3, review.getMember_no());
			pstmt.setString(4, review.getBook_no());
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		} 
		return no;
	}
	
	//insert 하자마자 단건조회해와서 ajax로 뿌려주기
	public Review selectReview(int seqno) {
		Review review = new Review();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql ="select review_no, contents, review_date, member_no, book_no from review where review_no =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seqno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review.setReview_no(rs.getString(1));
				review.setContents(rs.getString(2));
				review.setReview_date(rs.getString(3));
				review.setMember_no(rs.getString(4));
				review.setBook_no(rs.getString(5));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return review;
	}
	
	//review 전체 뿌려주기용
	public ArrayList<Map<String, Object>> selectAllReview(String book_no, int first, int last){
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select a.* from ( select  b.*,rownum rn from (  " + 
					"select r.review_no, r.contents, r.review_date, r.member_no, r.book_no, m.nickname"
					+ " from review r, member m where r.member_no=m.member_no and book_no=? order by review_no desc"
					 +  ") b ) a where rn  between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_no);
			pstmt.setInt(2, first);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("review_no",rs.getString("review_no"));
				map.put("contents",rs.getString("contents"));
				map.put("review_date",rs.getString("review_date"));
				map.put("member_no",rs.getString("member_no"));
				map.put("book_no",rs.getString("book_no"));
				map.put("nickname",rs.getString("nickname"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//베스트셀러인거만 가져오기
	public ArrayList<Books> selectBestBooks(){
		ArrayList<Books> list = new ArrayList<Books>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img from books where best_book='y' and rownum<6 and epub_path is not null order by book_no desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Books books = new Books();
				books.setBook_no(rs.getString(1));
				books.setTitle(rs.getString(2));
				books.setBook_img(rs.getString(3));
				list.add(books);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int count(String a) {
		int result = 0;
		ResultSet rs = null;
		
		try{
			conn = ConnectionManager.getConnnect();	
			String sql = "select count(*) from books where genre = nvl(?,genre)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);				
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	
	public int countReview(String book_no) {
		int result = 0;
		ResultSet rs = null;
		
		try{
			conn = ConnectionManager.getConnnect();	
			String sql = "select count(*) from review where book_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);				
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	
	public int reviewDelete(String review_no) {
		int result = 0;
		try {
			System.out.println(review_no+"이게바로 리뷰 넘버임");
			conn = ConnectionManager.getConnnect();
			String sql = "delete from review where review_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review_no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return result;
	}
	
	public void reviewUpdate(String contents, String review_no) {

		try {
			System.out.println(review_no+"이게바로 리뷰 넘버임");
			System.out.println(contents+"이게 바로 리뷰내용이다");
			conn = ConnectionManager.getConnnect();
			String sql = "update review set contents=? where review_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contents);
			pstmt.setString(2, review_no);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public int reviewDeclaration(String declaration_code,String declaContents,String member_no,String reported_member,String review_no,String book_no) {
		int no =0;
		int aa = 0;
		ResultSet rs =null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'declaration'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			no = rs.getInt(1);
			
			
			seqSql = "update seq set no = no + 1 where tablename = 'declaration'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);

			
			String sql = "insert into declaration(declaration_no, member_no, declaration_content, reported_member, declaration_date, declaration_code, book_no, review_no)"
					   + " values(?,?,?,?,sysdate,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, member_no);
			pstmt.setString(3, declaContents);
			pstmt.setString(4, reported_member);
			pstmt.setString(5, declaration_code);
			pstmt.setString(6, book_no);
			pstmt.setString(7, review_no);
			aa = pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return aa;
	}
	
	

}

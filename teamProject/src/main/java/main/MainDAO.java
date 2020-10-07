package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import common.ConnectionManager;
import vo.Books;

public class MainDAO {
	Connection conn = null;
	PreparedStatement pstmt;

	static MainDAO instance;

	public static MainDAO getInstance() {
		if (instance == null)
			instance = new MainDAO();
		return instance;
	}
	
	 public ArrayList<Books> selectAllBook() {
		ResultSet rs = null;
		Books resultVO = null;
			ArrayList<Books> list = new ArrayList<Books>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select  a.book_no, a.title, a.book_img, a.writer, a.epub_path,"
						+ " lower(a.best_book), a.genre, b.code_value " + 
						" from books a, common b" + 
						" where a.genre = b.code";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					resultVO = new Books();
					resultVO.setBook_no(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setBook_img(rs.getString(3));
					resultVO.setWriter(rs.getString(4));
					resultVO.setEpub_path(rs.getString(5));
					resultVO.setBest_book(rs.getString(6));
					resultVO.setGenre(rs.getString(7));
					resultVO.setCode_value(rs.getString(8));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}

}

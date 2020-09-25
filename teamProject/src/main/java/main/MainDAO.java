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
	ResultSet rs;

	static MainDAO instance;

	public static MainDAO getInstance() {
		if (instance == null)
			instance = new MainDAO();
		return instance;
	}
	
	 public ArrayList<Books> selectAllBook() {
		 Books resultVO = null;
			ArrayList<Books> list = new ArrayList<Books>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select book_no, title, book_img, writer from books ";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					resultVO = new Books();
					resultVO.setBook_no(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setBook_img(rs.getString(3));
					resultVO.setWriter(rs.getString(4));
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

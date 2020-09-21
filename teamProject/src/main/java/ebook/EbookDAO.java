package ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EbookDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static EbookDAO instance;

	public static EbookDAO getInstance() {
		if (instance == null)
			instance = new EbookDAO();
		return instance;
	}

}

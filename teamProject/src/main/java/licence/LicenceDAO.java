package licence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Common;


public class LicenceDAO {

	Connection conn;
	PreparedStatement pstmt;

	static LicenceDAO instance;

	public static LicenceDAO getInstance() {
		if (instance == null)
			instance = new LicenceDAO();
		return instance;
	}
}

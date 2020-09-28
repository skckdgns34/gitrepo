package licence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
import vo.Member;
import vo.TicketVO;

public class TicketDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static TicketDAO instance;

	public static TicketDAO getInstance() {
		if (instance == null)
			instance = new TicketDAO();
		return instance;
	}

	// 단건조회
		public List<TicketVO> selectAll(Member memberVO) {
			List<TicketVO> list = new ArrayList<TicketVO>();
			TicketVO ticketVO = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select ticket_code, ticket_date, member_no from ticket where member_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberVO.getMember_no());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ticketVO = new TicketVO();
					ticketVO.setTicket_code(rs.getString("ticket_code"));
					ticketVO.setTicket_date(rs.getString("ticket_date"));
					ticketVO.setMember_no(rs.getString("member_no"));
					list.add(ticketVO);
				} 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
}

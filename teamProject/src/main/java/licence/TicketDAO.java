package licence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
import vo.PayVO;
import vo.TicketVO;

public class TicketDAO {

	Connection conn;
	PreparedStatement pstmt;

	static TicketDAO instance;

	public static TicketDAO getInstance() {
		if (instance == null)
			instance = new TicketDAO();
		return instance;
	}
	
	//ticekt list
	public List<TicketVO> selectAllList(String no) {
		ResultSet rs = null;
		TicketVO ticketVO = null;
		List<TicketVO> list = new ArrayList<TicketVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select ticket_code, ticket_date, price, ticket_name , "
					+ " nvl((select 1 from pay where ticket_code=ticket.ticket_code and member_no = ?),0) ticketyn "
					+ " from ticket";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ticketVO = new TicketVO();
				ticketVO.setTicket_code(rs.getString(1));
				ticketVO.setTicket_date(rs.getString(2));
				ticketVO.setPrice(rs.getString(3));
				ticketVO.setTicket_name(rs.getString(4));
				ticketVO.setTicketyn(rs.getString(5));

			
				list.add(ticketVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	public List<PayVO> userTicketList(String member_no) {
		ResultSet rs = null;
		PayVO payVO = null;
		List<PayVO> list = new ArrayList<PayVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select pay_no,pay_date, member_no,ticket_code from pay where member_no ="+member_no;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				payVO = new PayVO();
				payVO.setPay_no(rs.getString(1));
				payVO.setPay_date(rs.getString(2));
				payVO.setMember_no(rs.getString(3));
				payVO.setTicket_code(rs.getString(4));
				list.add(payVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}

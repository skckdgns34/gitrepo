package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import vo.Notice;

public class ClientNoticeServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		NoticeDAO dao = new NoticeDAO();
		
		String p = request.getParameter("p");
		String notice_title = request.getParameter("notice_title");
		
		//유효성 체크
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(5);	//한페이지에 몇개가 보일지
		paging.setPageSize(3);	//페이지번호(?)가 한번에 보이는 갯수
		paging.setPage(page);
				
		Notice notice = new Notice();
		notice.setNotice_title(notice_title);
		paging.setTotalRecord(dao.count(notice));
		notice.setFirst(paging.getFirst());
		notice.setLast(paging.getLast());
	
		
		ArrayList<Notice> list = dao.selectAll(notice);
		
		request.setAttribute("list", list);

		request.setAttribute("paging", paging);
		
		request.getRequestDispatcher("client/clientNotice.jsp").forward(request, response);
		
	}

}

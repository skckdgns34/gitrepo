package common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
/*@WebServlet(name="front",
			urlPatterns = "*.do", 
			initParams = 
			{
				@WebInitParam(name = "charset", value="UTF-8")
			})
*/

@MultipartConfig(location = "c:/전자도서관",maxRequestSize = 1024*1024*10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String charset = null;
	HashMap<String, Controller> list = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();
		
		
		
		//조현주
		list.put("/memberModify.do", new member.MemberModifyServ());
		list.put("/memberDelete.do", new member.MemberDeleteServ());
		list.put("/memberBookMark.do", new member.MemberBookMarkServ());
		list.put("/memberBookLuvList.do", new member.MemberBookLuvListServ());
		list.put("/memberCreateBookCk.do", new member.MemberCreateBookCkServ());
		list.put("/memberLogin.do", new member.MemberLoginServ());
		list.put("/memberFind.do", new member.MemberFindServ());
		list.put("/memberJoin.do", new member.MemberJoinServ());
		list.put("/memberPopup.do", new member.MemberPopupServ());
		list.put("/memberLicense.do", new member.MemberLicenseServ());
		list.put("/clientNotice.do", new client.ClientNoticeServ());
		list.put("/clientFAQ.do", new client.ClientFAQServ());
		
		
		//한채빈
		list.put("/adminMain.do", new adminMain.AdminMainServ());
		list.put("/memberManageMain.do", new memberManage.MemberManageMainServ());
		list.put("/memberManageModify.do", new memberManage.MemberManageModifyServ());
		list.put("/memberManageBlackList.do", new memberManage.MemberManageBlackListServ());
		list.put("/memberManageBlackListPop.do", new memberManage.MemberManageBlackListPopServ());
		list.put("/memberManageQuestion.do", new memberManage.MemberManageQuestionServ());
		list.put("/memberManageQuestionPop.do", new memberManage.MemberManageQuestionPopServ());
		list.put("/empManageMain.do", new empManage.EmpManageMainServ());
		list.put("/empManageList.do", new empManage.EmpManageListServ());
		list.put("/empManageModify.do", new empManage.EmpManageModifyServ());
		
		
		//김한범&&내가 범인이다.
		list.put("/clientQuestion.do", new client.ClientQuestionServ());
		list.put("/clientQuestionWtrite.do", new client.ClientQuestionWtriteServ());
		list.put("/clientHopeBook.do", new client.ClientHopeBookServ());
		list.put("/clientHopeBookWrite.do", new client.ClientHopeBookWriteServ());
		list.put("/moneyOutList.do", new moneyManage.MoneyOutListServ());
		list.put("/moneyInList.do", new moneyManage.MoneyInListServ());
		list.put("/bookRegister.do", new bookManage.BookRegisterServ());
		list.put("/bookModify.do", new bookManage.BookModifyServ());
		list.put("/companyMain.do", new company.CompanyMainServ());
		list.put("/companyPop.do", new company.CompanyPopServ());
		
		
		//손용원&&최창훈
		list.put("/main.do", new main.MainServ());
		list.put("/mainsearchResult.do", new main.MainsearchResultServ());
		list.put("/createBookMain.do", new createBook.CreateBookMainServ());
		list.put("/createBook.do", new createBook.CreateBookServ());
		list.put("/createBookWrite.do", new createBook.CreateBookWriteServ());
		list.put("/eBookCategory.do", new ebook.EBookCategoryServ());
		list.put("/eBookDetail.do", new ebook.EBookDetailServ());
		list.put("/eBookReading.do", new ebook.EBookReadingServ());
		list.put("/audioBookCategory.do", new ebook.AudioBookCategoryServ());
		list.put("/audioBookDetail.do", new ebook.AudioBookDetailServ());
		list.put("/audioBookReading.do", new ebook.AudioBookReadingServ());
		list.put("/licenceList.do", new licence.LicenceListServ());
		list.put("/licencePayment.do", new licence.LicencePaymentServ());
	}
	
	public FrontController() {
        super();

    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		String uri = request.getRequestURI(); 		   		// frontWeb/memberInsert.do
		String contextPath = request.getContextPath(); 		// frontWeb
		String path = uri.substring(contextPath.length());  // /memberInsert.do
		Controller subController = list.get(path);
		subController.execute(request, response);
	}

}

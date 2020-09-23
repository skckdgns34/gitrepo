package common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminMain.LoginController;
import adminMain.LoginFormController;
import empManage.EmployeesInsertConrtoller;
import empManage.EmployeesInsertFormController;


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
		list.put("/memberLogout.do", new member.memberLogoutServ());
		list.put("/memberFind.do", new member.MemberFindServ());
		list.put("/memberJoin.do", new member.MemberJoinServ());
		list.put("/memberPopup.do", new member.MemberPopupServ());
		list.put("/memberLicense.do", new member.MemberLicenseServ());
		list.put("/clientNotice.do", new client.ClientNoticeServ());
		list.put("/clientFAQ.do", new client.ClientFAQServ());
		
		
		// 한채빈

				list.put("/adminMain.ad", new adminMain.AdminMainServ()); // 메인
				list.put("/login.ad", new LoginController());
				list.put("/loginForm.ad", new LoginFormController());
				list.put("/memberManageMain.ad", new memberManage.MemberManageMainServ());
				list.put("/memberManageModify.ad", new memberManage.MemberManageModifyServ());
				list.put("/memberManageModifyForm.ad", new memberManage.MemberManageModifyFormServ());				
				list.put("/memberManageBlackList.ad", new memberManage.MemberManageBlackListServ());
				list.put("/memberManageBlackListPop.ad", new memberManage.MemberManageBlackListPopServ());
				list.put("/memberManageQuestion.ad", new memberManage.MemberManageQuestionServ());
				list.put("/memberManageQuestionPop.ad", new memberManage.MemberManageQuestionPopServ());

				list.put("/empManageMain.ad", new empManage.EmpManageMainServ()); // 사원메인??
				list.put("/empManageList.ad", new empManage.EmpManageListServ()); // 사원 목록
				list.put("/employeesInsert.ad", new EmployeesInsertConrtoller());
				list.put("/employeesInsertForm.ad", new EmployeesInsertFormController());
				// list.put("/empManageModify.ad", new empManage.EmpManageModifyServ()); // 사원
				// 수정
		
		//김한범&&내가 범인이다.
		list.put("/clientQuestion.do", new client.ClientQuestionServ());
		list.put("/clientQuestionWtrite.do", new client.ClientQuestionWtriteServ());
		list.put("/clientHopeBook.do", new client.ClientHopeBookServ());
		list.put("/clientHopeBookWrite.do", new client.ClientHopeBookWriteServ());
		list.put("/moneyOutList.do", new moneyManage.MoneyOutListServ());
		list.put("/moneyInList.do", new moneyManage.MoneyInListServ());
		list.put("/bookRegister.do", new bookManage.BookRegisterServ());
		list.put("/bookModify.do", new bookManage.BookModifyServ());
		list.put("/bookDelete.do", new bookManage.BookDeleteServ());
		list.put("/bookList.do", new bookManage.BookListServ());
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
		list.put("/Ajax/mainsearchResultAjax.do", new main.MainSearchResultAjax());
		list.put("/mainsearchResult.do", new main.MainsearchResultServ());
		list.put("/audioBookSearchAfter.do", new ebook.AudioBookSearchAfterServ());
		list.put("/eBookSearchAfter.do", new ebook.EBookSearchAfterServ());
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

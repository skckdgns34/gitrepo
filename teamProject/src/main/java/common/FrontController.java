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

@MultipartConfig(location = "c:/도서저장",maxRequestSize = 1024*1024*10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String charset = null;
	HashMap<String, Controller> list = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();
		
		
		
		//조현주
		list.put("/memberModify.do", new member.memberModifyServ());
		list.put("/memberDelete.do", new member.memberDeleteServ());
		list.put("/memberBookMark.do", new member.memberBookMarkServ());
		list.put("/memberBookLuvList.do", new member.memberBookLuvListServ());
		list.put("/memberCreateBookCk.do", new member.memberCreateBookCkServ());
		list.put("/memberLogin.do", new member.memberLoginServ());
		list.put("/memberFind.do", new member.memberFindServ());
		list.put("/memberJoin.do", new member.memberJoinServ());
		list.put("/memberPopup.do", new member.memberPopupServ());
		list.put("/memberLicense.do", new member.memberLicenseServ());
		list.put("/clientNotice.do", new client.clientNoticeServ());
		list.put("/clientFAQ.do", new client.clientFAQServ());
		
		
		//한채빈
		list.put("/adminMain.do", new adminMain.adminMainServ());
		list.put("/memberManageMain.do", new memberManage.memberManageMainServ());
		list.put("/memberManageModify.do", new memberManage.memberManageModifyServ());
		list.put("/memberManageBlackList.do", new memberManage.memberManageBlackListServ());
		list.put("/memberManageBlackListPop.do", new memberManage.memberManageBlackListPopServ());
		list.put("/memberManageQuestion.do", new memberManage.memberManageQuestionServ());
		list.put("/memberManageQuestionPop.do", new memberManage.memberManageQuestionPopServ());
		list.put("/empManageMain.do", new empManage.empManageMainServ());
		list.put("/empManageList.do", new empManage.empManageListServ());
		list.put("/empManageModify.do", new empManage.empManageModifyServ());
		
		
		//김한범
		list.put("/clientQuestion.do", new client.clientQuestionServ());
		list.put("/clientQuestionWtrite.do", new client.clientQuestionWtriteServ());
		list.put("/clientHopeBook.do", new client.clientHopeBookServ());
		list.put("/clientHopeBookWrite.do", new client.clientHopeBookWriteServ());
		list.put("/moneyOutList.do", new moneyManage.moneyOutListServ());
		list.put("/moneyInList.do", new moneyManage.moneyInListServ());
		list.put("/bookRegister.do", new bookManage.BookRegisterServ());
		list.put("/bookModify.do", new bookManage.BookModifyServ());
		list.put("/companyMain.do", new company.companyMainServ());
		list.put("/companyPop.do", new company.companyPopServ());
		
		
		//손용원&&최창훈
		list.put("/main.do", new main.mainServ());
		list.put("/mainsearchResult.do", new main.mainsearchResultServ());
		list.put("/createBookMain.do", new createBook.createBookMainServ());
		list.put("/createBook.do", new createBook.createBookServ());
		list.put("/createBookWrite.do", new createBook.createBookWriteServ());
		list.put("/eBookCategory.do", new ebook.eBookCategoryServ());
		list.put("/eBookDetail.do", new ebook.eBookDetailServ());
		list.put("/eBookReading.do", new ebook.eBookReadingServ());
		list.put("/audioBookCategory.do", new ebook.audioBookCategoryServ());
		list.put("/audioBookDetail.do", new ebook.audioBookDetailServ());
		list.put("/audioBookReading.do", new ebook.audioBookReadingServ());
		list.put("/licenceList.do", new licence.licenceListServ());
		list.put("/licencePayment.do", new licence.licencePaymentServ());
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

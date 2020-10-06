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
import adminMain.LogoutController;
import empManage.EmployeesInsertConrtoller;
import empManage.EmployeesInsertFormController;

/**
 * Servlet implementation class FrontController
 */
/*
 * @WebServlet(name="front", urlPatterns = "*.do", initParams = {
 * 
 * @WebInitParam(name = "charset", value="UTF-8") })
 */

@MultipartConfig(location = "c:/전자도서관", maxRequestSize = 1024 * 1024 * 10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String charset = null;
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();

		// 이미지 다운로드
		list.put("/filenameDownload.do", new FileDownloadServlet());

		// 조현주
		list.put("/memberModify.do", new member.MemberModifyServ()); // 회원 정보수정
		list.put("/memberDelete.do", new member.MemberDeleteServ()); // 회원 탈퇴
		list.put("/memberDeletePassword.do", new member.MemberDeletePasswordServ());// 회원 탈퇴시 비밀번호 확인
		list.put("/memberBookMark.do", new member.MemberBookMarkServ()); // 내서재 - 읽던책
		list.put("/memberBookLuvList.do", new member.MemberBookLuvListServ()); // 내서재 - 찜목록
		list.put("/memberCreateBookCk.do", new member.MemberCreateBookCkServ()); // 내서재 - 나만의 도서
		list.put("/memberLogin.do", new member.MemberLoginServ()); // 로그인
		list.put("/memberLogout.do", new member.MemberLogoutServ()); // 로그아웃
		list.put("/memberFind.do", new member.MemberFindServ()); // 아이디/비밀번호 찾기 - 아이디 찾기
		list.put("/memberFindemail.do", new member.MemberFindEmailServ()); // 아이디/비밀번호 찾기 - 이메일 보내기
		list.put("/memberFindCheck.do", new member.MemberFindCheckServ()); // 아이디/비밀번호 찾기 - 인증번호 확인
		list.put("/memberFindPassword.do", new member.MemberFindPasswordServ()); // 아이디/비밀번호 찾기 - 비밀번호 번경
		list.put("/memberJoin.do", new member.MemberJoinServ()); // 회원가입
		list.put("/memberPopup.do", new member.MemberPopupServ()); // 알람팝업
		list.put("/memberLicense.do", new member.MemberLicenseServ()); // 내서재 - 이용권
		list.put("/memberLibrary.do", new member.MemberLibraryServ()); // 내서재
		list.put("/clientNotice.do", new client.ClientNoticeServ()); // 공지사항
		list.put("/clientNoticeSelect.do", new client.ClientNoticeSelectServ()); // 공지사항 자세히보기
		list.put("/clientFAQ.do", new client.ClientFAQServ()); // FAQ
		
		

		// 한채빈
		list.put("/adminMain.ad", new adminMain.AdminMainServ()); // admin 메인

		list.put("/viewChart.ad", new adminMain.ViewChartServ()); // 베스트셀러 차트
		list.put("/genderChart.ad", new adminMain.GenderChartServ()); // 성별 비율 차트
		list.put("/ticketChart.ad", new adminMain.TicketChartServ()); // 성별 인기이용권 차트

		list.put("/login.ad", new LoginController()); // admin 로그인
		list.put("/loginForm.ad", new LoginFormController()); // admin 로그인 form
		list.put("/logout.ad", new LogoutController()); // admin 로그아웃

		list.put("/memberManageMain.ad", new memberManage.MemberManageMainServ()); // 회원 관리 메인
		list.put("/memberManageModify.ad", new memberManage.MemberManageModifyServ()); // 회원 관리 수정
		list.put("/memberManageModifyForm.ad", new memberManage.MemberManageModifyFormServ()); // 회원 관리 수정 폼
		list.put("/memberManageDelete.ad", new memberManage.MemberManageDeleteServ()); // 회원 관리 삭제
		list.put("/memberManageBlackList.ad", new memberManage.MemberManageBlackListServ()); // 회원관리 블랙리스트
		list.put("/memberManageBlackListPop.ad", new memberManage.MemberManageBlackListPopServ()); // 회원 관리 블랙리스트 관리
		list.put("/memberManageBlackListPopForm.ad", new memberManage.MemberManageBlackListPopFormServ()); // 블랙리스트 관리수정폼
		list.put("/memberManageQuestion.ad", new memberManage.MemberManageQuestionServ()); // 회원관리 QnA 리스트
		list.put("/memberManageQuestionPop.ad", new memberManage.MemberManageQuestionPopServ()); // 회원관리 QnA 관리
		
		list.put("/memberManageNotice.ad", new memberManage.MemberManageNoticeServ()); // 회원관리 공지리스트
		list.put("/memberManageNoticeInsert.ad", new memberManage.MemberManageNoticeInsertServ()); // 회원관리 공지관리 입력
		list.put("/memberManageNoticeInsertForm.ad", new memberManage.MemberManageNoticeInsertFormServ()); // 회원관리 공지관리 입력

		list.put("/memberManageModify.ad", new memberManage.MemberManageNoticeModifyServ()); // 회원 관리 수정(이름 고쳐야함 ㅠ)
		list.put("/memberManageNoticeForm.ad", new memberManage.MemberManageNoticeFormServ()); // 회원관리 공지관리 수정(이름 고쳐야함 ㅠ)
		
		


		list.put("/empManageMain.ad", new empManage.EmpManageMainServ()); // 사원 관리 리스트
		list.put("/empManageList.ad", new empManage.EmpManageListServ()); // 안 씀?!?!
		list.put("/employeesInsert.ad", new EmployeesInsertConrtoller()); // 사원관리 등록
		list.put("/employeesInsertForm.ad", new EmployeesInsertFormController()); // 사원관리 등록 폼
		list.put("/empManageModify.ad", new empManage.EmpManageModifyServ()); // 사원관리 수정
		list.put("/empManageModifyForm.ad", new empManage.EmpManageModifyFormServ()); // 사원관리 수정 폼
		

		
		// 김한범&&내가 범인이다.
		list.put("/clientQuestion.ad", new client.ClientQuestionServ());
		list.put("/clientQuestionWtrite.ad", new client.ClientQuestionWtriteServ());
		list.put("/clientHopeBook.ad", new client.ClientHopeBookServ());
		list.put("/clientHopeBookWrite.ad", new client.ClientHopeBookWriteServ());
		list.put("/moneyOutList.ad", new moneyManage.MoneyOutListServ());
		list.put("/moneyInList.ad", new moneyManage.MoneyInListServ());

		list.put("/bookRegister.ad", new bookManage.BookRegisterServ()); // ebook 등록
		list.put("/bookRegisterAudio.ad", new bookManage.BookRegisterAudioServ()); // 오디오북 등록
		list.put("/bookModify.ad", new bookManage.BookModifyServ()); // ebook 수정
		// 수정
		list.put("/bookDelete.ad", new bookManage.BookDeleteServ()); // 도서 삭제
		list.put("/bookList.ad", new bookManage.BookListServ()); // 도서 목록
		list.put("/bookSelect.ad", new bookManage.BookSelectServ()); // 도서 선택
		list.put("/bookManage.ad", new bookManage.BookManageServ());// ebook 등록버튼
		list.put("/bookManageAudio.ad", new bookManage.BookManageAudioServ());// 오디오북 등록버튼

		list.put("/companyMain.ad", new company.CompanyMainServ()); // 출판사 목록
		list.put("/companyPop.ad", new company.CompanyPopServ()); // 출판사 수정
		list.put("/companyRegister.ad", new company.CompanyRegisterServ()); // 출판사 등록
		list.put("/companySelect.ad", new company.CompanySelectServ()); // 출판사 선택
		list.put("/companyDelete.ad", new company.CompanyDeleteServ()); // 출판사 삭제
		list.put("/companyManage.ad", new company.CompanyManageServ());// 출판사 등록버튼

		
		
		// 손용원&&최창훈
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
		
		list.put("/licenceAmount.do", new licence.LicenceAmount());
		
		list.put("/Ajax/mainsearchResultAjax.do", new main.MainSearchResultAjax());
		
		list.put("/mainsearchResult.do", new main.MainsearchResultServ());
		
		list.put("/audioBookSearchAfter.do", new ebook.AudioBookSearchAfterServ());
		
		list.put("/eBookSearchAfter.do", new ebook.EBookSearchAfterServ());
		
		list.put("/Ajax/eBookSearchAjax.do", new ebook.EBookSearchAjaxServ());
		
		list.put("/Ajax/audioBookSearchAjax.do", new ebook.AudioBookSearchAjaxServ());
		
		list.put("/Ajax/eBookRecommendation.do", new ebook.EBookRecommendationAjaxServ());
		
		list.put("/eBookRecommendation.do", new ebook.EBookRecommendationServ());
		
		list.put("/Ajax/eBookRecommendationUpdate.do", new ebook.EBookRecommendationUpdateAjaxServ());
		
		list.put("/Ajax/eBookCategoryAjax.do", new ebook.EBookCategoryAjaxServ());
		
		list.put("/Ajax/eBookReview.do", new ebook.EBookReviewAjaxServ());
	}

	public FrontController() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		String uri = request.getRequestURI(); // frontWeb/memberInsert.do
		String contextPath = request.getContextPath(); // frontWeb
		String path = uri.substring(contextPath.length()); // /memberInsert.do
		Controller subController = list.get(path);
		subController.execute(request, response);
	}

}

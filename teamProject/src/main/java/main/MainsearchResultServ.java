package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONArray;
import vo.Books;
import vo.Company;
import vo.SearchBook;

public class MainsearchResultServ implements Controller {

		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		MainDAO dao = new MainDAO();
		String AutoResult = request.getParameter("search");
		
				
 		String writer = "저자";
		String book = "책";
		String company = "출판사";
		if(AutoResult.equals(book)){
			System.out.println("책임");
		}
		else if(AutoResult.equals(writer)) {
			System.out.println("저자임");
		}
		else if(AutoResult.equals(company)) {
			System.out.println("회사이름임");
		}
		
		request.getRequestDispatcher("/main/main.jsp").forward(request, response);
		
		System.out.println(AutoResult);
		
		//dao 3개    sql 1개로 가능함//
		//select bookname, writer, company_name from books a , company b where company_code = company_code
		// 쿼리.writer   쿼리.책이름 
		//select a from d
//		ArrayList<Books> title= dao.searchTitle();
//		ArrayList<Books> writer = dao.searchWriter();
//		ArrayList<Company> company_name = dao.searchCompany();
//		
//		
//		
//		request.getRequestDispatcher("").forward(request, response);
	}
}

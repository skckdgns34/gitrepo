package createBook;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import bookManage.FileRenamePolicy;
import common.Controller;
import vo.Books;
import vo.Mywriting;

public class CreateBookInsertServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		response.sendRedirect("memberCreateBookCk.do");
	}
	

}


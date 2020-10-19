package client;

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
import vo.Questions;

public class ClientQuestionModifyServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Questions questions = new Questions();
		try {
			BeanUtils.copyProperties(questions, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Part part = request.getPart("question_file");
		String question_file = getFilename(part);
		String path = "c:/전자도서관/문의사항";
		//파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, question_file));
		part.write(path +"/" +renameFile.getName());
		if(renameFile.getName().equals("")) {
			questions.setQuestion_file(null);
		}else {
			questions.setQuestion_file(renameFile.getName());
		}
		
		 questions = QuestionDAO.getinstance().update(questions);
		 request.getRequestDispatcher("clientQuestion.do").forward(request, response);
		 

	}
		
	
	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
		if (cd.trim().startsWith("filename")) {
		return cd.substring(cd.indexOf('=') + 1).trim()
		.replace("\"", "");
		}
		}
		return null;
		}

	}


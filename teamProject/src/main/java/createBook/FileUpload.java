package createBook;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bookManage.FileRenamePolicy;
import common.Controller;
import net.sf.json.JSONObject;

public class FileUpload implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		Part part = request.getPart("upload");
		String book_img = getFilename(part);
		String folder = request.getSession().getServletContext().getRealPath("/images"); 
		String path = "./images";
		// 파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(folder, book_img));
		part.write(folder + "/" + renameFile.getName());
		/*
		 * if (renameFile.getName().equals("책표지1")) { // book.setBook_img(null); } else
		 * { //book.setBook_img(renameFile.getName()); }
		 */
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("uploaded", true);
		map.put("url",  path + "/" + renameFile.getName());
		response.getWriter().print(JSONObject.fromObject(map)); 
		
	}
	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}

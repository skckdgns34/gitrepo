package ebook;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class EBookRecommendationServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
		// no와 id값을 map에 저장
//		Map<String, Object> m = new HashMap<>();
//		m.put("no", request.getParameter("no"));
//		m.put("id", request.getParameter("id"));
		
//		BoardDAO manager = BoardDAO.getInstance();
		// 동일 게시글에 대한 이전 추천 여부 검색
//		int result = manager.recCheck(m);
		
//		if(result == 0){ // 추천하지 않았다면 추천 추가
//			manager.recUpdate(m);
//		}else{ // 추천을 하였다면 추천 삭제
//			manager.recDelete(m);
//		}
//		return null;
//	}

	}

}

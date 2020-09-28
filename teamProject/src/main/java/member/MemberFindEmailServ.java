package member;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import vo.Member;

public class MemberFindEmailServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		Member memberVO = new Member();
		String member_id = request.getParameter("member_id");
		String member_email = request.getParameter("member_email");
		memberVO.setMember_email(member_email);
		 //먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		
		Member m = MemberDAO.getinstance().findId(memberVO);
		
		if(m == null) {
			request.setAttribute("errormsg","이메일 정보가 맞지 않습니다.");
			request.setAttribute("loc", "member/memberPassword.jsp");
			request.getRequestDispatcher("member/memberFindPassword.jsp").forward(request, response);
			return;
		}
		
		//mail server 설정
		
		final String host = "smtp.naver.com";
		final String user = "glsk2545@naver.com";	//자신 네이버 아이디
		final String password = "kss01179--";	//자신 네이버 비밀번호
			
		
		//smtp server 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.ssl.enable", true);
		
		//인증번호 생성
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i = 0; i< 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				//a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				 break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
			}
		}
		String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        
        //email 전송
        try {
        	MimeMessage msg = new MimeMessage(session);
        	 msg.setFrom(new InternetAddress(user, "DumBook DamBook"));
        	 msg.addRecipient(Message.RecipientType.TO, new InternetAddress(member_email));
        	 
        	 //메일 제목
        	 msg.setSubject("DumBook DamBook 인증 메일입니다.");
        	 
        	 //메일 내용
        	 msg.setText("인증번호: " + temp);
        	 
        	 Transport.send(msg);
        	 System.out.println("이메일 전송");
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
        
        request.setAttribute("id", member_id);
        request.getRequestDispatcher("/member/memberFindPassword.jsp").forward(request, response);
	}

}

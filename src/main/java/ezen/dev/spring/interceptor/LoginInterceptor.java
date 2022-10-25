package ezen.dev.spring.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

//LoginInterceptor는  Servlet-context.xml에 빈등록을 하므로
//별도의 애노테이션을 붙이지 않음.
public class LoginInterceptor implements HandlerInterceptor {


//HandlerInterceptor 인터페이스에서 JDK8 이후부터는 3개의 메소드를 디폴트 메소드로 정의해 둠.
//preHandle(): 컨트롤러 실행 전, postHandle(): 컨트롤러 실행 후 뷰 실행전,
//afterCompletion():뷰 실행 후에 실행되는 메소드
//이들 가운데 필요한 메소드를 override해서 사용하면 됨.
	
//로그인의 경우는 요청이 처리되기 전에 요청을 체크해야하므로 preHandle()메소드를 사용.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception {
		//요청하는 브라우저의 회원인증 여부를 체크해야 하므로 session객체를 가져와서 처리함
		HttpSession session = request.getSession();
		
		String m_id = (String)session.getAttribute("m_id");
		
		if(m_id == null) {
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chrset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/JJBNB/login.do';</script>");
			out.flush();
			out.close();
			
			response.sendRedirect(request.getContextPath()+"/login.do");
			return false;	//Controller로 사용자 요청이 전달되지 못하도록 함.
		}
				
		return true; //Controller로 사용자 요청이 전달되게 함

	}
	
}

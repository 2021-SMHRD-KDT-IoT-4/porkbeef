package com.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class frontController extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqURI=request.getRequestURI();
		String path=request.getContextPath();
		String resultURI=reqURI.substring(path.length()+1);
		
		//인터페이스 command의이름은 inter
		Command inter =null;
		
		if(resultURI.equals("")) {
			
		}else if(resultURI.equals("")) {
			
		}else if(resultURI.equals("")) {
			
		}else if(resultURI.equals("")) {
			
		}else if(resultURI.equals("")) {
			
		}else if(resultURI.equals("")) {
			
			inter.command(request, response);
		}
		inter.command(request, response);
	}

}

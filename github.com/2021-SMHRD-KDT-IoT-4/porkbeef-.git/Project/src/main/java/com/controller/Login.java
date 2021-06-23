package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.UserDAO;

public class Login implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		
		UserDAO dao = new UserDAO();
		MemberDTO dto = new MemberDTO(mb_id, mb_pw);
		
		MemberDTO user = dao.userLogin(dto);
		
		if(user != null ) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();  
			session.setAttribute("user", user);  
			response.sendRedirect("index.jsp");
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}

package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.UserDAO;

public class UpdateMember implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		int mb_grade = Integer.parseInt(request.getParameter("mb_grade"));
		String mb_nick = request.getParameter("mb_nickName");
	
		UserDAO dao = new UserDAO();
		MemberDTO dto = new MemberDTO(mb_id, mb_pw, mb_grade, mb_nick);
		int cnt = dao.userUpdate(dto);
		
		if (cnt > 0) {
			System.out.println("ȸ������ ���� ����!");
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("ȸ������ ���� ����!");
			response.sendRedirect("member.jsp");
		}
		
	}

}

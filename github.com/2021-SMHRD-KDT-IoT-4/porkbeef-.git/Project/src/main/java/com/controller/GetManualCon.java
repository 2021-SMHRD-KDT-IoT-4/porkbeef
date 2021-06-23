package com.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;


public class GetManualCon implements Command {

	
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");
		
//		int act_feed = Integer.parseInt(request.getParameter("act_feed")); 
//		int act_door = Integer.parseInt(request.getParameter("act_door")); 
//		int act_absor = Integer.parseInt(request.getParameter("act_absor")); 
//		int act_aircon = Integer.parseInt(request.getParameter("act_aircon"));
//		int act_pump = Integer.parseInt(request.getParameter("act_pump")); 
//		int act_boil = Integer.parseInt(request.getParameter("act_boil"));
//		int act_humid = Integer.parseInt(request.getParameter("act_humid")); 
//		int enableGrade = Integer.parseInt(request.getParameter("enableGrade"));
		
		
		Manual_Control_DAO dao = new Manual_Control_DAO();
		Manual_Control_DTO manual = dao.GetManual();
		
		if(manual != null) {
			session.setAttribute("Manual_Control_All", manual);
			System.out.println("성공");
		}else {
			session.invalidate();
			System.out.println("실패");
			
		}
		response.sendRedirect("farmControl.jsp");
		
	}

}


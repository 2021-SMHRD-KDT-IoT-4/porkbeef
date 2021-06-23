package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Model.Automatic_Control_DAO;
import com.Model.Automatic_Control_DTO;

public class Get_Automatic_Con implements Command {

	private Automatic_Control_DAO automatic_DAO = null;
	private Automatic_Control_DTO automatic_DTO = null;

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("EUC-KR");

//		String feed_time = request.getParameter("feed_time");
//		int absor_start = Integer.parseInt(request.getParameter("absor_start"));
//		int absor_stop = Integer.parseInt(request.getParameter("absor_stop"));
//		int aircon_start = Integer.parseInt(request.getParameter("aircon_start"));
//		int aircon_stop = Integer.parseInt(request.getParameter("aircon_stop"));
//		int humid_start = Integer.parseInt(request.getParameter("humid_start"));
//		int humid_stop = Integer.parseInt(request.getParameter("humid_stop"));
//		int boil_start = Integer.parseInt(request.getParameter("boil_start"));
//		int boil_stop = Integer.parseInt(request.getParameter("boil_stop"));
//		int grade = Integer.parseInt(request.getParameter("grade"));

		automatic_DAO = new Automatic_Control_DAO();
		automatic_DTO = automatic_DAO.Automatic_SRead();

		if (automatic_DTO != null) {
			session.setAttribute("Automatic", automatic_DTO);
		}
	}
}

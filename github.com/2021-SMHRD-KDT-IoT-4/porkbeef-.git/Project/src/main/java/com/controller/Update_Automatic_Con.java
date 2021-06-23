package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Model.Automatic_Control_DAO;
import com.Model.Automatic_Control_DTO;

public class Update_Automatic_Con implements Command {

	private Automatic_Control_DAO automatic_DAO = null;
	private Automatic_Control_DTO automatic_DTO = null;

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		String feed_time = request.getParameter("feed_time");
		int absor_start = Integer.parseInt(request.getParameter("absor_start"));
		int absor_stop = Integer.parseInt(request.getParameter("absor_stop"));
		int aircon_start = Integer.parseInt(request.getParameter("aircon_start"));
		int aircon_stop = Integer.parseInt(request.getParameter("aircon_stop"));
		int humid_start = Integer.parseInt(request.getParameter("humid_start"));
		int humid_stop = Integer.parseInt(request.getParameter("humid_stop"));
		int boil_start = Integer.parseInt(request.getParameter("boil_start"));
		int boil_stop = Integer.parseInt(request.getParameter("boil_stop"));

		automatic_DAO = new Automatic_Control_DAO();
		automatic_DTO = new Automatic_Control_DTO(feed_time, absor_start, absor_stop, aircon_start, aircon_stop,
				humid_start, humid_stop, boil_start, boil_stop);

		int state_Check = automatic_DAO.Automatic_SUpdate(automatic_DTO);

		if (state_Check > 0) {
			System.out.println("자동상태 반영 성공");
		} else {
			System.out.println("자동상태 반영 실패");
		}
		response.sendRedirect("farmControl.jsp");
	}
}

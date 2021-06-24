package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Actuator_Status_DAO;
import com.Model.Actuator_Status_DTO;

public class GetActuatorStatusCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");

		Actuator_Status_DAO dao = new Actuator_Status_DAO();
		Actuator_Status_DTO status = dao.GetActuatorStatus();

		if (status != null) {
			session.setAttribute("Actuator_Status_All", status);
			System.out.println("입력 성공");
		} else {
			session.invalidate();
			System.out.println("입력 실패");
		}
		response.sendRedirect("farmControl.jsp");

	}
}

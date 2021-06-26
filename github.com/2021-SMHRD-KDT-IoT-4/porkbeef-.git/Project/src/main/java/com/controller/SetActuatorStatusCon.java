package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Actuator_Status_DAO;
import com.Model.Actuator_Status_DTO;
import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class SetActuatorStatusCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int act_feed = Integer.parseInt(request.getParameter("act_feed"));

		
		
		System.out.println(act_feed);

		HttpSession session = request.getSession();

		Actuator_Status_DTO actuator_Status_All = (Actuator_Status_DTO) session.getAttribute("Actuator_Status_All");

		request.setCharacterEncoding("EUC-KR");

		Actuator_Status_DAO dao = new Actuator_Status_DAO();
		Actuator_Status_DTO now_Status = dao.GetActuatorStatus();
		Actuator_Status_DTO status = actuator_Status_All;

//		System.out.println(actuator_Status_All.getAct_feed());

		int differentAt = cmpStatus(now_Status, status);

		int cnt = dao.SetActuatorStatus(status);

		// 자동-수동제어

		if (cnt > 0) {
			Manual_Control_DAO asDAO = new Manual_Control_DAO();
			Manual_Control_DTO asDTO = asDAO.GetManual();

			Manual_Control_DTO nextASDTO = changeASDTO(asDTO, differentAt); // cnt -> 기능선택번호

			int add = 0;

			while (asDAO.SetManual(nextASDTO) > 0) {
				add++;

				if (add > 10)
					break;
			}
		}

		response.sendRedirect("farmControl.do");

	}

	private int cmpStatus(Actuator_Status_DTO a, Actuator_Status_DTO b) {

		int rtn = -1;

		if (a.getAct_feed() != b.getAct_feed()) {
			rtn = 0;
		}
		if (a.getAct_door() != b.getAct_door()) {
			rtn = 1;
		}
		if (a.getAct_absor() != b.getAct_absor()) {
			rtn = 2;
		}
		if (a.getAct_aircon() != b.getAct_aircon()) {
			rtn = 3;
		}
		if (a.getAct_pump() != b.getAct_pump()) {
			rtn = 4;
		}
		if (a.getAct_boil() != b.getAct_boil()) {
			rtn = 5;
		}
		if (a.getAct_humid() != b.getAct_humid()) {
			rtn = 6;
		}

		return rtn;

	}

	private Manual_Control_DTO changeASDTO(Manual_Control_DTO dto, int num) {

		Manual_Control_DTO rtn = dto;

		if (num == 0)
			rtn.setAct_feed(1);
		if (num == 1)
			rtn.setAct_door(1);
		if (num == 2)
			rtn.setAct_absor(1);
		if (num == 3)
			rtn.setAct_aircon(1);
		if (num == 4)
			rtn.setAct_pump(1);
		if (num == 5)
			rtn.setAct_boil(1);
		if (num == 6)
			rtn.setAct_humid(1);

		return rtn;
	}

}

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

		HttpSession session = request.getSession();

		request.setCharacterEncoding("EUC-KR");

		int num = Integer.parseInt(request.getParameter("actnum"));
		int state = Integer.parseInt(request.getParameter("actState"));

		Actuator_Status_DAO dao = new Actuator_Status_DAO();
		Actuator_Status_DTO now_Status = dao.GetActuatorStatus();
		Actuator_Status_DTO status = now_Status;

		status = setStatus(status, num, state);
		int differentAt = cmpStatus(now_Status, status);

		int cnt = dao.SetActuatorStatus(status);

		// 자동-수동제어

		if (cnt > 0) {
			Manual_Control_DAO asDAO = new Manual_Control_DAO();
			Manual_Control_DTO asDTO = asDAO.GetManual();
			Manual_Control_DTO nextASDTO = changeASDTO(asDTO, differentAt); 

			int add = 0;

			while (asDAO.SetManual(nextASDTO) > 0) {
				add++;

				if (add > 10)
					break;
			}
		}

		response.sendRedirect("farmControl.do");

	}

	private Actuator_Status_DTO setStatus(Actuator_Status_DTO a, int num, int state) {

		if (num == 1) {
			a.setAct_feed(state == 0 ? 1 : 0);
		} else if (num == 2) {
			a.setAct_door(state == 0 ? 1 : 0);
		} else if (num == 3) {
			a.setAct_absor(state == 0 ? 1 : 0);
		} else if (num == 4) {
			a.setAct_aircon(state == 0 ? 1 : 0);
		} else if (num == 5) {
			a.setAct_pump(state == 0 ? 1 : 0);
		} else if (num == 6) {
			a.setAct_boil(state == 0 ? 1 : 0);
		} else if (num == 7) {
			a.setAct_humid(state == 0 ? 1 : 0);
		}
		
		return a;
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

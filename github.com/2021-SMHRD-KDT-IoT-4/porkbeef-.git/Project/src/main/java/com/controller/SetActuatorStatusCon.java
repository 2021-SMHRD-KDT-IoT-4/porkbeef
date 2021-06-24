package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Actuator_Status_DAO;
import com.Model.Actuator_Status_DTO;
import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class SetActuatorStatusCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		int act_feed = Integer.parseInt(request.getParameter("act_feed")); // 밥통
		int act_door = Integer.parseInt(request.getParameter("act_door")); // 축사문
		int act_absor = Integer.parseInt(request.getParameter("act_absor")); // 흡배기
		int act_aircon = Integer.parseInt(request.getParameter("act_aircon")); // 에어컨
		int act_pump = Integer.parseInt(request.getParameter("act_pump")); // 펌프
		int act_boil = Integer.parseInt(request.getParameter("act_boil")); // 보일러
		int act_humid = Integer.parseInt(request.getParameter("act_humid")); // 가습기

		Actuator_Status_DAO dao = new Actuator_Status_DAO();
		Actuator_Status_DTO now_Status = dao.GetActuatorStatus();
		Actuator_Status_DTO status = new Actuator_Status_DTO(act_feed, act_door, act_absor, act_aircon, act_pump,
				act_boil, act_humid);

		int differentAt = cmpStatus(now_Status, status);
		int cnt = dao.SetActuatorStatus(status);
		boolean rtn = false;
		if (cnt > 0) {
			Manual_Control_DAO asDAO = new Manual_Control_DAO();
			Manual_Control_DTO asDTO = asDAO.GetManual();
			Manual_Control_DTO nextASDTO = changeASDTO(asDTO, cnt);
			int add = 0;
			while (asDAO.SetManual(nextASDTO) > 0) {
				add++;
				if (add > 10)break;
			}
			
			if(add < 10) rtn = true;
			
		} else {

		}
		PrintWriter out = response.getWriter();
		
	
		out.print(rtn);

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

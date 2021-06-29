package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class arduinoGetSetPage implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String humi = request.getParameter("h");
		String temp = request.getParameter("t");
		String gas = request.getParameter("h");
		
		

	}

}

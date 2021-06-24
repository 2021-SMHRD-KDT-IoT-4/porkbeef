package com.Front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.controller.Command;
import com.controller.GetDomesticAnimals;
import com.controller.Login;
import com.controller.UpdateMember;

@WebServlet("*.do")
public class front_Controller extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String request_URI = request.getRequestURI();
		String context_Path = request.getContextPath();
		String result_URI = request_URI.substring(context_Path.length() + 1);

		Command _interface = null;

		if (result_URI.equals("Login.do")) {
			_interface = new Login();
		} else if (result_URI.equals("domesticAnimals.do")) {
			_interface = new GetDomesticAnimals();
		} else if (result_URI.equals("updateMember.do")) {
			_interface = new UpdateMember();

			_interface.command(request, response);
		}

	}
}

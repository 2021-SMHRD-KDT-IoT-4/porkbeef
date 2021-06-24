package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Domestic_AnimalsDAO;
import com.Model.Domestic_AnimalsDTO;

public class GetDomesticAnimals implements Command{
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("EUC-KR");
		
		int room=Integer.parseInt(request.getParameter("seq_num")); 				// 방번호
		int product_cnt=Integer.parseInt(request.getParameter("seq_num")); 		// 개체수
		String receving_date=request.getParameter("receving_date"); 	// 입고날짜
		String forwarding_date=request.getParameter("forwarding_date"); // 출고날짜
		String fir_vaccine=request.getParameter("fir_vaccine"); 	// 1차 백신날짜
		String sec_vaccine=request.getParameter("sec_vaccine"); 	// 2차 백신날짜
		String thr_vaccine=request.getParameter("thr_vaccine"); 	// 3차 백신날짜
		int enableGrade=Integer.parseInt(request.getParameter("enableGrade")); 		// 수정 가능 등급
		
		Domestic_AnimalsDAO dao =new Domestic_AnimalsDAO();
		Domestic_AnimalsDTO[] dto  =dao.getinfo();
		
		
		/* Domestic_AnimalsDTO[] domestic_animalsDTO[] = dto.get(dto.length); */
		
		if(dto.length > 1) {
			System.out.println("가축 정보 조회 성공");
			HttpSession session= request.getSession();
			session.setAttribute("animalDB",dto);
		}
		else {
			System.out.println("조회 실패");
		}
		response.sendRedirect("domesticAnimals.jsp");
		
	}
	
}

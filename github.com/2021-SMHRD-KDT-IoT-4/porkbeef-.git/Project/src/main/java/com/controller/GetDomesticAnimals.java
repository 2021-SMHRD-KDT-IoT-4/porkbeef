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
		
		int room=Integer.parseInt(request.getParameter("seq_num")); 				// ���ȣ
		int product_cnt=Integer.parseInt(request.getParameter("seq_num")); 		// ��ü��
		String receving_date=request.getParameter("receving_date"); 	// �԰���¥
		String forwarding_date=request.getParameter("forwarding_date"); // �����¥
		String fir_vaccine=request.getParameter("fir_vaccine"); 	// 1�� ��ų�¥
		String sec_vaccine=request.getParameter("sec_vaccine"); 	// 2�� ��ų�¥
		String thr_vaccine=request.getParameter("thr_vaccine"); 	// 3�� ��ų�¥
		int enableGrade=Integer.parseInt(request.getParameter("enableGrade")); 		// ���� ���� ���
		
		
		
		
		
		
		
		Domestic_AnimalsDAO dao =new Domestic_AnimalsDAO();
		Domestic_AnimalsDTO[] dto  =dao.getinfo();
		
		
		/* Domestic_AnimalsDTO[] domestic_animalsDTO[] = dto.get(dto.length); */
		
		if(dto.length > 1) {
			System.out.println("���� ���� ��ȸ ����");
			HttpSession session= request.getSession();
			session.setAttribute("animalDB",dto);
		}
		else {
			System.out.println("��ȸ ����");
		}
		
		
	}
	
}
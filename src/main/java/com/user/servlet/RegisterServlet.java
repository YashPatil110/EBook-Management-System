package com.user.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.Dao.UserDaoImp;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")

public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			
			//System.out.println(name+" "+email+" "+phno+" "+password);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
				
				UserDaoImp dao = new UserDaoImp(DBConnect.getConn());
				boolean f = dao.userRegister(us);
				if(f) {
					System.out.println("User Register Success..");
					resp.sendRedirect("login.jsp");
					
				} else {
					System.out.println("Something wrong on server..");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

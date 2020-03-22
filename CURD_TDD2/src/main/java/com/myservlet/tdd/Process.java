package com.myservlet.tdd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TDD.Learinig.com.DB_Connection;
import TDD.Learinig.com.IDAO;
import TDD.Learinig.com.UserModels;


public class Process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private IDAO mydao;
    
    public Process() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In DoGET");
		PrintWriter out=response.getWriter();
		String action=request.getPathInfo().toString();
		System.out.println(action);
		
		switch(action) {
		case"/insert": 
			insertRecord(request,response);
			break;
		case"/edit":
			UpdateRecord(request,response);
			System.out.println("edit record");
			break;
		default:
			System.out.println("Path Not Found");
		}
		
	}
	private void insertRecord(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		UserModels models=new UserModels();
		int uid=Integer.parseInt(request.getParameter("id"));
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String uaddres=request.getParameter("addres");
		
		models.setId(uid);
		models.setName(uname);
		models.setEmail(uemail);
		models.setAddre(uaddres);
		
		mydao=new DB_Connection();
		if(mydao.insertingRecords(models))
		{
				
		//	response.sendRedirect("http://localhost:8080/CRUD_UsingTDD/home.jsp");  
			response.sendRedirect("http://localhost:8080/CURD_TDD/home.jsp");

		}
		else
		{
			
			response.sendRedirect("http://localhost:8080/CURD_TDD/register.jsp");  
	    	
		}
	}
	private void  UpdateRecord(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		UserModels models=new UserModels();
		int uid=Integer.parseInt(request.getParameter("id"));
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String uaddres=request.getParameter("addres");

		models.setId(uid);
		models.setName(uname);
		models.setEmail(uemail);
		models.setAddre(uaddres);
		
		mydao=new DB_Connection();
		mydao.editRecords(uid,models);
		
		out.print("<script type='text/javascript'>");
		
		out.print(" window.location='http://localhost:8080/CURD_TDD/home.jsp' ");
		
		out.print("</script>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

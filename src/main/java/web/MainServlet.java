package web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import entity.Admin;



public class MainServlet extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		//��ȡ����·��
		String path = req.getServletPath();
		//����·�������ж�
		if("/admin.do".equals(path)) {
			admin(req,res);
		}else if("/toLogin.do".equals(path)) {
			toLogin(req,res);
			}
		else if("/login.do".equals(path)){
			login(req,res);
		}
		else if("/delete.do".equals(path)){
			delete(req,res);
		}else if("/toRegist.do".equals(path)){
			toRegist(req,res);
		}else if("/regist.do".equals(path)) {	
			try {
				regist(req,res);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("/toFindData.do".equals(path)) {
			toFindData(req,res);
		}else if("/findData.do".equals(path)) {
			findData(req,res);
		}else if("/toUserData.do".equals(path)) {
			toUserData(req,res);
		}else if("/userData.do".equals(path)) {
			userData(req,res);
		}else if("/userHome.do".equals(path)) {
			userHome(req,res);
		}else if("/index.do".endsWith(path)) {
			index(req,res);
		}else if("/News.do".equals(path)) {
			News(req,res);
		}
		else
			try {
				res.setCharacterEncoding("UTF-8");
				req.getRequestDispatcher("WEB-INF/game.jsp").forward(req, res);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	//����ҳ
	private void News(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/News.jsp").forward(req, res);
	}
	
	//δ��¼��ҳ
	private void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, res);
	}
	
	//�û���ҳ
	private void userHome(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/userhome.jsp").forward(req, res);
	}
	
	//�޸��û�����
	private void userData(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		//��req�е������ó���
		String Name =  req.getParameter("Name");
		String Password =  req.getParameter("Password");		
		String Telephone =  req.getParameter("Telephone");
		String Email =  req.getParameter("Email");
		//����Ϣ��װ��ģ����Admin
		Admin a= new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		//����DAO�㣬�����ݱ�������ݿ�
		new AdminDao().update(a);
		//�ض���userhome.do
		res.sendRedirect("userHome.do");
	}
	//�û�����
	private void toUserData(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		AdminDao dao = new AdminDao();
		Admin a = dao.findByName(name);
		System.out.println(a.toString());
		req.setAttribute("ad",a);
		req.getRequestDispatcher("WEB-INF/userdata.jsp").forward(req, res);
	}
	
	//����Ա�鿴
	private void findData(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		//��req�е������ó���
		String Name =  req.getParameter("Name");

		String Password =  req.getParameter("Password");
		
		String Telephone =  req.getParameter("Telephone");
		
		String Email =  req.getParameter("Email");
		
		Admin a = new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		//����DAO�㣬�����ݱ�������ݿ�

		//�ض���admin.do
		res.sendRedirect("admin.do");
	}
	//����Ա�鿴
	private void toFindData(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		System.out.println(name);
		AdminDao dao = new AdminDao();
		Admin a = dao.findByName(name);
		System.out.println(a.toString());
		req.setAttribute("ad",a);
		req.getRequestDispatcher("WEB-INF/finddata.jsp").forward(req, res);
	}
	
	//ע��
	private void regist(HttpServletRequest req, HttpServletResponse res) throws Exception  {
		//����addCost���ݴ���
		req.setCharacterEncoding("utf-8");
		String Name = req.getParameter("Name");
		String Password = req.getParameter("Password");
		String Telephone = req.getParameter("Telephone");
		String Email = req.getParameter("Email");			
		//����Ϣ��װ��ģ���� Admin
		Admin a = new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		
		//����dao�㣬�����ݱ�������ݿ�
		new AdminDao().save(a);
						
		//�ض���login.do
		res.sendRedirect("login.do");
	}
	//����ע��
	private void toRegist(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/regist.jsp").forward(req, res);
	}
	
	//ɾ��
	private void delete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		AdminDao dao = new AdminDao();
		dao.delete(id);
		res.sendRedirect("findData.do");
	}
	
	//��¼
	private void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//��ȡ�û���¼��Ϣ
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username+password);
		//�����û���Ϣȥ�����û�
		AdminDao dao = new AdminDao();
		int a = dao.findByCode(username, password);
		if(a==1) {
			if(username.equals("1")) {
				res.sendRedirect("admin.do");
			}else {
				req.getSession().setAttribute("username",username );
				//����ɹ����ض���userhome.jsp
				//�ض�������ת��
			    req.getRequestDispatcher("WEB-INF/userhome.jsp").forward(req, res);
			}    
		}else {
			//���ʧ��
			/*
			 * ��ʧ�����ݵ�request������
			 * ת����login.JSPҳ�档
			 */
			req.setAttribute("error","�û����������" );
			req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);	
		}
}
	//������¼
	private void toLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
		
	}
	
	//admin��ѯ
	private void admin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//��ѯ���е��û���Ϣ(������Ϣ)
		AdminDao dao = new AdminDao();
		List<Admin> admin = dao.finddata();
		//ͨ��ת������ȥ����Ϣ����JSPչʾ
		//���ת��
		//1�������ݱ�����HttpServletRequset������
		req.setAttribute("ad", admin);
		//2��ת��
		req.getRequestDispatcher("WEB-INF/admin.jsp").forward(req, res);
	}
}


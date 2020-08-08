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
		//获取请求路径
		String path = req.getServletPath();
		//根据路径来做判断
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
	
	//新闻页
	private void News(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/News.jsp").forward(req, res);
	}
	
	//未登录主页
	private void index(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, res);
	}
	
	//用户主页
	private void userHome(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("WEB-INF/userhome.jsp").forward(req, res);
	}
	
	//修改用户资料
	private void userData(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		//将req中的内容拿出来
		String Name =  req.getParameter("Name");
		String Password =  req.getParameter("Password");		
		String Telephone =  req.getParameter("Telephone");
		String Email =  req.getParameter("Email");
		//将信息封装进模板类Admin
		Admin a= new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		//调用DAO层，将数据保存进数据库
		new AdminDao().update(a);
		//重定向到userhome.do
		res.sendRedirect("userHome.do");
	}
	//用户资料
	private void toUserData(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		AdminDao dao = new AdminDao();
		Admin a = dao.findByName(name);
		System.out.println(a.toString());
		req.setAttribute("ad",a);
		req.getRequestDispatcher("WEB-INF/userdata.jsp").forward(req, res);
	}
	
	//管理员查看
	private void findData(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		//将req中的内容拿出来
		String Name =  req.getParameter("Name");

		String Password =  req.getParameter("Password");
		
		String Telephone =  req.getParameter("Telephone");
		
		String Email =  req.getParameter("Email");
		
		Admin a = new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		//调用DAO层，将数据保存进数据库

		//重定向到admin.do
		res.sendRedirect("admin.do");
	}
	//管理员查看
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
	
	//注册
	private void regist(HttpServletRequest req, HttpServletResponse res) throws Exception  {
		//复制addCost内容代码
		req.setCharacterEncoding("utf-8");
		String Name = req.getParameter("Name");
		String Password = req.getParameter("Password");
		String Telephone = req.getParameter("Telephone");
		String Email = req.getParameter("Email");			
		//将信息封装进模板类 Admin
		Admin a = new Admin();
		a.setName(Name);
		a.setPassword(Password);
		a.setEmail(Email);
		a.setTelephone(Telephone);
		
		//调用dao层，将数据保存进数据库
		new AdminDao().save(a);
						
		//重定向到login.do
		res.sendRedirect("login.do");
	}
	//启动注册
	private void toRegist(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/regist.jsp").forward(req, res);
	}
	
	//删除
	private void delete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		AdminDao dao = new AdminDao();
		dao.delete(id);
		res.sendRedirect("findData.do");
	}
	
	//登录
	private void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//获取用户登录信息
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username+password);
		//根据用户信息去查找用户
		AdminDao dao = new AdminDao();
		int a = dao.findByCode(username, password);
		if(a==1) {
			if(username.equals("1")) {
				res.sendRedirect("admin.do");
			}else {
				req.getSession().setAttribute("username",username );
				//如果成功，重定向到userhome.jsp
				//重定向不行用转发
			    req.getRequestDispatcher("WEB-INF/userhome.jsp").forward(req, res);
			}    
		}else {
			//如果失败
			/*
			 * 绑定失败数据到request请求上
			 * 转发给login.JSP页面。
			 */
			req.setAttribute("error","用户名密码错误" );
			req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);	
		}
}
	//启动登录
	private void toLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
		
	}
	
	//admin查询
	private void admin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询所有的用户信息(导入信息)
		AdminDao dao = new AdminDao();
		List<Admin> admin = dao.finddata();
		//通过转发功能去把信息交给JSP展示
		//如何转发
		//1、将数据保存在HttpServletRequset对象上
		req.setAttribute("ad", admin);
		//2、转发
		req.getRequestDispatcher("WEB-INF/admin.jsp").forward(req, res);
	}
}


package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.glassfish.external.probe.provider.StatsProvider;

import entity.Admin;
import util.DBUTils;

public class AdminDao {

	//查找用户信息	
	public List<Admin> finddata(){
			
			Connection conn = null;
			try {
				conn = DBUTils.getConnection();
				PreparedStatement pst = conn.prepareStatement("select * from admin");
				ResultSet rs = pst.executeQuery();
				List<Admin> admin =new ArrayList<Admin>();
				while(rs.next()){
					Admin a = new Admin();
					a.setId(rs.getInt(1));
					a.setName(rs.getString(2));
					a.setPassword(rs.getString(3));
					a.setEmail(rs.getString(4));
					a.setTelephone(rs.getString(5));
					a.setIntime(rs.getTimestamp(6));
					admin.add(a);
				}
				return admin;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBUTils.close(conn);
			}
			return null;

		}
	 
	 //修改
	 public int update(Admin a) {
		 
		 Connection conn = null;
		 try {
		  conn = DBUTils.getConnection();
		  String sql = "update admin set name=?,password=?,email=?,telephone=? where name=?";
		  PreparedStatement pst = conn.prepareStatement(sql);
		  pst.setString(1, a.getName());
		  /*
		   * setInt、setDouble不允许传入null值
		   * 但是我们的数据库允许传入null值
		   * 所以我们进行泛型处理，用setObject
		   */
		  pst.setString(2, a.getPassword());
		  pst.setString(3, a.getEmail());
		  pst.setString(4, a.getTelephone());
		  pst.setString(5, a.getName());
		  int rows = pst.executeUpdate();
		  return rows;
		  
		 } catch (Exception e) {
		  e.printStackTrace();
		 }finally {
		  DBUTils.close(conn);
		 }
		 
		 return 0;
		 
		}
	 
	 // 通过Name查找相应信息回填
	 public Admin findByName(String name) {
		 Connection conn = null;
		 try {
		  conn = DBUTils.getConnection();
		  String sql = "select * from admin where name=?";
		  PreparedStatement pst = conn.prepareStatement(sql);
		  pst.setString(1, name);
		  System.out.println(name);
		  /*
		   * setInt、setDouble不允许传入null值
		   * 但是我们的数据库允许传入null值
		   * 所以我们进行泛型处理，用setObject
		   */
		  ResultSet rs = pst.executeQuery();
		  Admin admin = new Admin();
		  while(rs.next()) {   
//			  System.out.println("1");
		   admin.setName(rs.getString(2));
		   admin.setPassword(rs.getString(3));
		   admin.setEmail(rs.getString(4));
		   admin.setTelephone(rs.getString(5));
		   
		  }
		  return admin;
		  
		 } catch (Exception e) {
		  e.printStackTrace();
		 }finally {
		  DBUTils.close(conn);
		 }
		 
		 return null;
		}
	 
	 //存储
	 public int save(Admin a) {
		 
		 Connection conn = null;
		 try {
		  conn = DBUTils.getConnection();
		  String sql = "insert into admin values(NULL,?,?,?,?,DEFAULT)";
		  PreparedStatement pst = conn.prepareStatement(sql);
		  pst.setString(1, a.getName());
		  pst.setString(2, a.getPassword());
		  pst.setString(3, a.getEmail());
		  pst.setString(4, a.getTelephone());
		  int rows = pst.executeUpdate();
		  return rows;
		  
		 } catch (Exception e) {
		  e.printStackTrace();
		 }finally {
		  DBUTils.close(conn);
		 }
		 
		 return 0;
		}
	 
	 //登录
	 public int findByCode(String username,String password) {
			
			Connection conn = null;
			try {
				conn=DBUTils.getConnection();
				String sql="select * from admin where name=? and password=?";
				//DEFFUT, 自动获得当前时间
				PreparedStatement pst=conn.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);   
				ResultSet rs = pst.executeQuery();
				if(rs.next()) {
					return 1;
				}else {
					return 0;
				}
			} catch (Exception e) {	
				e.printStackTrace();
			}finally {
				DBUTils.close(conn);
			}
			 return 0;
			
		}
	 
	 //删除
	 public int delete(int id) {
		    Connection conn = null;
		    try {
		     conn = DBUTils.getConnection();
		     PreparedStatement pst = null;
		     // 获取传输器对象
		     pst = conn.prepareStatement("delete from admin where id=?");
		     pst.setInt(1, id);
		     int rows = pst.executeUpdate();
		     if (rows > 0)
		      return 1;
		    } catch (Exception e) {
		     // TODO Auto-generated catch block
		     e.printStackTrace();
		    } finally {
		     DBUTils.close(conn);
		    }
		    return 0;
		   }
	 
//		//登录从页面获取账号name和密码password
//	 public int findLogin(String name,String password) {
//	  Connection conn = null;
//	  try {
//	   conn = DBUTils.getConnection();
//	   PreparedStatement pst = null;
//	   ResultSet rs = null;
//	   //查找
//	   pst = conn.prepareStatement("select * from admin where name=? and password=?");
//	   // 设置参数
//	   pst.setString(1,name);
//	   pst.setString(2, password);
//	   rs = pst.executeQuery();
//	   if (rs.next()) {
//	    return 1;
//	   } else {
//	    return 0;
//	   }
//	  } catch (Exception e) {
//	   e.printStackTrace();
//	  } finally {
//	   DBUTils.close(conn);
//	  }
//	  return 0;
//	 }
//	 
//	//注册函数，从页面获取，name,password,email,telephone；
//	 public int findRegist(Admin a) {
//	  Connection conn = null;
//	  try {
//	   conn = DBUTils.getConnection();
//	   PreparedStatement pst = null;
//	   ResultSet rs = null;
//	   // 获取传输器对象
//	   pst =conn.prepareStatement("insert into admin values(NULL,?,?,?,?,default)");
//	   pst.setString(1, a.getName());
//	   pst.setString(2, a.getPassword());
//	   pst.setString(3, a.getEmail());
//	   pst.setString(4, a.getTelephone());
//	   int rows=pst.executeUpdate();
//	   return rows;
//	  } catch (Exception e) {
//	   e.printStackTrace();
//	  }finally {
//	   DBUTils.close(conn);
//	  }
//	  return 0;
//	 }
	 
}

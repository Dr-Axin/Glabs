package util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class DBUTils {
	//����һ�����ӳض���
	private static BasicDataSource bds;
	static{
//		��ȡ���Ӳ���
		try {
			Properties p=new Properties();
			p.load(DBUTils.class.getClassLoader().getResourceAsStream("db.properties"));
			String driver=p.getProperty("driver");
			String url=p.getProperty("url");
			String username=p.getProperty("username");
			String password=p.getProperty("password"); 
													//"3"
			int initSize=Integer.parseInt(p.getProperty("initSize"));
			int maxActive=Integer.parseInt(p.getProperty("maxActive"));
			bds=new BasicDataSource();
			bds.setDriverClassName(driver);
			bds.setUrl(url);
			bds.setUsername(username);
			bds.setPassword(password);
			bds.setInitialSize(initSize);//��ʼ����������
			bds.setMaxActive(maxActive);//�����������
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//�÷��������������Ĺرյ�����,���ǰ����ӹ黹�����ӳ�
	public static void close(Connection conn){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//����һ�������ӳع��������
	public static Connection getConnection() throws SQLException{
		return bds.getConnection();
	}
}

package entity;

import java.sql.Timestamp;

public class Admin {

	private Integer Id;
	private String Name;
	private String Password;
	private String Email;
	private String Telephone;
	private Timestamp Intime;
	
	public Admin() {
		super();
	}
	@Override
	public String toString() {
		return "Admin [Id=" + Id + ", Name=" + Name + ", Password=" + Password + ", Email=" + Email + ", Telephone="
				+ Telephone + ", Intime=" + Intime + "]";
	}
	public Admin(Integer id, String name, String password, String email, String telephone, Timestamp intime) {
		super();
		Id = id;
		Name = name;
		Password = password;
		Email = email;
		Telephone = telephone;
		Intime = intime;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTelephone() {
		return Telephone;
	}
	public void setTelephone(String telephone) {
		Telephone = telephone;
	}
	public Timestamp getIntime() {
		return Intime;
	}
	public void setIntime(Timestamp intime) {
		Intime = intime;
	}
}

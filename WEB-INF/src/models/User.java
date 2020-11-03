package models;

import java.sql.*;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class User{
	private Integer userId;
	private String userName;
	private String firstName;
	private String middleName;
	private String lastName;
	private String email;
	private String password;
	private Date dob;
	private Status status;
	private UserType userType;
	private String activationCode;
	private String mobile;
	private String profpic;
	
	public User(){
		
	}

	public User(String userName, String email, String password) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
	}



	//getter setter
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserType(UserType userType){
		this.userType = userType; 
	}

	public UserType getUserType(){
		return userType;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public void setMobile(String mobile){
		this.mobile = mobile;
	}

	public String getMobile(){
		return mobile;
	}

	public void setProfpic(String profpic){
		this.profpic = profpic;
	}

	public String getProfpic(){
		return profpic;
	}

	public boolean saveProfile(){
		boolean flag = false;
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomdb?user=root&password=1234");

			String query = "update users set first_name=?,middle_name=?,last_name=?,dob=?,mobile=? where user_id=?";

			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1,firstName);
			pst.setString(2,middleName);
			pst.setString(3,lastName);
			pst.setDate(4,dob);
			pst.setString(5,mobile);
			pst.setInt(6,userId);
			int res = pst.executeUpdate();
			if(res==1){
				flag = true;
			}	
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}	
		return flag;
	}

	
	public static boolean checkUniqueKey(String key){
		Connection con = null;
		boolean flag = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomdb?user=root&password=1234");
			
			String query = "select user_id from users where username=? or email=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,key);
			pst.setString(2,key);
			ResultSet rs = pst.executeQuery();
			System.out.println(rs);
			if(rs.next()){
				flag = true;
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}
			catch(SQLException e){e.printStackTrace();}
		}
		return flag;
	}

	
	
	
	public static User loginUser(String usernameOrEmail, String password){
		User user = null;
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomdb?user=root&password=1234");
			String query = "select password,user_id,username,email,first_name,middle_name,last_name,dob,user_type_id,status_id,mobile from users where username=? or email=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, usernameOrEmail);
			pst.setString(2, usernameOrEmail);

			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				String encpsw = rs.getString(1);
				StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
				if(spe.checkPassword(password,encpsw)){
					user = new User();
					user.setUserId(rs.getInt(2));
					user.setUserName(rs.getString(3));
					user.setEmail(rs.getString(4));
					user.setFirstName(rs.getString(5));
					user.setMiddleName(rs.getString(6));
					user.setLastName(rs.getString(7));
					user.setDob(rs.getDate(8));
					user.setUserType(new UserType(rs.getInt(9)));
					user.setStatus(new Status(rs.getInt(10)));
					user.setMobile(rs.getString(11));
				}
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){ e.printStackTrace(); }
		}
		return user;
	}

	
	
	public boolean saveUser(){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomdb?user=root&password=1234");
			String query = "insert into Users (username, email, password) value (?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, userName);
			pst.setString(2, email);
			StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
			pst.setString(3,spe.encryptPassword(password));
			pst.executeUpdate();
			flag = true;

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }
		}
		return flag;
	}
}
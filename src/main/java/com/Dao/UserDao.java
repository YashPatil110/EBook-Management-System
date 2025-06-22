package com.Dao;

import com.entity.User;

public interface UserDao {

	public boolean userRegister(User us);
	
	public User login(String email,String password);

	boolean checkPassword(int id,String ps);
	
	public boolean updateProfile(User us);

}

package cn.dao;

import cn.entity.User;

public interface UserDao extends GenericDao<User>{
	public boolean isExists(String username);
}

package cn.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.UserDao;
import cn.entity.User;

@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}

	@Override
	public boolean isExists(String username) {
		boolean flag=false;
		String hql="from User u where u.username=?";
		List<User> list=getByHql(hql, username);
		if(list!=null && list.size()>0){
			flag=true;
		}
		return flag;
	}
}

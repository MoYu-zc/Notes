package cn.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.TagsDao;
import cn.dao.UserDao;
import cn.entity.Tags;
import cn.entity.User;

@Repository("tagsDao")
public class TagsDaoImpl extends GenericDaoImpl<Tags> implements TagsDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}
	@Override
	public boolean isExists(String tagname) {
		boolean flag=false;
		String hql="from Tags b where b.tagname=?";
		List<Tags> list=getByHql(hql, tagname);
		if(list!=null && list.size()>0){
			flag=true;
		}
		return flag;
	}
}

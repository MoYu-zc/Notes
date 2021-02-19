package cn.dao;

import cn.entity.Tags;

public interface TagsDao extends GenericDao<Tags>{
	public boolean isExists(String tagname);
}

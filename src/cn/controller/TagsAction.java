package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;

import cn.dao.TagsDao;
import cn.dao.TagsDao;
import cn.dao.UserDao;
import cn.entity.Docs;
import cn.entity.User;
import cn.entity.Tags;
import cn.util.Const;
import cn.util.PageBean;

@Controller("tagsAction")
@Scope("prototype")
public class TagsAction extends BaseAction {
	private Integer id;
	private Tags tags=new Tags();
	private List<Tags> list=new ArrayList<Tags>();
	private PageBean pageBean=new PageBean();
	@Autowired
	@Qualifier("tagsDao")
	private TagsDao tagsDao;
	
	public String add(){
		tags.setStatus(0);
		tagsDao.add(tags);
		return "list";
	}
	//列表
	public String list() {
		String hqlCount="select count(*) from Tags u where 1=1";
		String hql = "from Tags u where 1=1";
		
		pageBean.setTotalCount(tagsDao.getCount(hqlCount));
		list = tagsDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		return SUCCESS;
	}
	
	//屏蔽
	public String pb() {
		Tags b=tagsDao.get(Tags.class, id);
		b.setStatus(1);
		tagsDao.update(b);
		return "list";
	}
	//取消屏蔽
	public String qxpb() {
		Tags b=tagsDao.get(Tags.class, id);
		b.setStatus(0);
		tagsDao.update(b);
		return "list";
	}
	public String jsondetail() throws IOException {
		Tags b=tagsDao.get(Tags.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSONObject.toJSONString(b));
		out.close();
		return null;
	}
	//修改
	public String update() {
		tagsDao.merge(tags);
		return "list";
	}
	public String delete() {
		Tags tags=tagsDao.get(Tags.class, id);
		tagsDao.delete(tags);
		return "list";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Tags getTags() {
		return tags;
	}

	public void setTags(Tags tags) {
		this.tags = tags;
	}

	public List<Tags> getList() {
		return list;
	}

	public void setList(List<Tags> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public TagsDao getTagsDao() {
		return tagsDao;
	}

	public void setTagsDao(TagsDao tagsDao) {
		this.tagsDao = tagsDao;
	}
	
}

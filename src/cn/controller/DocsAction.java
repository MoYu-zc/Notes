package cn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.dao.TagsDao;
import cn.dao.DocsDao;
import cn.dao.UserDao;
import cn.entity.Docs;
import cn.entity.Tags;
import cn.entity.User;
import cn.util.Const;
import cn.util.PageBean;

@Controller("docsAction")
@Scope("prototype")
public class DocsAction extends BaseAction {
	private Integer id;
	private String keyword;
	private String[] tags;
	private Docs docs=new Docs();
	private List<Docs> list=new ArrayList<Docs>();
	private PageBean pageBean=new PageBean();
	private String filename;
	@Autowired
	@Qualifier("docsDao")
	private DocsDao docsDao;
	@Autowired
	@Qualifier("tagsDao")
	private TagsDao tagsDao;
	//详情
	public String detail(){
		docs=docsDao.get(Docs.class, id);
		return "detail";
	}
	//列表到index查看共享的
	public String search() {
		String hqlCount="select count(*) from Docs u where u.isdel=0 and u.status=1";
		String hql = "from Docs u where u.isdel=0 and u.status=1";
		if(keyword!=null && !"".equals(keyword)){		
			hqlCount+=" and exists(from Tags t where t.tagname='"+keyword+"' and t.status=0) and u.tags like '%"+keyword+"%'";
			hql+=" and exists(from Tags t where t.tagname='"+keyword+"' and t.status=0) and u.tags like '%"+keyword+"%'";
		}
			
		pageBean.setTotalCount(docsDao.getCount(hqlCount));
		list = docsDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		//查询所有分类显示
//		List<Tags> tagsList=tagsDao.getByHql("from Tags k where k.isdel=0");
//		session.setAttribute("tagsList", tagsList);
		return "index";
	}
	
	//后台管理
	public String list() {
		String hqlCount="select count(*) from Docs u where u.isdel=0";
		String hql = "from Docs u where u.isdel=0";
		//通过Tags查
		if(keyword!=null && !"".equals(keyword)){		
			hqlCount+=" and u.tags like '%"+keyword+"%'";
			hql+=" and u.tags like '%"+keyword+"%'";
		}
		hqlCount+=" order by u.doctime desc";
		hql+=" order by u.doctime desc";
		pageBean.setTotalCount(docsDao.getCount(hqlCount));
		list = docsDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		return SUCCESS;
	}
	
	//我的list
	public String mylist() {
		int role=(Integer)session.getAttribute("role");
		String hqlCount="select count(*) from Docs u where u.isdel=0";
		String hql = "from Docs u where u.isdel=0";
		//查看自己的
		if(role==1){
			User user=(User)session.getAttribute("currentUser");
			hqlCount+=" and u.user.id="+user.getId();
			hql+=" and u.user.id="+user.getId();
		}
		//通过Tags查
		if(keyword!=null && !"".equals(keyword)){		
			hqlCount+=" and u.tags like '%"+keyword+"%'";
			hql+=" and u.tags like '%"+keyword+"%'";
		}
		hqlCount+=" order by u.doctime desc";
		hql+=" order by u.doctime desc";
		pageBean.setTotalCount(docsDao.getCount(hqlCount));
		list = docsDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		return "mylist";
	}
	
	public String add() {
		User user=(User)session.getAttribute("currentUser");
		docs.setUser(user);
		docs.setDoctime(Const.getCurrentTime());
		docs.setIsdel(0);
		docs.setStatus(0);//0未共享，1已共享，2已屏蔽
		docsDao.add(docs);
		request.setAttribute("msg", "添加成功!");
		
		//添加Tags
		String[] tags=docs.getTags().split(",");
		for(int i=0;i<tags.length;i++){
			Tags tag=new Tags();
			tag.setTagname(tags[i]);
			tag.setStatus(0);
			//不存在就添加
			if(!tagsDao.isExists(tags[i])){
				tagsDao.add(tag);
			}
		}
		
		return "tomylist";
	}

	//下载时请求访问的方法
	public String download() throws IOException {
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		File file=new File(realpath+"/"+filename);
		if(!file.exists()){
			session.setAttribute("docsmsg", "文档不存在!");
			response.sendRedirect("docs_search.action");
			return null;
		}
		return "download";
	}
	
	//下载的方法返回值一定是InputStream
	public InputStream getInputStream(){
		InputStream fis=null;
		//得到真实路径
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		File file=new File(realpath+"/"+filename);
		try {
			fis=new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fis;
	}
	//共享
	public String gx() {
		Docs b=docsDao.get(Docs.class, id);
		b.setStatus(1);
		docsDao.update(b);
		return "tomylist";
	}
	//取消共享
	public String qxgx() {
		Docs b=docsDao.get(Docs.class, id);
		b.setStatus(0);
		docsDao.update(b);
		return "tomylist";
	}
	//屏蔽
	public String pb() {
		Docs b=docsDao.get(Docs.class, id);
		b.setStatus(2);
		docsDao.update(b);
		return "list";
	}
	//取消屏蔽
	public String qxpb() {
		Docs b=docsDao.get(Docs.class, id);
		b.setStatus(1);
		docsDao.update(b);
		return "list";
	}
	
	public String jsondetail() throws IOException {
		Docs b=docsDao.get(Docs.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSONObject.toJSONString(b));
		out.close();
		return null;
	}
	public String toupdate() {
		docs=docsDao.get(Docs.class, id);
		return "update";
	}
	//修改
	public String update() {
		docsDao.merge(docs);
		
		String[] tags=docs.getTags().split(",");
		for(int i=0;i<tags.length;i++){
			Tags tag=new Tags();
			tag.setTagname(tags[i]);
			tag.setStatus(0);
			//不存在就添加
			if(!tagsDao.isExists(tags[i])){
				tagsDao.add(tag);
			}
		}
		return "tomylist";
	}
	//删除
	public String delete() {
		Docs b=docsDao.get(Docs.class, id);
		b.setIsdel(1);
		docsDao.update(b);
		return "tomylist";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Docs getDocs() {
		return docs;
	}
	public void setDocs(Docs docs) {
		this.docs = docs;
	}
	public List<Docs> getList() {
		return list;
	}
	public void setList(List<Docs> list) {
		this.list = list;
	}

	public DocsDao getDocsDao() {
		return docsDao;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String[] getTags() {
		return tags;
	}
	public void setTags(String[] tags) {
		this.tags = tags;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public TagsDao getTagsDao() {
		return tagsDao;
	}
	public void setTagsDao(TagsDao tagsDao) {
		this.tagsDao = tagsDao;
	}
	public void setDocsDao(DocsDao docsDao) {
		this.docsDao = docsDao;
	}
	
	
}

package cn.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;

import cn.dao.DocsDao;
import cn.dao.TagsDao;
import cn.dao.UserDao;
import cn.entity.Tags;
import cn.entity.User;
import cn.util.Const;
import cn.util.PageBean;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {
	private Integer id;
	private String username;
	private String password;
	private Integer role;// 0管理员1用户
	private String password1;
	private String name;

	private User user = new User();
	private List<User> list = new ArrayList<User>();
	private PageBean pageBean = new PageBean();
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	@Autowired
	@Qualifier("tagsDao")
	private TagsDao tagsDao;
	// 登录
	public String login() throws Exception {
		session.setAttribute("role", role);// 保存角色
		String hql = "from User u where username=? and password=? and role=? and isdel=0";
		List<User> list = userDao.getByHql(hql, username, password, role);
		if (list != null && list.size() > 0) {
			User user = list.get(0);
			session.setAttribute("currentUser", user);
			//查询标签列表
			List<Tags> tags=tagsDao.getByHql("from Tags t where t.status=0");//未屏蔽标签
			session.setAttribute("tags", tags);
			if (role == 0) {		
				response.sendRedirect("index.jsp");
			} else {	
				response.sendRedirect("docs_search.action");
			}
		} else {
			if (role == 0) {
				session.setAttribute("usermsg", "用户名密码错误!");
				response.sendRedirect("login.jsp");
			} else {
				session.setAttribute("usermsg", "用户名密码错误!");
				response.sendRedirect("docs_search.action");
			}
		}
		return null;
	}

	public String logout() throws Exception {
		Integer role = (Integer) session.getAttribute("role");
		User user = (User) session.getAttribute("currentUser");
		session.removeAttribute("currentUser");
		session.removeAttribute("role");

		if (role!=null && role == 0) {
			response.sendRedirect("manage/login.jsp");
		} else {
			response.sendRedirect("docs_search.action");
		}
		return null;
	}

	// 详情
	public String detail() {
		user = userDao.get(User.class, id);
		return "detail";
	}

	// 列表
	public String list() {
		String hqlCount = "select count(*) from User u where isdel=0";
		String hql = "from User u where isdel=0";
		if (name != null && !"-1".equals(name)) {
			hqlCount += " and u.name like '%" + name + "%'";
			hql += " and u.name like '%" + name + "%'";
		}
		hqlCount += " order by u.id desc";
		hql += " order by u.id desc";
		pageBean.setTotalCount(userDao.getCount(hqlCount));
		list = userDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return SUCCESS;
	}

	public String add() throws IOException {
		if(userDao.isExists(user.getUsername())){
			session.setAttribute("usermsg", "用户名已经存在!");
		}else{
			user.setRole(1);
			user.setIsdel(0);
			userDao.add(user);
			session.setAttribute("usermsg", "注册成功!");
		}
		response.sendRedirect("docs_search.action");
		return null;
	}

	public String isExists(){
		boolean flag=userDao.isExists(user.getUsername());
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(flag);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		
	}

	// 前台个人资料
	public String userinfo() {
		userDao.merge(user);
		session.setAttribute("currentUser", user);
		return "userinfo";
	}

	public String jsondetail() throws IOException {
		User user = userDao.get(User.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONObject.toJSONString(user));
		out.close();
		return null;
	}

	public String update() {
		userDao.merge(user);
		return "list";
	}
	
	public String delete() {
		User user = userDao.get(User.class, id);
		user.setIsdel(1);
		userDao.update(user);
		return "list";
	}

	public String updatepwd() {
		User user = (User) session.getAttribute("currentUser");
		if (!password.equals(user.getPassword())) {
			request.setAttribute("msg", "原密码不正确!");
			return "updatepwd";
		} else {
			user.setPassword(password1);
			userDao.update(user);
		}

		request.setAttribute("msg", "密码修改成功,请重新登录!");
		return "login";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}

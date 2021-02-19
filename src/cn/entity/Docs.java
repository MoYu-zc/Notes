package cn.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Docs entity. @author MyEclipse Persistence Tools
 */

/**
 * @author Administrator
 *
 */
public class Docs implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String shortcontent;
	private String content;
	private String docpath;
//	private List<Tagdoc> tagdocs=new ArrayList<Tagdoc>();
	private String tags;
	private User user;
	private String doctime;
	private Integer status;//0未共享,1共享,2已屏蔽
	private Integer isdel;

	// Constructors

	/** default constructor */
	public Docs() {
	}

	

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortcontent() {
		return this.shortcontent;
	}

	public void setShortcontent(String shortcontent) {
		this.shortcontent = shortcontent;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDocpath() {
		return this.docpath;
	}

	public void setDocpath(String docpath) {
		this.docpath = docpath;
	}

	

//	public List<Tagdoc> getTagdocs() {
//		return tagdocs;
//	}
//
//
//
//	public void setTagdocs(List<Tagdoc> tagdocs) {
//		this.tagdocs = tagdocs;
//	}


	public User getUser() {
		return user;
	}



	public String getTags() {
		return tags;
	}



	public void setTags(String tags) {
		this.tags = tags;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public String getDoctime() {
		return this.doctime;
	}

	public void setDoctime(String doctime) {
		this.doctime = doctime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsdel() {
		return this.isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

}
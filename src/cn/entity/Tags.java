package cn.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tags entity. @author MyEclipse Persistence Tools
 */

/**
 * @author Administrator
 *
 */
public class Tags implements java.io.Serializable {
	private Integer id;
	// Fields
	private String tagname;
	private Integer status;//是否屏蔽0未屏蔽1屏蔽
	//private Set<Tagdoc> tagdocs=new HashSet<Tagdoc>(); 
	// Constructors

	/** default constructor */
	public Tags() {
	}

	// Property accessors

	public String getTagname() {
		return this.tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	public Set<Tagdoc> getTagdocs() {
//		return tagdocs;
//	}
//
//	public void setTagdocs(Set<Tagdoc> tagdocs) {
//		this.tagdocs = tagdocs;
//	}

}
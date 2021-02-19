package cn.util;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.dao.DocsDao;
import cn.entity.Docs;

public class SpringTest {

	@Test
	public void test01() {
//		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
//		DocsDao dao=(DocsDao)ac.getBean("docsDao");
//		String keywords="JAVA";
//		
//		String hql="from Docs u  where u.isdel=0 and u.status=1 and exists(from Tags t where t.tagname='"+keywords.toLowerCase()+"' and t.status=0) and u.tags like '%"+keywords.toLowerCase()+"%'";
//		List<Docs> docs=dao.getByHql(hql);
//		System.out.println(docs);
		
		String[] tags="abc,".split(",");
		System.out.println(tags);

	}

}

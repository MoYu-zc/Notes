<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<script>
function toURL(url){
	<s:if test="#session.currentUser==null">
		alert("请先登录!");
	</s:if>
	<s:else>
		location.href=url;
	</s:else>
}
</script>

<!--header strat here-->
 <!-- TOP HEADER -->
        <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-10">
                        <p class="phone-info">便携式共享笔记</p>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-14">
                        <div class="social-icons">
                            <ul class="nav">
                            <s:if test="#session.currentUser!=null">
	                            <li>欢迎你：${currentUser.name}</li>
	                            <li><a style="padding:0px 10px;color:#5cb48e;font-weight:700;" href="docs_search.action">共享笔记列表</a></li>
	                            <li><a style="padding:0px 10px;color:#5cb48e;font-weight:700;" href="docs_mylist.action">我的文档</a></li>
								<li><a style="padding:0px 10px;color:#5cb48e;font-weight:700;" href="userinfo.jsp">个人资料</a></li>
								<li><a style="padding:0px 10px;color:#5cb48e;font-weight:700;" href="user_logout.action">退出</a></li>
							</s:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- .top-header -->
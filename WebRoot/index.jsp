<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="zh" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="zh" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="zh" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="zh" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>共享笔记</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <div class="site-bg"></div>
        <div class="site-bg-overlay"></div>
       
		<%@include file="top.jsp" %>


        <div class="container" id="page-content">
            <div class="row">
                <div class="col-md-9 col-sm-12 content-holder">
                    <!-- CONTENT -->
                    <div id="menu-container">
                        <div id="menu-1" class="homepage home-section gallery-section">
                            <div class="box-content">

                                        <form id="sform" action="docs_search.action" method="post" class="subscribe-form">
                                        <input type="hidden" name="pageBean.pageNo" id="pageNo" value="1"/>       
                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <h3 class="widget-title">共享笔记列表</h3>
                                                </div>
                                                <fieldset class="col-md-5">
                                                    <input name="keyword" type="text" class="email" id="subscribe-email" placeholder="文档搜索">
                                                </fieldset>
                                                <fieldset class="col-md-4 button-holder">
                                                    <input type="submit" class="button default" value="搜索">
                                                </fieldset>
                                            </div>
                                        </form>

                                <div class="row">
                                    <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>编号</th>
                                            <th>文档名称</th>
                                            <th>共享人</th>
                                            <th>共享时间</th>
                                            <th>标签</th>
                                            <th>操作</th>
                                        </tr>
                                        <s:iterator value="list" status="st">
	                                        <tr>
	                                            <td><s:property value="#st.count"/></td>
	                                            <td><s:property value="name"/></td>
	                                            <td><s:property value="user.name"/></td>
	                                            <td><s:property value="doctime"/></td>
	                                            <td><s:property value="tags"/></td>
	                                            <td><a href="docs_detail.action?id=<s:property value="id"/>">详情</a> | <a href="docs_download.action?filename=<s:property value="docpath"/>">下载</a></td>
	                                        </tr>
                                        </s:iterator>
                                    </table>
                                    </div>
                                </div>
                                <div class="project-pages">
                                    <ul>
                                        <li><a href="javascript:doPage('${pageBean.prePage }')">上一页</a></li>
                                        <li><a href="javascript:doPage('${pageBean.nextPage }')">下一页</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="menu-2" class="content about-section">
                            <div class="row">
                                <div class="col-md-8 col-sm-8">
                                    <div class="box-content">
                                        <h3 class="widget-title">用户注册</h3>
                                        <form class="contact-form" action="user_add.action" method="post" onsubmit="return checkAdd()">
                                            <fieldset>
                                                <input type="text" class="username" onblur="checkUsername()" name="user.username" id="username" placeholder="用户名...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="password" class="email"  name="user.password" id="password" placeholder="密码...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="password" class="email" id="password2" placeholder="确认密码...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="text" class="email" name="user.name" id="name" placeholder="真实姓名...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="email" class="email" name="user.email" id="email" placeholder="邮箱...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="number" class="email" name="user.qq" id="qq" placeholder="QQ...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="submit" class="button" id="button" value="注册">
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="box-content">
                                        <h3 class="widget-title">用户登录</h3>
                                        <form class="contact-form" action="user_login.action" method="post" onsubmit="return checkLogin()">
                                        	<input type="hidden" name="role" value="1"/>
                                            <fieldset>
                                                <input type="text" class="name" id="loginusername" name="username" placeholder="用户名...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="password" class="email" id="loginpassword" name="password" placeholder="密码...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="submit" class="button" id="loginbtn" value="登录">
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="right.jsp" %>
            </div>
        </div>
<%@include file="footer.jsp" %>
</body>

        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
		<!-- templatemo 439 rectangle -->
<script>
	function doPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#sform").submit();
	}
	function checkUsername(){
		$.getJSON("user_isExists.action",{"user.username":$("#username").val()},function(data){
			if(data==true){
				alert("用户名已经存在！");
				return false;
			}
		});
	}

	function checkLogin(){
		if($("#loginusername").val()==""){
	  		alert("请输入您的用户名");
	  		return false;
	  	}
	  	if($("#loginpassword").val()==""){
	  		alert("请输入密码");
	  		return false;
	  	}
		return true;	
	}
	function checkAdd(){
		if($("#username").val()==""){
	  		alert("请输入您的用户名");
	  		return false;
	  	}
	  	if($("#password").val()==""){
	  		alert("请输入密码");
	  		return false;
	  	}	
	  	if($("#password2").val()==""){
	  		alert("请输入确认密码");
	  		return false;
	  	}	
	  	if($("#password2").val()!=$("#password").val()){
	  		alert("两次密码不一致");
	  		return false;
	  	}
	  	if($("#name").val()==""){
	  		alert("请输入您的姓名");
	  		return false;
	  	}
	  	if($("#email").val()==""){
	  		alert("请输入Email");
	  		return false;
	  	}	
	  	return true;
	  }

		
</script>
<s:if test="#session.usermsg!=null && #session.usermsg!=''">
	<script>
		alert('<s:property value="#session.usermsg"/>');
		<%
			session.removeAttribute("usermsg");
		%>
	</script>
</s:if>
<s:if test="#session.docsmsg!=null && #session.docsmsg!=''">
	<script>
		alert('<s:property value="#session.docsmsg"/>');
		<%
			session.removeAttribute("docsmsg");
		%>
	</script>
</s:if>




    </body>
</html>
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
        <style type="text/css">
        .contact-form input, .contact-form textarea{
           padding: 6px 10px !important;
        }
        </style>
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
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="box-content">
                                        <h3 class="widget-title">用户信息修改</h3>
                                        <form class="contact-form" action="user_userinfo.action" method="post" onsubmit="return checkAdd()"> 
                                        <input type="hidden" name="user.id" value="${currentUser.id }"/>
										<input type="hidden" name="user.username" value="${currentUser.username }"/>
										<input type="hidden" name="user.isdel" value="${currentUser.isdel }"/>
										<input type="hidden" name="user.role" value="${currentUser.role }"/>
                                            <fieldset>
                                                	密码：<input type="password" class="email" name="user.password" id="password" value="${currentUser.password}" placeholder="密码...">
                                            </fieldset>
                                            <fieldset>
                                                	确认密码：<input type="password" class="email" id="password2" placeholder="确认密码...">
                                            </fieldset>
                                            <fieldset>
                                                	真实姓名：<input type="text" class="email" name="user.name" id="name" value="${currentUser.name}" placeholder="真实姓名...">
                                            </fieldset>
                                            <fieldset>
                                                EMail：<input type="email" class="email" id="email" name="user.email"  value="${currentUser.email}" placeholder="邮箱...">
                                            </fieldset>
                                            <fieldset>
                                               QQ号： <input type="number" class="email" id="qq" name="user.qq" value="${currentUser.qq }" placeholder="QQ...">
                                            </fieldset>
                                            <fieldset>
                                                <input type="submit" class="button" id="button" value="修改">
                                                <input type="button" class="button" id="button" onclick="history.go(-1)" value="返回">
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
               <div class="col-md-3 hidden-sm">

                    <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                        <ul class="main-menu">
                            <li>
                                <a class="homebutton" href="docs_search.action"><i class="fa fa-home"></i>首页/笔记列表</a>
                            </li>
                           
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
<%@include file="footer.jsp" %>
</body>

        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/plugins.js"></script>
       
		<!-- templatemo 439 rectangle -->
<script>
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
<s:if test="#request.msg!=null && #request.msg!=''">
	<script>
		alert('<s:property value="#request.msg"/>');
	</script>
</s:if>
        

    </body>
</html>
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
                <div class="col-md-12 col-sm-12 content-holder">
                    <!-- CONTENT -->
                    <div id="menu-container">
                        <div id="menu-1" class="homepage home-section gallery-section">
                            <div class="box-content">

                                        <form id="sform" action="docs_mylist.action" method="post" class="subscribe-form">
                                        	<input type="hidden" name="pageBean.pageNo" id="pageNo" value="1"/>                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <h3 class="widget-title">我的笔记列表</h3>
                                                </div>
                                                <fieldset class="col-md-5">
                                                    <input name="keyword" type="text" class="email" id="subscribe-email" placeholder="文档搜索">
                                                </fieldset>
                                                <fieldset class="col-md-4 button-holder">
                                                    <input  type="submit" class="button default"  value="搜索"> <input  onclick="location.href='docadd.jsp'" type="button" class="button default"  value="增加">
                                                </fieldset>
                                            </div>
                                        </form>

                                <div class="row">
                                    <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>编号</th>
                                            <th>文档名称</th>
                                            <th>所有人</th>
                                            <th>标签</th>
                                            <th>状态</th>
                                            <th>共享时间</th>
                                            <th>操作</th>
                                        </tr>
                                        <s:iterator value="list" status="st">
	                                        <tr>
	                                            <td><s:property value="#st.count"/></td>
	                                            <td><s:property value="name"/></td>
	                                            <td><s:property value="user.name"/></td>
	                                            <td><s:property value="tags"/></td>
	                                            <td>
	                                            <s:if test="status==0">
	                                            	未共享
	                                            </s:if>
	                                             <s:if test="status==1">
	                                            	已共享
	                                            </s:if>
	                                             <s:if test="status==2">
	                                            	已屏蔽
	                                            </s:if>
	                                            </td>
	                                            <td><s:property value="doctime"/></td>
	                                            <td>
	                                            <a href="docs_toupdate.action?id=<s:property value="id"/>">修改</a> 
	                                            <s:if test="status!=2">
	                                            	<s:if test="status==0">
		                                            	| <a href="docs_gx?id=<s:property value="id"/>">共享</a> 
		                                            </s:if>
		                                            <s:if test="status==1">
		                                            	| <a href="docs_qxgx.action?id=<s:property value="id"/>">取消共享</a>
		                                            </s:if>
	                                            </s:if> 
	                                            	| <a href="javascript:todel('<s:property value="id"/>')">删除</a>
	                                            </td>
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
                    </div>
                </div>
           
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
	function todel(id){
		if(confirm("是否删除该文档?")){
			location.href="docs_delete.action?id="+id;
		}
	}
</script>





    </body>
</html>
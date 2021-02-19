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

                                        <form action="#" method="get" class="subscribe-form">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <h3 class="widget-title">笔记详情</h3>
                                                </div>
                                            </div>
                                        </form>

                                <div class="row">
                                    <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td width="15%">文档名称：</td>
                                            <td width="85%"><s:property value="docs.name"/></td>
                                        </tr>
                                        <tr>
                                            <td>文档标签：</td>
                                            <td><s:property value="docs.tags"/></td>
                                        </tr>
                                        <tr>
                                            <td>文档共享人：</td>
                                            <td><s:property value="docs.user.name"/></td>
                                        </tr>
                                        <tr>
                                            <td>文档共享时间：</td>
                                            <td><s:property value="docs.doctime"/></td>
                                        </tr>
                                        <tr>
                                            <td>文档简介：</td>
                                            <td><s:property value="docs.shortcontent"/></td>
                                        </tr>
                                        <tr>
                                            <td>文档内容：</td>
                                            <td><s:property value="docs.content"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center" colspan="2">
                                                <button type="button" class="btn btn-primary" onclick="download()">下载</button>
                                                <button type="button" class="btn btn-primary" onclick="history.go(-1)">返回</button>
                                            </td>
                                        </tr>
                                    </table>
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

        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/plugins.js"></script>
      <script>
function download(){
	location.href="docs_download.action?filename=<s:property value="docs.docpath"/>";
}
      </script>
		<!-- templatemo 439 rectangle -->
    </body>
</html>
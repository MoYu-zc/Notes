<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
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
                                                    <h3 class="widget-title">添加笔记</h3>
                                                </div>
                                            </div>
                                        </form>

                                <div class="row">
                                    <div class="col-md-12">
                                    <form id="docaddform" action="docs_add.action" method="post" onsubmit="return checkAdd()">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td width="15%">文档名称：</td>
                                            <td width="85%"><input style="width:500px" type="text" class="name" id="name" name="docs.name" placeholder="文档名称..."></td>
                                        </tr>
                                        <tr>
                                            <td>文档标签：</td>
                                            <td>
                                            <input style="width:500px" type="text" class="name" id="tags" name="docs.tags" placeholder="文档标签...">(多个标签,隔开)
                                            <br/>
                                            <s:iterator value="#session.tags">
                                            	<input onclick="fillTags(this)" type="checkbox" value="<s:property value="tagname"/>"/> <s:property value="tagname"/> &nbsp; 
                                            </s:iterator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>文档路径：</td>
                                            <td>
	                                            <input style="width:500px" type="file" id="fujian" name="fujian" onchange="updateFile()"/>
	                                			<input type="hidden" id="docpath" name="docs.docpath"/> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>文档简介：</td>
                                            <td><textarea name="docs.shortcontent" id="shortcontent" style="width:500px" rows="2" placeholder="简介"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>文档内容：</td>
                                            <td><textarea id="content" name="docs.content" style="width:500px" rows="3" placeholder="内容"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center" colspan="2">
                                                <button type="submit" class="btn btn-primary">保存</button>
                                                <button type="button" class="btn btn-primary" onclick="history.go(-1)">返回</button>
                                            </td>
                                        </tr>
                                    </table>
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

        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
      <script>
	function fillTags(ck){
		if(ck.checked){
			var oldcontent=$("#docaddform #tags").val();
			var tags=oldcontent.split(",");
			var ckval=ck.value;
			var flag=false;
			for(i=0;i<tags.length;i++){
				if(tags[i]==ckval){
					flag=true;
					break;
				}
			}
			if(!flag){
				$("#docaddform #tags").val(oldcontent+","+ckval);
			}
		}
	}
      
      function checkAdd(){
		  	if($("#docaddform #name").val()==""){
		  		alert("请输入名称");
		  		return false;
		  	}
		  	if($("#docaddform #tags").val()==""){
		  		alert("请输入标签");
		  		return false;
		  	}
		  	var tagsreg=/^((([\u4e00-\u9fa5]|\w)*),?)+$/;
		  	if(!$("#docaddform #tags").val().match(tagsreg)){
		  		alert("标签格式不正确，多个标签必须用英文,隔开");
		  		return false;
		  	}
		  	if($("#docaddform #docpath").val()==""){
		  		alert("请选择文件");
		  		return false;
		  	}
		  	if($("#docaddform #shortcontent").val()==""){
		  		alert("请输入简介");
		  		return false;
		  	}
		  	if($("#docaddform #content").val()==""){
		  		alert("请输入内容");
		  		return false;
		  	}
		  	
		  	return true;
		  }

    //上传文件
	  function updateFile(){
		  if($("#fujian").val()==""){
			  alert("请先选择文件!");
		  }else{
		  $.ajaxFileUpload
          (
              {
                  url: '<%=Const.ROOT%>upload.action', //用于文件上传的服务器端请求地址
                  secureuri: false, //是否需要安全协议，一般设置为false
                  fileElementId: 'fujian', //文件上传域的ID
                  success: function (data, status)  //服务器成功响应处理函数
                  {        	
                	  $("#docaddform #docpath").val($(data).find("body").text());
                	  alert("上传成功，请点击保存！");
                  },
                  error: function (data, status, e)//服务器响应失败处理函数
                  {
                      alert("上传失败!");
                  }
              }
          );
		  }
          return false;
      }

      </script>
		<!-- templatemo 439 rectangle -->
    </body>
</html>
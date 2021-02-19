<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!--right icons-->
                <div class="col-md-3 hidden-sm">

                    <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                        <ul class="main-menu">
                            <li>
                                <a class="show-1 active homebutton" href="#"><i class="fa fa-home"></i>首页/笔记列表</a>
                            </li>
                            <s:if test="#session.currentUser==null">
                            <li>
                                <a class="show-2 aboutbutton" href="#"><i class="fa fa-user"></i>登录/注册</a>
                            </li>
                            </s:if>
                        </ul>
                    </nav>
                </div>
                <!--right icons-->
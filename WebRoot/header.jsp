<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<div class="yz-header">
    <div class="header">
        <div class="header_content" style="text-align: center; position: relative">
            <span style="position: absolute; left: 0px"><a href="./">拍卖管理系统</a></span>
            <span class="header_hotline"></span>
            <div class="" style="padding-top: 16px">
                <div class="select">
                    <% if (request.getSession().getAttribute("username") != null && !("".equals(request.getSession().getAttribute("username")))) { %>
 欢迎<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>登录， 您得权限：<%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %>

                    <a class="btn btn-primary btn-xs" href="main.jsp"> 个人中心</a>
                    <a class="btn btn-default btn-xs" href="logout.jsp" onclick="return confirm('你确定退出？')"> 退出</a>
                    <%} else { %>
                    <button type="button" class="btn btn-default btn-xs" toggle="modal" data-toggle="modal" data-target="#loginModel">登录</button>
                    <%} %>

                </div>
            </div>
        </div>
    </div>

    <div class="nav">
        <div class="left nav_one nav_common">
            <span><a href="./">主页</a></span>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="yonghuadd.jsp">用户注册</a></span>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="liuyanbanadd.jsp">在线留言</a></span>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="shangpinlist.jsp">竞拍商品 </a></span>

            <div class="dropmenu">
                <div class="triangle"></div>
                <div class="dropmenu_bg"></div>
                <div class="dropmenu_content dropmenu_content_eight">
                    <h3>竞拍商品</h3>
                    <% List<Map> mapfenlei1 = new CommDAO().select("SELECT id,fenleiming FROM fenlei"); %>
 <% for (Map m : mapfenlei1) { %>

                    <a href="shangpinlist.jsp?fenlei=<%= m.get("id") %>"><%= m.get("fenleiming") %></a>
                    <%} %>

                </div>
            </div>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="guanyudetail.jsp?id=1">关于我们</a></span>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="guanyudetail.jsp?id=2">系统简介</a></span>
        </div>
        <div class="left nav_one nav_common">
            <span><a href="login.jsp">后台管理</a></span>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="0" id="loginModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="0">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="pa10">
                        <form action="login?ac=login&a=a" method="post">
                            <!-- form 标签开始 -->

                            <div class="form-group">
                                <input type="text" class="form-control" name="username" placeholder="输入帐号" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="pwd" placeholder="密码" />
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="cx">
                                    <option value="用户">用户</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码" />

                                    <span class="input-group-addon"
                                        ><img
                                            src="image.jsp"
                                            style="width: 60px; height: 20px; max-width: none; max-height: none"
                                            onclick="this.src='image.jsp?rand='+new Date().getTime()"
                                    /></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">登录</button>
                                    </div>
                                </div>
                            </div>

                            <!--form标签结束-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

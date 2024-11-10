<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">账号管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="admins_list.jsp" target="main">管理员账号管理</a></li>
        <li><a href="admins_add.jsp" target="main">管理员账号添加</a></li>
        <li><a href="yonghu_list.jsp" target="main">注册用户管理</a></li>
        <li><a href="yonghu_add.jsp" target="main">添加新用户</a></li>
        <li><a href="mod.jsp" target="main">密码修改</a></li>
    </ul>
</li>
<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">分类管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="fenlei_add.jsp" target="main">分类添加</a></li>
        <li><a href="fenlei_list.jsp" target="main">分类查询</a></li>
    </ul>
</li>
<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">商品管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="shangpin_add.jsp" target="main">商品添加</a></li>
        <li><a href="shangpin_list.jsp" target="main">商品查询</a></li>
    </ul>
</li>
<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">竞拍管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="jingpai_list.jsp" target="main">竞拍查询</a></li>
    </ul>
</li>
<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">订单管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="dingdan_list.jsp" target="main">订单查询</a></li>
    </ul>
</li>
<li class="submenu">
    <a href="javascript:void(0);">
        <span class="icon"><i class="fa fa-globe"></i></span>
        <span class="text">系统管理</span>
        <span class="arrow"></span>
    </a>
    <ul>
        <li><a href="youqinglianjie_add.jsp" target="main">友情链接添加</a></li>
        <li><a href="youqinglianjie_list.jsp" target="main">友情链接查询</a></li>
        <li><a href="lunbotu_add.jsp" target="main">轮播图添加</a></li>
        <li><a href="lunbotu_list.jsp" target="main">轮播图查询</a></li>
        <li><a href="guanyu_add.jsp" target="main">单页简介添加</a></li>
        <li><a href="guanyu_list.jsp" target="main">单页简介查询</a></li>
        <li><a href="liuyanban_list.jsp" target="main">留言管理</a></li>
    </ul>
</li>

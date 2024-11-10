<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <% Map map = Query.make("dingdan").where("id", request.getParameter("id")).find(); %>

    <div class="admin-detail">
        <table class="table table-detail">
            <tr>
                <td width="180">商品id</td>
                <td><%= map.get("shangpinid") %></td>

                <td width="180">编号</td>
                <td><%= map.get("bianhao") %></td>
            </tr>
            <tr>
                <td width="180">名称</td>
                <td><%= map.get("mingcheng") %></td>

                <td width="180">分类</td>
                <td><% Map mapfenlei20 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei20.get("fenleiming") %></td>
            </tr>
            <tr>
                <td width="180">发布人</td>
                <td><%= map.get("faburen") %></td>

                <td width="180">当前竞价</td>
                <td><%= map.get("dangqianjingjia") %></td>
            </tr>
            <tr>
                <td width="180">竞拍人</td>
                <td><%= map.get("jingpairen") %></td>

                <td width="180">联系人</td>
                <td><%= map.get("lianxiren") %></td>
            </tr>
            <tr>
                <td width="180">联系电话</td>
                <td><%= map.get("lianxidianhua") %></td>

                <td width="180">地址</td>
                <td><%= map.get("dizhi") %></td>
            </tr>
            <tr>
                <td width="180">状态</td>
                <td><%= map.get("zhuangtai") %></td>
            </tr>
        </table>
    </div>

    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);" style="background: #07de19; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">返回</button>
            <button onclick="window.print()" style="background: #4961de; border: 1px solid #9a9a9a; border-top-width: 2px; border-left: 2px">打印本页</button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>


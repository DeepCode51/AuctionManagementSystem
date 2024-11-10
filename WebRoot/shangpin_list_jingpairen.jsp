<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序
    
    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
    where += " AND jingpairen='" + request.getSession().getAttribute("username") + "' "; //  设置jingpairen为当前登录用户
    
    // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    
    if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
        where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }
    
    List<Map> list = Query.make("shangpin").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 商品 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group">
                        名称

                        <input type="text" class="form-control" style="" name="mingcheng" value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>" />
                    </div>
                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei8" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("fenleiming") %></option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_fenlei8").val($(".class_fenlei8").attr("data-value"));
                        </script>
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>
                    <script>
                        $("#orderby").val("<%= orderby %>");
                        $("#sort").val("<%= sort %>");
                    </script>
                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>名称</th>
                            <th>分类</th>
                            <th>图片</th>
                            <th>发布人</th>
                            <th>起拍价</th>
                            <th>当前竞价</th>
                            <th>起拍时间</th>
                            <th>结束时间</th>
                            <th>状态</th>
                            <th>竞拍人</th>
                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i = 0;
                        for (Map map : list) {
                            i++;
                        %>

                        <tr id="<%= map.get("id") %>" pid="">
                            <td width="30" align="center">
                                <label> <%= i %> </label>
                            </td>
                            <td><%= map.get("mingcheng") %></td>
                            <td><% Map mapfenlei4 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapfenlei4.get("fenleiming") %></td>
                            <td><% if ("".equals(map.get("tupian"))) { %>
-<%} else { %><img width="100" src="<%= Info.images(map.get("tupian")) %>" /><%} %>
</td>
                            <td><%= map.get("faburen") %></td>
                            <td><%= map.get("qipaijia") %></td>
                            <td><%= map.get("dangqianjingjia") %></td>
                            <td><%= map.get("qipaishijian") %></td>
                            <td><%= map.get("jieshushijian") %></td>
                            <td><%= map.get("zhuangtai") %></td>
                            <td><%= map.get("jingpairen") %></td>
                            <td align="center">
                                <a href="shangpin_detail.jsp?id=<%= map.get("id") %>">详情</a>

                                <a href="shangpin_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                                <a href="shangpin.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>


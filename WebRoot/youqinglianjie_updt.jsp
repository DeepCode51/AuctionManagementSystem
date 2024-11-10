<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %> <%
     String updtself = "0"; // 设置更新
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "youqinglianjie");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑友情链接:</div>
            <div class="panel-body">
                <form action="youqinglianjie.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">网站名称<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入网站名称"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写网站名称"
                                    id="wangzhanmingcheng"
                                    name="wangzhanmingcheng"
                                    value="<%= Info.html(mmm.get("wangzhanmingcheng")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">网址<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入网址"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写网址"
                                    id="wangzhi"
                                    name="wangzhi"
                                    value="<%= Info.html(mmm.get("wangzhi")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="<%= updtself %>" type="hidden" />

                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>


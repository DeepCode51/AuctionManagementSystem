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
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "jingpai");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑竞拍:</div>
            <div class="panel-body">
                <form action="jingpai.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="shangpinid" value="<%= mmm.get("shangpinid") %>" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10"><%= mmm.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(mmm.get("bianhao")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">名称</label>
                            <div class="col-sm-10"><%= mmm.get("mingcheng") %><input type="hidden" id="mingcheng" name="mingcheng" value="<%= Info.html(mmm.get("mingcheng")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                            <div class="col-sm-10"><% Map mapfenlei14 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + mmm.get("fenlei") + "'"); %>
<%= mapfenlei14.get("fenleiming") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(mmm.get("fenlei")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">起拍价</label>
                            <div class="col-sm-10"><%= mmm.get("qipaijia") %><input type="hidden" id="qipaijia" name="qipaijia" value="<%= Info.html(mmm.get("qipaijia")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">发布人</label>
                            <div class="col-sm-10"><%= mmm.get("faburen") %><input type="hidden" id="faburen" name="faburen" value="<%= Info.html(mmm.get("faburen")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">竞拍价<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入竞拍价"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="请填写竞拍价"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="jingpaijia"
                                    name="jingpaijia"
                                    value="<%= Info.html(mmm.get("jingpaijia")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">竞拍人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入竞拍人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="jingpairen"
                                    name="jingpairen"
                                    value="<%= mmm.get("jingpairen") %>"
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


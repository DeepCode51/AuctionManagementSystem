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
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "dingdan");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑订单:</div>
            <div class="panel-body">
                <form action="dingdan.jsp?a=update" method="post" name="form1" id="form1">
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
                            <div class="col-sm-10"><% Map mapfenlei22 = new CommDAO().find("SELECT fenleiming,id FROM fenlei where id='" + mmm.get("fenlei") + "'"); %>
<%= mapfenlei22.get("fenleiming") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(mmm.get("fenlei")) %>" /></div>
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">当前竞价</label>
                            <div class="col-sm-10"><%= mmm.get("dangqianjingjia") %><input type="hidden" id="dangqianjingjia" name="dangqianjingjia" value="<%= Info.html(mmm.get("dangqianjingjia")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">竞拍人</label>
                            <div class="col-sm-10"><%= mmm.get("jingpairen") %><input type="hidden" id="jingpairen" name="jingpairen" value="<%= Info.html(mmm.get("jingpairen")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系人<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系人"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写联系人"
                                    id="lianxiren"
                                    name="lianxiren"
                                    value="<%= Info.html(mmm.get("lianxiren")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系电话"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写联系电话"
                                    id="lianxidianhua"
                                    name="lianxidianhua"
                                    value="<%= Info.html(mmm.get("lianxidianhua")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">地址<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入地址"
                                    style="width: 250px"
                                    data-rule-required="true"
                                    data-msg-required="请填写地址"
                                    id="dizhi"
                                    name="dizhi"
                                    value="<%= Info.html(mmm.get("dizhi")) %>"
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


<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@page import="com.jntoo.db.model.QMap" %>


<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
    <script>
        alert('对不起,请您先登陆!');
        location.href = 'login.jsp';
    </script>
    <%
            return;
        } %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                添加商品:
            </div>
            <div class="panel-body">
                <form action="shangpin.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入编号" style="width:150px;"
                                       readonly="readonly" id="bianhao" name="bianhao" value="<%= Info.getID() %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">名称<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入名称" style="width:250px;"
                                       data-rule-required="true" data-msg-required="请填写名称" id="mingcheng"
                                       name="mingcheng" value=""/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                            <div class="col-sm-10">

                                <select class="form-control class_fenlei8" data-value="" id="fenlei" name="fenlei"
                                        style="width:250px">
                                    <%
                                        List<HashMap> select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc");
                                    %>
                                    <% for (HashMap m : select) { %>
                                    <option value="<%= m.get("id") %>"><%= m.get("fenleiming") %>
                                    </option>
                                    <% } %>

                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
                            <div class="col-sm-10">

                                <input type="hidden" id="tupian" name="tupian" value=""/>
                                <script>showUploadImages("#tupian")</script>

                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">详情</label>
                            <div class="col-sm-10">

                                <textarea id="xiangqing" name="xiangqing"
                                          style="max-width: 750px;width:100%; height: 300px;"></textarea>
                                <script>
                                    (function () {
                                        var um = UM.getEditor('xiangqing');
                                    })();
                                </script>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">发布人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入发布人" style="width:150px;"
                                       readonly="readonly" id="faburen" name="faburen"
                                       value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">起拍价<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <input type="number" class="form-control" placeholder="输入起拍价" style="width:150px;"
                                       step="0.01" data-rule-required="true" data-msg-required="请填写起拍价" number="true"
                                       data-msg-number="输入一个有效数字" id="qipaijia" name="qipaijia" value=""/>
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">起拍时间<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',lang:'zh-cn',minDate:'<%=Info.getDateStr()%>'})"
                                       style="width:200px;" data-rule-required="true" data-msg-required="请填写起拍时间"
                                       id="qipaishijian" name="qipaishijian" readonly="readonly" value=""/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">结束时间<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',lang:'zh-cn',minDate:'<%=Info.getDateStr()%>'})"
                                       style="width:200px;" data-rule-required="true" data-msg-required="请填写结束时间"
                                       id="jieshushijian" name="jieshushijian" readonly="readonly" value=""/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">


                                <input type="hidden" name="zhuangtai" id="zhuangtai" value="待售"/>
                                <input type="hidden" name="issh" value="否"/>

                                <button type="submit" class="btn btn-primary" name="Submit">
                                    提交
                                </button>
                                <button type="reset" class="btn btn-default" name="Submit2">
                                    重置
                                </button>


                            </div>

                        </div>
                    </div>

                    <!--form标签结束--></form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>


    <script>
        $(function () {
            $('#form1').validate();
        });
    </script>


</div>
<%@ include file="foot.jsp" %>

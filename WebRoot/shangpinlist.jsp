<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
    where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
}
if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
    where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
}

List<Map> list = Query.make("shangpin").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="section-dianzi" style="margin: 15px 15px 15px 15px; background-color: #FFFFFF">
            <div class="section_title">
                <h2>
                    <span>竞拍商品</span>
                </h2>
            </div>
            <div class="section_content">
                <div class="grid-box">
                    <div style="margin-bottom: 20px">
                        <form action="?" class="search">
                            <table class="jd-search">
                                <tbody>
                                    <tr>
                                        <td class="label1">分类</td>
                                        <td class="form-inline">
                                            <p class="search-radio">
                                                <input type="hidden" name="fenlei" value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" />
                                                <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                                <% List<Map> mapfenlei5 = new CommDAO().select("SELECT id,fenleiming FROM fenlei"); %>
 <% for (Map r : mapfenlei5) { %>

                                                <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("fenleiming") %></a>
                                                <%} %>

                                            </p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="label1">名称</td>
                                        <td class="form-inline">
                                            <input type="text" class="form-control" style="width: 150px" name="mingcheng" value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>" placeholder="请输入关键词" />
                                            <button type="submit" class="btn btn-default">搜索</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="row clearfix">
                        <% for (Map r : list) { %>

                        <div class="col-md-3 grid">
                            <div class="cate-bnr-sngle">
                                <a href="shangpindetail.jsp?id=<%= r.get("id") %>">
                                    <div class="img-box pb70">
                                        <div class="img" style="background-image: url('<%= Info.images(r.get("tupian")) %>')"></div>
                                    </div>
                                </a>
                                <div class="cate-content text-center">
                                    <h6><%= Info.subStr(r.get("mingcheng"), 20) %></h6>
                                    <a href="shangpindetail.jsp?id=<%= r.get("id") %>" class="shop"> 查看 </a>
                                </div>
                            </div>
                        </div>
                        <%} %>

                    </div>
                    ${page.info}
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>
<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>


<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%  %>
 <% Map map = Query.make("guanyu").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div>
            <div class="common-title" style="margin-top: 4em">
                <p>
                    <i></i>
                    <i></i>
                </p>
            </div>
            <div class="news_show">
                <span class="show_t"> <%= map.get("biaoti") %> </span>
                <span class="fa_time"> </span>

                <div><%= map.get("neirong") %></div>

            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>
<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>


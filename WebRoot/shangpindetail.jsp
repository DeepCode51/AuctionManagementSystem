<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@page import="com.jntoo.db.model.QMap" %>


<%
%>
<% Map map = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper-4.5.0/css/swiper.css">
<script src="js/swiper-4.5.0/js/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="section-dianzi" style="margin:15px 15px 15px 15px ;background-color:#FFFFFF">
            <div class="section_title">
                <h2>
                    <span>详情</span>
                </h2>
            </div>
            <div class="section_content">


                <div class="">
                    <div class="goods-info clearfix">
                        <div class="gallery-list">
                            <div class="swiper-container gallery-top" id="shangpin-galler">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                        </div>
                        <div class="goods-right-content">
                            <h3 class="title"><%= map.get("mingcheng") %>
                            </h3>
                            <div class="descount">
                                <div>
                        <span class="name">
                            编号：
                        </span>
                                    <span class="val">
                            <%= map.get("bianhao") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            分类：
                        </span>
                                    <span class="val">
                            <%
                                Map mapfenlei7 = new CommDAO().find("SELECT fenleiming FROM fenlei where id='" + map.get("fenlei") + "'");
                            %><%= mapfenlei7.get("fenleiming") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            发布人：
                        </span>
                                    <span class="val">
                            <%= map.get("faburen") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            起拍价：
                        </span>
                                    <span class="val">
                            <%= map.get("qipaijia") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            当前竞价：
                        </span>
                                    <span class="val">
                            <%= map.get("dangqianjingjia") %>                        </span>
                                </div>
                                <div>
                                    <span class="val">
                            <%= map.get("qipaishijian") %>   - <%= map.get("jieshushijian") %>
                                    </span>
                                </div>
                            </div>

                            <% Map readMap = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>
                            <form class="form-inline" action="jingpai.jsp?a=insert" id="jingpaiForm" name="jingpaiForm"
                                  method="post"><!-- form 标签开始 -->


                                <div style="display: none">

                                    <input type="hidden" name="shangpinid"
                                           value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                                    <input type="hidden" id="bianhao" name="bianhao"
                                           value="<%= Info.html(map.get("bianhao")) %>"/>
                                    <input type="hidden" id="mingcheng" name="mingcheng"
                                           value="<%= Info.html(map.get("mingcheng")) %>"/>
                                    <input type="hidden" id="fenlei" name="fenlei"
                                           value="<%= Info.html(map.get("fenlei")) %>"/>
                                    <input type="hidden" id="qipaijia" name="qipaijia"
                                           value="<%= Info.html(map.get("qipaijia")) %>"/>
                                    <input type="hidden" id="faburen" name="faburen"
                                           value="<%= Info.html(map.get("faburen")) %>"/>
                                    <input type="text" class="form-control" placeholder="输入竞拍人" style="width:150px;"
                                           readonly="readonly" id="jingpairen" name="jingpairen"
                                           value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                    <input name="referer" id="referer" value="" type="hidden"/>
                                    <script>
                                        $('#referer').val(location.href);
                                    </script>
                                </div>

                                <div class="mt10">
                                    <div class="spec-list">
                                    </div>

                                    <div class="mt10">
                                        <%
                                            Map mapJingpai = new CommDAO().find("SELECT (case WHEN NOW() > qipaishijian and NOW() < jieshushijian THEN 1 WHEN NOW()< qipaishijian THEN 2 WHEN NOW()>jieshushijian THEN 3 END) as time FROM shangpin WHERE id='" + request.getParameter("id") + "'");
                                        %>

                                        <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
                                        <% if (mapJingpai.get("time").equals("2")) { %>
                                        竞拍尚未开始，请耐心等待
                                        <% } else if (mapJingpai.get("time").equals("3")) { %>
                                        已竞拍结束
                                        <% } else { %>
                                        你尚未登录，请登录后操作
                                        <% } %>
                                        <% } else { %>
                                        <!-- 取出竞拍时间是否一致 -->

                                        <% if (mapJingpai.get("time").equals("1")) { %>
                                        竞拍价：<input type="number" class="form-control" placeholder="输入竞拍价"
                                                   style="width:150px;" step="0.01" data-rule-required="true"
                                                   min="<%= Double.valueOf(map.get("qipaijia").toString()) >Double.valueOf( map.get("dangqianjingjia").toString()) ? Double.valueOf(map.get("qipaijia").toString()) : Double.valueOf(map.get("dangqianjingjia").toString())+50 %>"
                                                   data-msg-required="请填写竞拍价" number="true" data-msg-number="输入一个有效数字"
                                                   id="jingpaijia" name="jingpaijia" value=""/>

                                        <button type="submit" class="btn btn-primary">
                                            竞拍
                                        </button>
                                        <% } else if (mapJingpai.get("time").equals("2")) { %>
                                        竞拍尚未开始，请耐心等待
                                        <% } else if (mapJingpai.get("time").equals("3")) { %>
                                        <% if (map.get("jingpairen").equals(request.getSession().getAttribute("username"))) { %>
                                        <%
                                            Map jiluCount = new CommDAO().find("SELECT count(*) AS count FROM dingdan WHERE shangpinid='" + request.getParameter("id") + "'");
                                        %>
                                        <% if (jiluCount.get("count").equals("0")) { %>
                                        <a class="btn btn-primary"
                                           href="dingdanadd.jsp?id=<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>">立即下单</a>
                                        <% } else { %>
                                        已下单
                                        <% } %>
                                        <% } else { %>
                                        已竞拍结束
                                        <% } %>

                                        <% } %>

                                        <% } %>

                                    </div>
                                </div>

                                <!--form标签结束--></form>

                            <script>
                                $(function () {
                                    $('#jingpaiForm').validate();
                                })
                            </script>

                        </div>
                    </div>

                    <script>
                        (function () {
                            var images = "<%= map.get("tupian") %>".split(",");
                            if (images.length > 0) {
                                for (var i = 0; i < images.length; i++) {
                                    var path = images[i]
                                    var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                    $('#shangpin-galler .swiper-wrapper').append(src);
                                    $('#shangpin-thumb .swiper-wrapper').append(src);
                                }

                                var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                    spaceBetween: 10,
                                    slidesPerView: 4,
                                    watchSlidesVisibility: true,//防止不可点击
                                })
                                var gallerySwiper = new Swiper('#shangpin-galler', {
                                    spaceBetween: 10,
                                    thumbs: {
                                        swiper: thumbsSwiper,
                                    }
                                })
                            }
                        })();

                    </script>

                </div>


            </div>
        </div>


        <!-- container定宽，并剧中结束 --></div>


</div>
<div>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="tabs" style="margin:15px 15px 15px 15px;background-color: #FFFFFF">
            <!-- tabs切换页 -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#xiangqing" aria-controls="xiangqing" role="tab" data-toggle="tab">详情</a>
                </li>

            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!--内容区 -->
                <div role="tabpanel" class="tab-pane active" id="xiangqing">


                    <div style="margin:15px  15px 15px 15px ;text-indent: 1em">
                        <%= map.get("xiangqing") %>
                    </div>


                </div>



                </div>

            </div>
        </div>


        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
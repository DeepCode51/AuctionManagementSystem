<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<link rel="stylesheet" href="js/swiper/swiper.css" />
<script src="js/swiper/swiper.js"></script>

<div>
    <% List<Map> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner16">
        <div class="swiper-wrapper">
            <% for (Map bht : bhtList) { %>

            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>" style="background-image: url('<%= bht.get("image") %>'); height: 320px"></a>
                </div>
            </div>
            <%} %>

        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>

    <script>
        var mySwiper = new Swiper("#banner16", {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            // 如果需要分页器
            pagination: {
                el: ".swiper-pagination",
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        });
    </script>
</div>
<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="jianli">
            <h3 class="title">竞拍商品</h3>
            <div class="sap_tabs">
                <div class="resp-tabs" style="display: block; width: 100%; margin: 0px">
                    <ul class="resp-tabs-list wow fadeInUp animated clearfix" data-wow-delay=".7s">
                        <li class="resp-tab-item"><span>竞拍商品</span></li>
                    </ul>
                    <div class="resp-tabs-container">
                        <div class="tab-1 resp-tab-content">
                            <div class="tab_img clearfix">
                                <% List<Map> shangpinlist20 = Query.make("shangpin").limit(16).order("id desc").select(); %>

                                <div class="row">
                                    <% for (Map r : shangpinlist20) { %>

                                    <div class="col-md-3">
                                        <div class="portfolio-grids">
                                            <div class="grid">
                                                <a href="shangpindetail.jsp?id=<%= r.get("id") %>" class="swipebox">
                                                    <div class="img-box pb80">
                                                        <div class="img" style="background-image: url('<%= Info.images(r.get("tupian")) %>'); background-repeat: no-repeat"></div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <h4><span><%= r.get("mingcheng") %></span></h4>
                                                        <p><%= Info.subStr(r.get("xiangqing"), 30) %></p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <%} %>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>
<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>


<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <!-- START @HEAD -->
    <head>
        <!-- START @META SECTION -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>拍卖管理系统</title>
        <link href="ustyle/global/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="ustyle/global/fontawesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="ustyle/admin/css/layout.css" rel="stylesheet" />
    </head>
    <!--/ END HEAD -->

    <body class="page-session page-sound page-header-fixed page-sidebar-fixed demo-dashboard-session">
        <!--[if lt IE 9]>
            <p class="upgrade-browser">你的浏览器不支持该界面样式，请使用 <strong>谷歌浏览器</strong> 或者相应的极速浏览器访问</p>
        <![endif]-->

        <!-- START @WRAPPER -->
        <section id="wrapper">
            <!-- START @HEADER -->
            <header id="header">
                <div class="header-left hidden-lg hidden-md hidden-sm">
                    <!-- Start offcanvas left: This menu will take position at the top of template header (mobile only). Make sure that only #header have the `position: relative`, or it may cause unwanted behavior -->
                    <div class="navbar-minimize-mobile left">
                        <i class="fa fa-bars"></i>
                    </div>
                    <!--/ End offcanvas left -->

                    <!-- Start navbar header -->
                    <div class="navbar-header">
                        <!-- Start brand -->
                        <a class="navbar-brand" style="font-size: 12px" href="./"> 拍卖管理系统 </a
                        ><!-- /.navbar-brand -->
                        <!--/ End brand -->
                    </div>
                    <!-- /.navbar-header -->
                    <!--/ End navbar header -->

                    <!-- Start offcanvas right: This menu will take position at the top of template header (mobile only). Make sure that only #header have the `position: relative`, or it may cause unwanted behavior -->
                    <div class="navbar-minimize-mobile right">
                        <div class="dropdown navbar-profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="meta">
                                    <span class="avatar"><img src="ustyle/global/img/avatar/35/1.png" class="img-circle" alt="admin" /></span>
                                    <span class="text hidden-xs hidden-sm text-muted"><%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %></span>
                                    <span class="caret"></span>
                                </span>
                            </a>
                            <!-- Start dropdown menu -->
                            <ul class="dropdown-menu animated dropdown-menu-right flipInX">
                                <li class="dropdown-header">Account</li>
                                <li>
                                    <a href="mod.jsp" target="main"><i class="fa fa-user"></i>修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="logout.jsp" onclick="return confirm('确定退出？')"><i class="fa fa-sign-out"></i>退出</a>
                                </li>
                            </ul>
                            <!--/ End dropdown menu -->
                        </div>
                        <!-- /.dropdown navbar-profile -->
                    </div>
                    <!--/ End offcanvas right -->

                    <div class="clearfix"></div>
                </div>
                <!-- /.header-left -->

                <!-- Start header right -->
                <div class="header-right">
                    <!-- Start navbar toolbar -->
                    <div class="navbar navbar-toolbar navbar-success">
                        <!-- Start left navigation -->
                        <ul class="nav navbar-nav navbar-left">
                            <!-- Start sidebar shrink -->
                            <!--<li class="navbar-minimize">
                        <a href="javascript:void(0);" title="Minimize sidebar">
                            <i class="fa fa-bars"></i>
                        </a>
                    </li>-->
                            <!--/ End sidebar shrink -->

                            <!-- Start form search -->
                            <li class="navbar-search">
                                <!-- Just view on mobile screen-->
                                <span class="navbar-brand" href="./" style="color: #ffffff"> 拍卖管理系统 </span>
                            </li>
                            <!--/ End form search -->
                        </ul>
                        <!-- /.nav navbar-nav navbar-left -->
                        <!--/ End left navigation -->

                        <!-- Start right navigation -->
                        <ul class="nav navbar-nav navbar-right">
                            <!-- /.nav navbar-nav navbar-right -->
                            <li class="dropdown">
                                <a href="./" style="color: #FFFFFF"> 前台首页 </a>
                            </li>
                            <!-- Start profile -->
                            <li class="dropdown navbar-profile">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="meta">
                                        <span class="avatar"><img src="ustyle/global/img/avatar/35/1.png" class="img-circle" alt="admin" /></span>
                                        <span class="text hidden-xs hidden-sm text-muted"><%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %></span>
                                        <span class="caret"></span>
                                    </span>
                                </a>
                                <!-- Start dropdown menu -->
                                <ul class="dropdown-menu animated flipInX">
                                    <li class="dropdown-header">Account</li>
                                    <li>
                                        <a href="mod.jsp"><i class="fa fa-user"></i>修改密码</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="logout.jsp" onclick="return confirm('确定退出？')"><i class="fa fa-sign-out"></i>退出</a>
                                    </li>
                                </ul>
                                <!--/ End dropdown menu -->
                            </li>
                            <!-- /.dropdown navbar-profile -->
                            <!--/ End profile -->
                        </ul>
                        <!--/ End right navigation -->
                    </div>
                    <!-- /.navbar-toolbar -->
                    <!--/ End navbar toolbar -->
                </div>
                <!-- /.header-right -->
                <!--/ End header left -->
            </header>
            <!-- /#header -->
            <!--/ END HEADER -->

            <!--

    START @SIDEBAR LEFT
    |=========================================================================================================================|
    |  TABLE OF CONTENTS (Apply to sidebar left class)                                                                        |
    |=========================================================================================================================|
    |  01. sidebar-box               |  Variant style sidebar left with box icon                                              |
    |  02. sidebar-rounded           |  Variant style sidebar left with rounded icon                                          |
    |  03. sidebar-circle            |  Variant style sidebar left with circle icon                                           |
    |=========================================================================================================================|

    -->
            <aside id="sidebar-left" class="sidebar-circle">
                <!-- Start left navigation - profile shortcut -->
                <div class="sidebar-content">
                    <div class="media">
                        <a class="pull-left has-notif avatar" href="javascript:;">
                            <% if (request.getSession().getAttribute("touxiang") != null && request.getSession().getAttribute("touxiang") != "") { %>

                            <img src="<%= request.getSession().getAttribute("touxiang") !=null ? request.getSession().getAttribute("touxiang") : "" %>" alt="admin" />
                            <%} else { %>
                            <img src="ustyle/global/img/avatar/50/1.png" alt="admin" />
                            <%} %>

                            <i class="online"></i>
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading"><span><%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %></span></h4>
                            <small><%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %></small>
                        </div>
                    </div>
                </div>
                <!-- /.sidebar-content -->
                <!--/ End left navigation -  profile shortcut -->

                <!-- Start left navigation - menu -->
                <ul class="sidebar-menu">
                    <!-- Start navigation - blog -->

                    <% if ("管理员".equals(request.getSession().getAttribute("cx"))) { %>
 <%@ include file="left_guanliyuan.jsp" %>
 <%} %>
 <% if ("用户".equals(request.getSession().getAttribute("cx"))) { %>
 <%@ include file="left_yonghu.jsp" %>
 <%} %>


                    <!--/ End navigation - blog -->
                </ul>
                <!-- /.sidebar-menu -->
                <!--/ End left navigation - menu -->
            </aside>
            <!-- /#sidebar-left -->
            <!--/ END SIDEBAR LEFT -->

            <!-- START @PAGE CONTENT -->
            <section id="page-content">
                <iframe scrolling="1" frameborder="0" name="main" src="sy.jsp"></iframe>
            </section>
            <!-- /#page-content -->
            <!--/ END PAGE CONTENT -->
        </section>
        <!-- /#wrapper -->
        <!--/ END WRAPPER -->

        <!-- START JAVASCRIPT SECTION (Load javascripts at bottom to reduce load time) -->
        <!-- START @CORE PLUGINS -->
        <script src="ustyle/global/jquery.min.js"></script>
        <script src="ustyle/global/bootstrap/js/bootstrap.min.js"></script>
        <script src="ustyle/global/jquery.nicescroll.min.js"></script>
        <script src="ustyle/admin/js/apps.js"></script>

        <script>
            setInterval(function () {
                $.post("./", "", function () {});
            }, 60 * 1000);
        </script>
    </body>
</html>

<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <!-- START @HEAD -->
    <head>
        <!-- START @META SECTION -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta
            name="description"
            content="Blankon is a theme fullpack admin template powered by Twitter bootstrap 3 front-end framework. Included are multiple example pages, elements styles, and javascript widgets to get your project started."
        />
        <meta name="keywords" content="admin, admin template, bootstrap3, clean, fontawesome4, good documentation, lightweight admin, responsive dashboard, webapp" />
        <meta name="author" content="Djava UI" />
        <title>SIGN IN | BLANKON - Fullpack Admin Theme</title>
        <!--/ END META SECTION -->

        <!-- START @FONT STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" />
        <!--/ END FONT STYLES -->

        <!-- START @GLOBAL MANDATORY STYLES -->
        <link href="ustyle/global/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <!--/ END GLOBAL MANDATORY STYLES -->

        <!-- START @PAGE LEVEL STYLES -->
        <link href="ustyle/global/fontawesome/css/font-awesome.min.css" rel="stylesheet" />
        <!--/ END PAGE LEVEL STYLES -->

        <!-- START @THEME STYLES -->
        <link href="ustyle/admin/css/layout.css" rel="stylesheet" />
        <link href="ustyle/admin/css/pages/sign.css" rel="stylesheet" />
        <!--/ END THEME STYLES -->
    </head>

    <body class="page-sound">
        <!--[if lt IE 9]>
            <p class="upgrade-browser">
                Upps!! You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" target="_blank">upgrade your browser</a> to improve your
                experience.
            </p>
        <![endif]-->

        <!-- START @SIGN WRAPPER -->
        <div id="sign-wrapper">
            <!-- Brand -->
            <div class="brand">拍卖管理系统</div>
            <!--/ Brand -->

            <!-- Login form -->
            <form class="sign-in form-horizontal shadow rounded no-overflow" action="login?ac=adminlogin&a=a" method="post">
                <div class="sign-header">
                    <div class="form-group">
                        <div class="sign-text">
                            <span>后台登录</span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.sign-header -->
                <div class="sign-body">
                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="text" class="form-control input-sm" placeholder="用户名" name="username" />
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="password" class="form-control input-sm" placeholder="密码" name="pwd" />
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group">
                        <select name="cx" class="form-control border-0 shadow form-control-lg text-violet">
                            <option value="管理员">管理员</option>
                        </select>
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="text" class="form-control input-sm" placeholder="验证码" name="pagerandom" />
                            <span class="input-group-addon">
                                <img
                                    alt="刷新验证码"
                                    title="点击刷新验证码"
                                    onClick="this.src='image.jsp?time='+new Date().getTime();"
                                    src="image.jsp"
                                    style="cursor: pointer; padding-top: 10px; width: 60px; height: 22px; float: right"
                                />
                            </span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.sign-body -->
                <div class="sign-footer">
                    <div class="form-group">
                        <button type="submit" class="btn btn-theme btn-lg btn-block no-margin rounded" id="login-btn">登录</button>
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.sign-footer -->
            </form>
            <!-- /.form-horizontal -->
            <!--/ Login form -->
        </div>
        <!-- /#sign-wrapper -->
        <!--/ END SIGN WRAPPER -->

        <!-- START JAVASCRIPT SECTION (Load javascripts at bottom to reduce load time) -->
        <!-- START @CORE PLUGINS -->
        <script src="ustyle/global/jquery.min.js"></script>

        <script src="ustyle/global/bootstrap/js/bootstrap.min.js"></script>
        <script src="ustyle/global/jquery.validate.min.js"></script>
        <script src="ustyle/admin/js/blankon.sign.js"></script>
    </body>
    <!-- END BODY -->
</html>

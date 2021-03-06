<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dao.CheckLogDAO, com.entity.LogStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.CustomDAO" %>
<%@ page import="com.entity.Custom" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>个人与家乡展示管理平台</title>

    <!-- Custom fonts for this template-->
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">我与家乡</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>欢迎页</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            个人
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="selfIntro.jsp">
                <i class="fas fa-fw fa-cog"></i>
                <span>个人简介</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>个人技能管理</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">方向:</h6>
                    <a class="collapse-item" href="science.jsp">科研情况</a>
                    <a class="collapse-item" href="study.jsp">学习成绩</a>
                    <a class="collapse-item" href="develop.jsp">开发技能</a>
                    <a class="collapse-item" href="reward.jsp">获奖</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            家乡
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="hometown.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>家乡简介</span></a>
        </li>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>特色介绍</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">南京特色:</h6>
                    <a class="collapse-item" href="food.jsp">美食</a>
                    <a class="collapse-item" href="scene.jsp">美景</a>
                    <a class="collapse-item" href="custom.jsp">风土人情</a>
                </div>
            </div>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            留言板
        </div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="messageBoard.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>用户留言</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

        <!-- Sidebar Message -->
        <div class="sidebar-card">
            <img class="sidebar-card-illustration mb-2" src="static/img/undraw_rocket.svg" alt="">
            <p class="text-center mb-2"><strong>个人家乡管理展示平台</strong>  </p>
            <%--<a class="btn btn-success btn-sm" href="https://blog.csdn.net/xiangQiAtCSDN">访问我的博客!</a>--%>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%
                                CheckLogDAO dao = new CheckLogDAO();
                                List<LogStatus> list = dao.readLogStatus();
                                for (LogStatus ls : list) {
                            %>
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                <%=ls.getName()%>
              </span>
                            <%}%>
                            <img class="img-profile rounded-circle"
                                 src="static/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="login.jsp">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                访客注册/登录/切换账号
                            </a>
                            <a class="dropdown-item" href="loginAdmin.jsp">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                管理员登录/切换账号
                            </a>
                            <div class="dropdown-divider"></div>
                            <form method="post" action="ServletLogout">
                                <button class="dropdown-item" type="submit" data-toggle="modal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    退出登录
                                </button>
                            </form>

                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">风土人情</h1>
                </div>

                <div>
                    <%
                        LogStatus ls = list.get(0);
                        if ("Chess".equals(ls.getName())) {
                    %>
                    <a href="editCustom.jsp" class="btn btn-primary btn-icon-split" id="button1">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                        <span class="text">管理此页内容</span>
                    </a>
                    <%}%>
                </div>

                <div>&nbsp;</div>

                <%
                    CustomDAO customDAO = new CustomDAO();
                    List<Custom> list1 = customDAO.readCustom();
                    int num = list1.size(); //食物数量
                    int col = num / 2; //第一列的数量
                %>

                <div class="row">
                    <div class="col-lg-6">

                        <%
                            for (int i = 0; i < col; i++) {
                        %>
                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><%=list1.get(i).getId()%>&nbsp;<%=list1.get(i).getName()%>
                                </h6>
                            </div>
                            <div class="card-body">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%=list1.get(i).getInfo()%>
                                <%
                                    if (!list1.get(i).getImg().equals("")) {
                                %>
                                <div align="center">
                                    <img src="<%=list1.get(i).getImg()%>" width="400">
                                </div>
                                <%
                                    }
                                    System.out.println(list1.get(i));
                                %>
                            </div>
                        </div>

                        <%}%>

                    </div>
                    <div class="col-lg-6">

                        <%
                            for (int i = col; i < num; i++) {
                        %>
                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><%=list1.get(i).getId()%>&nbsp;<%=list1.get(i).getName()%>
                                </h6>
                            </div>
                            <div class="card-body">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%=list1.get(i).getInfo()%>
                                <%
                                    if (!list1.get(i).getImg().equals("")) {
                                %>
                                <div align="center">
                                    <img src="<%=list1.get(i).getImg()%>" width="400">
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                        <%}%>

                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; hello 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="static/vendor/jquery/jquery.min.js"></script>
<script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="static/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="static/js/demo/chart-area-demo.js"></script>
<script src="static/js/demo/chart-pie-demo.js"></script>

</body>

</html>
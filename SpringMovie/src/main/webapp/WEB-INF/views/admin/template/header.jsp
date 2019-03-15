<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<header id="header">
           <!--logo start-->
            <div class="brand">
                <a href="admin_Member.movie" class="logo">
                    <!-- <i class="icon-layers"></i> -->
                    <span>a.MOVIE</span>&nbsp;ADMIN</a>
            </div>
            <!--logo end-->
            <ul class="nav navbar-nav navbar-left">
                <li class="toggle-navigation toggle-left">
                    <button class="sidebar-toggle" id="toggle-left">
                        <i class="fa fa-bars"></i>
                    </button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown profile hidden-xs">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="meta">
                        <span class="text">${sessionScope.id}</span>
                        <span class="caret"></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight" role="menu">
                        <li>
                            <span class="arrow top"></span>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="test" href="logout.movie">
                                <span class="icon"><i class="fa fa-sign-out"></i>
                                </span>Logout
                            </a>
                        </li>
                    </ul>
                </li>
                 <li class="toggle-fullscreen hidden-xs">
                    <button type="button" class="btn btn-default expand" id="toggle-fullscreen">
                        <i class="fa fa-expand"></i>
                    </button>
                </li>
            </ul>
        </header> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>test</title>
    <link rel="icon" href="../image/logo.png" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
    body {
	  background: #f7f6f3;
	  font-family: sans-serif;
	}
	.calendar {
	  position: relative;
	  top: 50%;
	  background: #fff;
	  border-radius: 4px;
	  overflow: hidden;
	}
	.ui-datepicker-header {
	  height: 50px;
	  line-height: 50px;
	  color: #b0aead;
	  background: #e9e5e3;
	  margin-bottom: 10px;
	}
	.ui-datepicker-prev,
	.ui-datepicker-next {
	  width: 20px;
	  height: 20px;
	  text-indent: 9999px;
	  border: 2px solid #b0aead;
	  border-radius: 100%;
	  cursor: pointer;
	  overflow: hidden;
	  margin-top: 12px;
	}
	.ui-datepicker-prev {
	  float: left;
	  margin-left: 12px;
	}
	.ui-datepicker-prev:after {
	  transform: rotate(45deg);
	  margin: -43px 0px 0px 8px;
	}
	.ui-datepicker-next {
	  float: right;
	  margin-right: 12px;
	}
	.ui-datepicker-next:after {
	  transform: rotate(-135deg);
	  margin: -43px 0px 0px 6px;
	}
	.ui-datepicker-prev:after,
	.ui-datepicker-next:after {
	  content: '';
	  position: absolute;
	  display: block;
	  width: 4px;
	  height: 4px;
	  border-left: 2px solid #b0aead;
	  border-bottom: 2px solid #b0aead;
	}
	.ui-datepicker-prev:hover,
	.ui-datepicker-next:hover,
	.ui-datepicker-prev:hover:after,
	.ui-datepicker-next:hover:after {
	  border-color: #5ed1cc;
	}
	.ui-datepicker-title {
	  text-align: center;
	}
	.ui-datepicker-calendar {
	  width: 100%;
	  text-align: center;
	}
	.ui-datepicker-calendar thead tr th span {
	  display: block;
	  width: 40px;
	  color: #00a8b2;
	  margin-bottom: 5px;
	  font-size: 13px;
	}
	.ui-state-default {
	  display: block;
	  text-decoration: none;
	  color: #b5b5b5;
	  line-height: 40px;
	  font-size: 12px;
	}
	.ui-state-default:hover {
	  background: rgba(0,0,0,0.02);
	}
	.ui-state-highlight {
	  color: #8dd391;
	}
	.ui-state-active {
	  color: #5ed1cc;
	}
	.ui-datepicker-unselectable .ui-state-default {
	  color: #eee;
	  border: 2px solid transparent;
	}
    </style>

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/IntegrityLibraryProject">통합 도서관</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="certificate.jsp" class="dropdown-toggle"><i class="fa fa-envelope"></i> 회원가입</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"><i class="fa fa-bell"></i> 로그인</a>                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> HOME </a>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-user"></i> My Page</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="glyphicon glyphicon-search"></i> 자료 상세 검색 </a>
                    </li>    
                    <li>
                        <a href="charts.html"><i class="fa fa-fw fa-desktop"></i> 도서관 안내 </a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> 도서 대출 조회</a>
                    </li> 
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> 도서 예약 조회</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Best 도서</a>
                    </li>
                    <!-- <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> </a>
                    </li> -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-desktop"></i> 참고 사이트 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="http://www.riss.kr/index.do">Riss 학술정보서비스</a>
                            </li>
                            <li>
                                <a href="http://www.ndsl.kr/index.do">국가과학기술전자도서관</a>
                            </li>
                            <li>
                                <a href="http://www.museum.go.kr/site/main/home">국립중앙도서관</a>
                            </li>
                            <li>
                                <a href="http://www.nanet.go.kr/main.do">국회도서관</a>
                            </li>
                            <li>
                                <a href="http://www.dlibrary.go.kr/JavaClient/jsp/ndli/index.jsp?LOGSTATUS=notok&NLSSOTOKEN=">국가전자도서관</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- 
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
		<br><br><br><br><br>aaaaa
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../js/plugins/morris/raphael.min.js"></script>
    <script src="../js/plugins/morris/morris.min.js"></script>
    <script src="../js/plugins/morris/morris-data.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>
    <script src="../js/index.js"></script>

</body>

</html>

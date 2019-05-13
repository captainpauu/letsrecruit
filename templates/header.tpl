<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>DashBoard</title>

    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome JS -->
    <script defer src="/assets/fontawesome/js/solid.js"></script>
    <script defer src="/assets/fontawesome/js/fontawesome.js"></script>
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="/assets/jQuery/jquery-3.4.1.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets/datatables/css/datatables.min.css">
    <script type="text/javascript" charset="utf8" src="/assets/datatables/js/datatables.min.js"></script>
    <link rel="stylesheet" href="/assets/css/global.css">
    <script src="/assets/js/global.js"></script>
</head>

<body>
<div class="wrapper">

    <!-- Sidebar -->
    <nav id="sidebar" class="active">
        <div class="sidebar-header">
            <img src="/assets/images/Aventri-color-logo.webp">
            <span>Aventri</span>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-table"></i>
                    <span>Dashboards</span>
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="#">Candidate Dashboard</a>
                    </li>
                    <li>
                        <a href="#">User Dashboard</a>
                    </li>
                    <li>
                        <a href="#">Consultancy Dashboard</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="addCandidate.html">
                    <i class="fas fa-briefcase"></i>
                    <span>Add Candidate</span>
                </a>
            </li>
            <li>
                <a href="#interviewSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-copy"></i>
                    <span>Interviews</span>
                </a>
                <ul class="collapse list-unstyled" id="interviewSubmenu">
                    <li>
                        <a href="#">Interview Rounds</a>
                    </li>
                    <li>
                        <a href="#">Interview Requests</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-image"></i>
                    <span>Portfolio</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-address-book"></i>
                    <span>Contact Us</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">
        <nav class="navbar navbar-default navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-bars"></i>
                </button>
                <ul class="nav navbar-nav navbar-right">
                    <div id="notification" class="dropdown">
                        <span class="counter">3</span>
                        <a class="dropdown-toggle" href="#" role="button" id="notificationDropdown"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-lebelledby="notificationDropdown">
                            <li class="list notification-head">
                                <i class="far fa-bell"></i> Pending Interview Requests
                            </li>
                            <div class="dropdown-divider"></div>
                            <li class="list notification-body">
                                <ul class="list-unstyled">
                                    <li>
                                        <b>Pravin Dhange</b> for <b>job title</b>
                                        <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                                    </li>
                                    <li>
                                        <b>Pravin Dhange</b> for <b>job title</b>
                                        <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                                    </li>
                                    <li>
                                        <b>Pravin Dhange</b> for <b>job title</b>
                                        <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                                    </li>
                                </ul>
                            </li>
                            <div class="dropdown-divider"></div>
                            <li class="list notification-foot">
                                <a>View All Pending Requests <i class="fas fa-arrow-right"></i></a>
                            </li>
                        </div>
                    </div>
                    <div id="profile" class="dropdown">
                        <a class="dropdown-toggle" href="#" role="button" id="profileDropdown" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Pravin Dhange
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-lebelledby="profileDropdown">
                            <li>
                                <a href="#"><i class="fas fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="fas fa-cog"></i> Settings</a>
                            </li>
                            <div class="dropdown-divider"></div>
                            <li>
                                <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                            </li>
                        </div>
                    </div>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="main-header">
                <h3>Candidate Dashboard</h3>
            </div>
            <div class="main-content">
                <table id="dataTable" class="table table-bordered table-hover" style="width:100%">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                    </tr>
                    <tr>
                        <td>Garrett Winters</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>63</td>
                        <td>2011/07/25</td>
                        <td>$170,750</td>
                    </tr>
                    <tr>
                        <td>Ashton Cox</td>
                        <td>Junior Technical Author</td>
                        <td>San Francisco</td>
                        <td>66</td>
                        <td>2009/01/12</td>
                        <td>$86,000</td>
                    </tr>
                    <tr>
                        <td>Cedric Kelly</td>
                        <td>Senior Javascript Developer</td>
                        <td>Edinburgh</td>
                        <td>22</td>
                        <td>2012/03/29</td>
                        <td>$433,060</td>
                    </tr>
                    <tr>
                        <td>Airi Satou</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>33</td>
                        <td>2008/11/28</td>
                        <td>$162,700</td>
                    </tr>
                    <tr>
                        <td>Brielle Williamson</td>
                        <td>Integration Specialist</td>
                        <td>New York</td>
                        <td>61</td>
                        <td>2012/12/02</td>
                        <td>$372,000</td>
                    </tr>
                    <tr>
                        <td>Herrod Chandler</td>
                        <td>Sales Assistant</td>
                        <td>San Francisco</td>
                        <td>59</td>
                        <td>2012/08/06</td>
                        <td>$137,500</td>
                    </tr>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                    </tr>
                    <tr>
                        <td>Garrett Winters</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>63</td>
                        <td>2011/07/25</td>
                        <td>$170,750</td>
                    </tr>
                    <tr>
                        <td>Ashton Cox</td>
                        <td>Junior Technical Author</td>
                        <td>San Francisco</td>
                        <td>66</td>
                        <td>2009/01/12</td>
                        <td>$86,000</td>
                    </tr>
                    <tr>
                        <td>Cedric Kelly</td>
                        <td>Senior Javascript Developer</td>
                        <td>Edinburgh</td>
                        <td>22</td>
                        <td>2012/03/29</td>
                        <td>$433,060</td>
                    </tr>
                    <tr>
                        <td>Airi Satou</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>33</td>
                        <td>2008/11/28</td>
                        <td>$162,700</td>
                    </tr>
                    <tr>
                        <td>Brielle Williamson</td>
                        <td>Integration Specialist</td>
                        <td>New York</td>
                        <td>61</td>
                        <td>2012/12/02</td>
                        <td>$372,000</td>
                    </tr>
                    <tr>
                        <td>Herrod Chandler</td>
                        <td>Sales Assistant</td>
                        <td>San Francisco</td>
                        <td>59</td>
                        <td>2012/08/06</td>
                        <td>$137,500</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
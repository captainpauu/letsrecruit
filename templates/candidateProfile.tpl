<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    {include 'header.tpl'}

    <title>Candidate Profile</title>
    <link rel="stylesheet" href="/assets/css/candidateProfile.css">
</head>

<body>
<div class="wrapper">

    <!-- Side Navbar -->
    {include 'side-navbar.tpl'}

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navbar -->
        {include 'top-navbar.tpl'}

        <div class="container-fluid">
            <div class="main-header">
                <h3>Candidate Profile</h3>
            </div>
            <!-- Information table table -->
            <div id="information" class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs" id="informationTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="personal-tab" data-toggle="tab" href="#personal" role="tab"
                               aria-controls="personal" aria-selected="true">Personal Info</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="work-tab" data-toggle="tab" href="#work" role="tab"
                               aria-controls="work" aria-selected="false">Work Info</a>
                        </li>
                    </ul>
                </div>
                <div class="card-block">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="personal" role="tabpanel"
                             aria-labelledby="personal-tab">
                            <div class="row">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <th scope="row">Full Name</th>
                                                <td>Josephine Villa</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender</th>
                                                <td>Female</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Birth Date</th>
                                                <td>October 25th, 1990</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Marital Status</th>
                                                <td>Single</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Location</th>
                                                <td>New York, USA</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- end of table col-lg-6 -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <th scope="row">Email</th>
                                                <td><a href="#!">Demo@phenix.com</a></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Mobile Number</th>
                                                <td>(0123) - 4567891</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Twitter</th>
                                                <td>@codedthemes</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Skype</th>
                                                <td>codedthemes.demo</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Website</th>
                                                <td><a href="#!">www.demo.com</a></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- end of table col-lg-6 -->
                            </div>
                            <!-- end of row -->
                        </div>
                        <div class="tab-pane fade" id="work" role="tabpanel" aria-labelledby="work-tab">
                            <div class="row">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <th scope="row">Full Name</th>
                                                <td>Josephine Villa</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender</th>
                                                <td>Female</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Birth Date</th>
                                                <td>October 25th, 1990</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- end of table col-lg-6 -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <th scope="row">Email</th>
                                                <td><a href="#!">Demo@phenix.com</a></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Mobile Number</th>
                                                <td>(0123) - 4567891</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Twitter</th>
                                                <td>@codedthemes</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- end of table col-lg-6 -->
                            </div>
                            <!-- end of row -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Interview history table -->
            <div id="interview" class="card">
                <div class="card-header">Interview History</div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>Josephine Villa</th>
                                        <th>Full Name</th>
                                        <th>Josephine Villa</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Gender</td>
                                        <td>Female</td>
                                        <td>Full Name</td>
                                        <td>Josephine Villa</td>
                                        <td><span class="badge badge-success">Accepted</span></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>Female</td>
                                        <td>Full Name</td>
                                        <td>Josephine Villa</td>
                                        <td><span class="badge badge-success">Accepted</span></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>Female</td>
                                        <td>Full Name</td>
                                        <td>Josephine Villa</td>
                                        <td><span class="badge badge-danger">Rejected</span></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>Female</td>
                                        <td>Full Name</td>
                                        <td>Josephine Villa</td>
                                        <td><span class="badge badge-danger">Rejected</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end of row -->
                </div>
                <!-- end of card-block -->
            </div>
            <div id="resume" class="card">
                <div class="card-header">Resume</div>
                <div class="card-block">
                    <iframe src="assets/resumes/PAUU.pdf" style="width:100%; height:500px;" frameborder="0">
                    </iframe>
                </div>
            </div>
        </div>

    </div>
</body>

</html>
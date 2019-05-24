<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    {include 'header.tpl'}

    <title>Candidate Registration Form</title>
    <link rel="stylesheet" href="/assets/css/jobOpening.css">
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
                <h3>Jobs Portal</h3>
            </div>
            <div class="row">
                <!-- Information table table -->
                <div class="col-md-8">
                    <div id="jobs-table" class="card">
                        <div class="card-header">
                            <h5>Jobs</h5>
                        </div>
                        <div class="card-block">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <div class="job-row">
                                            <h6>Junior PHP Developer</h6>
                                            <div class="row job-info">
                                                <label class="col-md-4"><i class="fas fa-calendar-alt"></i> 2 - 3 Years</label>
                                                <label class="col-md-4"><i class="fas fa-map-marker-alt"></i> Pune, India</label>
                                                <label class="col-md-4"><i class="fas fa-rupee-sign"></i> 3.5 - 4.5 LPA</label>
                                            </div>
                                            <div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="job-row">
                                            <div>
                                                <h6>Junior JAVA Developer</h6>
                                            </div>
                                            <div class="row job-info">
                                                <label class="col-md-4"><i class="fas fa-calendar-alt"></i> 1 - 3 Years</label>
                                                <label class="col-md-4"><i class="fas fa-map-marker-alt"></i> Mumbai, India</label>
                                                <label class="col-md-4"><i class="fas fa-rupee-sign"></i> 4.5 - 5.5 LPA</label>
                                            </div>
                                            <div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="job-row">
                                            <h6>Junior UI Developer</h6>
                                            <div class="row job-info">
                                                <label class="col-md-4"><i class="fas fa-calendar-alt"></i> 0 - 5 Years</label>
                                                <label class="col-md-4"><i class="fas fa-map-marker-alt"></i> Chennai, India</label>
                                                <label class="col-md-4"><i class="fas fa-rupee-sign"></i> 4 - 5.5 LPA</label>
                                            </div>
                                            <div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end of row -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div id="jobs-form" class="card">
                        <div class="card-header">
                            <h5>Add Job</h5>
                        </div>
                        <div class="card-block">
                            <form>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Job Profile</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Experience Required</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="ex. 3 - 5 years">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Location</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Pune, India">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Salary</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="ex. 4 - 5.5 LPA">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Job Description</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect2">Skills Required</label>
                                    <select multiple class="form-control" id="exampleFormControlSelect2">
                                        <option>PHP</option>
                                        <option>.NET</option>
                                        <option>JAVA</option>
                                        <option>MySQL</option>
                                        <option>Security</option>
                                    </select>
                                </div>
                                <div>
                                    <button class="btn btn-primary">Add</button>
                                    <button class="btn btn-primary-outline">Cancel</button>
                                    <div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
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
                                        {foreach $jobs as $job}
                                            <div class="job-row">
                                                <h6>{$job.name}</h6>
                                                <div class="row job-info">
                                                    <label class="col-md-3"><i class="fas fa-calendar-alt"></i> {$job.req_experience} years</label>
                                                    <label class="col-md-3"><i class="fas fa-map-marker-alt"></i> {$job.location}</label>
                                                    <label class="col-md-3"><i class="fas fa-rupee-sign"></i> {$job.salary}</label>
                                                </div>
                                                <div>
                                                    <p>{$job.description}</p>
                                                </div>
                                            </div>
                                        {/foreach}
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
                            <form action="{path_for name='addJob'}" method="post">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Select Technology</label>
                                    <select class="form-control" name="technology">
                                        <option value="0">Select...</option>
                                        {foreach $techs as $tech}
                                            <option value="{$tech.id}">{$tech.tech_name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Job Profile</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Experience Required</label>
                                    <input type="text" class="form-control" id="experience" name="experience" placeholder="ex. 3 - 5 years">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Location</label>
                                    <input type="text" class="form-control" id="location" name="location" placeholder="Pune, India">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Salary</label>
                                    <input type="text" class="form-control" id="salary" name="salary" placeholder="ex. 4 - 5.5 LPA">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Job Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="4"></textarea>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <button type="reset" class="btn btn-primary-outline">Cancel</button>
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
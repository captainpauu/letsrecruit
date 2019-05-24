<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    {include 'header.tpl'}

    <title>Candidate DashBoard</title>
    <link rel="stylesheet" href="/assets/css/candidateDashboard.css">
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
                        {foreach $allCandidates as $c}
                            <tr>
                                <td>{$c.id}</td>
                                <td>{$c.fname} {$c.lname}</td>
                                <td>{$c.cand_email}</td>
                                <td>{$c.cand_mobile}</td>
                                <td>{$c.cand_technology}</td>
                                <td>{$c.cand_resume}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
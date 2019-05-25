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
                        <th>Job Profile</th>
                        <th>Experience</th>
                        <th>Current CTC</th>
                        <th>Expected CTC</th>
                        <th>Notice Period</th>
                        <th>Offer In Hand?</th>
                        <th>Interview Round</th>
                    </tr>
                    </thead>
                    <tbody>
                        {foreach $allCandidates as $c}
                            <tr>
                                <td>
                                    <a href="{path_for name='candidateProfile' data=['id' => {$c.id}]}">{$c.fname} {$c.lname}</a>
                                </td>
                                <td>{$c.job_profile}</td>
                                <td>{$c.experience}</td>
                                <td>{$c.current_ctc}</td>
                                <td>{$c.expected_ctc}</td>
                                <td>{$c.notice_period}</td>
                                <td>{$c.offer_in_hand}</td>
                                <td></td>
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
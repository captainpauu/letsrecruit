<!DOCTYPE html>
<html>

<head>
    {include 'header.tpl'}

    <title>Interview Requests</title>
    <link rel="stylesheet" href="/assets/css/interviewRequests.css">

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
                <div class="row">
                    <h3>Interview Dashboard</h3>
                </div>
            </div>
            <div class="main-content">
                <table id="dataTable" class="table table-bordered table-hover" style="width:100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Candidate Name</th>
                        <th>Job Profile</th>
                        <th>Experience</th>
                        <th>Date & Time</th>
                        <th>Interview Mode</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $interviews as $i}
                        <tr>
                            <td>{$i.candidate_id}</td>
                            <td>{$i.fname} {$i.lname}</td>
                            <td>{$i.job_profile}</td>
                            <td>{$i.experience}</td>
                            <td>{$i.scheduled_date} {$i.scheduled_time}</td>
                            <td>
                                {if $i.interview_mode == 1}
                                    Face to Face
                                {elseif $i.interview_mode == 2}
                                    Skype
                                {elseif $i.interview_mode == 3}
                                    Phone Call
                                {/if}
                            </td>
                            <td>
                                {if $i.schedule_status == 1}
                                    <a href="/interview/request/{$i.id}/{$i.candidate_id}/2" id="acceptRequest" title="Accept">
                                        <i class="fas fa-check-circle"></i>
                                    </a>
                                    <a href="/interview/request/{$i.id}/{$i.candidate_id}/3" id="rejectRequest" title="Reject">
                                        <i class="fas fa-times-circle"></i>
                                    </a>
                                {elseif $i.schedule_status == 2}
                                    <span class="badge badge-success">Accepted</span>
                                {elseif $i.schedule_status == 3}
                                    <span class="badge badge-danger">Rejected</span>
                                {elseif $i.schedule_status == 0}
                                    <span class="badge badge-info">Done</span>
                                {/if}
                            </td>
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
<!DOCTYPE html>
<html>

<head>
    {include 'header.tpl'}

    <title>Candidate Profile</title>
    <link rel="stylesheet" href="/assets/css/candidateProfile.css">
    <script src="/assets/js/candidateProfile.js"></script>
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
            <div class="row col-md-12">
                <div class="col-md-8">
                    <div id="information" class="card">
                        <div class="card-header">
                            <ul class="nav nav-tabs" id="informationTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="personal-tab" data-toggle="tab" href="#personal"
                                       role="tab"
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
                                                        <td>{$candidate.fname} {$candidate.lname}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Birth Date</th>
                                                        <td>{$candidate.birth_date}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Gender</th>
                                                        <td>{$candidate.gender}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Current City</th>
                                                        <td>{$candidate.current_city}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">State</th>
                                                        <td>{$candidate.state}</td>
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
                                                        <td>{$candidate.email}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Mobile Number</th>
                                                        <td>{$candidate.mobile}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Marital Status</th>
                                                        <td>{$candidate.marital_status}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Permanent City</th>
                                                        <td>{$candidate.permanent_city}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Zip Code</th>
                                                        <td>{$candidate.zip_code}</td>
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
                                                        <th scope="row">Job Profile</th>
                                                        <td>{$candidate.job_profile}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Experience</th>
                                                        <td>{$candidate.experience}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Current CTC</th>
                                                        <td>{$candidate.current_ctc}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Skills</th>
                                                        <td>{$candidate.skills}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Offer In Hand?</th>
                                                        <td>{$candidate.offer_in_hand}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Reference Type</th>
                                                        <td>{$candidate.reference}</td>
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
                                                        <th scope="row">Current Company</th>
                                                        <td>{$candidate.current_company}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">LinkedIn URL</th>
                                                        <td>{$candidate.linkedin}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Expected CTC</th>
                                                        <td>{$candidate.expected_ctc}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Notice Period</th>
                                                        <td>{$candidate.notice_period}</td>
                                                    </tr>
                                                    <tr>
                                                        {if $candidate.reference == 'Consultancy'}
                                                            <th scope="row">Consultancy Name</th>
                                                            <td>{$candidate.consult_id}</td>
                                                        {elseif $candidate.reference == 'Office Employee'}
                                                            <th scope="row">Referred By</th>
                                                            <td>{$candidate.referred_by}</td>
                                                        {/if}
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Change Reason</th>
                                                        <td>{$candidate.change_reason}</td>
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
                </div>
                <div class="col-md-4">
                    <div id="shortlist-status" class="card text-white bg-info">
                        <div class="card-header">Shortlist Status</div>
                        <div class="card-body">
                            {if $candidate.is_shortlisted == 1}
                                <h5>Shortlisted by <strong>{$candidate.name}</strong> on
                                    <strong>{$candidate.shortlist_date}</strong>.</h5>
                            {elseif $candidate.is_shortlisted == 2}
                                <h5>Rejected by <strong>{$candidate.name}</strong> on
                                    <strong>{$candidate.shortlist_date}</strong>.</h5>
                            {else}
                                <h5 class="card-title">Not shortlisted yet. Want to shortlist?</h5>
                                <a href="{path_for name='shortlisting' data=['status' => 1, 'id' => {$candidate.id}]}">
                                    <i class="fas fa-check-circle"></i> Yes
                                </a>
                                <a href="{path_for name='shortlisting' data=['id' => {$candidate.id}, 'status' => 2]}">
                                    <i class="fas fa-times-circle"></i> No
                                </a>
                            {/if}
                        </div>
                    </div>
                    <div id="interview-schedule"
                         class="card text-white
                        {if $schedule.schedule_status == 1}
                            bg-secondary">
                            <div class="card-header">Interview Round Status</div>
                        {elseif $schedule.schedule_status == 2}
                            bg-success">
                            <div class="card-header">Interview Round Status</div>
                        {elseif $schedule.schedule_status == 3}
                            bg-danger">
                            <div class="card-header">Interview Round Status</div>
                        {elseif $schedule.schedule_status == 0}
                            bg-secondary">
                            <div class="card-header">Schedule Interview</div>
                        {/if}

                        <div class="card-body">
                            {if $schedule.schedule_status == 1}
                                <h6>
                                    Interview scheduled on {$schedule.scheduled_date} at {$schedule.scheduled_time} by {$schedule.scheduled_by}.
                                    Waiting for interviewers acceptance.
                                </h6>
                            {elseif $schedule.schedule_status == 2}
                                <h6>{$schedule.interviewer_name} has accepted interview request.
                                    Interview scheduled on {$schedule.scheduled_date} at {$scheduled.schedule_time}</h6>
                            {else}
                                {if $schedule.schedule_status == 3}
                                    <h6>{$schedule.interviewer_name} has rejected interview request.
                                        Interview was scheduled on {$schedule.scheduled_date} at {$schedule.scheduled_time}</h6>
                                {/if}
                                <button id="shceduleInterviewBtn" class="btn btn-light btn-sm" data-toggle="modal"
                                        data-target="#scheduleModal">Schedule Interview
                                </button>
                                <button class="btn btn-success btn-sm">Offer Job</button>
                            {/if}
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
                                        <th>Round Number</th>
                                        <th>Interviewer Name</th>
                                        <th>Interview Date</th>
                                        <th>Feedback</th>
                                        <th>Round Status</th>
                                        <th>Feedback By</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $rounds as $r}
                                        <tr>
                                            <td>{$r.round_number}</td>
                                            <td>{$r.name}</td>
                                            <td>{$r.scheduled_date} {$r.scheduled_time}</td>
                                            {if $r.round_status == 0}
                                                {assign var=feedbackId value=$r.interview_id}
                                                <td><button id="feedbackSubmitBtn" data-toggle="modal" data-target="#feedbackFormModal"
                                                       class="btn btn-info btn-sm">Submit Feedback</button></td>
                                                <td><span class="badge badge-primary">Pending</span></td>
                                            {elseif $r.round_status == 1}
                                                <td>{$r.feedback}</td>
                                                <td><span class="badge badge-success">Accepted</span></td>
                                            {elseif $r.round_status == 2}
                                                <td>{$r.feedback}</td>
                                                <td><span class="badge badge-danger">Rejected</span></td>
                                            {/if}
                                            <td>{$r.feedback_by_name}</td>
                                        </tr>
                                    {/foreach}
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
                    <iframe src="/assets/resumes/{$candidate.resume}" style="width:100%; height:500px;" frameborder="0">
                    </iframe>
                </div>
            </div>
        </div>

    </div>

    {include 'modal/interviewSchedule.tpl'}

    {include 'modal/feedbackForm.tpl'}
</div>
</body>

</html>
{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/candidate_profile.css">
    <script src="/assets/js/candidateProfile.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="main-header">
            <div class="row">
                <h3>Candidate Profile</h3>
                {if $smarty.session.loggedinUser.role == 3}
                    <a href="{path_for name='editForm' data=['id' => {$candidate.id}]}" id="edit-btn"
                       class="btn btn-info">Edit Info</a>
                {/if}
            </div>
        </div>
        <div class="row col-md-12">
            <div class="col-md-8">
                <!-- Candidate Information table table -->
                <div id="information" class="card">
                    <div class="card-header">
                        <ul class="nav nav-tabs nav-justified" id="informationTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="personal-tab" data-toggle="tab" href="#personal"
                                   role="tab"
                                   aria-controls="personal" aria-selected="true">Personal Info</a>
                            </li>
                            {if $smarty.session.loggedinUser.role == 3}
                                <li class="nav-item">
                                    <a class="nav-link" id="work-tab" data-toggle="tab" href="#work" role="tab"
                                       aria-controls="work" aria-selected="false">Work Info</a>
                                </li>
                            {/if}
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
                            {if $smarty.session.loggedinUser.role == 3}
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
                                                        <th scope="row">Reference Type</th>
                                                        <td>{$candidate.reference}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Offer In Hand?</th>
                                                        <td>{$candidate.offer_in_hand}</td>
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
                                                            <td>{$candidate.consult_name}</td>
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
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">

                <!-- Candidate Shortlist Status -->
                {include 'profileCards/shortlistCard.tpl'}

                {if $candidate.job_offered == 1}
                    <div id="job-offer-card" class="card">
                        <div class="card-body">
                            <h3><strong>Job Offered</strong></h3>
                        </div>
                    </div>
                {else}
                    {if $candidate.is_shortlisted == 1 && $smarty.session.loggedinUser.role == 3}
                        <!-- Interview Schedule status -->
                        {include 'profileCards/interviewCard.tpl'}
                    {/if}
                {/if}
            </div>
        </div>

        <!-- Interview Rounds Table -->
        {include 'profileCards/roundsTable.tpl'}

        <div id="resume" class="card">
            <div class="card-header">Resume</div>
            <div class="card-block">
                <iframe src="/assets/resumes/{$candidate.resume}" style="width:100%; height:500px;">
                </iframe>
            </div>
        </div>
    </div>
    <!-- Interview Schedule form -->
    {include 'modal/interviewSchedule.tpl'}

{/block}
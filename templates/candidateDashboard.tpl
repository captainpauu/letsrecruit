{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/build/candidate_dashboard.css">
    <script src="/assets/js/build/CandidateDashboard.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="main-header">
            <h3>Candidate Dashboard</h3>
        </div>
        <div class="main-content">
            <table id="dataTable" class="table table-hover" style="width:100%">
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
                    <th class="action">Delete</th>
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
                        <td>
                            {if $c.job_offered == 1}
                                <h5><span class="badge badge-pill badge-dark">Job Offered</span></h5>
                            {else}
                                {$status[$c.id].round}
                                <span class="badge badge-pill {$status[$c.id].badge_class}">{$status[$c.id].status}</span>
                            {/if}
                        </td>
                        <td class="action">
                            <button class="btn btn-outline-danger btn-sm delete-candidate" title="delete"
                                    data-deleteId="{$c.id}">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/candidateDashboard.css">
{/block}

{block name=content}
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
                    <th class="action">Action</th>
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
                        <td class="action">
                            <a href="" title="edit"><i class="fas fa-edit"></i></a>
                            <a href="" title="delete"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
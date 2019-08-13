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
                            <th>Improvement Area</th>
                            <th>Feedback By</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach $rounds as $r}
                            <tr>
                                <td>{$r.round_number}</td>
                                <td>{$r.interviewer_name}</td>
                                <td>{$r.scheduled_date} - {$r.scheduled_time}</td>
                                {if $r.round_status == 0}
                                    {assign var=feedbackId value=$r.interview_id}
                                    <td>
                                        <button id="feedbackFormBtn" data-toggle="modal"
                                                data-target="#feedbackFormModal"
                                                class="btn btn-info btn-sm">Submit Feedback
                                        </button>
                                    </td>
                                    <td><span class="badge badge-primary">Pending</span></td>
                                {elseif $r.round_status == 1}
                                    <td><pre>{$r.feedback}</pre></td>
                                    <td><span class="badge badge-success">Accepted</span></td>
                                {elseif $r.round_status == 2}
                                    <td><pre>{$r.feedback}</pre></td>
                                    <td><span class="badge badge-danger">Rejected</span></td>
                                {/if}
                                <td>{$r.improvement_area}</td>
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

<!-- Interview Feedback form -->
{include '../modal/feedbackForm.tpl'}
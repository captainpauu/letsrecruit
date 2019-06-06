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
                Interview scheduled on {$schedule.scheduled_date} at {$schedule.scheduled_time}
                by {$schedule.scheduled_by}.
                Waiting for interviewers acceptance.
            </h6>
        {elseif $schedule.schedule_status == 2}
            <h6>{$schedule.interviewer_name} has accepted interview request.
                Interview scheduled on {$schedule.scheduled_date}
                at {$schedule.scheduled_time}</h6>
        {else}
            {if $schedule.schedule_status == 3}
                <h6>{$schedule.interviewer_name} has rejected interview request.
                    Interview was scheduled on {$schedule.scheduled_date}
                    at {$schedule.scheduled_time}</h6>
            {/if}
            <button id="shceduleInterviewBtn" class="btn btn-light btn-sm" data-toggle="modal"
                    data-target="#scheduleModal">Schedule Interview
            </button>
            <button id="offerJobBtn" class="btn btn-success btn-sm" data-id="{$candidate.id}">Offer Job</button>
        {/if}
    </div>
</div>
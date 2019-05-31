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
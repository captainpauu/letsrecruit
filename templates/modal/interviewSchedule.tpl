<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Schedule Interview</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form id="scheduleInterviewForm"
                  action="{path_for name='scheduleInterview' data = ['candidateId' => {$candidate.id}]}" method="post"
                  name="scheduleInterviewForm">
                <input type="hidden" name="{$smarty.session.csrf_name}" value="{$smarty.session.csrf_token}">
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label for="scheduledDate">Interview Date</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-7">
                            <input class="form-control" id="scheduledDate" type="date" name="scheduledDate">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label for="scheduledTime">Interview Time</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-7">
                            <input class="form-control" id="scheduledTime" type="time" name="scheduledTime">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label for="interviewMode">Interview Mode</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-7">
                            <select class="form-control" id="interviewMode" name="interviewMode">
                                <option value="">Select...</option>
                                <option value="1">Face To Face</option>
                                <option value="2">Skype</option>
                                <option value="3">Phone Call</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label for="mobile">Interviewer Name</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-7">
                            <select class="form-control" id="interviewerId" name="interviewerId">
                                <option value="">Select...</option>
                                {foreach $users as $u}
                                    <option value="{$u.id}">{$u.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <input name="action" value="schedule" hidden>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-secondary" type="button" data-dismiss="modal" value="Cancel">
                    <input class="btn btn-primary" type="submit" value="Schedule">
                </div>
            </form>
        </div>
    </div>
</div>
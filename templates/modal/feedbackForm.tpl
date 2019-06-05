<div class="modal fade" id="feedbackFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Schedule Interview</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form id="feedbackForm"
                  action="{path_for name='submitFeedback' data = ['id' => {$feedbackId},'candidateId' => {$candidate.id}]}"
                  method="post" name="feedbackForm">
                <div class="modal-body">
                    <input type="hidden" id="candidateId" value="{$candidate.id}">
                    <input type="hidden" id="feedbackId" value="{$feedbackId}">
                    <div class="form-row">
                        <div class="col-md-3">
                            <label for="feedback">Feedback</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-9">
                            <textarea class="form-control" id="feedback" name="feedback" rows="8"></textarea>
                            <span id="dateError" class="error"></span>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-3">
                            <label for="scheduledDate">Shortlist?</label><span class="error"> *</span>
                        </div>
                        <div class="col-md-9">
                            <div class="row col-md-12">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="roundStatus" id="select" value="1">
                                    <span>Select</span>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="roundStatus" id="reject" value="2">
                                    <span>Reject</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-secondary" type="button" data-dismiss="modal" value="Cancel">
                    <input class="btn btn-primary" type="submit" id="submitFeedbackBtn" value="Submit">
                </div>
            </form>
        </div>
    </div>
</div>
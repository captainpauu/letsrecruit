{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/job_opening.css">
    <script src="/assets/js/build/JobOpening.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="main-header">
            <h3>Jobs Portal</h3>
        </div>
        <div class="row">
            <!-- Information table table -->
            <div class="{if $smarty.session.loggedinUser.role == 3}col-md-8{else}col-md-12{/if}">
                <div id="jobs-table" class="card">
                    <div class="card-header">
                        <h5>Jobs</h5>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="allJobs" class="table-responsive">
                                    {foreach $jobs as $job}
                                        <div class="job-row">
                                            <h6>{$job.name}</h6>
                                            <div class="row job-info">
                                                <label class="col-md-3"><i
                                                            class="fas fa-calendar-alt"></i> {$job.req_experience} years</label>
                                                <label class="col-md-3"><i
                                                            class="fas fa-map-marker-alt"></i> {$job.location}</label>
                                                <label class="col-md-3"><i class="fas fa-rupee-sign"></i> {$job.salary}
                                                </label>
                                            </div>
                                            <div>
                                                <p>{$job.description}</p>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                                <div>
                                    <ul class="pagination">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- end of row -->
                    </div>
                </div>
            </div>
            {if $smarty.session.loggedinUser.role == 3}
                <div class="col-md-4">
                    <div id="jobs-form" class="card">
                        <div class="card-header">
                            <h5>Add Job</h5>
                        </div>
                        <div class="card-block">
                            <form action="{path_for name='addJob'}" method="post">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Select Technology</label>
                                    <select class="form-control" name="technology">
                                        <option value="0">Select...</option>
                                        {foreach $techs as $tech}
                                            <option value="{$tech.id}">{$tech.tech_name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Job Profile</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Experience Required</label>
                                    <input type="text" class="form-control" id="experience" name="experience"
                                           placeholder="ex. 3 - 5 years">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Location</label>
                                    <input type="text" class="form-control" id="location" name="location"
                                           placeholder="Pune, India">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Salary</label>
                                    <input type="text" class="form-control" id="salary" name="salary"
                                           placeholder="ex. 4 - 5.5 LPA">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Job Description</label>
                                    <textarea class="form-control" id="description" name="description"
                                              rows="4"></textarea>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <button type="reset" class="btn btn-primary-outline">Cancel</button>
                                    <div>
                            </form>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
{/block}
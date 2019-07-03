{extends 'index.tpl'}

{block name=head}
    <script src="/assets/js/addCandidate.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="main-header">
            <h3>Candidate Registration Form</h3>
        </div>
        <div class="main-content">
            <label class="text-danger">{$error}</label>
            <form name="candidateRegistrationForm" action="{path_for name='addCandidate'}" method="post"
                  enctype="multipart/form-data" autocomplete="off">
                <input type="hidden" name="{$smarty.session.csrf_name}" value="{$smarty.session.csrf_token}">
                <div class="row col-md-12">
                    <div class="col-md-4">
                        <h5>1. Personal details</h5>
                    </div>
                    <div class="col-md-8">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="fname">First Name</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="fname" name="fname"
                                       placeholder="First Name">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lname">Last Name</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="lname" name="lname"
                                       placeholder="Last Name">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">Email</label><span class="error"> *</span>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="email@id.com">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="mobile">Mobile Number</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="mobile" name="mobile"
                                       placeholder="9876543210">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="birthDate">Date of Birth</label><span class="error"> *</span>
                                <input type="date" class="form-control" id="birthDate" name="birthDate"
                                       placeholder="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="currentCity">Current City</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="currentCity" name="currentCity"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Gender</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender1"
                                               value="0">
                                        <span>Male</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender2"
                                               value="1">
                                        <span>Female</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Marital Status</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="marital"
                                               id="marital1" value="1">
                                        <span>Married</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="marital"
                                               id="marital2" value="0">
                                        <span>Unmarried</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="permanentCity">Permanent City</label>
                                <input type="text" class="form-control" id="permanentCity" name="permanentCity">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="state">State</label>
                                <input type="text" class="form-control" id="state" name="state">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="inputZip">Zip</label>
                                <input type="text" class="form-control" id="zipCode" name="zipCode">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="formDivider"></div>
                <div class="row col-md-12">
                    <div class="col-md-4">
                        <h5>2. Work details</h5>
                    </div>
                    <div class="col-md-8">
                        <div class="form-row">
                            <div class="form-group col-md-6" id="jobProfileDropdown">
                                <label>Job Profile</label><span class="error"> *</span>
                                <select class="form-control" name="jobProfileId">
                                    <option value="0">Select...</option>
                                    {foreach $jobs as $job}
                                        <option value="{$job.id}">{$job.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="linkedIn">LinkedIn URL</label>
                                <input type="text" class="form-control" id="linkedIn" name="linkedIn">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="experience">Experience</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="experience" name="experience"
                                       placeholder="ex. 1y 3m">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="currentCompany">Current Company</label>
                                <input type="text" class="form-control" id="currentCompany"
                                       name="currentCompany">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="currentCTC">Current CTC</label>
                                <input type="text" class="form-control" id="currentCtc" name="currentCtc">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="expectedCTC">Expected CTC</label>
                                <input type="text" class="form-control" id="expectedCTC" name="expectedCTC">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Offer In Hand?</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="offerInHand"
                                               id="offerYes" value="1">
                                        <span>Yes</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="offerInHand"
                                               id="offerNo" value="0">
                                        <span>No</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="noticePeriod">Notice Period</label>
                                <input type="text" class="form-control" id="noticePeriod" name="noticePeriod">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Reference Type</label>
                                <div class="row col-md-12" id="reference-type">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="0">
                                        <span>consultancy</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="1">
                                        <span>Office Employee</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="2">
                                        <span>Self</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6 hidden" id="consultancyDropdown">
                                <label>Consultancy</label>
                                <select class="form-control" name="consultancyId">
                                    <option value="0">Select...</option>
                                    {foreach $consultancies as $consult}
                                        <option value="{$consult.id}">{$consult.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group col-md-6 hidden" id="referredBy">
                                <label for="noticePeriod">Referred By</label>
                                <input type="text" class="form-control" name="referredBy">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="skills">Skills</label>
                                <input type="text" class="form-control" id="skills" name="skills"
                                       placeholder="ex. Php, .Net">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="changeReason">Reason For Change</label>
                                <input type="text" class="form-control" id="changeReason" name="changeReason">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="formDivider"></div>
                <div class="row col-md-12">
                    <div class="col-md-4">
                        <h5>3. Upload Documents</h5>
                    </div>
                    <div class="col-md-8">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="resume">Resume</label><span class="error"> *</span>
                                <input type="file" class="form-control" id="resume" name="resume"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="formDivider"></div>
                <div class="row col-md-12 justify-content-end">
                    <div class="col-md-4">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">Register</button>
                                <button type="reset" class="btn btn-outline-primary">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{/block}
{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/addCandidate.css">
    <script src="/assets/js/addCandidate.js"></script>
{/block}

{block name=content}
    <div class="container-fluid">
        <div class="main-header">
            <h3>Candidate Information</h3>
        </div>
        <div class="main-content">
            <label class="text-danger">{$error}</label>
            <form name="candidateRegistrationForm" action="{path_for name='updateCandidate' data=['id' => {$candidate.id}]}" method="post"
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
                                       placeholder="First Name" value="{$candidate.fname}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lname">Last Name</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="lname" name="lname"
                                       placeholder="Last Name" value="{$candidate.lname}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">Email</label><span class="error"> *</span>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="email@id.com" value="{$candidate.email}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="mobile">Mobile Number</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="mobile" name="mobile"
                                       placeholder="9876543210" value="{$candidate.mobile}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="birthDate">Date of Birth</label><span class="error"> *</span>
                                <input type="date" class="form-control" id="birthDate" name="birthDate"
                                       placeholder="" value="{$candidate.birth_date}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="currentCity">Current City</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="currentCity" name="currentCity"
                                       placeholder="" value="{$candidate.current_city}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Gender</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender1"
                                               value="0" {if $candidate.gender == 0}checked{/if}>
                                        <span>Male</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender2"
                                               value="1" {if $candidate.gender == 1}checked{/if}>
                                        <span>Female</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Marital Status</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="marital"
                                               id="marital1" value="1" {if $candidate.marital == 1}checked{/if}>
                                        <span>Married</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="marital"
                                               id="marital2" value="0" {if $candidate.marital == 0}checked{/if}>
                                        <span>Unmarried</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="permanentCity">Permanent City</label>
                                <input type="text" class="form-control" id="permanentCity" name="permanentCity"
                                       value="{$candidate.permanent_city}">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="state">State</label>
                                <input type="text" class="form-control" id="state" name="state"
                                       value="{$candidate.state}">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="inputZip">Zip</label>
                                <input type="text" class="form-control" id="zipCode" name="zipCode"
                                       value="{$candidate.zip_code}">
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
                                        <option value="{$job.id}"
                                                {if $candidate.job_profile_id == $job.id}selected{/if}>{$job.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="linkedIn">LinkedIn URL</label>
                                <input type="text" class="form-control" id="linkedIn" name="linkedIn"
                                       value="{$candidate.linkedin}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="experience">Experience</label><span class="error"> *</span>
                                <input type="text" class="form-control" id="experience" name="experience"
                                       placeholder="ex. 1y 3m" value="{$candidate.experience}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="currentCompany">Current Company</label>
                                <input type="text" class="form-control" id="currentCompany"
                                       name="currentCompany" value="{$candidate.current_company}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="currentCTC">Current CTC</label>
                                <input type="text" class="form-control" id="currentCtc" name="currentCtc"
                                       value="{$candidate.current_ctc}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="expectedCTC">Expected CTC</label>
                                <input type="text" class="form-control" id="expectedCTC" name="expectedCTC"
                                       value="{$candidate.expected_city}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Offer In Hand?</label>
                                <div class="row col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="offerInHand"
                                               id="offerYes" value="1" {if $candidate.offer_in_hand == 1}checked{/if}>
                                        <span>Yes</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="offerInHand"
                                               id="offerNo" value="0" {if $candidate.offer_in_hand == 0}checked{/if}>
                                        <span>No</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="noticePeriod">Notice Period</label>
                                <input type="text" class="form-control" id="noticePeriod" name="noticePeriod"
                                       value="{$candidate.notice_period}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Reference Type</label>
                                <div class="row col-md-12" id="reference-type">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="0"
                                               id="consult-refer" {if $candidate.reference == 0}checked{/if}>
                                        <span>consultancy</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="1"
                                               id="office-refer" {if $candidate.reference == 1}checked{/if}>
                                        <span>Office Employee</span>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reference" value="2"
                                               id="self-refer" {if $candidate.reference == 2}checked{/if}>
                                        <span>Self</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6 hidden" id="consultancyDropdown">
                                <label>Consultancy</label>
                                <select class="form-control" name="consultancyId">
                                    <option value="0">Select...</option>
                                    {foreach $consultancies as $consult}
                                        <option value="{$consult.id}"
                                                {if $candidate.consult_id == $consult.id}selected{/if}>{$consult.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group col-md-6 hidden" id="referredBy">
                                <label for="noticePeriod">Referred By</label>
                                <input type="text" class="form-control" name="referredBy"
                                       value="{$candidate.referred_by}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="skills">Skills</label>
                                <input type="text" class="form-control" id="skills" name="skills"
                                       placeholder="ex. Php, .Net" value="{$candidate.skills}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="changeReason">Reason For Change</label>
                                <input type="text" class="form-control" id="changeReason" name="changeReason"
                                       value="{$candidate.change_reason}">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="formDivider"></div>
                <div class="row col-md-12 justify-content-end">
                    <div class="col-md-4">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">Update</button>
                                <button type="reset" class="btn btn-outline-primary">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{/block}
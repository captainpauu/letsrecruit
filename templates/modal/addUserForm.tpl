<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Enter Details</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form id="addUserForm" action="{path_for name='addUser'}" method="post" name="addUserForm"
                  autocomplete="off">
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Full Name</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="text" name="name"
                                   placeholder="Full Name">
                        </div>
                    </div>
                    {literal}
                        <div class="form-row">
                            <div class="col-md-5 t">
                                <label>E-mail</label><span class="error"> *</span>
                            </div>
                            <div class="form-group col-md-7">
                                <input class="form-control" type="email" name="email" id="email"
                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                                       placeholder="E-mail Id">
                            </div>
                        </div>
                    {/literal}
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Username</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="text" name="userName" id="username"
                                   placeholder="Username">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Password</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="password" name="password" id="password"
                                   placeholder="&#9679;&#9679;&#9679;&#9679;" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Confirm Password</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="password" name="confirmPassword" id="confirmPassword"
                                   placeholder="&#9679;&#9679;&#9679;&#9679;" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Technology</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <select class="form-control" name="technology">
                                <option value="">Select...</option>
                                {foreach $techs as $tech}
                                    <option value="{$tech.id}">{$tech.tech_name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Role</label><span class="error"> *</span>
                        </div>
                        <div class="form-group col-md-7">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" value="1">
                                <label class="form-check-label">1st Round Interviewer</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" value="2">
                                <label class="form-check-label">2st Round Interviewer</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" value="3">
                                <label class="form-check-label">Admin</label>
                            </div>
                        </div>
                    </div>
                    <input type="text" name="action" value="add" hidden>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-sm btn-secondary" type="reset" data-dismiss="modal" value="Cancel">
                    <input class="btn btn-sm btn-primary" type="submit" value="Register">
                </div>
            </form>
        </div>
    </div>
</div>
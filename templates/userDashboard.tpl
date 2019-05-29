<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    {include 'header.tpl'}

    <title>Candidate DashBoard</title>
    <link rel="stylesheet" href="/assets/css/userDashboard.css">
</head>

<body>
<div class="wrapper">

    <!-- Side Navbar -->
    {include 'side-navbar.tpl'}

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navbar -->
        {include 'top-navbar.tpl'}

        <div class="container-fluid">
            <div class="main-header">
                <div class="row">
                    <h3>User Dashboard</h3>
                    <button id="add-user-btn" class="btn btn-dark" data-toggle="modal" data-target="#addUserModal">Add
                        User
                    </button>
                </div>
            </div>
            <div class="main-content">
                <table id="dataTable" class="table table-bordered table-hover" style="width:100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Technology</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $users as $u}
                        <tr>
                            <td>{$u.id}</td>
                            <td>{$u.name}</td>
                            <td>{$u.email}</td>
                            <td>
                                {if $u.role === 1}
                                    Admin
                                {elseif $u.role === 2}
                                    1st Round Panel
                                {else}
                                    2nd Round Panel
                                {/if}
                            </td>
                            <td>{$u.tech_name}</td>
                            <td>
                                <button id="edit" class="btn btn-sm btn-outline-primary"
                                        data-toggle="modal" data-target="" disabled>
                                    <i class="fa fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

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
            <form id="addUserForm" action="{path_for name='addUser'}" method="post" name="addUserForm">
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Full Name</label>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="text" name="name"
                                   placeholder="Full Name">
                        </div>
                    </div>
                    {literal}
                        <div class="form-row">
                            <div class="col-md-5 t">
                                <label>E-mail</label>
                            </div>
                            <div class="form-group col-md-7">
                                <input class="form-control" type="email" name="email"
                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                                       placeholder="E-mail Id">
                            </div>
                        </div>
                    {/literal}
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Username</label>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="text" name="userName"
                                   placeholder="Username">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Password</label>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="password" name="password"
                                   placeholder="&#9679;&#9679;&#9679;&#9679;">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Confirm Password</label>
                        </div>
                        <div class="form-group col-md-7">
                            <input class="form-control" type="password" name="confirmPassword"
                                   placeholder="&#9679;&#9679;&#9679;&#9679;">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Technology</label>
                        </div>
                        <div class="form-group col-md-7">
                            <select class="form-control" name="technology">
                                <option value="0">Select...</option>
                                {foreach $techs as $tech}
                                    <option value="{$tech.id}">{$tech.tech_name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-5 t">
                            <label>Role</label>
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
</body>
</html>
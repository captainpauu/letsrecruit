<!DOCTYPE html>
<html>

<head>
    {include 'header.tpl'}

    <title>Candidate DashBoard</title>
    <link rel="stylesheet" href="/assets/css/userDashboard.css">
    <script src="/assets/js/userDashboard.js"></script>
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
                        <th class="action">Action</th>
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
                            <td class="action">
                                <a href="">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{include 'modal/addUserForm.tpl'}

</body>
</html>
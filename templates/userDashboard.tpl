{extends 'index.tpl'}

{block name=head}
    <link rel="stylesheet" href="/assets/css/userDashboard.css">
    <script src="/assets/js/userDashboard.js"></script>
{/block}

{block name=content}
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
                    <th class="action">Delete</th>
                </tr>
                </thead>
                <tbody>
                {foreach $users as $u}
                    <tr>
                        <td>{$u.id}</td>
                        <td>{$u.name}</td>
                        <td>{$u.email}</td>
                        <td>
                            {if $u.role == 1}
                                1st Round Panel
                            {elseif $u.role == 2}
                                2nd Round Panel
                            {else}
                                Admin
                            {/if}
                        </td>
                        <td>{$u.tech_name}</td>
                        <td class="action">
                            <button class="btn btn-outline-primary btn-sm delete-user" title="delete" data-deleteId="{$u.id}">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
    {include 'modal/addUserForm.tpl'}

{/block}
{*<div id="addTechModal" class="modal fade" role="dialog" tabindex="-1"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form action="{path_for name='addTech'}" method="post">
                <input type="text" class="form-control" name="newTech" placeholder="Technology">
                <button type="submit" class="btn btn-primary btn-sm">Add</button>
                <button type="reset" data-dismiss="modal" class="btn btn-secondary btn-sm">
                    Cancel
                </button>
            </form>
        </div>
    </div>
</div>*}

<nav class="navbar navbar-default navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-bars"></i>
        </button>
        <ul class="nav navbar-nav navbar-right">
            <div id="technology" class="dropdown">
                <a class="dropdown-toggle" href="#" role="button" id="techDropdown" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Technologies
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-lebelledby="techDropdown">
                    {foreach $smarty.session.technologies as $tech}
                    <li>
                        <a>{$tech.tech_name}</a>
                    </li>
                    {/foreach}
                    {*<div class="dropdown-divider"></div>
                    <li>
                        <a data-toggle="modal" data-target="#addTechModal" href="">Add Technology</a>
                    </li>*}
                </div>
            </div>
            <div id="notification" class="dropdown hidden">
                <span class="counter">3</span>
                <a class="dropdown-toggle" href="#" role="button" id="notificationDropdown" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-lebelledby="notificationDropdown">
                    <li class="list notification-head">
                        <i class="far fa-bell"></i> Pending Interview Requests
                    </li>
                    <div class="dropdown-divider"></div>
                    <li class="list notification-body">
                        <ul class="list-unstyled">
                            <li>
                                <b>Pravin Dhange</b> for <b>job title</b>
                                <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                            </li>
                            <li>
                                <b>Pravin Dhange</b> for <b>job title</b>
                                <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                            </li>
                            <li>
                                <b>Pravin Dhange</b> for <b>job title</b>
                                <p>on <b>11/05/2019</b> at <b>11:00</b> am</p>
                            </li>
                        </ul>
                    </li>
                    <div class="dropdown-divider"></div>
                    <li class="list notification-foot">
                        <a>View All Pending Requests <i class="fas fa-arrow-right"></i></a>
                    </li>
                </div>
            </div>
            <div id="profile" class="dropdown">
                <a class="dropdown-toggle" href="#" role="button" id="profileDropdown" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    {$smarty.session.loggedinUser.name}
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-lebelledby="profileDropdown">
                    <li>
                        <a href="#"><i class="fas fa-user"></i> Profile</a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-cog"></i> Settings</a>
                    </li>
                    <div class="dropdown-divider"></div>
                    <li>
                        <a href="{path_for name='logout'}"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </div>
            </div>
        </ul>
    </div>
</nav>
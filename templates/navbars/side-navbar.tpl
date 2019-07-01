<!-- Sidebar -->
<nav id="sidebar" class="active">
    <div class="sidebar-header">
        <img src="/assets/images/Aventri-color-logo.webp">
        <span>Aventri</span>
    </div>

    <ul class="list-unstyled components">
        {if $smarty.session.loggedinUser.role == 3}
            <li>
                <a href="">
                    <i class="fas fa-chart-line"></i>
                    <span>Admin Dashboard</span>
                </a>
            </li>
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-table"></i>
                    <span>Tables</span>
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="{path_for name='candidateDashboard'}">All Candidates</a>
                    </li>
                    <li>
                        <a href="{path_for name='userDashboard'}">All Users</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="{path_for name='addCandidate'}">
                    <i class="fas fa-user"></i>
                    <span>Add Candidate</span>
                </a>
            </li>
        {/if}
        <li>
            <a href="#interviewSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                <span>Interviews</span>
            </a>
            <ul class="collapse list-unstyled" id="interviewSubmenu">
                <li class="hidden">
                    <a href="#">Interview Rounds</a>
                </li>
                <li>
                    <a href="{path_for name='interviewRequest'}">Interview Requests</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="{path_for name='jobOpening'}">
                <i class="fas fa-briefcase"></i>
                <span>Job Openings</span>
            </a>
        </li>
        <li class="hidden">
            <a href="#">
                <i class="fas fa-address-book"></i>
                <span>Contact Us</span>
            </a>
        </li>
    </ul>
</nav>

<div class="topbar-actions">
    <!-- BEGIN GROUP NOTIFICATION -->
    @section('notification-menu')
    <div class="btn-group-notification btn-group" id="header_notification_bar">
        <button type="button" class="btn btn-sm md-skip dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="icon-bell"></i>
            <span class="badge">7</span>
        </button>
        <ul class="dropdown-menu-v2">
            <li class="external">
                <h3>
                    <span class="bold">12 pending</span> notifications</h3>
                <a href="#">view all</a>
            </li>
            <li>
                <ul class="dropdown-menu-list scroller" style="height: 250px; padding: 0;" data-handle-color="#637283">
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-success md-skip">
                                    <i class="fa fa-plus"></i>
                                </span> New user registered. </span>
                            <span class="time">just now</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-danger md-skip">
                                    <i class="fa fa-bolt"></i>
                                </span> Server #12 overloaded. </span>
                            <span class="time">3 mins</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-warning md-skip">
                                    <i class="fa fa-bell-o"></i>
                                </span> Server #2 not responding. </span>
                            <span class="time">10 mins</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-info md-skip">
                                    <i class="fa fa-bullhorn"></i>
                                </span> Application error. </span>
                            <span class="time">14 hrs</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-danger md-skip">
                                    <i class="fa fa-bolt"></i>
                                </span> Database overloaded 68%. </span>
                            <span class="time">2 days</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-danger md-skip">
                                    <i class="fa fa-bolt"></i>
                                </span> A user IP blocked. </span>
                            <span class="time">3 days</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-warning md-skip">
                                    <i class="fa fa-bell-o"></i>
                                </span> Storage Server #4 not responding dfdfdfd. </span>
                            <span class="time">4 days</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-info md-skip">
                                    <i class="fa fa-bullhorn"></i>
                                </span> System Error. </span>
                            <span class="time">5 days</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="details">
                                <span class="label label-sm label-icon label-danger md-skip">
                                    <i class="fa fa-bolt"></i>
                                </span> Storage server failed. </span>
                            <span class="time">9 days</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    @show
    
    @section('btn-add')
    <div class="btn-group-red btn-group">
        <button type="button" class="btn btn-sm md-skip dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="fa fa-plus"></i>
        </button>
        <ul class="dropdown-menu-v2" role="menu">
            <li class="active">
                <a href="#">New Post</a>
            </li>
            <li>
                <a href="#">New Comment</a>
            </li>
            <li>
                <a href="#">Share</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">Comments
                    <span class="badge badge-success">4</span>
                </a>
            </li>
            <li>
                <a href="#">Feedbacks
                    <span class="badge badge-danger">2</span>
                </a>
            </li>
        </ul>
    </div>
    @show

    @section('inbox')
    @show

    @section('task')
    @show
    
    @section('user')
    <div class="btn-group-img btn-group">
        <button type="button" class="btn btn-sm md-skip dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <span>Hi, Marcus</span>
            <img src="../assets/layouts/layout5/img/avatar1.jpg" alt=""> </button>
        <ul class="dropdown-menu-v2" role="menu">
            <li>
                <a href="page_user_profile_1.html">
                    <i class="icon-user"></i> My Profile
                    <span class="badge badge-danger">1</span>
                </a>
            </li>
            <li>
                <a href="app_calendar.html">
                    <i class="icon-calendar"></i> My Calendar </a>
            </li>
            <li>
                <a href="app_inbox.html">
                    <i class="icon-envelope-open"></i> My Inbox
                    <span class="badge badge-danger"> 3 </span>
                </a>
            </li>
            <li>
                <a href="app_todo_2.html">
                    <i class="icon-rocket"></i> My Tasks
                    <span class="badge badge-success"> 7 </span>
                </a>
            </li>
            <li class="divider"> </li>
            <li>
                <a href="page_user_lock_1.html">
                    <i class="icon-lock"></i> Lock Screen </a>
            </li>
            <li>
                <a href="page_user_login_1.html">
                    <i class="icon-key"></i> Log Out </a>
            </li>
        </ul>
    </div>
    @show
    <!-- END USER PROFILE -->
    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
    @section('quick.sidebar')
    <!-- <button type="button" class="quick-sidebar-toggler md-skip" data-toggle="collapse">
        <span class="sr-only">Toggle Quick Sidebar</span>
        <i class="icon-logout"></i>
    </button> -->
    @show
    <!-- END QUICK SIDEBAR TOGGLER -->
</div>
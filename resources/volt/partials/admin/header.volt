<header class="main-header">
    <a class="logo" href="{{ url(['for': 'admin']) }}">
        <span class="logo-lg"><b>Minion</b>CMS</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/static/images/icons/favicon-192x192.png" class="user-image" alt="User Image">
                        <span class="hidden-xs">I'm Minion</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="/static/images/logo.png" class="img-circle" alt="User Image">
                            <p>I'm Minion</p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="javascript:void(0);" class="btn btn-default btn-flat" onclick="document.getElementById('logout-form').submit()">
                                    <i class="plane icon"></i>{{ helper.at('Logout') }}
                                </a>
                                <form action="{{ url.get() }}admin/index/logout" method="post" style="display: none;" id="logout-form">
                                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                </form>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
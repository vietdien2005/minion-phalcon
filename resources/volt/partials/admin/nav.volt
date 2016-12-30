<aside class="main-sidebar">
    <section class="sidebar">
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-flask" aria-hidden="true"></i>
                    <span>{{ helper.at('Contents') }}</span> 
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="{{ helper.activeMenu().activeClass('admin-page') }}">
                        <a href="{{ url.get() }}page/admin">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Pages') }} <i class="file outline icon"></i>
                        </a>
                    </li>
                    <li class="{{ helper.activeMenu().activeClass('admin-publication') }}">
                        <a href="{{ url.get() }}publication/admin">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Publications') }} <i class="calendar icon"></i>
                        </a>
                    </li>
                    <li class="{{ helper.activeMenu().activeClass('admin-widget') }}">
                        <a href="{{ url.get() }}widget/admin">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Widgets') }} <i class="text file icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-cogs" aria-hidden="true"></i>
                    <span>{{ helper.at('Admin') }}</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="{{ helper.activeMenu().activeClass('admin-user') }}">
                        <a href="{{ url.get() }}admin/admin-user">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Manage Users') }} <i class="user icon"></i>
                        </a>
                    </li>
                    <li class="{{ helper.activeMenu().activeClass('admin-cms') }}">
                        <a href="{{ url.get() }}cms/configuration">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('CMS Configuration') }} <i class="settings icon"></i>
                        </a>
                    </li>
                    <li class="{{ helper.activeMenu().activeClass('admin-language') }}">
                        <a href="{{ url.get() }}cms/language">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Languages') }} <i class="globe icon"></i>
                        </a>
                    </li>
                    <li class="{{ helper.activeMenu().activeClass('admin-translate') }}">
                        <a href="{{ url.get() }}cms/translate">
                            <i class="fa fa-circle-o"></i>
                            {{ helper.at('Translate') }} <i class="book icon"></i>
                        </a>    
                    </li>
                </ul>
            </li>
            <li>
                <a target="_blank" href="{{ url.get() }}">
                    <i class="fa fa-home" aria-hidden="true"></i><span>{{ helper.at('View Site') }}</span>
                </a>
            </li>
        </ul>
    </section>
</aside>

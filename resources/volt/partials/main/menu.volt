<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom affix-top">
    <div class="container">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#page-top">Minion CMS</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden active">
                    {{ helper.menu.item( helper.translate('Home'), 'index', helper.langUrl(['for':'index']) ) }}
                </li>
                <li class="page-scroll">
                    {{ helper.menu.item( helper.translate('News'), 'news', helper.langUrl(['for':'publications','type':'news#portfolio']) ) }}
                </li>
                <li class="page-scroll">
                    {{ helper.menu.item( helper.translate('Articles'), 'articles', helper.langUrl(['for':'publications','type':'articles#portfolio']) ) }}
                </li>
                <li class="page-scroll">
                    {{ helper.menu.item( helper.translate('Contacts'), 'contacts', helper.langUrl(['for':'contacts','type':'contacts#portfolio']) ) }}
                </li>
                <li class="page-scroll">
                    {{ helper.menu.item( helper.translate('Admin'), null, url(['for':'admin']), ['li':['class':'last'], 'a':['class':'noajax']] ) }}
                </li>
            </ul>
        </div>
    </div>
</nav>
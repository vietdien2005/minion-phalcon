<section id="portfolio">
    <div class="container" id="content">
        <div class="row">
            <h1 class="text-center">{{ publicationResult.title }}</h1>
            {% if helper.isAdminSession() %}
                <div class="form-group text-center">
                    <a class="btn btn-primary" href="{{ url.get() }}publication/admin/edit/{{ publicationResult.p.getId() }}?lang={{ constant('LANG') }}">
                        <i class="fa fa-pencil"></i>  {{ helper.at('Edit publication') }}
                    </a>
                </div>
            {% endif %}
            {% if publicationResult.p.getTypeDisplayDate() %}
                <h4 class="last-news-datetime">{{ publicationResult.p.getDate('d.m.Y') }}</h4>
            {% endif %}
        
            {% if publicationResult.p.preview_inner %}
                {% set image = helper.image(['id': publicationResult.p.getId(),'width': 500]) %}
                <img class="img-responsive" src="{{ url.path() }}{{ image.cachedRelPath() }}" style="margin:0 auto;padding:20px;">
            {% endif %}
        
            <p>
                {{ publicationResult.text }}
            </p>

            <div class="form-group text-center">
                <a href="{{ helper.langUrl(['for':'publications','type':publicationResult.t_slug]) }}" class="btn btn-default">
                    <i class="fa fa-arrow-left"></i> {{ helper.translate('Back to publications list') }}
                </a>
            </div>
        </div>
    </div>
</section>
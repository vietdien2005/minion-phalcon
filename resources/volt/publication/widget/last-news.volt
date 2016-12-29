{% if entries %}
<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>{{ helper.translate('Latest news') }}</h2>
            <hr class="star-light">
        </div>
        <div class="row">
            {% for item in entries %}
                {% set url = helper.langUrl(['for':'publication','type':item.t_slug,'slug':item.p.getSlug()]) %}
                {% set image = helper.image(['id':item.p.getId(),'width': 360,'height': 260]) %}
                <div class="col-sm-4 text-center">
                    <a href="{{ url }}#content">
                        {% if image.isExists() %}
                            <img class="img-responsive" src="{{ image.cachedRelPath() }}" alt="{{ item.title|escape_attr }}">
                        {% endif %}
                    </a>
                    <h4>{{ item.title }}</h4>
                    <p class="last-news-datetime"><i>{{ item.p.getDate('d.m.Y') }}</i></p>
                    <h5 class="last-news-content">{{ helper.announce(item.text, 130) }}</h5>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
{% endif %}
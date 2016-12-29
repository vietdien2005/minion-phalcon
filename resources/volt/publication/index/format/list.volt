{% set image = helper.image(['id': item.p.getId(),'width': 280]) %}
{% set link = helper.langUrl(['for':'publication', 'type':item.t_slug, 'slug':item.p.getSlug()]) %}
{% if image.isExists() %}{% set imageExists = true %}{% else %}{% set imageExists = false %}{% endif %}
<div class="col-sm-10 col-sm-offset-1" style="padding-bottom: 20px;">
    <div class="col-sm-4">
        {% if imageExists %}
            <a href="{{ link }}#content">
                <img class="img-responsive" src="{{ image.cachedRelPath() }}" alt="{{ item.title|escape_attr }}">
            </a>
        {% endif %}    
    </div>
    <div class="col-sm-8">
        <a href="{{ link }}#content"><h4>{{ item.title }}</h4></a>
        {% if item.p.getTypeDisplayDate() %}
            <p class="last-news-datetime"><i>{{ item.p.getDate('d.m.Y') }}</i></p>
        {% endif %}
        <h5 class="last-news-content">{{ helper.announce(item.text, 300) }}</h5>    
    </div>
</div>

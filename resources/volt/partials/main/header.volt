<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <a href="{{ helper.langUrl(['for':'index']) }}">
			    <img class="img-responsive" src="{{ url.path() }}static/images/logo.png" alt="" height="50">
			</a>
            <div class="intro-text">
                {{ helper.staticWidget('homepage') }}
                <hr class="star-light">
				<iframe frameborder="none" src="http://ghbtns.com/github-btn.html?user=vietdien2005&repo=minion-phalcon&type=watch&count=true&size=large" style="width: 115px;"></iframe>
            </div>
        </div>
    </div>
</div>

{% set languages = helper.languages() %}
{% if languages|length > 1 %}
    <div class="languages">
        {% for language in languages %}
            <div class="lang">
                {{ helper.langSwitcher(language['iso'], language['name']) }}
            </div>
        {% endfor %}
    </div>
{% endif %}
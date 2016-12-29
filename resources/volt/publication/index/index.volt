<section id="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>{{ title }}</h2>
                <hr class="star-primary">
            </div>
            <div class="row">
                {% if paginate.total_items > 0 %}
                    {% for item in paginate.items %}
                        {{ helper.modulePartial('index/format/' ~ format, ['item':item]) }}
                    {% endfor %}
                {% else %}
                    <div class="col-md-12 text-center">
                        <h3>{{ helper.translate('Entries not found') }}</h3>
                    </div>
                {% endif %}
            </div>
        </div>
        {% if paginate.total_pages > 1 %}
            <div class="row text-center">
                {{ partial('main/pagination', ['paginate':paginate] ) }}
            </div>
        {% endif %}
    </div>
</section>
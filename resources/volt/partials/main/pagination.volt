{% set link = url.get() ~ substr(router.getRewriteUri(), 1) %}
<ul class="pagination">
    <li><a href="{{ link }}?page={{ paginate.before }}"><i class="fa fa-angle-left"></i></a></li>
    {% if paginate.total_pages > 10 %}
        {% if paginate.current > 5 %}
            {% for i in paginate.current-4..paginate.current+5 %}
                {% if i <= paginate.total_pages %}
                    <li>
                        <a class="item{% if paginate.current == i %} active{% endif %}" href="{{ link }}?page={{ i }}">{{ i }}</a>
                    </li>
                {% endif %}
            {% endfor %}
        {% else %}
            {% for i in 1..10 %}
                <li>
                    <a class="item{% if paginate.current == i %} active{% endif %}" href="{{ link }}?page={{ i }}">{{ i }}</a>
                </li>
            {% endfor %}
        {% endif %}
    {% else %}
        {% for i in 1..paginate.total_pages %}
            <li>
                <a class="item{% if paginate.current == i %} active{% endif %}" href="{{ link }}?page={{ i }}">{{ i }}</a>
            </li>
        {% endfor %}
    {% endif %}
    <li><a href="{{ link }}?page={{ paginate.next }}"><i class="fa fa-angle-right"></i></a></li>
</ul>
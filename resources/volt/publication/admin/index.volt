<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}publication/admin/{{ type is not empty ? type ~ '/' : '' }}/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url.get() }}publication/type" class="btn btn-default">
                        <i class="fa fa-list"></i> {{ helper.at('Publications types') }}
                    </a>
                </div>
            </div>
        </div>
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="{% if not type_id %} active{% endif %}">
                    <a href="{{ url.get() }}publication/admin?lang={{ constant('LANG') }}">{{ helper.at('All') }}</a>
                </li>
                {% for type_el in types %}
                    <li class="{% if type_el.getId() == type_id %} active{% endif %}">
                        <a href="{{ url(['for':'publications_admin','type':type_el.getSlug()]) }}?lang={{ constant('LANG') }}">{{ type_el.getTitle() }}</a>
                    </li>
                {% endfor %}
            </ul>
            <div class="tab-content">
                <div class="tab-pane active">
                    {% if paginate.total_items > 0 %}
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th style="width: 100px"></th>
                                    <th>{{ helper.at('Title') }}</th>
                                    <th style="width: 50px;">{{ helper.at('Image') }}</th>
                                    <th>{{ helper.at('Type') }}</th>
                                    <th style="width: 150px">{{ helper.at('Date') }}</th>
                                    <th>{{ helper.at('Thumbs Inside') }}</th>
                                    <th>{{ helper.at('Url') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {% for item in paginate.items %}
                                {% set link = url.get() ~ "publication/admin/edit/" ~ item.getId() %}
                                {% set image = helper.image(['id':item.getId(),'type':'publication','width':50]) %}
                                <tr>
                                    <td>
                                        <a href="{{ link }}?lang={{ constant('LANG') }}" class="btn btn-primary">
                                            <i class="fa fa-pencil"></i> id = {{ item.getId() }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ link }}?lang={{ constant('LANG') }}"><h5>{{ item.getTitle() }}</h5></a></td>
                                    <td>
                                        <a href="{{ link }}?lang={{ constant('LANG') }}">
                                            {% if image.isExists() %}{{ image.imageHTML() }}{% endif %}
                                        </a>
                                    </td>
                                    <td><h5>{{ item.getTypeTitle() }}</h5></td>
                                    <td><h5>{{ item.getDate() }}</h5></td>
                                    <td style="color:#4caf50;">
                                        {% if item.getPreviewInner() %}
                                            <h4><i class="fa fa-check"></i></h4>
                                        {% endif %}
                                    </td>
                                    {% set url = helper.langUrl(['for':'publication', 'type':item.getTypeSlug(), 'slug':item.getSlug()]) %}
                                    <td><a href="{{ url }}" target="_blank"><h5>{{ url }}</h5></a></td>
                                </tr>
                            {% endfor %}
                            </tbody>
                        </table>
                    {% else %}
                        <p>{{ helper.at('Entries not found') }}</p>
                    {% endif %}
                </div>
            </div>
        </div>
        {% if paginate.total_pages > 1 %}
            {{ partial('admin/pagination', ['paginate':paginate] ) }}
        {% endif %}        
    </div>
</div>




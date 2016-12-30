<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}publication/admin?lang={{ constant('LANG') }}" class="btn btn-default">
                        <i class="fa fa-arrow-left"></i> {{ helper.at('Publications types') }}
                    </a>
                </div>
                <div class="btn-group">
                    <a href="{{ url.get() }}publication/type/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
                    </a>
                </div>
                
            </div>
        </div>
        <div class="nav-tabs-custom">
            <div class="tab-content">
                <div class="tab-pane active">
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr>
                                <th style="width: 100px"></th>
                                <th>Title</th>
                                <th>URL</th>
                                <th>Display Layout</th>
                                <th>Thumbnail Inside</th>
                            </tr>
                        </thead>
                        <tbody>
                        {% for item in entries %}
                            {% set link = url.get() ~ "publication/type/edit/" ~ item.getId() %}
                            <tr>
                                <td>
                                    <a href="{{ link }}?lang={{ constant('LANG') }}" class="btn btn-primary">
                                        <i class="fa fa-pencil"></i> id = {{ item.getId() }}
                                    </a>
                                </td>
                                <td>
                                    <a href="{{ link }}?lang={{ constant('LANG') }}"><h5>{{ item.getTitle() }}</h5></a>
                                </td>

                                {% set pub_link = helper.langUrl(['for':'publications', 'type': item.getSlug()]) %}
                                <td><a href="{{ pub_link }}" target="_blank"><h5>{{ pub_link }}</h5></a></td>
                                <td><h5>{{ item.getFormatTitle() }}</h5></td>
                                <td style="color:#4caf50;">
                                    {% if item.getDisplayDate() %}<h4><i class="fa fa-check"></i></h4>{% endif %}
                                </td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
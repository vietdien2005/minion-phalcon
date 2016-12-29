<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}cms/language/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
                    </a>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Code</th>
                            <th>ISO</th>
                            <th>Locale</th>
                            <th>URL</th>
                            <th>Sort order</th>
                            <th>Main</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for item in entries %}
                            <tr>
                                <td>
                                    <a href="{{ url.get() }}cms/language/edit/{{ item.getId() }}"><h5>{{ item.getName() }}</h5></a>
                                </td>
                                <td><h5>{{ item.getShort_name() }}</h5></td>
                                <td><h5>{{ item.getIso() }}</h5></td>
                                <td><h5>{{ item.getLocale() }}</h5></td>
                                {% set url = url.get() %}
                                {% if item.getUrl() and not item.getPrimary() %}{% set url = url.get() ~ item.getUrl() ~ '/' %}{% endif %}
                                <td><a href="{{ url }}" target="_blank"><h5>{{ url }}</h5></a></td>
                                <td><h5>{{ item.getSortorder() }}</h5></td>
                                <td>{% if item.getPrimary() %} <h5><i class="fa fa-plus"></i></h5> {% endif %}</td>
                            </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

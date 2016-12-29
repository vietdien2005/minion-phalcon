<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}page/admin/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> Add New
                    </a>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 100px"></th>
                            <th>Title</th>
                            <th >Url</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for item in entries %}
                            {% set link = url.get() ~ "page/admin/edit/" ~ item.getId() %}
                            <tr>
                                <td>
                                    <a class="btn btn-primary" href="{{ link }}?lang={{ constant('LANG') }}">
                                        <i class="fa fa-pencil"></i> id = {{ item.getId() }}
                                    </a>
                                </td>
                                <td>
                                    <a href="{{ link }}?lang={{ constant('LANG') }}">
                                        <h5>{{ item.getTitle() }}</h5>
                                    </a>
                                </td>
                                {% set url = helper.langUrl(['for':'page', 'slug':item.getSlug()]) %}
                                <td><a href="{{ url }}" target="_blank"><h5>{{ url }}</h5></a></td>
                            </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
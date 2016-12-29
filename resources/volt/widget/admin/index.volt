<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}widget/admin/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
                    </a>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width:150px">{{ helper.at('ID') }}</th>
                            <th style="width: 200px">{{ helper.at('Title') }}</th>
                            <th>{{ helper.at('HTML') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for item in entries %}
                            {% set link = url.get() ~ 'widget/admin/edit/' ~ item.getId() %}
                            <tr>
                                <td><a href="{{ link }}"><h5>{{ item.getId() }}</h5></a></td>
                                <td><a href="{{ link }}"><h5>{{ item.getTitle() }}</h5></a></td>
                                <td><pre>{{ item.getHtml() | escape }}</pre></td>
                            </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
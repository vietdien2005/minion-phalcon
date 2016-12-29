<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <div class="btn-group">
                    <a href="{{ url.get() }}admin/admin-user/add" class="btn btn-success">
                        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
                    </a>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered">
                    <thead>
                        
                    </thead>
                    <tbody>
                        <tr>
                            <th style="width: 100px"></th>
                            <th>{{ helper.at('Login') }}</th>
                            <th>{{ helper.at('Email') }}</th>
                            <th>{{ helper.at('Name') }}</th>
                            <th>{{ helper.at('Role') }}</th>
                            <th>{{ helper.at('Active') }}</th>
                        </tr>
                        {% for user in entries %}
                            <tr>
                                {% set url = url.get() ~ 'admin/admin-user/edit/' ~ user.getId() %}
                                <td><a href="{{ url }}" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                <td><a href="{{ url }}"><h5>{{ user.getLogin() }}</h5></a></td>
                                <td><h5>{{ user.getEmail() }}</h5></td>
                                <td><h5>{{ user.getName() }}</h5></td>
                                <td><h5>{{ user.getRoleTitle() }}</h5></td>
                                <td style="color:#4caf50;">
                                    {% if user.getActive() %}<h4><i class="fa fa-check"></i></h4>{% endif %}
                                </td>
                            </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
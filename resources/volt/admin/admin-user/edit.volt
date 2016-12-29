<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}admin/admin-user" class="btn btn-default">
                            <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
                        </a>
                    </div>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
                        </button>
                    </div>
                    {% if model.getId() %}
                        <div class="btn-group">
                            <a href="{{ url.get() }}admin/admin-user/delete/{{ model.getId() }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    {{ form.renderDecorated('login') }}
                    {{ form.renderDecorated('email') }}
                    {{ form.renderDecorated('name') }}
                    {{ form.renderDecorated('role') }}
                    {{ form.renderDecorated('password') }}
                    {{ form.renderDecorated('active') }}
                </div>
            </form>
        </div>
    </div>
</div>
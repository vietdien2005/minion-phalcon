<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}cms/language" class="btn btn-default">
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
                            <a href="{{ url.get() }}cms/language/delete/{{ model.getId() }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    {{ form.renderDecorated('iso') }}
                    {{ form.renderDecorated('locale') }}
                    {{ form.renderDecorated('name') }}
                    {{ form.renderDecorated('short_name') }}
                    {{ form.renderDecorated('url') }}
                    {% if model.getId() %}
                        {{ form.renderDecorated('sortorder') }}
                        {{ form.renderDecorated('primary') }}
                    {% endif %}
                </div>
            </form>
        </div>
    </div>
</div>
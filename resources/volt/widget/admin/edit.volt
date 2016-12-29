<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}widget/admin/index" class="btn btn-default">
                            <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
                        </a>
                    </div>
                    {% if widget is defined %}
                        <div class="btn-group">
                            <a href="{{ url.get() }}widget/admin/delete/{{ widget.getId() }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    {% if widget is defined %}
                        <p>ID = <b><?php echo $widget->getId() ?></b></p>
                    {% else %}
                        {{ form.renderDecorated('id') }}
                    {% endif %}
                    {{ form.renderDecorated('title') }}
                    {{ form.renderDecorated('html') }}
                </div>
                <div class="box-footer">
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
